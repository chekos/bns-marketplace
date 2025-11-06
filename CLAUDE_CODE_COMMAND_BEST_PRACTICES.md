# Claude Code Slash Command Best Practices

> **Comprehensive Research Report**
> Date: 2025-11-05
> Based on official Anthropic documentation, successful marketplace plugins, and AI prompt engineering principles

---

## Table of Contents

1. [Command Structure Fundamentals](#1-command-structure-fundamentals)
2. [YAML Frontmatter Specification](#2-yaml-frontmatter-specification)
3. [Writing Clear, Actionable Prompts](#3-writing-clear-actionable-prompts)
4. [Common Patterns in Successful Commands](#4-common-patterns-in-successful-commands)
5. [Tool Scoping Best Practices](#5-tool-scoping-best-practices)
6. [Approval Gates & User Interaction](#6-approval-gates--user-interaction)
7. [Error Handling & Edge Cases](#7-error-handling--edge-cases)
8. [TodoWrite Integration Patterns](#8-todowrite-integration-patterns)
9. [Security Considerations](#9-security-considerations)
10. [Advanced Patterns & Techniques](#10-advanced-patterns--techniques)

---

## 1. Command Structure Fundamentals

### Location and Scoping

Commands are markdown files (`.md`) stored in specific directories:

- **Project-scoped**: `.claude/commands/` (shared via git, shows "(project)" in `/help`)
- **User-scoped**: `~/.claude/commands/` (personal, shows "(user)" in `/help`)

### Basic File Structure

```markdown
---
# YAML frontmatter (optional but recommended)
description: Brief command summary
allowed-tools: Read, Write, Edit, Bash(git:*)
model: claude-sonnet-4-0
argument-hint: [required-arg] [optional-arg]
---

# Command Name

Brief introduction explaining the command's purpose and context.

## Prerequisites

- List required tools
- State expected environment setup
- Note any dependencies

## Main Tasks

### 1. First Major Step

<thinking>
Explain the reasoning for this step
</thinking>

- [ ] Specific action to take
- [ ] Another specific action
- [ ] Use $ARGUMENTS placeholder for passed parameters

### 2. Second Major Step

Continue with workflow...

## Completion Criteria

Define what success looks like.
```

### Naming Conventions

- **Filename = Command name**: `feature-review.md` becomes `/feature-review`
- **Use namespaces for organization**: `workflows/feature-development.md` becomes `/workflows:feature-development`
- **Kebab-case recommended**: `create-issue.md` not `createIssue.md`
- **Descriptive names**: `/api-scaffold` not `/api`

---

## 2. YAML Frontmatter Specification

### Available Options

| Option | Type | Purpose | Default | Example |
|--------|------|---------|---------|---------|
| `description` | string | Brief command summary (10-200 chars) | First line of prompt | `"Create a comprehensive GitHub issue"` |
| `allowed-tools` | string | Comma-separated list of permitted tools | Inherits from conversation | `"Read, Write, Bash(git:*)"` |
| `model` | string | Specific Claude model to use | Inherits from conversation | `"claude-sonnet-4-0"` |
| `argument-hint` | string | Expected arguments for autocomplete | None | `"[issue-description]"` |
| `disable-model-invocation` | boolean | Prevent SlashCommand tool execution | false | `true` |
| `category` | string | Organizational category | None | `"development"` |

### Model Selection

Available models (as of January 2025):
- `claude-opus-4-1` - Most capable, use for complex tasks
- `claude-sonnet-4-0` - Balanced performance/cost, recommended default
- `claude-sonnet-4-5` - Latest with enhanced capabilities
- `claude-3-5-haiku-20241022` - Fast, use for simple tasks

### Complete Frontmatter Example

```yaml
---
description: Perform exhaustive code reviews using multi-agent analysis
allowed-tools: Read, Bash(gh:*), Bash(git:*), TodoWrite
model: claude-opus-4-1
argument-hint: [PR-number-or-url]
category: code-review
disable-model-invocation: false
---
```

---

## 3. Writing Clear, Actionable Prompts

### Core Principles from Anthropic

#### Be Explicit and Direct

**❌ Vague**: "Can you suggest some improvements?"
**✅ Clear**: "Analyze the code and make these improvements: refactor for readability, add error handling, improve performance."

**Why it matters**: Claude 4.5 is trained for precise instruction following. Saying "can you suggest" often results in suggestions rather than actions.

#### Use Action-Oriented Language

**❌ Passive**: "It would be good to have tests"
**✅ Active**: "Write comprehensive tests covering happy path, edge cases, and error scenarios"

**Pattern**: Start with strong verbs: "Create", "Implement", "Analyze", "Execute", "Generate"

#### Provide Context and Motivation

**Good structure**:
```markdown
## Context
[Why this command exists]

## Problem Statement
[What issue it solves]

## Approach
[How it solves it]
```

**Example**:
```markdown
## Context
Code reviews often miss security vulnerabilities and performance issues because
reviewers focus primarily on functionality.

## Problem Statement
Teams need a systematic way to ensure all aspects of code quality are evaluated
consistently.

## Approach
This command uses specialized agents to analyze security, performance,
architecture, and maintainability in parallel.
```

### XML-Style Structuring

Claude is trained to recognize XML tags for structure:

```markdown
<role>Senior Code Review Architect</role>

<requirements>
- Git repository with GitHub CLI
- Clean main/master branch
- Proper permissions for worktrees
</requirements>

<thinking>
First, determine the review target type and set up the worktree.
This enables all subsequent agents to analyze actual code, not just diffs.
</thinking>

<task_list>
- [ ] Determine review type: PR number, URL, or file path
- [ ] Create worktree at `$git_root/.worktrees/reviews/pr-$identifier`
- [ ] Check out PR branch in isolated worktree
- [ ] Navigate to worktree for analysis
</task_list>

<critical_requirement>
MUST create worktree FIRST to enable local code analysis. No exceptions.
</critical_requirement>
```

### Format Control

**Match your style to desired output**:

- **Bulleted lists** → Claude returns bulleted responses
- **Prose paragraphs** → Claude returns flowing prose
- **Code blocks** → Claude returns structured code

**Explicit format instructions**:
```markdown
## Output Format

Provide your analysis in this structure:

1. **Summary** (2-3 sentences)
2. **Critical Issues** (bullet list with severity)
3. **Recommendations** (numbered list with specific actions)
4. **Code Examples** (actual code blocks showing improvements)
```

### Variable References

- `$ARGUMENTS` - All arguments passed to the command
- `$1`, `$2`, etc. - Individual positional arguments
- File references with `@`: `@path/to/file.md` includes file content
- Bash execution with `!`: `!git status` runs before prompt

**Example**:
```markdown
## Feature Description

<feature_description>$ARGUMENTS</feature_description>

Current branch status: !`git branch --show-current`

Related documentation: @docs/architecture.md
```

---

## 4. Common Patterns in Successful Commands

### Multi-Agent Orchestration Pattern

**From Every's compounding-engineering plugin**:

```markdown
### Run Parallel Agents

<parallel_tasks>
Execute ALL of these agents simultaneously:

**Language-Specific Reviewers**:
1. Task kieran-rails-reviewer(PR content)
2. Task dhh-rails-reviewer(PR title)
3. Task rails-turbo-expert(PR content)

**Universal Reviewers**:
4. Task git-history-analyzer(PR content)
5. Task security-sentinel(PR content)
6. Task performance-oracle(PR content)
7. Task architecture-strategist(PR content)
</parallel_tasks>
```

**Key principles**:
- Call independent agents in parallel for speed
- Pass context between sequential agents
- Aggregate results for unified output
- Use specialized expertise for different aspects

### Research → Plan → Execute Pattern

**Best practice workflow**:

```markdown
### Phase 1: Research

<thinking>
Before implementing, understand existing patterns and constraints.
</thinking>

- [ ] Read relevant documentation
- [ ] Search codebase for similar implementations
- [ ] Identify project conventions (CLAUDE.md)
- [ ] Check dependencies and constraints

### Phase 2: Planning

<thinking>
Break down the work into concrete, testable steps.
</thinking>

- [ ] Create task breakdown
- [ ] Identify dependencies
- [ ] Define success criteria
- [ ] Use TodoWrite to track tasks

### Phase 3: Execution

<thinking>
Execute systematically, validating as you go.
</thinking>

- [ ] Implement each task
- [ ] Run tests after each change
- [ ] Mark tasks complete in TodoWrite
- [ ] Validate against success criteria
```

**Why it works**:
- Prevents jumping straight to implementation
- Ensures alignment with project patterns
- Provides clear progress tracking
- Reduces errors and rework

### Worktree Isolation Pattern

**From Every's review command**:

```markdown
### 1. Worktree Creation (ALWAYS FIRST)

<critical_requirement>
MUST create worktree FIRST to enable local code analysis. No exceptions.
</critical_requirement>

#### Immediate Actions:

- Get git root: `git_root=$(git rev-parse --show-toplevel)`
- Create worktrees directory: `mkdir -p "$git_root/.worktrees"`
- Add to .gitignore: `echo ".worktrees" >> "$git_root/.gitignore"`
- Create worktree: `git worktree add -b feature-name "$git_root/.worktrees/feature-name" main`
- Navigate: `cd "$git_root/.worktrees/feature-name"`
```

**Benefits**:
- Isolated development environment
- No interference with main branch
- Safe experimentation
- Easy cleanup

### Progressive Detail Levels

**From Every's plan command**:

```markdown
### Choose Implementation Detail Level

#### 📄 MINIMAL (Quick Issue)
**Best for**: Simple bugs, small improvements
**Includes**: Problem statement, basic acceptance criteria

#### 📋 STANDARD (Most Features)
**Best for**: Complex bugs, team collaboration
**Includes**: Everything from MINIMAL plus technical considerations, metrics, risks

#### 📚 COMPREHENSIVE (Critical Features)
**Best for**: Architecture changes, security features
**Includes**: Everything from STANDARD plus implementation guide, test strategy
```

**Why it works**:
- Adapts to complexity
- Reduces overhead for simple tasks
- Ensures thoroughness when needed
- User choice based on context

### Framework Selection Matrices

**From wshobson's api-scaffold command**:

```python
frameworks = {
    'fastapi': {
        'best_for': ['high_performance', 'async_operations', 'modern_python'],
        'strengths': ['Auto OpenAPI docs', 'Type hints', 'Async support'],
        'use_cases': ['Microservices', 'Data APIs', 'ML APIs']
    },
    'django_rest': {
        'best_for': ['rapid_development', 'orm_integration'],
        'strengths': ['Batteries included', 'ORM', 'Admin panel'],
        'use_cases': ['CRUD applications', 'Content management']
    }
}
```

**Pattern**: Provide decision frameworks that help Claude choose the right approach based on requirements.

### Conditional Logic Based on Detection

**Example from review command**:

```markdown
#### Detect Project Type

<project_type_detection>

**Rails Project**:
- `Gemfile` with `rails` gem
- `config/application.rb`
- `app/` directory structure

**TypeScript Project**:
- `tsconfig.json`
- `package.json` with TypeScript dependencies

Based on detection, use appropriate language-specific reviewers.
</project_type_detection>
```

**Benefits**:
- Single command works across project types
- Automatic adaptation
- Reduced command proliferation
- Better user experience

---

## 5. Tool Scoping Best Practices

### Understanding Tool Permissions

Tools can be scoped at three levels:

1. **Conversation level**: Default permissions for the session
2. **Command level**: Override via frontmatter `allowed-tools`
3. **User settings**: Permanent allowlists/denylists

### Tool Specification Syntax

**Basic format**: `ToolName(scope:permission)`

**Available tools**:
- `Read` - Read files
- `Write` - Write/create files
- `Edit` - Edit existing files
- `Bash(command:*)` - Run bash commands
- `Glob` - Pattern-based file search
- `Grep` - Content search
- `TodoWrite` - Task management
- `AskUserQuestion` - User prompts
- `WebSearch` - Internet search
- `WebFetch` - Fetch URLs

### Bash Command Scoping

**Syntax**: `Bash(command:subcommand:args)`

**Examples**:

```yaml
# Git operations only
allowed-tools: Bash(git:*)

# Specific git commands
allowed-tools: Bash(git add:*), Bash(git commit:*), Bash(git status:*)

# GitHub CLI for PRs and issues
allowed-tools: Bash(gh pr:*), Bash(gh issue:*)

# Node package manager
allowed-tools: Bash(npm:*), Bash(yarn:*)

# Testing commands
allowed-tools: Bash(pytest:*), Bash(jest:*)
```

**Wildcard patterns**:
- `Bash(git:*)` - All git commands
- `Bash(git commit:*)` - Only git commit (all flags)
- `Bash(git commit:-m:*)` - Only git commit -m

### Progressive Permission Patterns

**Level 1: Read-only** (research, analysis)
```yaml
allowed-tools: Read, Glob, Grep, Bash(git status:*), Bash(git log:*)
```

**Level 2: Safe modifications** (documentation, non-destructive)
```yaml
allowed-tools: Read, Write, Edit, Bash(git:add|commit|status)
```

**Level 3: Full development** (implementation)
```yaml
allowed-tools: Read, Write, Edit, Bash(git:*), Bash(npm:*), TodoWrite
```

**Level 4: Deployment** (production changes)
```yaml
allowed-tools: Read, Write, Edit, Bash(git:*), Bash(gh:*), Bash(docker:*)
```

### Command-Specific Tool Needs

**Code review command**:
```yaml
allowed-tools: Read, Bash(gh:*), Bash(git:*), TodoWrite
# Needs: Read code, use gh CLI, git operations, track tasks
```

**Issue creation command**:
```yaml
allowed-tools: Read, Write, Bash(gh issue:create), Bash(git:branch|status)
# Needs: Read for context, Write for drafts, gh for creation, git for state
```

**Test runner command**:
```yaml
allowed-tools: Read, Bash(pytest:*), Bash(jest:*), Bash(npm test:*)
# Needs: Read test files, run test frameworks
```

### Security Through Tool Restriction

**Principle**: Grant minimum necessary permissions

**Anti-pattern**: `allowed-tools: *`
**Better**: Explicitly list needed tools

**Example - deployment command**:
```yaml
# ❌ Too permissive
allowed-tools: Bash(*)

# ✅ Explicit and safe
allowed-tools: Read, Bash(git:push), Bash(gh:pr create), Bash(docker:build|push)
```

### Tool Scoping for Multi-Agent Commands

**Pattern**: Different agents need different tools

```yaml
# Parent command - minimal tools
allowed-tools: Read, TodoWrite

# Research agents - read-only
allowed-tools: Read, Grep, Bash(git log:*)

# Implementation agents - full development
allowed-tools: Read, Write, Edit, Bash(git:*), Bash(npm:*)

# Review agents - read + gh CLI
allowed-tools: Read, Bash(gh:*), Bash(git:*)
```

**Note**: Child agents/subagents inherit and can be further restricted, but cannot gain permissions beyond what parent has.

---

## 6. Approval Gates & User Interaction

### Permission Model Overview

Claude Code operates on a permission-based model:
- **Default**: Read-only, asks before modifications
- **Normal mode**: Standard permission prompts
- **Auto-accept**: Automatically approves all actions
- **Plan mode**: Read-only research and planning

### AskUserQuestion Tool

**Purpose**: Structured user interaction for decisions, preferences, clarifications

**Best practices**:

```markdown
### When to Use AskUserQuestion

- **Decision points**: Multiple valid approaches exist
- **Preference gathering**: Style, framework, or pattern choices
- **Clarification**: Ambiguous requirements
- **Confirmation**: Before destructive or expensive operations
```

**Example usage**:

```markdown
## Implementation Approach Selection

Before proceeding, ask the user:

<user_question>
Use AskUserQuestion to determine:

**Question**: "How should we implement the authentication?"

**Options**:
1. JWT with refresh tokens (standard, stateless)
2. Session-based with Redis (traditional, centralized)
3. OAuth2 integration (external provider)
4. Custom token system (flexible, complex)

**Recommendation**: JWT for API-first applications, Sessions for traditional web apps
</user_question>
```

**Pattern for destructive operations**:

```markdown
## Confirmation Required

<approval_gate>
Before deleting files, use AskUserQuestion:

**Question**: "This will delete 15 test files. Proceed?"
**Options**:
- Yes, delete all test files
- No, cancel operation
- Show me the file list first

If user chooses "Show me the file list first", display files and ask again.
</approval_gate>
```

### disable-model-invocation Flag

**Purpose**: Prevent Claude from automatically invoking command via SlashCommand tool

**Use cases**:
- Commands that require explicit user initiation
- Commands with side effects
- Commands that need user context
- Expensive operations

```yaml
---
description: Deploy application to production
allowed-tools: Bash(docker:*), Bash(kubectl:*)
disable-model-invocation: true  # Prevent auto-invocation
---

# IMPORTANT: This command deploys to production
# Only run when explicitly instructed by user
```

### Explicit Confirmation Patterns

**Pattern 1: Pre-flight checklist**

```markdown
## Pre-Deployment Checklist

Before deploying, verify:

- [ ] All tests passing
- [ ] Code reviewed and approved
- [ ] Database migrations ready
- [ ] Rollback plan documented
- [ ] Stakeholders notified

**Ask user**: "All checklist items confirmed?"
```

**Pattern 2: Impact summary**

```markdown
## Operation Impact Summary

This command will:
- Delete 247 cache files
- Regenerate 52 configuration files
- Restart 8 services
- Estimated downtime: 30 seconds

**Confirm before proceeding**
```

**Pattern 3: Dry-run first**

```markdown
## Execution Strategy

1. Run in dry-run mode first
2. Show what would be changed
3. Ask for confirmation
4. Execute actual changes
5. Validate results
```

### Plan Mode Best Practices

**When command is called in Plan Mode**, adjust behavior:

```markdown
<plan_mode_behavior>
When in Plan Mode (read-only):

1. Research and analyze thoroughly
2. Use AskUserQuestion to clarify requirements
3. Create detailed plan with TodoWrite
4. Provide implementation strategy
5. DO NOT make actual changes
6. Ask user if they want to exit Plan Mode to execute

Example message:
"I've created a comprehensive plan with 12 tasks. Would you like to exit Plan
Mode and execute this plan, or would you prefer to review and modify it first?"
</plan_mode_behavior>
```

---

## 7. Error Handling & Edge Cases

### Defensive Programming in Commands

**Principle**: Anticipate failures and handle them gracefully

#### Check Prerequisites First

```markdown
## Prerequisites Validation

<validation_checklist>
Before starting, verify:

1. **Git repository check**:
   ```bash
   if ! git rev-parse --git-dir > /dev/null 2>&1; then
       echo "Error: Not a git repository"
       exit 1
   fi
   ```

2. **GitHub CLI authentication**:
   ```bash
   if ! gh auth status > /dev/null 2>&1; then
       echo "Error: GitHub CLI not authenticated. Run: gh auth login"
       exit 1
   fi
   ```

3. **Required tools**:
   ```bash
   for cmd in git gh jq; do
       if ! command -v $cmd &> /dev/null; then
           echo "Error: $cmd not found. Please install it."
           exit 1
       fi
   done
   ```

4. **Working directory clean**:
   ```bash
   if [[ -n $(git status --porcelain) ]]; then
       echo "Warning: Working directory has uncommitted changes"
       # Ask user if they want to proceed
   fi
   ```
</validation_checklist>
```

### Error Recovery Strategies

**Pattern 1: Graceful degradation**

```markdown
## API Scaffold Generation

### Primary Approach: FastAPI
Try to generate using FastAPI first.

If FastAPI fails:
1. Check for Python version compatibility
2. Fall back to Flask if Python < 3.8
3. Provide manual setup instructions if all fail

### Fallback Chain:
FastAPI → Flask → Django → Manual Instructions
```

**Pattern 2: Partial success handling**

```markdown
## Multi-File Operations

For each file in the list:
1. Try to process file
2. If error, log it and continue
3. Track successes and failures
4. Report summary at end

**Do not fail entire operation if one file fails**

Summary format:
- ✅ 45 files processed successfully
- ⚠️ 3 files skipped (permission denied)
- ❌ 2 files failed (syntax errors)
```

**Pattern 3: Rollback capability**

```markdown
## Database Migration

### Execution with Rollback

1. **Create backup**:
   ```bash
   pg_dump dbname > backup_$(date +%Y%m%d_%H%M%S).sql
   ```

2. **Run migration**:
   ```bash
   if ! ./migrate.sh; then
       echo "Migration failed, rolling back..."
       psql dbname < backup_*.sql
       exit 1
   fi
   ```

3. **Verify success**:
   - Check table structure
   - Run smoke tests
   - If verification fails, rollback
```

### Edge Case Handling

**Common edge cases to consider**:

1. **Empty inputs**
   ```markdown
   ## Handle Empty Arguments

   If $ARGUMENTS is empty:
   - Don't fail silently
   - Show usage example
   - Ask user for input with AskUserQuestion
   ```

2. **Missing files**
   ```markdown
   ## File Operations

   Before reading file:
   - Check if file exists
   - Check if readable
   - Provide clear error if missing
   - Suggest correct path if typo detected
   ```

3. **Network failures**
   ```markdown
   ## API Calls

   For external API calls:
   - Set reasonable timeouts
   - Retry with exponential backoff
   - Cache responses when possible
   - Provide offline fallback
   ```

4. **Permission issues**
   ```markdown
   ## File System Operations

   Before writing:
   - Check write permissions
   - Verify disk space
   - Create parent directories if missing
   - Provide sudo instructions if needed
   ```

5. **Concurrent execution**
   ```markdown
   ## Lock Files

   Prevent concurrent runs:
   ```bash
   LOCKFILE="/tmp/mycommand.lock"
   if [ -f "$LOCKFILE" ]; then
       echo "Another instance is running"
       exit 1
   fi
   trap "rm -f $LOCKFILE" EXIT
   touch $LOCKFILE
   ```

### Validation Patterns

**Input validation**:

```markdown
## Argument Validation

<validation>
Validate $ARGUMENTS before proceeding:

1. **Format check**:
   - PR number: Must be numeric
   - URL: Must match GitHub PR pattern
   - File path: Must exist and be readable

2. **Range check**:
   - PR number: Must be positive integer
   - File size: Must be < 10MB
   - Line count: Must be reasonable

3. **Type check**:
   - Ensure correct data type
   - Convert/coerce if possible
   - Error with helpful message if invalid

Example validation:
```bash
if [[ ! "$1" =~ ^[0-9]+$ ]]; then
    echo "Error: PR number must be numeric"
    echo "Usage: /review 123"
    exit 1
fi
```
</validation>
```

### Error Message Best Practices

**Good error messages are**:
1. **Specific**: "File 'config.yaml' not found in /app/config"
2. **Actionable**: "Run 'npm install' to install dependencies"
3. **Contextual**: Include what was being attempted
4. **Helpful**: Suggest next steps or alternatives

**Example**:

```markdown
## Error Reporting Format

When operation fails, provide:

❌ **Error**: [What went wrong]

**Context**: [What was being attempted]

**Cause**: [Why it failed]

**Solution**: [How to fix it]

**Example**:
```
❌ Error: Failed to create GitHub issue

Context: Attempting to create issue "Add user authentication"
Cause: GitHub CLI not authenticated (gh auth status failed)
Solution: Run 'gh auth login' to authenticate GitHub CLI

For more help: https://cli.github.com/manual/gh_auth_login
```
```

---

## 8. TodoWrite Integration Patterns

### When to Use TodoWrite

**From Claude Code best practices**:

> Create todo lists when tasks require **3 or more distinct steps**. For simple tasks, just execute them directly.

**Use TodoWrite for**:
- Multi-step implementations
- Complex workflows
- Long-running tasks
- Tasks with dependencies
- When user needs visibility into progress

**Don't use TodoWrite for**:
- Single-step operations
- Trivial tasks
- Quick queries or lookups

### Todo Item Structure

**Three states**:
1. `pending` - Not yet started
2. `in_progress` - Currently working (ideally only ONE at a time)
3. `completed` - Finished successfully

**Two required forms**:
```json
{
  "content": "Run tests",  // Imperative: what needs to be done
  "activeForm": "Running tests",  // Present continuous: what is happening
  "status": "pending"
}
```

### TodoWrite Best Practices

**1. Create todos at the start**

```markdown
## Phase 1: Planning

Create comprehensive todo list using TodoWrite:

<todo_creation>
Based on the work plan, create todos with:

1. Clear, actionable content
2. Proper active forms
3. Logical ordering with dependencies
4. Appropriate granularity

Example:
- content: "Create database schema for users table"
  activeForm: "Creating database schema for users table"

- content: "Implement user authentication API"
  activeForm: "Implementing user authentication API"

- content: "Write integration tests for auth flow"
  activeForm: "Writing integration tests for auth flow"
</todo_creation>
```

**2. Update status before and after work**

```markdown
## Execution Pattern

For each task:

1. **Before starting**:
   - Mark task as `in_progress`
   - Ensure only one task is `in_progress`

2. **During execution**:
   - Work on the task
   - Handle errors appropriately
   - Validate completion

3. **After completion**:
   - Verify success criteria met
   - Mark task as `completed` IMMEDIATELY
   - Move to next pending task
```

**3. Don't mark completed if blocked**

```markdown
## Completion Criteria

ONLY mark a task as completed when:

✅ **Do mark completed**:
- Task fully accomplished
- Tests passing
- Implementation working
- No unresolved errors

❌ **Don't mark completed**:
- Tests are failing
- Implementation is partial
- Errors encountered but not fixed
- Waiting for external dependency

**If blocked**: Keep status as `in_progress` and create new task describing the blocker.
```

**4. Break down complex tasks**

```markdown
## Task Granularity

If a task seems too complex, break it down:

❌ **Too broad**:
- content: "Implement user authentication"

✅ **Well-scoped**:
- content: "Create User model with password hashing"
- content: "Implement login endpoint with JWT generation"
- content: "Add password reset functionality"
- content: "Write authentication middleware"
- content: "Create authentication tests"
```

### Complete TodoWrite Example

**From Every's work command**:

```markdown
### Phase 2: Document Analysis and Planning

1. **Read Input Document**
   - Use Read tool to examine the work document
   - Identify all deliverables and requirements
   - Note any constraints or dependencies
   - Extract success criteria

2. **Create Task Breakdown**
   - Convert requirements into specific tasks
   - Add implementation details for each task
   - Include testing and validation steps
   - Consider edge cases and error handling

3. **Build Todo List**

Use TodoWrite to create comprehensive list:

```json
{
  "todos": [
    {
      "content": "Set up development environment and feature branch",
      "activeForm": "Setting up development environment and feature branch",
      "status": "pending"
    },
    {
      "content": "Implement user authentication API endpoints",
      "activeForm": "Implementing user authentication API endpoints",
      "status": "pending"
    },
    {
      "content": "Write unit tests for authentication logic",
      "activeForm": "Writing unit tests for authentication logic",
      "status": "pending"
    },
    {
      "content": "Create integration tests for auth flow",
      "activeForm": "Creating integration tests for auth flow",
      "status": "pending"
    },
    {
      "content": "Update API documentation",
      "activeForm": "Updating API documentation",
      "status": "pending"
    },
    {
      "content": "Run full test suite and linting",
      "activeForm": "Running full test suite and linting",
      "status": "pending"
    }
  ]
}
```

### Phase 3: Systematic Execution

```markdown
## Task Execution Loop

while (tasks remain):
  1. Select next pending task
  2. Use TodoWrite to mark as `in_progress`
  3. Execute task completely
  4. Validate completion
  5. Use TodoWrite to mark as `completed`
  6. Report progress to user

**Example execution**:

// Start first task
TodoWrite([
  {content: "Set up development environment", activeForm: "Setting up...", status: "in_progress"},
  {content: "Implement API endpoints", activeForm: "Implementing...", status: "pending"},
  ...
])

// [Perform the work]

// Complete first task, start second
TodoWrite([
  {content: "Set up development environment", activeForm: "Setting up...", status: "completed"},
  {content: "Implement API endpoints", activeForm: "Implementing...", status: "in_progress"},
  ...
])
```

### Dynamic Todo Management

**Add new tasks discovered during execution**:

```markdown
## Handling Discovered Work

If during execution you discover additional required tasks:

1. Add them to the todo list immediately
2. Place them in appropriate order (consider dependencies)
3. Set status to `pending`
4. Continue with current task

Example:
```json
// During "Implement API endpoints", discover need for rate limiting

{
  "todos": [
    {content: "Implement API endpoints", status: "in_progress"},
    {content: "Add rate limiting middleware", status: "pending"},  // NEW
    {content: "Configure Redis for rate limit storage", status: "pending"},  // NEW
    {content: "Write unit tests", status: "pending"}
  ]
}
```

**Remove irrelevant tasks**:

```markdown
## Todo List Maintenance

If a task becomes irrelevant:
- Remove it entirely from the list
- Don't mark as completed
- Explain to user why it was removed

Example: "Removed 'Set up MySQL' task because we're using PostgreSQL instead."
```

---

## 9. Security Considerations

### Security Principles

**Zero-trust approach**: Commands should assume they're running in a potentially hostile environment.

**Principle of least privilege**: Grant minimum necessary permissions.

**Fail secure**: When in doubt, ask for permission rather than proceeding.

### Dangerous Operations Checklist

**Before implementing a command that**:
- Deletes files or data
- Modifies production systems
- Accesses sensitive information
- Makes network requests
- Installs packages
- Changes permissions

**Include**:
1. Explicit confirmation gate
2. Clear impact description
3. Rollback capability
4. Audit logging
5. Rate limiting (if applicable)

### Scoping Sensitive Commands

**Example - deployment command**:

```yaml
---
description: Deploy application to production environment
allowed-tools: Read, Bash(git:push), Bash(docker:build|push), Bash(kubectl:apply)
disable-model-invocation: true
category: deployment
---

# 🚨 PRODUCTION DEPLOYMENT COMMAND 🚨

**WARNING**: This command makes changes to production infrastructure.

## Security Controls

1. **Confirmation Required**: Must explicitly confirm deployment
2. **Audit Trail**: All actions logged to deployment.log
3. **Rollback Ready**: Previous version tagged for quick rollback
4. **Notification**: Team notified of deployment via Slack

## Prerequisites

- [ ] All tests passing in CI/CD
- [ ] Code review approved
- [ ] Change request approved
- [ ] Backup created
- [ ] Rollback plan documented
```

### Preventing Command Injection

**Validate and sanitize inputs**:

```markdown
## Input Sanitization

<security_check>
Before using $ARGUMENTS in bash commands:

1. **Validate format**:
   ```bash
   # Only allow alphanumeric, dash, underscore
   if [[ ! "$BRANCH_NAME" =~ ^[a-zA-Z0-9_-]+$ ]]; then
       echo "Invalid branch name"
       exit 1
   fi
   ```

2. **Quote variables**:
   ```bash
   # ❌ Dangerous
   git commit -m $COMMIT_MSG

   # ✅ Safe
   git commit -m "$COMMIT_MSG"
   ```

3. **Use -- to separate options from arguments**:
   ```bash
   # ❌ Could be exploited
   git checkout $BRANCH

   # ✅ Safe
   git checkout -- "$BRANCH"
   ```

4. **Avoid eval**:
   ```bash
   # ❌ Never do this
   eval $USER_INPUT
   ```
</security_check>
```

### Handling Secrets

**Never include secrets in commands**:

```markdown
## Secret Management

<security_rules>
1. **Never hardcode secrets**:
   ❌ `API_KEY="sk-1234567890"`
   ✅ `API_KEY="${API_KEY:-$(read -sp 'API Key: ' key; echo $key)}"`

2. **Use environment variables**:
   ```bash
   if [ -z "$GITHUB_TOKEN" ]; then
       echo "Error: GITHUB_TOKEN not set"
       echo "Set it with: export GITHUB_TOKEN=your_token"
       exit 1
   fi
   ```

3. **Check .gitignore**:
   ```bash
   if ! grep -q "^\.env$" .gitignore; then
       echo "Warning: .env not in .gitignore"
       echo "Add it to prevent committing secrets"
   fi
   ```

4. **Don't log secrets**:
   ```bash
   # ❌ Don't do this
   echo "Using API key: $API_KEY"

   # ✅ Do this
   echo "Using API key: ${API_KEY:0:8}..."
   ```
</security_rules>
```

### Network Security

**Best practices for external calls**:

```markdown
## External API Calls

<network_security>
1. **Validate URLs**:
   ```bash
   # Only allow specific domains
   if [[ ! "$URL" =~ ^https://api\.github\.com/ ]]; then
       echo "Invalid URL domain"
       exit 1
   fi
   ```

2. **Use HTTPS only**:
   ```bash
   URL="${URL/http:/https:}"
   ```

3. **Set timeouts**:
   ```bash
   curl --max-time 30 "$URL"
   ```

4. **Validate responses**:
   ```bash
   response=$(curl -s "$URL")
   if ! echo "$response" | jq empty 2>/dev/null; then
       echo "Invalid JSON response"
       exit 1
   fi
   ```

5. **Handle rate limits**:
   ```bash
   if [[ "$HTTP_STATUS" == "429" ]]; then
       echo "Rate limited, waiting..."
       sleep 60
   fi
   ```
</network_security>
```

### Allowlist > Denylist

**Use allowlists instead of denylists**:

```yaml
# ❌ Denylist approach - risky
allowed-tools: Bash(*), Read, Write, Edit
# Then try to block dangerous commands - easy to miss something

# ✅ Allowlist approach - secure
allowed-tools: Read, Bash(git:status|log), Bash(grep:*), Bash(ls:*)
# Only allow specific, safe commands
```

### Audit Logging

**Log important actions**:

```markdown
## Audit Trail

For sensitive operations, maintain audit log:

```bash
AUDIT_LOG="${HOME}/.claude/audit.log"

log_action() {
    local action="$1"
    local details="$2"
    echo "[$(date -Iseconds)] $action: $details" >> "$AUDIT_LOG"
}

# Usage
log_action "DEPLOY" "Deployed version v1.2.3 to production"
log_action "DELETE" "Removed 42 cache files from /tmp/cache"
```

Review audit log periodically:
```bash
/audit-review  # Custom command to analyze audit.log
```
```

---

## 10. Advanced Patterns & Techniques

### Extended Thinking Mode

**Trigger extended reasoning**:

```markdown
## Deep Analysis Required

[Extended thinking: This task requires careful consideration of multiple
trade-offs including performance, maintainability, and user experience.
I need to analyze each approach thoroughly before recommending a solution.]

### Analysis Framework

<thinking_prompt>
ULTRA-THINK: Explore all dimensions of this problem:

1. **Technical Feasibility**: Can this be implemented with current stack?
2. **Performance Impact**: What are the computational costs?
3. **Maintainability**: How easy is this to understand and modify?
4. **Security Implications**: What vulnerabilities might this introduce?
5. **User Experience**: How does this affect end users?
6. **Alternative Approaches**: What other solutions exist?
</thinking_prompt>
```

**When to use**:
- Complex architecture decisions
- Security-critical features
- Performance optimization
- Design pattern selection

### Dynamic Agent Selection

**Choose specialists based on context**:

```markdown
## Smart Agent Routing

<agent_selection>
Analyze the problem type and select appropriate specialist:

**Problem Analysis**:
1. Identify primary domain (frontend/backend/infrastructure)
2. Determine complexity level (simple/moderate/complex)
3. Check for special requirements (security/performance/compliance)

**Agent Selection Matrix**:

| Problem Type | Complexity | Agent |
|--------------|------------|-------|
| Bug fix | Simple | bug-hunter |
| Bug fix | Complex | senior-debugger |
| Feature | Simple | feature-developer |
| Feature | Complex | architect → frontend-dev → backend-dev |
| Security | Any | security-sentinel + code-auditor |
| Performance | Any | performance-oracle + profiler-expert |

**Execution**:
```python
if complexity == "complex" and domain == "full-stack":
    agents = [
        Task architect(problem),
        Task backend-dev(architect_output),
        Task frontend-dev(architect_output),
        Task test-automator(all_outputs)
    ]
else:
    agent = select_single_agent(problem_type, complexity)
    Task agent(problem)
```
</agent_selection>
```

### Parallel Tool Execution

**Call multiple tools simultaneously**:

```markdown
## Efficient Parallel Operations

When operations are independent, run them in parallel:

<parallel_execution>
Example: Gathering context for code review

Execute ALL of these simultaneously:
1. Read tool: Fetch PR diff
2. Bash(git log): Get commit history
3. Bash(gh pr view): Get PR metadata
4. Bash(gh pr checks): Get CI status
5. Read tool: Fetch CLAUDE.md for conventions

This reduces total time from ~10s (sequential) to ~2s (parallel).
</parallel_execution>

**Pattern**:
```markdown
Run these in parallel:
- Task repo-analyzer(target_repo)
- Task dependency-checker(target_repo)
- Task security-scanner(target_repo)
- Task test-validator(target_repo)

Then aggregate results for unified report.
```
```

### Checkpoint and Resume Patterns

**For long-running commands**:

```markdown
## Checkpoint System

<checkpoint_strategy>
For commands that take >5 minutes:

1. **Save state periodically**:
   ```bash
   CHECKPOINT_FILE=".claude/checkpoints/$(date +%s).json"
   save_checkpoint() {
       jq -n \
           --arg step "$current_step" \
           --arg status "$status" \
           '{step: $step, status: $status, timestamp: now}' \
           > "$CHECKPOINT_FILE"
   }
   ```

2. **Resume capability**:
   ```bash
   if [ -f "$CHECKPOINT_FILE" ]; then
       echo "Found checkpoint, resume from step $(jq -r .step $CHECKPOINT_FILE)?"
       # Use AskUserQuestion
   fi
   ```

3. **Clean up old checkpoints**:
   ```bash
   find .claude/checkpoints -mtime +7 -delete
   ```
</checkpoint_strategy>
```

### Conditional Command Variants

**Adapt behavior based on context**:

```markdown
## Context-Aware Execution

<conditional_behavior>
Detect environment and adjust approach:

**CI Environment**:
```bash
if [ -n "$CI" ]; then
    # Non-interactive mode
    # Skip confirmations
    # Output machine-readable format
    # Fail fast on errors
fi
```

**Local Development**:
```bash
else
    # Interactive mode
    # Ask for confirmations
    # Colorized output
    # Helpful error messages
fi
```

**Example**:
```bash
if [ -n "$CI" ]; then
    # CI mode: strict and automated
    npm test -- --coverage --reporters=json
    if [ $? -ne 0 ]; then exit 1; fi
else
    # Dev mode: helpful and interactive
    npm test -- --watch --verbose
    if [ $? -ne 0 ]; then
        echo "Tests failed. Run /fix-tests for help"
    fi
fi
```
</conditional_behavior>
```

### Sub-Command Pattern

**Organize related commands**:

```markdown
## Sub-Command Structure

Main command: `/system-prompt`

Sub-commands via argument:
- `/system-prompt edit` - Edit the system prompt
- `/system-prompt show` - Display current prompt
- `/system-prompt backup` - Backup to timestamped file
- `/system-prompt restore` - Restore from backup

**Implementation**:
```bash
SUBCOMMAND="$1"

case "$SUBCOMMAND" in
    edit)
        # Edit logic
        ;;
    show)
        # Show logic
        ;;
    backup)
        # Backup logic
        ;;
    restore)
        # Restore logic
        ;;
    *)
        echo "Usage: /system-prompt {edit|show|backup|restore}"
        exit 1
        ;;
esac
```
```

### Self-Improvement Commands

**Meta-commands that improve the command system**:

```markdown
## Command Generator Command

Create new commands using a template:

`/generate-command [name] [description]`

**Process**:
1. Ask user for command details (AskUserQuestion)
2. Select appropriate template based on category
3. Generate command file with proper frontmatter
4. Place in `.claude/commands/`
5. Validate syntax
6. Test with example input
7. Document usage in README

**Template Selection**:
- Simple utility: Basic template
- Multi-step workflow: TodoWrite integration
- Code modification: Full tool access
- Review/analysis: Read-only + gh CLI
```

### Quality Gates Pattern

**Built-in quality checks**:

```markdown
## Pre-Commit Quality Gates

Before allowing commit/push:

<quality_gates>
1. **Linting**:
   ```bash
   npm run lint || { echo "❌ Linting failed"; exit 1; }
   ```

2. **Type Checking**:
   ```bash
   npm run typecheck || { echo "❌ Type errors found"; exit 1; }
   ```

3. **Tests**:
   ```bash
   npm test || { echo "❌ Tests failing"; exit 1; }
   ```

4. **Coverage**:
   ```bash
   coverage=$(npm run coverage:check)
   if [ "$coverage" -lt 80 ]; then
       echo "❌ Coverage below 80%"
       exit 1
   fi
   ```

5. **Security Scan**:
   ```bash
   npm audit --audit-level=high || { echo "⚠️  Security vulnerabilities"; }
   ```

All gates passed ✅
</quality_gates>
```

---

## Key Takeaways

### What Makes a Great Command

1. **Clear Purpose**: Specific, well-defined use case
2. **Good Documentation**: Prerequisites, examples, troubleshooting
3. **Proper Scoping**: Minimum necessary tool permissions
4. **Error Handling**: Graceful failures with helpful messages
5. **User Interaction**: AskUserQuestion for decisions, confirmation for destructive ops
6. **Progress Visibility**: TodoWrite for complex workflows
7. **Security**: Input validation, secret handling, audit logging

### Command Design Checklist

Before shipping a command, verify:

- [ ] Clear, descriptive name
- [ ] Comprehensive frontmatter with proper tool scoping
- [ ] Prerequisites documented and validated
- [ ] Input validation and error handling
- [ ] User confirmations for destructive operations
- [ ] TodoWrite integration for multi-step workflows
- [ ] Security considerations addressed
- [ ] Example usage provided
- [ ] Edge cases handled
- [ ] Tested with real-world scenarios

### Anti-Patterns to Avoid

1. ❌ Overly broad tool permissions (`allowed-tools: *`)
2. ❌ No error handling or validation
3. ❌ Destructive operations without confirmation
4. ❌ Vague or ambiguous instructions
5. ❌ TodoWrite for trivial single-step tasks
6. ❌ Hardcoded secrets or credentials
7. ❌ No documentation or examples
8. ❌ Failing silently instead of providing helpful errors
9. ❌ Not using AskUserQuestion for important decisions
10. ❌ Complex logic without conditional branches

---

## Additional Resources

### Official Documentation
- [Claude Code Docs - Slash Commands](https://docs.claude.com/en/docs/claude-code/slash-commands)
- [Claude Code Best Practices](https://www.anthropic.com/engineering/claude-code-best-practices)
- [Prompt Engineering Guide](https://docs.claude.com/en/docs/build-with-claude/prompt-engineering)

### Example Repositories
- [Every Marketplace - compounding-engineering](https://github.com/EveryInc/every-marketplace/tree/main/plugins/compounding-engineering)
- [wshobson/commands](https://github.com/wshobson/commands)
- [qdhenry/Claude-Command-Suite](https://github.com/qdhenry/Claude-Command-Suite)
- [hesreallyhim/awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code)

### Community Resources
- [Claude Code Plugin Marketplace](https://claudecodemarketplace.com/)
- [ClaudeLog - Best Practices](https://claudelog.com/)

---

**Document Version**: 1.0
**Last Updated**: 2025-11-05
**Research Sources**: Anthropic official docs, Every marketplace, community best practices, Claude 4.5 prompt engineering guidelines
