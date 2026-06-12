---
name: repo-modernization-auditor
description: Audit and modernize aging repositories so they become clean, current, safe, and agent-friendly. Use this skill whenever the user says a repo is old, vibe-coded, stale, confusing, over-engineered, has technical debt, needs cleanup, needs modernization, should be brought up to speed, or should be made agent-friendly or agent-ready — even if they only say "I haven't touched this in a while" or "look around and tell me what's here". Also use it when docs/specs/todos may no longer match the implementation, when tests or builds need a fresh baseline, when CLAUDE.md or agent instructions look outdated, or when the user wants obsolete repo context deleted because git history is the archive.
allowed-tools: Read, Grep, Glob, Bash, Edit, Write, TodoWrite, Task, WebFetch, WebSearch
---

# Repo Modernization Auditor

Turn an aging repo into a trustworthy working surface for future agents and humans. The core job: establish the current truth of the repository, identify stale or misleading context, then make or propose reviewable improvements that reduce confusion without hiding real risk.

The most common intent behind this skill is: "This repo was built quickly a while ago. The ideas may still be good, but the code and docs may be stale. Audit it, clean it up, and make it easier for agents to work in."

## Operating Principles

These shape every phase — internalize them before starting:

- **Code is evidence; docs are clues.** The codebase, lockfile, scripts, tests, build output, git state, and runtime behavior are stronger evidence than docs. Docs, roadmaps, devlogs, todos, and agent instructions must be reconciled with current reality, not trusted.
- **Git history is the archive.** Prefer deletion or consolidation when old context would mislead future agents. But preserve durable decisions, operational footguns, current architecture, and knowledge that prevents repeated mistakes.
- **Small safe slices over broad rewrites.** Avoid rewrites for style alone. Favor changes that make future changes safer and easier.
- **Never print secret values.** If env files exist, report key names and configuration shape only.
- **Protect user work.** Run `git status` before any edit and never revert or sweep up unrelated dirty files.
- **Verify with repo-native commands.** When checks fail, distinguish product regressions from stale tests, obsolete mocks, or tooling drift — they call for different fixes.
- **Check currency against current docs.** When evaluating framework or library best practices, use WebSearch/WebFetch on official documentation if there is any chance guidance has changed since your training data.

## Workflow

Start by creating a TodoWrite plan with the phases below so the user can see progress. Adjust scope to the repo size — a small script repo doesn't need the full treatment.

### Phase 1: Orientation

Before editing anything, build a factual map. Run independent lookups in parallel:

1. Read top-level guidance: `CLAUDE.md`, `AGENTS.md`, `README.md`, `CONTRIBUTING.md`, package manifests, CI config, docs indexes.
2. Map the file tree with Glob and Grep. Notice generated artifacts, local-only directories, duplicated configs, old roadmaps, large docs folders, and tracked agent-specific files.
3. Check git state: `git status`, `git log --oneline -20`, recent branch activity. Identify untracked or dirty files before touching anything.
4. Identify the stack, product purpose, core workflows, data stores, auth model, deployment target, and verification commands.
5. Run the lowest-risk baseline checks the repo itself advertises — install status, lint, typecheck, tests, build. Record pass/fail; do not sink time into fixing yet.

Spawn parallel `Explore` subagents where it helps — one per area (docs inventory, dependency state, test/build health, security surfaces) — and synthesize their findings rather than reading everything yourself. You're the judge of when the repo is small enough to just read directly.

If the user explicitly said "before doing anything, report back," stop after this phase and deliver the orientation, baseline, risks, and a recommended first cleanup slice.

### Phase 2: Truth Reconciliation

Compare claims against implementation. Label every finding with one of three states:

- `current` — matches the implementation; should remain.
- `stale` — no longer matches the product or workflow; delete or rewrite.
- `aspirational` — useful future direction; mark clearly as roadmap or move out of the working path.

Common drift zones to check (Grep is your friend here — search for feature names mentioned in docs and verify the code exists):

- Product docs listing planned features as completed.
- "Offline mode," "self-hosted," "privacy-first," "AI," "export," "sync," or "agent-native" claims that may not match code.
- Stale TODO directories, historical devlogs, generated audit reports, old specs, previous review artifacts.
- Agent instructions (CLAUDE.md, old slash commands, `.cursorrules`, etc.) referencing obsolete tools, retired workflows, or incompatible permission assumptions.
- Compatibility facades and "legacy" paths no current caller needs.
- Setup docs with old env var names, dead commands, or non-working flows.

### Phase 3: Audit Areas

Audit broadly enough to find the real risks, then prioritize. Read `references/audit-areas.md` for the detailed per-area checklists covering:

1. **Agent readiness** — one concise source of truth for future agents
2. **Build, test, and CI** — do the advertised gates actually work
3. **Security and privacy** — verify against code, never against security docs
4. **Architecture and simplicity** — fewer code paths beats another abstraction
5. **Data and operations** — migrations, schema drift, operational footguns
6. **UX and product quality** — does the UI match the current product promise
7. **Repo hygiene** — tracked files that should only exist in git history

Use a workflow to run the audit (the Workflow tool, where available): one finder agent per audit area, each given its checklist section from the reference file, then adversarially verify the P0/P1 findings before reporting them — a finding that survives a skeptic agent trying to refute it is worth far more than a plausible guess. Scale the fan-out to the repo; the workflow script is yours to shape. If the Workflow tool isn't available, fall back to parallel Task subagents (one per area) and merge their findings yourself.

Treat destructive database or production operations as high-risk: surface them, but require explicit user direction before acting.

### Phase 4: Prioritized Report

Report findings before changing code, unless the user already asked you to implement. Use this structure:

```markdown
**Repo Orientation**
- What this repo is today; current stack and core workflows.
- Main verification commands.

**Health Baseline**
- Checks run with pass/fail results and notable warnings.
- Dirty/untracked git state.

**Highest-Risk Findings**
- P0/P1 issues first, with file:line references and evidence.
- Impact and recommended action for each.

**Stale Context**
- Docs, todos, generated reports, old agent instructions, or specs likely to mislead.
- Mark each: delete, rewrite, keep, or confirm-with-user.

**First Cleanup Slice**
- A small reviewable set of changes, why it comes first, and the verification plan.
```

For larger audits, group recommendations into: delete/archive stale context, fix broken gates, security hardening, simplify architecture, refresh current docs, defer/confirm product direction.

### Phase 5: Implementation

When the user approves (or asked for implementation up front):

1. Start with the smallest high-confidence slice; track each slice in TodoWrite.
2. Delete stale docs and dead support files only after verifying (Grep for references) they are not current inputs.
3. Update CLAUDE.md / agent guidance so future agents know the current commands, product truth, and operational footguns.
4. Fix broken quality gates before broad refactors.
5. Add or update tests where behavior risk changes.
6. Run the relevant checks after each slice — not just at the end.
7. Keep changes easy to review: don't mix cleanup, behavior changes, dependency upgrades, and docs rewrites in one batch unless the user asked for a single sweep.

## Deletion Heuristics

Good deletion candidates:

- Completed todo files outside any active tracking system.
- Historical devlogs duplicated across locations with no current decision value.
- Old specs for features that don't exist and aren't current roadmap.
- Generated reports whose conclusions were implemented or went stale.
- Tool-specific agent commands that no longer run in the current agent environment.
- Local build outputs, temp files, downloaded media, generated caches.
- Duplicate config files where only one is used.

Do **not** delete without stronger evidence:

- ADRs capturing current or superseded architectural choices.
- Migration files, schema history, data repair scripts.
- Operational notes about known deployment, database, auth, or migration footguns.
- User-facing docs for features that currently work.
- Tests that fail because code regressed — fix or replace them instead.

## Final Handoff

End with a concise report: what changed or was found, what checks passed or failed, what stale context was removed or still needs confirmation, and what remains as the next safest slice. If no edits were made, say so clearly and provide the reusable plan the user asked for.
