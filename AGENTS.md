# Repository Guidelines

## Project Structure & Module Organization
- `.claude-plugin/marketplace.json` defines the marketplace manifest and lists bundled plugins.
- `bns-dev/.claude-plugin/plugin.json` contains plugin metadata (name, version, author).
- `bns-dev/commands/` holds the plugin’s slash commands as Markdown files (`*.md`) with YAML frontmatter followed by the prompt body.
- Top-level docs live in `README.md` and `CLAUDE.md`.

## Build, Test, and Development Commands
- There is no build system or test runner in this repository.
- Validate changes by inspecting the JSON and Markdown files directly and ensuring command files render correctly.
- For plugin usage, you can install locally via Claude Code, e.g. `/plugin marketplace add https://github.com/chekos/bns-marketplace` and `/plugin install bns-dev`.

## Coding Style & Naming Conventions
- JSON files use 4-space indentation and plain key/value structure; keep formatting consistent.
- Command definitions are Markdown with YAML frontmatter. Include `description` and `allowed-tools` fields.
- Command files are kebab-case (`create-issue.md`, `review-pr.md`), and command names match file names.

## Testing Guidelines
- No automated tests are present.
- Spot-check changes by opening updated Markdown and JSON files and confirming schema fields and versions are valid.

## Commit & Pull Request Guidelines
- Git history favors short, sentence-style commit messages (e.g., “Refactor all commands based on best practices review”).
- If you change versions, update both `.claude-plugin/marketplace.json` and `bns-dev/.claude-plugin/plugin.json` in the same commit.
- PRs should include a brief summary, the motivation for the change, and any relevant links (issues or discussions).
- Include screenshots only when modifying user-facing documentation or examples.

## Plugin Architecture Notes
- Each command follows a “research → plan → implement → verify” workflow; keep that structure when editing or adding commands.
- Use `#$ARGUMENTS` in command Markdown when user input is required.
