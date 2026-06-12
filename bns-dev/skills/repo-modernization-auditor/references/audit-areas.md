# Audit Area Checklists

Detailed checklists for Phase 3 of the repo modernization audit. When spawning parallel Task subagents, give each agent its relevant section below plus the three-way labeling scheme (`current` / `stale` / `aspirational`) and ask for findings with file references and evidence.

## 1. Agent Readiness

- Is there one concise source of truth for future agents (CLAUDE.md / AGENTS.md)?
- Are instructions tool-agnostic enough for the current agent environment, or do they reference retired tools, old slash commands, or model-specific workflows?
- Do docs guide agents toward verified commands and away from stale assumptions?
- Are old plans, completed todos, generated reports, and dead prompts cluttering the context agents will load?
- Do permission assumptions in agent instructions match how the repo is actually worked on today?

## 2. Build, Test, and CI

- Do package scripts work as written? Run them, don't trust them.
- Do lint, typecheck, test, and build pass?
- Are failing tests real regressions, stale expectations, environment issues, or tooling drift? Each needs a different fix.
- Does CI run the same meaningful checks as local development, or has it drifted?
- Are dependency and lockfile states consistent (`install` clean, no phantom or unused deps)?

## 3. Security and Privacy

Never assume security docs are accurate — verify against code and migrations.

- Auth, authorization, row-level security, API tokens, session handling.
- Secrets: hardcoded values, tracked env files, leaked keys in history or examples. Report key names and shape, never values.
- Error messages leaking internals; missing rate limiting; unsafe file uploads.
- SSR/client boundaries; XSS surfaces; weak input validation.
- Service-role clients, auth bypasses, overly broad permissions.
- Dependency risk: known-vulnerable or long-abandoned packages.

## 4. Architecture and Simplicity

- Duplicate layers, oversized components, unnecessary abstractions, dead code.
- Unused dependencies, compatibility shims, mixed old/new patterns coexisting.
- Prefer reducing code paths over adding another abstraction.
- Keep behavior stable unless the user asked for product changes.

## 5. Data and Operations

- Migrations, schema drift, seed data, database scripts.
- Env requirements, deployment config, operational warnings.
- Destructive database or production operations are high-risk: surface them, require explicit user direction before acting.
- Preserve hard-won operational footguns in a concise, current doc — this knowledge is expensive to relearn.

## 6. UX and Product Quality

- Verify key user flows when a frontend exists.
- Accessibility, responsive layout, loading and error states.
- Does the UI match the current product promise, or does it expose half-built features the docs claim are done?
- Use browser or screenshot verification for significant UI changes.

## 7. Repo Hygiene

- Ignored files vs. tracked generated artifacts, local outputs, build caches, temp files.
- Duplicate configs, sample env files, stale examples, dead scripts, broken automation.
- Recommend deleting tracked files that should only exist in git history or local workspaces — but Grep for references first to confirm nothing current consumes them.
