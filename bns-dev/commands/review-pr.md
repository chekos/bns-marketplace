---
allowed-tools: [Read, Bash(gh*), Bash(git*), Grep, Glob, AskUserQuestion]
description: Review pull requests with comprehensive feedback on code quality, security, and best practices
argument-hint: [pr-number]
---

Review pull request #$ARGUMENTS comprehensively.

## Phase 1: Prerequisites

Validate environment:
```bash
gh auth status
gh pr view #$ARGUMENTS --json number
```

## Phase 2: Gather Context

1. Fetch PR details:
   ```bash
   gh pr view #$ARGUMENTS --json title,body,author,files
   ```

2. Get code changes:
   ```bash
   gh pr diff #$ARGUMENTS
   ```

3. Check CI status:
   ```bash
   gh pr checks #$ARGUMENTS
   ```

4. Read project conventions (CLAUDE.md if exists)

## Phase 3: Analysis

Analyze the PR systematically:

- **Code Quality**: Readability, maintainability, adherence to project conventions
- **Potential Bugs**: Logic errors, edge cases, null/undefined handling
- **Performance**: N+1 queries, unnecessary loops, caching opportunities
- **Security**: Input validation, authentication checks, SQL injection risks
- **Test Coverage**: Are there tests? Do they cover edge cases? Test quality?

Be constructive and specific. Provide code examples for suggestions.

## Phase 4: Compose Review

Structure your feedback as:
- **Summary** (2-3 sentences)
- **Critical Issues** (blockers that must be fixed)
- **Suggestions** (improvements that would be good to make)
- **Nitpicks** (optional improvements)

## Phase 5: Submit Review

Use AskUserQuestion to determine how to submit:

**Options:**
1. "Post as PR review comment"
2. "Post as blocking review (Request Changes)"
3. "Post as approving review (Approve)"
4. "Save to file only (no GitHub post)"

If posting to GitHub, use:
```bash
gh pr review #$ARGUMENTS --comment --body "REVIEW_CONTENT"
```

Or for approval/request changes, use `--approve` or `--request-changes` flags.
