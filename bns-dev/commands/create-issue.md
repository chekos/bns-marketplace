---
allowed-tools: [Bash(gh*), Read, WebSearch, Grep, Glob, Task]
description: Create well-structured GitHub issues following best practices
---

Create a GitHub issue from the following description:

<feature_description>
#$ARGUMENTS
</feature_description>

If no description provided, ask the user for the feature request or bug report details.

## Phase 1: Research

Conduct comprehensive research to ensure the issue follows best practices:

1. **Repository research**:
   - Check for CONTRIBUTING.md, .github/ISSUE_TEMPLATE.md, or similar guidelines
   - Review 2-3 recent issues to understand format and conventions
   - Note project-specific coding style, naming conventions, and requirements

2. **Best practices research**:
   - Search for current best practices in writing GitHub issues (clarity, completeness, actionability)
   - Look for well-written examples in popular open-source projects for inspiration
   - Research best practices specific to the feature/bug topic
   - If available, use specialized research agents to gather latest approaches and patterns

3. **Context gathering**:
   - Identify any reference links (featurebase, external sources) that inspired this request
   - Note any local files or repositories that should be referenced

## Phase 2: Draft the Issue

Based on your research, create a comprehensive issue:

- **Title**: Clear, concise (50 chars or less)
- **Description**:
  - Problem statement or feature request summary
  - Current behavior (for bugs) or motivation (for features)
  - Expected behavior or desired outcome
  - Acceptance criteria (bulleted list)
  - Additional context, screenshots, or resources
  - References (local files with line numbers, external links) at bottom

## Phase 3: Determine Appropriate Label

Retrieve available labels in the repository:

```bash
gh label list
```

Based on the available labels and the nature of the issue, determine the most appropriate label(s). Common labels include `bug`, `enhancement`, but use project-specific labels when they better describe the issue.

## Phase 4: Create the Issue

1. Present the draft issue content for approval (including title, body, and selected label(s))
2. Once approved, create using:
   ```bash
   gh issue create --title "TITLE" --body "BODY" --label "LABEL"
   ```
3. Display the created issue URL

## Error Handling

If issue creation fails, check:
- Repository exists and is accessible
- You have permission to create issues
- gh CLI is authenticated (`gh auth status`)
- Selected labels exist in the repository (verify with `gh label list`)
