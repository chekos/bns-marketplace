# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Claude Code plugin marketplace** that hosts the `bns-dev` plugin - an opinionated development workflow plugin for brasas&nube. This is not a traditional application but a distribution repository for Claude Code extensions.

## Repository Structure

```
bns-marketplace/
├── .claude-plugin/
│   └── marketplace.json       # Marketplace manifest
└── bns-dev/                   # Main plugin
    ├── .claude-plugin/
    │   └── plugin.json        # Plugin metadata
    └── commands/              # Slash commands (*.md files)
```

## Plugin Architecture

### Commands as Markdown Files

Each command in `bns-dev/commands/` is a Markdown file with:
1. **YAML frontmatter** - defines metadata and allowed tools
2. **Markdown body** - contains the system prompt/instructions

Example structure:
```markdown
---
description: Brief description of the command
allowed-tools: [Bash, TodoWrite, Read, Edit, etc.]
---

Command instructions and workflow go here...
```

### Available Tools in Commands

Commands can use these tools (specified in YAML frontmatter):
- `Bash`, `Bash(gh*)`, `Bash(git*)`, `Bash(pnpm*)` - shell commands with scoping
- `Read`, `Write`, `Edit`, `MultiEdit` - file operations
- `Grep`, `Glob` - search operations
- `TodoWrite`, `TodoRead` - task tracking
- `Task` - sub-agent spawning

## The Four Slash Commands

### `/solve-issue` (work-issue.md)
End-to-end GitHub issue resolution workflow:
1. View issue with `gh issue view`
2. Analyze codebase
3. Create feature branch: `feature/[issue-number]-brief-description`
4. Create comprehensive plan with TodoWrite
5. Ask for approval before implementing

**Usage:** `/solve-issue #123`

### `/create-issue` (create-issue.md)
Create well-structured GitHub issues:
1. Research repository structure and conventions
2. Review CONTRIBUTING.md and templates
3. Present implementation plan
4. Create issue with `gh issue create`
5. Apply appropriate labels (`bug` or `enhancement`)

**Usage:** `/create-issue <description>`

### `/review-pr` (review-pr.md)
Comprehensive PR review covering:
- Code quality and best practices
- Potential bugs and issues
- Performance considerations
- Security concerns
- Test coverage

Asks for approval before posting review comments.

**Usage:** `/review-pr #456`

### `/resolve-pr-comments` (resolve-pr-comments.md)
Systematically resolve all PR review comments in 4 phases:

**Phase 1: Research & Analysis**
- Extract unresolved review comments via GitHub API
- Identify to-dos and requested changes

**Phase 2: Planning**
- Create detailed resolution plan
- Use TodoWrite for tracking

**Phase 3: Implementation**
- Make requested changes
- Run tests and verify
- Support parallel sub-agents for independent comments

**Phase 4: Resolution & Verification**
- Run linting and test suite
- Create resolution summary
- Commit changes

**Usage:** `/resolve-pr-comments` (auto-detects current PR from branch)

## GitHub CLI Commands

The plugin heavily uses `gh` CLI. Key patterns:

### PR Comment Retrieval
```bash
# Get current PR details
gh pr view --comments

# Get code review comments
gh api repos/{owner}/{repo}/pulls/{pr_number}/comments

# Get review summaries
gh api repos/{owner}/{repo}/pulls/{pr_number}/reviews

# Get general PR comments
gh pr view --json comments

# Verify CI and merge status
gh pr checks
gh pr view --json mergeable
```

### Issue Management
```bash
gh issue view #123
gh issue create --title "..." --body "..."
gh issue list
```

### Branch Operations
```bash
gh pr status
gh pr view --json number
```

## Development Workflow Patterns

### Research → Plan → Implement → Verify
All commands follow this pattern:
1. **Research**: Analyze the task and codebase
2. **Plan**: Create TodoWrite plan and get approval
3. **Implement**: Execute changes systematically
4. **Verify**: Run tests, verify quality before committing

### Parallel Processing
The `/resolve-pr-comments` command supports spawning parallel sub-agents to resolve independent comments simultaneously, grouped by file or area.

### Quality Assurance
Before committing changes:
- Run project linter (e.g., `bundle exec standardrb` for Ruby)
- Run test suite (e.g., `bin/rails test` for Rails)
- Verify CI status with `gh pr checks`

## Plugin Distribution

### Version Management
- Version defined in both `marketplace.json` and `plugin.json`
- Current version: `0.1.0`
- Follow semantic versioning

### Publishing Updates
1. Update version in `marketplace.json` and `bns-dev/.claude-plugin/plugin.json`
2. Commit changes to main branch
3. Plugin automatically available in Claude Code marketplace

### Creating New Commands
1. Create new `.md` file in `bns-dev/commands/`
2. Add YAML frontmatter with `description` and `allowed-tools`
3. Write command instructions in Markdown body
4. Use `#$ARGUMENTS` to access command arguments
5. Test via Claude Code plugin system

## Important Conventions

- **Argument passing**: Use `#$ARGUMENTS` in command markdown to receive user input
- **Tool scoping**: Restrict bash commands with patterns like `Bash(git*)` for safety
- **Approval gates**: Commands should ask for approval before major operations
- **TodoWrite usage**: Use TodoWrite extensively for planning and tracking
- **GitHub integration**: All commands are GitHub-centric and rely on `gh` CLI
- **Language agnostic**: Commands work with any project type (Rails, Python, Node.js, etc.)
