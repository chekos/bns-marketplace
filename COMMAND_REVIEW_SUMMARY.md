# BNS-Dev Commands: Best Practices Review Summary

**Date**: 2025-11-05
**Reviewer**: Compounding Engineering Review Process
**Commands Reviewed**: 4

---

## Executive Summary

All four commands in the bns-dev plugin were reviewed against Claude Code best practices. The analysis revealed:

- **Critical Issue**: 2 commands missing tool scoping (security/reliability risk)
- **Major Issue**: Significant over-engineering in longest command (283 lines → 17 lines recommended)
- **Major Issue**: Incomplete workflow in solve-issue command (stops at planning, doesn't solve)
- **Consistency Issues**: Wide variance in command length and structure

### Overall Assessment by Command

| Command | Lines | Status | Priority | Recommended Lines |
|---------|-------|--------|----------|-------------------|
| `/create-issue` | 48 | ⚠️ Needs improvement | MEDIUM | 35 (-27%) |
| `/solve-issue` | 53 | ⚠️ Incomplete workflow | HIGH | 75 (+42%) |
| `/review-pr` | 16 | ❌ Critically minimal | CRITICAL | 60-70 (+312%) |
| `/resolve-pr-comments` | 283 | ❌ Over-engineered | HIGH | 17 (-90%) |

---

## Critical Findings

### 🚨 Security Issue: Missing Tool Scoping

**Commands Affected**: `/create-issue`, `/review-pr`

**Risk Level**: HIGH

**Problem**: Without explicit `allowed-tools` in frontmatter, commands inherit conversation-level permissions unpredictably.

**Fix Required**:
```yaml
---
allowed-tools: [Bash(gh*), Read, Write, Grep, Glob, TodoWrite]
description: [command description]
---
```

**Impact**: Must be fixed before production use.

---

## Command-by-Command Analysis

### 1. `/create-issue` - Over-Engineered Research

**Current**: 48 lines
**Recommended**: 35 lines
**Priority**: MEDIUM

#### Issues Found

1. **Over-engineered research phase** (Lines 13-24)
   - Requires "web research" and mentions unavailable "context7 mcp"
   - Unnecessary for straightforward issues
   - **Fix**: Simplify to check CONTRIBUTING.md and recent issues

2. **Missing tool scoping** (Lines 1-3)
   - No `allowed-tools` specification
   - **Fix**: Add `allowed-tools: [Bash(gh*), Read, WebSearch, Grep, Glob]`

3. **Redundant approval gates** (Lines 26-43)
   - Plan presentation + issue creation approval = double gate
   - **Fix**: Single approval before `gh issue create`

4. **Contradictory output format** (Lines 42-44)
   - Requires XML tags but also `gh issue create` CLI usage
   - **Fix**: Clarify workflow with single approval point

5. **Quality issues**
   - "think ultrahard" is unprofessional (Line 11)
   - Typo: "Inlcude" → "Include"

#### Recommended Changes

```markdown
---
allowed-tools: [Bash(gh*), Read, WebSearch, Grep, Glob]
description: Create well-structured GitHub issues following best practices
---

Create a GitHub issue from: $ARGUMENTS

## Steps

1. **Gather context** (if in a repository):
   - Check CONTRIBUTING.md or ISSUE_TEMPLATE.md
   - Review 2-3 recent issues for format

2. **Draft the issue**:
   - Title: Clear, concise (50 chars or less)
   - Description: Problem, acceptance criteria, context
   - Label: `bug` or `enhancement`

3. **Create**:
   - Present draft for approval
   - Use: `gh issue create --title "..." --body "..." --label "..."`
```

---

### 2. `/solve-issue` - Incomplete Workflow

**Current**: 53 lines
**Recommended**: 75 lines
**Priority**: HIGH

#### Critical Issue: Name Mismatch

**Problem**: Command is named "solve-issue" but only implements planning phase.

**Options**:
1. **Rename to `/plan-issue`** - Keep current scope (recommended if minimal)
2. **Complete the workflow** - Add implementation steps (recommended for UX)

#### Issues Found

1. **Incomplete scope** (Stops at line 52)
   - Description says "end-to-end" but workflow stops at planning
   - Missing: implementation, testing, PR creation
   - **Fix**: Add steps 7-10 for complete workflow

2. **Tool list redundancy** (Lines 2-17)
   - Lists `Bash`, `Bash(gh*)`, `Bash(git*)`, `Bash(pnpm*)` separately
   - Generic `Bash` already includes scoped patterns
   - **Fix**: Consolidate to single line or remove generic `Bash`

3. **TodoWrite not used** (Line 4)
   - Listed in allowed-tools but never instructed to use
   - **Fix**: Add explicit TodoWrite step in workflow

4. **Vague analysis instructions** (Lines 27-29)
   - "Analyze thoroughly until you feel..." lacks concrete steps
   - **Fix**: Specify: run `gh issue view`, use Grep, read files

5. **Over-detailed planning aspects** (Lines 35-42)
   - 8 bullets that are implied in "comprehensive plan"
   - **Fix**: Reduce to 3-4 essential items

#### Recommended Changes

**Option A: Rename to `/plan-issue`** (Minimal changes)
```yaml
---
allowed-tools: [Bash, TodoWrite, Read, Grep, Glob]
description: Create comprehensive plans for GitHub issues
---
```

**Option B: Complete the `/solve-issue` workflow** (Recommended)
```markdown
---
allowed-tools: [Bash, TodoWrite, Read, Edit, Write, Grep, Glob]
description: Solve GitHub issues end-to-end - analyze, implement, test, create PR
---

1. View issue: `gh issue view #$ARGUMENTS`
2. Analyze codebase: Use Grep/Read to understand context
3. Create branch: `feature/[issue]-brief-description`
4. Create TodoWrite plan with: changes, tests, documentation
5. **Ask for approval before implementing**
6. Implement systematically, marking todos complete
7. Run tests to verify
8. Create PR: `gh pr create` with issue reference
9. Monitor for review feedback
```

---

### 3. `/review-pr` - Dangerously Minimal

**Current**: 16 lines
**Recommended**: 60-70 lines
**Priority**: CRITICAL

#### Critical Issues

1. **MISSING TOOL SCOPING** (Lines 1-3)
   - No `allowed-tools` specification
   - Inherits unpredictable conversation permissions
   - **Fix**: MUST ADD tool scoping before production use

2. **No prerequisite validation**
   - Doesn't check if PR exists, gh CLI authenticated, etc.
   - **Fix**: Add validation phase

3. **Missing implementation guidance** (Lines 5-12)
   - Lists WHAT to review but not HOW
   - Vague bullet points instead of actionable steps
   - **Fix**: Add specific `gh` commands and workflow

4. **Weak approval gate** (Line 15)
   - "Ask before leaving review" is too passive
   - **Fix**: Use AskUserQuestion with multiple submission options

5. **No error handling**
   - No consideration for PR not existing, network issues, etc.
   - **Fix**: Add error handling section

#### This is the Most Critical Command to Fix

The command will work in happy path scenarios but fail unpredictably. Missing tool scoping is a security/reliability issue.

#### Recommended Changes

```markdown
---
description: Review pull requests with comprehensive feedback
allowed-tools: [Read, Bash(gh*), Bash(git*), Grep, Glob, AskUserQuestion]
argument-hint: [pr-number]
---

## Prerequisites

1. Validate environment:
   - `gh auth status` (verify authenticated)
   - Validate $ARGUMENTS is PR number
   - `gh pr view $ARGUMENTS` (verify PR exists)

## Phase 1: Gather Context

1. Fetch PR: `gh pr view $ARGUMENTS --json title,body,files`
2. Get changes: `gh pr diff $ARGUMENTS`
3. Check CI: `gh pr checks $ARGUMENTS`
4. Read project conventions (CLAUDE.md if exists)

## Phase 2: Analysis

Analyze systematically:
- **Code Quality**: Readability, conventions adherence
- **Bugs**: Logic errors, edge cases, null handling
- **Performance**: N+1 queries, caching opportunities
- **Security**: Input validation, SQL injection risks
- **Testing**: Coverage gaps, test quality

## Phase 3: Review Composition

Structure feedback:
- Summary (2-3 sentences)
- Critical Issues (blockers)
- Suggestions (improvements)
- Nitpicks (optional)

Be constructive. Provide code examples.

## Phase 4: Submission

Use AskUserQuestion for submission method:
1. "Post as PR review comment"
2. "Post as blocking review (Request Changes)"
3. "Post as approving review (Approve)"
4. "Save to file only"
```

---

### 4. `/resolve-pr-comments` - Massively Over-Engineered

**Current**: 283 lines
**Recommended**: 17 lines
**Priority**: HIGH

#### Critical Issue: 90% Unnecessary Content

This command confuses **documentation** with **instructions**.

#### What to Remove (256 lines / 90%)

1. **Lines 5-12**: Obvious context - Claude knows this
2. **Lines 15-57**: Generic workflow pattern - not specific to PR comments
3. **Lines 65-111**: GitHub API documentation - keep 1 command only
4. **Lines 113-146**: Duplicate workflow section
5. **Lines 150-212**: **Parallel processing fantasy** - doesn't exist in Claude Code
6. **Lines 215-239**: Generic QA advice
7. **Lines 241-283**: Self-referential templates

#### The Parallel Processing Illusion

**Lines 150-212 describe spawning sub-agents**:
- "Spawn 4 parallel sub-agents..."
- Complex bash pipelines for coordination
- Multi-agent orchestration patterns

**Problem**: Claude Code doesn't have sub-agent spawning API. This is architectural fiction that misleads users.

**Fix**: Delete entirely.

#### Recommended Changes

Replace 283 lines with:

```markdown
---
allowed-tools: [Bash, Read, Edit, Write, Grep, TodoWrite, Bash(gh*), Bash(git*)]
description: Resolve all comments and issues in the current PR
---

Resolve all unresolved comments systematically:

1. Get comments: `gh pr view --comments`
2. Create TodoWrite plan for addressing them
3. For each comment:
   - Make requested code change
   - Run relevant tests
   - Mark complete in TodoWrite
4. Commit changes with descriptive message
5. Verify all comments addressed

Focus on: $ARGUMENTS
```

**Result**: 17 lines, 100% functionality preserved, dramatically clearer.

---

## Consistency Issues Across Commands

| Feature | create-issue | solve-issue | review-pr | resolve-pr-comments |
|---------|--------------|-------------|-----------|---------------------|
| **Tool scoping** | ❌ Missing | ✅ Present | ❌ Missing | ❌ Missing |
| **Research phase** | ⚠️ Over-eng | ⚠️ Vague | ❌ Missing | ⚠️ Over-doc |
| **Approval gates** | ⚠️ Double | ✅ Good | ⚠️ Weak | ❌ None |
| **Error handling** | ❌ Missing | ❌ Missing | ❌ Missing | ❌ Missing |
| **XML structure** | ✅ Present | ✅ Present | ❌ Missing | ❌ Missing |
| **TodoWrite usage** | ❌ None | ❌ Listed but unused | ❌ None | ✅ Mentioned |

### Recommendations for Consistency

1. **All commands MUST have tool scoping**
2. **All commands should follow pattern**: Research → Plan → Implement → Verify
3. **All commands should use TodoWrite** for multi-step tasks
4. **All commands should have single approval gate** before major operations
5. **All commands should validate arguments** and prerequisites

---

## Priority Action Items

### CRITICAL (Must Fix Before Production)

1. **Add tool scoping to `/review-pr`**
   - Missing allowed-tools is security/reliability issue
   - Add: `allowed-tools: [Read, Bash(gh*), Bash(git*), Grep, Glob, AskUserQuestion]`

2. **Add tool scoping to `/create-issue`**
   - Add: `allowed-tools: [Bash(gh*), Read, WebSearch, Grep, Glob]`

3. **Add tool scoping to `/resolve-pr-comments`**
   - Add: `allowed-tools: [Bash, Read, Edit, Write, Grep, TodoWrite, Bash(gh*), Bash(git*)]`

### HIGH (Major Functionality Issues)

4. **Complete `/solve-issue` workflow**
   - Currently stops at planning
   - Add implementation, testing, and PR creation steps
   - OR rename to `/plan-issue`

5. **Simplify `/resolve-pr-comments`**
   - Remove 256 lines (90%) of documentation
   - Delete parallel processing fantasy (lines 150-212)
   - Focus on actionable instructions

6. **Expand `/review-pr` to minimal viable**
   - Add prerequisite validation
   - Add structured workflow phases
   - Strengthen approval gate

### MEDIUM (Quality Improvements)

7. **Simplify `/create-issue` research phase**
   - Remove "context7 mcp" reference
   - Remove "think ultrahard" unprofessional language
   - Consolidate approval gates

8. **Add error handling to all commands**
   - Validate prerequisites
   - Handle missing tools (gh CLI)
   - Handle network failures
   - Handle permission issues

9. **Add argument validation to all commands**
   - Check $ARGUMENTS is valid
   - Provide usage examples
   - Suggest alternatives if invalid

### LOW (Polish)

10. **Standardize command structure**
    - All use same frontmatter format
    - All use same phase naming
    - All use same XML tag conventions

11. **Fix typos and quality issues**
    - create-issue.md line 42: "Inlcude" → "Include"
    - Consistent professional tone

---

## Recommended Command Lengths

Based on complexity and best practices:

| Command | Current | Recommended | Rationale |
|---------|---------|-------------|-----------|
| `/create-issue` | 48 | **35** | Simple task, streamline research |
| `/solve-issue` | 53 | **75** | Complex task, needs full workflow |
| `/review-pr` | 16 | **60-70** | Medium task, needs structure |
| `/resolve-pr-comments` | 283 | **17** | Simple task, over-documented |

**Total**: 400 lines → **187-197 lines** (53% reduction)

---

## Comparison to Industry Best Practices

### Every's Compounding Engineering Plugin

Every's commands demonstrate:
- ✅ Explicit tool scoping in all commands
- ✅ Progressive detail levels (minimal/standard/comprehensive)
- ✅ Multi-agent patterns (but real, not theoretical)
- ✅ Worktree isolation for safety
- ✅ TodoWrite integration throughout
- ✅ Clear approval gates

### BNS-Dev Plugin Gaps

- ❌ Inconsistent tool scoping (50% missing)
- ⚠️ Variable quality (16 lines to 283 lines)
- ❌ Theoretical features (parallel processing)
- ⚠️ Incomplete workflows (solve-issue)
- ⚠️ Limited TodoWrite usage
- ⚠️ Weak/missing error handling

---

## Implementation Roadmap

### Phase 1: Critical Fixes (Day 1)
1. Add tool scoping to all 4 commands
2. Remove parallel processing fantasy from resolve-pr-comments
3. Add prerequisite validation to review-pr

### Phase 2: Major Improvements (Week 1)
4. Complete solve-issue workflow or rename to plan-issue
5. Simplify resolve-pr-comments to ~17 lines
6. Expand review-pr to 60-70 lines with proper structure

### Phase 3: Quality & Consistency (Week 2)
7. Simplify create-issue research phase
8. Add error handling to all commands
9. Add argument validation to all commands
10. Standardize structure across commands

### Phase 4: Polish (Week 3)
11. Fix typos and language issues
12. Add comprehensive testing
13. Update documentation
14. Get user feedback

---

## Success Metrics

After implementing recommendations:

- **Security**: 100% of commands have explicit tool scoping
- **Completeness**: 100% of commands complete their stated purpose
- **Clarity**: Average command length aligned with complexity
- **Consistency**: All commands follow same structural pattern
- **Quality**: No typos, professional language throughout
- **Usability**: Clear error messages, argument validation

---

## Conclusion

The bns-dev plugin has strong foundational concepts but needs systematic improvements:

1. **Security first**: Add tool scoping to all commands
2. **Complete workflows**: Finish what commands promise to do
3. **Ruthless simplification**: Delete documentation, keep instructions
4. **Consistency**: Apply same patterns across all commands
5. **Error handling**: Validate inputs, handle failures gracefully

Following these recommendations will result in a production-ready plugin that aligns with Claude Code best practices and provides excellent user experience.

---

**Next Step**: Review this summary and decide which fixes to prioritize. Critical security issues (tool scoping) should be addressed immediately.
