---
name: tunelito
description: >-
  Run a human-in-the-loop review loop over any HTML artifact (a page, dashboard,
  plan, draft, design mockup) with the `tunelito` CLI: serve it, let a human drop
  comments anchored directly on the page, then read those comments and act on them
  in a loop. Use this whenever the user wants to look at something and leave feedback
  on it — "let me review this in the browser", "share it so I can comment", "I want
  to mark up the page", any human-in-the-loop / HITL review or sign-off, or whenever
  you'd otherwise be guessing at feedback on a generated artifact. Prefer this over
  inventing ad-hoc "leave comments in the file" conventions.
---

# tunelito — human-in-the-loop review surface

`tunelito` (CLI, `tunelito <page.html|folder> [options]`) serves an HTML artifact
locally (and optionally over a Cloudflare tunnel), overlays a commenting UI so a
human can attach comments to specific elements on the page, and writes every comment
to a markdown file. That markdown file is the channel you watch and act on.

This turns "I generated something, is it right?" into a real feedback loop: the human
sees the artifact, marks up exactly what's wrong *where it's wrong*, and you respond —
instead of you guessing or them describing problems in prose.

## When to use

- The user wants to **review a generated artifact visually** and leave feedback: a
  page, dashboard, report, plan, spec, draft, or design mockup.
- You want **structured human sign-off** before committing to an approach, rather than
  asking "does this look right?" in chat and getting vague answers.
- A long artifact needs **localized comments** ("this section", "this number", "this
  button") that are painful to reference in plain chat.

Don't use it for quick yes/no questions, or when the user explicitly wants to edit the
artifact themselves rather than comment on it.

## The loop

1. **Prepare the artifact as HTML.** tunelito serves HTML. If you already have a page,
   point at it. If you have markdown (a plan, draft, doc), render it to a small HTML
   page first, or serve the folder (see *Reviewing markdown*). Put the page and any
   data it loads in one folder so relative `fetch()`/asset paths resolve.
2. **Launch tunelito in the background** and capture the local URL (see *Launching*).
3. **Hand the URL to the user** and tell them, briefly, what they're looking at and that
   you're watching their comments — they can mark up the page directly.
4. **Watch the comments file** for changes (see *Watching*). Don't poll in your own
   turn; run a background watcher that exits when the file changes, which re-invokes you.
5. **Read and act** on each new comment (see *Reading comments*). Make the changes,
   regenerate the artifact if needed, and reply in chat summarizing what you did.
6. **Re-arm the watcher** and continue until the user is done. Comments arrive in bursts;
   re-read the whole file each time and act only on what's new.

## Launching

```
tunelito <page.html|folder> [options]
```

| Option | Use |
|--------|-----|
| `--out <path>` | Where comments are written. Default `<target>.comments.md`. **Set this explicitly** so you know exactly what file to watch. |
| `--no-tunnel` | Local only — skip the Cloudflare tunnel. Fastest; right for a solo local review. |
| `--no-auth` | Drop the review-key gate so the URL is a clean `http://127.0.0.1:<port>/`. |
| `--open` | Open the page in the user's browser automatically. |
| `--port <n>` | Default: first free port from `4317`. |
| `--live` | Ephemeral collaboration; do **not** persist comments to disk (avoid when you need to watch a file). |
| `--agent claude` | Lets *tunelito itself* run a separate agent worker on comments. Avoid this when **you** are the one watching — it spawns a second agent. |

**Recommended for a local solo loop** (you watch, no sharing):

```bash
cd <folder-with-the-page>
tunelito . --no-tunnel --no-auth --out comments.md --open
# → serves http://127.0.0.1:4317/ , writes ./comments.md
```

Run this in the background (it's a long-lived server). Then confirm it's up before
handing over the URL — e.g. `curl -s -o /dev/null -w '%{http_code}' http://127.0.0.1:4317/`.

**For remote sharing** (review from a phone or another machine), drop `--no-tunnel`
(and usually `--no-auth`) so tunelito prints a public tunnel URL with a review key.

## Watching

There's usually no `fswatch` available, so watch by polling the comments file's
modification signature and exiting on change — exiting is what hands control back to you.
Use the bundled script:

```bash
scripts/watch_comments.sh ./comments.md   # run in the BACKGROUND; prints new content and exits on change
```

Run it as a background process. When the human comments, it exits, you're re-invoked,
you read the file, act, and start it again. Pick a poll interval that keeps your context
cache warm if you're cost-sensitive; 3s is fine for an interactive session.

Do **not** schedule short wake-ups to poll yourself — let the background watcher's exit
re-invoke you.

## Reading comments

The comments file is human-readable markdown with one machine block per comment. Each
comment looks like this:

```
<!-- tunelito-comment: <base64-encoded JSON metadata> -->
## Guest 0H4X0Y at 2026-06-08 15:14:05 UTC

> tech · 5

we can get rid of all the tech ones for now. YAGNI, right?

_Context: scope: `page` · page: `/` · path: `body > tbody#rows > tr:nth-of-type(25) > td > span` · text offset: 12315 · id: `c_…`_
```

To interpret a comment:
- **The body** (the paragraph after the `>` quote) is what the human is telling you to do.
- **The `>` quote** is the on-page text they anchored to — use it to know *which thing*
  they mean (a row, a heading, a number).
- **The `_Context: … path: …_`** line is the CSS selector / location on the page; use it
  to disambiguate when the quote alone is ambiguous.
- **Ignore the `<!-- tunelito-comment: … -->` base64 line** for reading — it's session
  metadata so tunelito can restore state, not instructions.

Read the whole file each cycle and diff against what you've already handled (track by the
comment `id` in the metadata, or by position) so you act on new comments only.

## Reviewing markdown (plans, drafts, docs)

tunelito serves HTML, so wrap markdown before serving. Two good options:
- **Render to a single page**: convert the markdown to an `index.html` (any renderer; keep
  it simple and readable) and serve that file. Best when you want a clean reading surface.
- **Serve the folder**: drop the `.html` alongside its data/assets in one directory and
  point tunelito at the directory so relative paths load.

Keep on-page text meaningful and uniquely phrased — the human's comments anchor to page
text, so clear headings and labels make their feedback easy to localize.

## Tips

- Verify the server responds (HTTP 200) and that any data file it loads is reachable
  before sending the URL — a blank page wastes a review round.
- One artifact, one comments file, one watcher. If you regenerate the artifact, keep the
  same `--out` path so the thread of comments stays continuous.
- This skill replaces older "leave comments as callouts in the file" conventions — the
  value here is that comments are anchored to *what the human sees*, with a tight act-and-
  re-render loop.
