---
allowed-tools: [Bash(gh*), Bash(git*), Read, Grep, Glob, TodoWrite, Task]
description: Create comprehensive plans for GitHub issues
---

You are an experienced software developer tasked with creating a comprehensive plan for addressing a GitHub issue.

## Phase 1: Analyze the Issue

1. Review the GitHub issue:
   ```bash
   gh issue view #$ARGUMENTS
   ```

2. Examine the relevant parts of the codebase:
   - Use Grep/Glob to locate related code
   - Read key files to understand current implementation
   - Identify patterns and conventions in the codebase

## Phase 2: Create Branch

Create a feature branch for this work:
```bash
git checkout -b feature/#$ARGUMENTS-brief-description
```

## Phase 3: Create Comprehensive Plan

Using TodoWrite, create a detailed plan that includes:

- **Required code changes**: Specific files and modifications needed
- **Tests to write or update**: What test coverage is needed
- **Documentation updates**: README, comments, or other docs
- **Reference links**: Include featurebase or any other links that inspired this request

Consider these aspects:
- Potential impacts on other parts of the system
- Performance and security implications
- Backwards compatibility (if applicable)
- Edge cases and potential challenges

## Phase 4: Present the Plan

Present your plan in `<plan>` tags with:
- High-level overview
- Detailed breakdown of steps
- TodoWrite task list

**ASK FOR APPROVAL BEFORE THE USER STARTS WORKING ON THE TODO LIST**

After approval, the user can implement the solution using the TodoWrite list as a guide, or use other commands like `/resolve-pr-comments` to assist with implementation.
