# Archive — 2026-06-08 curation

This marketplace was deliberately narrowed on 2026-06-08 from seven "department"
plugins (49 skills) down to two: **bns-dev** (dev workflows + `gemini-imagegen`) and
**writing**.

Everything removed below is preserved in git history. To recover any of it:

```bash
git show archive/pre-curation-2026-06-08            # the full pre-curation tree
git checkout archive/pre-curation-2026-06-08 -- tdd-growth/skills/<name>   # pull one skill back
```

## Why

- **Atomic, high-quality unit skills + thin orchestrators** — not bundled mega-skills.
- **Pipelines / product-led flows belong in the product** (tacosdedatos "paperclip",
  Gotti-OS, the Spiral CLI), not as marketplace skills.
- **No publication-specific skills** in a public marketplace.
- Dropped categories were vibe-generated and unused (YAGNI).

## Removed plugins (dropped — vibe-generated, unused)

| Plugin | Skills | Disposition |
|--------|--------|-------------|
| `tdd-tech` | code-standards, data-engineering, devrel-practices, docs-as-code, technical-writing | drop |
| `tdd-growth` | 21 skills (seo, social crafters, analytics, …) | drop |
| `tdd-community` | community-guidelines, event-playbook, member-experience, moderation-rules | drop |
| `tdd-revenue` | financial-models, product-development, sales-templates, sponsorship-playbook | drop |

## Removed skills (archived — retired but recoverable)

From the old `tdd-editor` and `tdd-design` plugins:

- `every-style-editor` — stale editorial-era copy.
- `article-to-newsletter` — really a pipeline; lives in the product now.
- `tacosdedatos-editor`, `tacosdedatos-writer` — publication-specific bundles; the
  tacosdedatos voice lives in the Spiral CLI + Gotti-OS now.
- `tacosdedatos-pipeline` — pipeline, not a skill.
- `tacosdedatos-illustrator` — publication-specific.
- `design-guidelines` — too fuzzy; a generic *generator* may replace it later.
- `image-prompt-writer`, `image-validator` — image tooling churns too fast to pin in a skill.

## What moved where

- The generic editorial line (`fact-checker`, `humanizer`, `essay-pattern-language`)
  was **recaptured from the `writing-skills` repo** (its canonical generic versions, with
  attribution) into the new **`writing`** plugin here.
- `content-refresh` moved into `writing` (parked — may become a workflow).
- `gemini-imagegen` (was `tdd-design/image-generation`) moved into **`bns-dev`** (no need for a whole plugin just for it).
- The private editorial workshop (`developmental-editor`, `hip-hop-ear`, `exit-ramp-audit`,
  `idea-to-draft`, `voice-codification`) stays in the **`writing-skills`** repo (private).
- The original app `tdd-editors-room` is archived.
