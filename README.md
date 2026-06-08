# BNS Marketplace

The brasas & nube marketplace for Claude Code plugins. Two focused plugins:

| Plugin | What it is |
|--------|------------|
| **bns-dev** | The brasas & nube dev plugin. Currently ships the **`image-generator`** skill (Gemini Nano Banana Pro). Home for development tooling as it emerges from the workflow. |
| **writing** | General-purpose, publication-agnostic writing & editing skills: `fact-checker`, `humanizer`, `essay-pattern-language`, `content-refresh`, `tunelito` (human-in-the-loop review). |

> Narrowed from seven plugins to two on 2026-06-08 — see [ARCHIVE.md](ARCHIVE.md) for what was removed and how to recover it. The private editorial workshop (`developmental-editor`, `hip-hop-ear`, `exit-ramp-audit`, `idea-to-draft`, `voice-codification`) lives in the separate **writing-skills** repo.

## Quick Start

Add the marketplace, then install whichever plugins you want:

```bash
/plugin marketplace add https://github.com/chekos/bns-marketplace
/plugin install bns-dev      # image generation (+ dev tooling, growing)
/plugin install writing      # writing & editing
```

### One-Command Installation
Use the [Claude Plugins CLI](https://claude-plugins.dev) to skip the marketplace setup:

```bash
npx claude-plugins install @chekos/bns-marketplace/writing
```

This automatically adds the marketplace and installs the plugin in a single step.

### Factory (Droid) quick start

1) Install Droid (Factory).

```bash
bunx droid-factory
```

What this does: copies Claude Code marketplace commands/agents/subagents and converts them to Droid format.

Next:
- Start Droid
- In Settings, enable Sub-agents

You're done: use this source from Droid. You don't need to add it in Claude Code anymore.

---

# bns-dev

The brasas & nube development plugin. Right now it's the home of one skill —
**`image-generator`** — because image generation is part of the dev workflow here.
More dev commands will land as they prove themselves out of real work.

It began as a set of GitHub workflow commands (`create-issue`, `plan-issue`,
`review-pr`, `resolve-pr-comments`, `session-summary`) following a
research → plan → implement → verify pattern. Those were **retired on 2026-06-08** —
**compound-engineering** now covers that ground far better (`ce-plan`,
`ce-code-review`, `ce-resolve-pr-feedback`, `ce-compound`, and the end-to-end `lfg`
pipeline). They remain in git history; see [ARCHIVE.md](ARCHIVE.md).

## image-generator

Generate and edit images with Google's Gemini **Nano Banana Pro**
(`gemini-3-pro-image-preview`): text-to-image, image editing, multi-image
composition, and Google Search grounding — with Python / JavaScript / curl examples
and a file-based approach for large images. Requires a `GEMINI_API_KEY`
([Google AI Studio](https://aistudio.google.com/)).

## Install

```bash
/plugin marketplace add https://github.com/chekos/bns-marketplace
/plugin install bns-dev
```

Author: [chekos](https://github.com/chekos)
