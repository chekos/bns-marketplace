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

## Development Workflow Patterns

### Research → Plan → Implement → Verify
All commands follow this pattern:
1. **Research**: Analyze the task and codebase
2. **Plan**: Create TodoWrite plan and get approval
3. **Implement**: Execute changes systematically
4. **Verify**: Run tests, verify quality before committing

## Plugin Distribution

### Version Management
- Version defined in both `marketplace.json` and `plugin.json`
- Follow semantic versioning

### Publishing Updates
1. Update version in `marketplace.json` and `bns-dev/.claude-plugin/plugin.json`
2. Commit changes to main branch
3. Plugin automatically available in Claude Code marketplace

## Important Conventions

- **Argument passing**: Use `#$ARGUMENTS` in command markdown to receive user input
- **Tool scoping**: Restrict bash commands with patterns like `Bash(git*)` for safety
- **Approval gates**: Commands should ask for approval before major operations
- **TodoWrite usage**: Use TodoWrite extensively for planning and tracking
- **GitHub integration**: All commands are GitHub-centric and rely on `gh` CLI
- **Language agnostic**: Commands work with any project type (Rails, Python, Node.js, etc.)
