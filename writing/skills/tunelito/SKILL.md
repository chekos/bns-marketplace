---
name: tunelito
description: >-
  Run a Tunelito live review room for a local HTML file or folder, then process
  the comments it collects. Use whenever a user wants to share, serve, or
  preview a local .html page or static site/mini-site from their machine so a
  designer, client, teammate, or PM can leave feedback on a call; wants a
  temporary public link to a local page; says "review my HTML", "annotate this
  page", "let people comment on my site", "get feedback on index.html", "spin up
  a review room", or "review this page locally without exposing it"; OR points
  you at a `*.comments.md` / `site.comments.md` inbox and asks you to apply,
  process, or act on the comments inside it. Covers starting and sharing a
  session (Cloudflare Tunnel, keyed bearer URLs), local-only review of sensitive
  pages, active-agent `tunelito inbox` commands, the opt-in `--agent` worker
  that edits files from comments, and the comment Markdown schema (scope, page,
  path, id, status). Do NOT use for
  reviewing a pull request, IDE inline comments, reviewing source code for bugs,
  or writing code comments/docstrings.
license: MIT
compatibility: Requires Node.js 22 or newer. Public sharing uses a temporary Cloudflare Tunnel when available.
metadata:
  package: tunelito
  install: npx --yes tunelito ./page.html
  skill: npx --yes tunelito skill show
---

# Tunelito

Tunelito serves a local HTML file or folder, injects a same-origin annotation
client into the served HTTP response, and syncs comments over WebSocket.
Reviewers select text or leave page/site notes; comments persist as readable
Markdown beside the source. You keep editing the HTML in your own editor and
connected browsers hot-reload on save. It can expose the local server through a
temporary Cloudflare Tunnel and, opt-in, either run a local coding-agent worker
or expose inbox commands for the current agent session to satisfy comments.

The whole arc: **start a session -> share it safely -> process the comments ->
wrap up.** Pick the branch that matches the user's intent.

## When to use this

- "I have `./index.html`, let my designer leave feedback while we're on a call."
- "Folder `./site`, auto-apply comments people leave during the review."
- "Tunelito wrote `site.comments.md` -- go apply those comments to the pages."
- "This page has client data; let me review it locally without exposing it."

Do **not** reach for this for a PR review, IDE inline comments, reviewing source
code for bugs, or adding a docstring. Those are unrelated to review rooms.

## Flags rot; confirm them against the CLI

The CLI is the source of truth. Before quoting an exact flag you are unsure
about, run `tunelito --help` (or `npx --yes tunelito --help`) and read it; run
`tunelito --version` to know which build you are on. Never invent a flag that is
not in that output.

## Step 1 -- Start a session

Default invocation, no flags needed:

```bash
tunelito ./index.html      # single page
tunelito ./site            # folder -> one shared inbox beside it (site.comments.md)
```

A folder shares **one** inbox: `site/` -> `site.comments.md`. Page-scoped
comments appear only on their page; site-scoped comments appear on every page.
If it is not installed, prefix with `npx --yes` (e.g. `npx --yes tunelito ./index.html`).

Startup prints `Local:`, `Comments:`, and `Access:` always, plus `Owner:`,
`Agent:`, `Live:`, and `Public:` lines when those flags are set. Read them back
and act on them:

```text
Local:    http://127.0.0.1:4317/?tunelito_key=...   # you, on this machine
Comments: /path/to/index.html.comments.md           # where notes land
Access:   review key required by the printed URLs
Public:   https://<random>.trycloudflare.com/?tunelito_key=...   # share THIS
```

`Public:` is the only shareable URL. `Live:` (printed with `--live`) is a
**transport status line** ("WebRTC peer-to-peer when available; WebSocket relay
fallback enabled"), not a URL -- never hand it to a reviewer.

Defaults that matter: binds `127.0.0.1`, picks the first free port from `4317`,
writes `<page-or-folder>.comments.md` beside the source. Useful tweaks (all
optional): `--port <n>` if 4317 is taken, `--host <host>` to change the bind,
`--out <path>` to redirect the inbox, `--open` to launch the Local URL,
`--owner <name>` to label yourself in the viewer and tag your comments with
`author role: owner`.

## Step 2 -- Share it safely

Hand the reviewer the **`Public:`** URL, not the `Local:` one (`127.0.0.1` is
unreachable for a remote person). Then tell them the one thing that matters:

> The link contains a `tunelito_key`. It is **bearer access** -- anyone who has
> the full URL can view *and* comment, with no login. The first valid request
> sets a short-lived HTTP-only cookie. Treat the link like a password: share it
> only in a trusted channel and stop the session when the review is done.

`--owner` adds a separate owner key to the `Local:` URL and labels that person.
It is a session **label**, not stronger auth; do not present it as a permission
boundary.

**Never pass `--no-auth` while a tunnel is active.** `--no-auth` and the tunnel
are **independent** -- `--no-auth` only removes the key gate; it does NOT turn
off the Cloudflare Tunnel. So `tunelito ./page.html --no-auth` still publishes a
public URL, now with no key at all: anyone who finds it can view and edit. If
the user wants no key, they almost always mean local-only -- add `--no-tunnel`.
Reach for `--no-auth` only on a trusted local network or a throwaway demo, and
warn the user first.

### Sensitive pages: stay local

If the page has client data, secrets, or anything that must not leave the
machine, do not open a tunnel:

```bash
tunelito ./report.html --no-tunnel --open
```

`--no-tunnel` prints only the `Local:` URL and never starts the Cloudflare
Tunnel, so the session stays on `127.0.0.1` with no public exposure. This is the
flag that controls exposure -- not `--no-auth`, and not `--live`.

## Step 3 -- Process the comments

Three ways comments become edits. Choose by what the user asked for.

### 3a. Active agent session (`--agent-session`)

When the user is already talking to you inside Claude Code, Codex, or another
agent session and says "serve this and watch comments," do **not** spawn a
nested agent. Start Tunelito in agent-session mode:

```bash
tunelito ./site --owner "Reviewer Lead" \
  --agent-session \
  --agent-policy owner-or-mention --agent-trigger "@agent"
```

`--agent-session` writes `.tunelito/session.json`; it does not run a nested
worker. The same Tunelito server process watches the persistent comments
Markdown, keeps interval polling as fallback, claims the next actionable comment
in `.tunelito/agent/state.json`, prints a prompt with the matching claim id, and
pauses further claims until that claim is recorded or expires. Edit the matching
source files, then record the result:

```bash
tunelito inbox record ./site --id c_... --claim claim_... --status resolved --summary "Updated hero copy." --file index.html
```

Use `tunelito inbox next ./site` for a non-waiting manual check, or
`tunelito inbox watch ./site` when you need the one-shot primitive without a
running `--agent-session` server. Use repeated `--file`, `--completed`, and
`--remaining` flags when recording multi-file work or `needs_followup`. Run one
active inbox watcher per served workspace; claim ids are local leases that
prevent stale recordings and let abandoned claims expire, not a distributed lock
for multiple simultaneous watchers. Active-agent mode and the inbox commands use
the same `--agent-policy`,
`--agent-trigger`, `--agent-state`, `--agent-max-attempts`, and
`--agent-max-passes` semantics as `--agent`.

### 3b. Live auto-apply during the session (`--agent`)

When the user wants comments handled **as people leave them** ("auto-apply
comments while I'm on the call"), start the session with a worker. Default
`--agent-policy all` sends **every** comment to the worker, so on a shared call
any guest's note becomes a local code-edit instruction. Scope it:

```bash
tunelito ./site --owner "Reviewer Lead" \
  --agent claude \
  --agent-policy owner-or-mention --agent-trigger "@agent"
```

- `--agent claude` runs `claude -p` with edit access to the served folder. In
  this build it runs in acceptEdits mode with tools allowlisted to
  Read/Write/Edit/MultiEdit/LS/Grep/Glob -- but treat `--agent` as trusted local
  code execution regardless, since that allowlist is internal and can change.
- `--agent codex` runs `codex exec` in workspace-write mode.
- `--agent custom --agent-command "<cmd>"` runs your CLI from the served root
  with the prompt on stdin and `TUNELITO_AGENT_ROOT`, `TUNELITO_AGENT_COMMENTS`,
  `TUNELITO_AGENT_STATE`, `TUNELITO_OWNER_NAME` set.

`--agent-policy owner-or-mention` (owner's notes, or notes containing the
trigger) is the safe default for a shared call. The `mention` and
`owner-or-mention` policies **require** a non-`all` `--agent-trigger` such as
`@agent` -- without it the server **refuses to start** (hard error), it does not
silently fall through.

Watch the owner-gating trap: a person counts as the **owner** for policy only
when their session carries the owner key, i.e. they opened the `Owner:`/`Local:`
URL. If the user reviews via the **`Public:`** link they are seen as a visitor,
so `owner` and `owner-or-mention` will silently never match their comments. When
you set up "only I can trigger edits," either have the user open the
owner-keyed Local URL, or rely on the `--agent-trigger` marker for them.

The worker logs decisions to `.tunelito/agent/state.json` (ledger) and
`.tunelito/agent/log.md` (readable), both blocked from serving.

`--agent` is **trusted-session local code execution**: a reviewer's comment
becomes an instruction to a local process that can edit your files. See Safety.
Tuning flags (`--agent-interval`, `--agent-max-attempts`, `--agent-max-passes`,
`--agent-instructions[-file]`, `--agent-prompt[-file]`, `--agent-state`) and the
full worker output contract are in the **Agent worker reference** at the end of
this skill.

### 3c. Apply an existing inbox by hand (no `--agent` or `inbox`)

When Tunelito already wrote a `*.comments.md` / `site.comments.md` and the user
says "go apply these," that is your task. **Editing the source HTML to satisfy a
comment is the intended workflow** -- do it; do not refuse. (Tunelito's
"untouched HTML" rule is only about its own client injection, not about you.)

Read the inbox and process each `##` comment section. A section looks like:

```markdown
## Dana (owner) at 2026-06-09 14:32 UTC
> the hero headline we want to change

Make this punchier and bump the size.

_Context: author role: `owner` · scope: `page` · page: `/index.html` · path: `h1.hero` · text offset: 142 · id: `c_ab12cd`_
```

Honor the metadata:

- **scope** -- `page` edits only the file named in **page** (`/index.html`).
  `site` means the comment was *shown* on every page, not that you must *edit*
  every page. Apply a site note only where the feedback concretely fits; if it
  is vague, treat it as general feedback and ask rather than mass-editing the
  whole folder.
- **page / path / text offset / `> quote`** locate the file, element, and text.
- **id** (`c_...`) identifies the comment; reference it when you report what you
  did so the user can match your work to the note.
- Owner comments get `(owner)` in the heading and `author role: owner` as the
  **first** context field. Notes with no `> quote` are unanchored "Page note" /
  "Site note" lines -- treat them as general feedback for that scope.

Apply edits with honest status discipline: done -> resolved; can't act (missing
asset, ambiguous, conflicting) -> say so and leave it rather than guessing.
**Do not edit the `*.comments.md` file or anything under `.tunelito/`** -- those
are Tunelito's data store and ledger, not your edit targets.

## Step 4 -- Wrap up

- Tell the user where comments landed (the `Comments:` path) and which files you
  changed, keyed by comment id.
- If a session is still running, stop it (Ctrl-C) when the review is done so the
  bearer URL dies. (When you only processed an inbox in 3c, there is no server
  to stop.)
- If you used `--agent`, point the user at `.tunelito/agent/log.md` for the
  human-readable record of what the worker did. If you used `--agent-session`,
  summarize the `tunelito inbox record` statuses you wrote.

## Safety and non-negotiables

- **Public links are bearer access.** The `tunelito_key` in a shared URL grants
  view + comment to anyone who holds it. Keep sessions keyed (the default); only
  use `--no-auth` on trusted/local networks, and stop the session when done.
- **`--no-auth` does not make a session local.** It only removes the key gate;
  the tunnel is controlled separately by `--no-tunnel`. `--no-auth` on a default
  (tunneled) run publishes an *ungated* public URL anyone can open and edit. If
  the user wants no key, pair it with `--no-tunnel`, or just use `--no-tunnel`.
- **`--live` changes persistence, not exposure.** It only stops writing to disk;
  a `--live` session still serves over the same Cloudflare Tunnel and bearer key.
  "Nothing saved" is **not** "nothing exposed" -- for a sensitive/confidential
  page, combine `--live` with `--no-tunnel` (or skip `--live` and review locally).
- **`--live` keeps nothing.** It is ephemeral real-time collaboration: no
  Markdown is written and no agent worker runs, so a restart loses everything,
  and it cannot be combined with `--agent` (no persistent inbox). Use it only for
  a throwaway live session where no record is wanted.
- **`--agent` runs real code from reviewer input.** Fine for your own trusted
  session; on a shared call scope it with `--owner` + `--agent-policy
  owner-or-mention` + a real `--agent-trigger`, never bare `--agent-policy all`.
- **`--agent-session` has the same trust boundary.** It does not spawn a child
  process, but reviewer comments still become instructions to the current agent
  session. Use the same owner/mention gating, and record outcomes with
  `tunelito inbox record` instead of editing `.tunelito/` by hand.
- **You may edit the HTML to satisfy comments.** The "source untouched" rule
  refers only to Tunelito's injection layer, not to your edits. Refusing a
  legitimate apply-the-comment request on those grounds is wrong and defeats the
  purpose.

## Anti-patterns

| Anti-pattern | Why it bites |
| --- | --- |
| Sharing the `Local:` URL instead of `Public:` | `127.0.0.1` is unreachable for the remote reviewer; they see nothing. |
| Sharing the `Live:` line as a link | It is a transport status string, not a URL; the reviewer still needs the `Public:` URL. |
| Treating the keyed URL as private or "authenticated per person" | It is a shared bearer token -- forwarding it hands over full view + comment rights. |
| `--no-auth` without `--no-tunnel` | Publishes an ungated public URL anyone can open and edit; `--no-auth` does not disable the tunnel. |
| Assuming `--live` is private because nothing is saved | `--live` only changes persistence; it still serves over the same tunnel and bearer key. Add `--no-tunnel` for sensitive pages. |
| Tunneling a page with sensitive/client data | A public URL exposes the data; use `--no-tunnel`. |
| `--agent --agent-policy all` on a shared call | Any guest comment becomes a local code-edit instruction; scope to owner/mention. |
| Spawning `--agent` from inside an existing agent session | Creates a nested agent and hides the loop; use `--agent-session` so the serving process watches comments for the current session. |
| Promising owner-only edits while the owner uses the `Public:` link | Owner policy only matches the owner-keyed session; via the public link they count as a visitor and never match. |
| `mention`/`owner-or-mention` with `--agent-trigger all` | The server refuses to start -- these policies require a real trigger marker. |
| Using `--live` then expecting a record | Nothing is written to disk; the comments are gone on restart, and `--agent` won't run. |
| Editing `*.comments.md` or `.tunelito/` directly | Corrupts the inbox/ledger Tunelito round-trips; let the tool own them. |
| Mass-editing every page from one vague `site`-scope note | `site` means "shown everywhere," not "edit everywhere"; apply only where it fits, else ask. |
| Refusing to edit HTML for a review comment | That is the intended workflow; the "untouched" rule is about injection only. |
| Inventing flags not in `tunelito --help` | They silently do nothing or error; confirm against the CLI. |

## Limits

Annotations need real DOM text. Canvas, video, images, and cross-origin iframes
are not annotatable -- if a user wants feedback on those, have them add nearby
text or leave a page note. Strict in-page CSP `<meta>` tags are stripped from
the **served response** (not the disk file) so the client can run. If the exact
commented text later changes, the comment stays in the Markdown/sidebar but its
highlight may not reattach -- the note is not lost, only its anchor.

## Quick reference

| Goal | Command |
| --- | --- |
| Share a page on a call | `tunelito ./index.html` -> share the `Public:` URL |
| Share a folder mini-site | `tunelito ./site` (one `site.comments.md` inbox) |
| Review sensitive data locally | `tunelito ./report.html --no-tunnel --open` |
| Throwaway live session, kept private | `tunelito ./mockup.html --live --no-tunnel` |
| Watch comments from the current agent session | `tunelito ./site --agent-session` |
| Auto-apply comments live, scoped | `tunelito ./site --owner "Me" --agent claude --agent-policy owner-or-mention --agent-trigger "@agent"` |
| Custom agent CLI | `tunelito ./site --agent custom --agent-command "<your cli>"` |
| Pick a port / open browser | `--port 4318` / `--open` |
| Confirm flags / version | `tunelito --help` / `tunelito --version` |

## Agent worker reference

Long-tail detail for `--agent`. The worker is opt-in and runs only with
`--agent` or `--agent-command`, never under `--live`. Treat it as trusted local
code execution: every reviewer comment that reaches the worker becomes an
instruction to a process that edits files under the served root.

### Backends

| `--agent <value>` | What runs |
| --- | --- |
| `claude` | `claude -p` with edit access to the served folder. In this build: acceptEdits mode, tools allowlisted to Read, Write, Edit, MultiEdit, LS, Grep, Glob. That allowlist is internal Tunelito behavior and can change between builds -- do not present it to the user as a guaranteed sandbox boundary; treat `--agent` as trusted local code execution either way. |
| `codex` | `codex exec` in workspace-write mode. |
| `custom` | Requires `--agent-command "<cmd>"`; runs it from the served root with the prompt on stdin. |

`--agent-command <cmd>` is only valid with `--agent custom`, and `--agent
custom` requires it. The custom command receives these env vars:
`TUNELITO_AGENT_ROOT`, `TUNELITO_AGENT_COMMENTS`, `TUNELITO_AGENT_STATE`,
`TUNELITO_OWNER_NAME`.

### Which comments reach the worker (gating)

`--agent-policy <all|mention|owner|owner-or-mention>` (default `all`):

- `all` -- every persisted comment.
- `mention` -- only comments containing the trigger marker.
- `owner` -- only comments authored from the owner-keyed session.
- `owner-or-mention` -- owner comments, or any comment containing the trigger.

A comment is "owner"-authored only when it was left from a session holding the
owner key (the `Owner:`/`Local:` URL). If the owner reviews via the `Public:`
link they count as a visitor, so `owner` and `owner-or-mention` will not match
their notes -- rely on the trigger marker for them, or have them open the
owner-keyed Local URL.

`--agent-trigger <txt>` is the marker for the mention policies (default `all`).
The `mention` and `owner-or-mention` policies **require** a non-`all` trigger
(e.g. `--agent-trigger "@agent"`). If the policy needs a marker and the trigger
is still `all`, the server **throws at startup and will not run** -- it does not
silently treat every comment as a match.

### Prompt and pacing flags

- `--agent-instructions <txt>` / `--agent-instructions-file <path>` -- append
  host guidance to the built-in prompt (the safe way to add context).
- `--agent-prompt <txt>` / `--agent-prompt-file <path>` -- replace the built-in
  behavior prompt entirely. Only do this if the user wants full control; you
  then own the output-contract instructions below.
- `--agent-interval <s>` -- fallback poll interval (default 120).
- `--agent-max-attempts <n>` -- stop retrying a comment after n attempts
  (default 2).
- `--agent-max-passes <n>` -- stop continuing a multi-pass (`needs_followup`)
  comment after n passes (default 3). Raise it for broad comments that genuinely
  need several rounds.
- `--agent-state <path>` -- resolution ledger (default
  `<target>/.tunelito/agent/state.json`).

### Output contract

The worker's final output must be JSON. Each entry maps a comment `id` to an
outcome:

```json
{
  "comments": [
    {
      "id": "c_...",
      "status": "resolved",
      "summary": "...",
      "filesChanged": ["about.html"],
      "completedTasks": ["..."],
      "remainingTasks": []
    }
  ]
}
```

Valid statuses the worker may emit: `resolved`, `needs_followup`, `no-op`,
`ignored`, `blocked`, `stale`, `partial`. Use them honestly: `resolved` when
fully handled; `no-op` when nothing needs doing; `blocked` when you cannot
proceed; `stale` when the target text/page no longer matches; `partial` when you
did some but not all of the work; `needs_followup` only when real remaining tasks
exist. Do **not** emit `changed_needs_review` -- Tunelito sets that internally
when a comment's fingerprint changes; it is not a valid worker output.

`needs_followup` re-queues the same comment with its `completedTasks` and
`remainingTasks` carried forward, looping until the comment reaches a terminal
status (`resolved`, `no-op`, `blocked`, `stale`, `ignored`, `partial`) or until
`--agent-max-passes` is hit.

### Ledger and log

- `.tunelito/agent/state.json` -- machine-readable resolution ledger.
- `.tunelito/agent/log.md` -- human-readable run log.

Both live under the served root but are blocked from being served. Do not edit
them by hand.
