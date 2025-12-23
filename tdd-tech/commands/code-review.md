---
description: Review code for correctness, quality, and best practices
---

When /code-review is used with the following code or file:

$ARGUMENTS

Perform a comprehensive code review following this process:

## 1. Initial Assessment

Identify:
- **Language/Framework**: What technology is being used?
- **Purpose**: What is this code meant to do?
- **Context**: Is this tutorial code, production code, or example code?

## 2. Execution Test (if possible)

Try to run the code:
- Set up necessary environment
- Execute the code
- Verify output matches expectations
- Note any errors or warnings

## 3. Code Review Checklist

### Correctness
- [ ] Code runs without errors
- [ ] Logic is correct
- [ ] Edge cases are handled
- [ ] Output matches documentation

### Code Quality
- [ ] Clear, descriptive naming
- [ ] Single responsibility principle
- [ ] No unnecessary complexity
- [ ] Proper error handling

### Style & Formatting
- [ ] Consistent formatting
- [ ] Follows language conventions
- [ ] Appropriate comments
- [ ] No unused code/imports

### Best Practices
- [ ] Modern language features used appropriately
- [ ] No anti-patterns
- [ ] Efficient algorithms/data structures
- [ ] Thread-safe (if applicable)

### Security
- [ ] No hardcoded secrets
- [ ] Input validation present
- [ ] No injection vulnerabilities
- [ ] Proper error messages (no information leakage)

### Documentation
- [ ] Purpose is clear
- [ ] Parameters documented
- [ ] Return values documented
- [ ] Examples included (for tutorials)

## 4. Generate Review Report

```markdown
# Code Review Report

**Reviewer**: CTO / Code Reviewer
**Date**: [Today]
**Verdict**: ✅ Approved / ⚠️ Needs Changes / ❌ Rejected

## Summary
[1-2 sentence overall assessment]

## Execution Results
| Test | Status | Notes |
|------|--------|-------|
| Syntax check | ✅/❌ | |
| Run test | ✅/❌ | |
| Output verification | ✅/❌ | |

## Issues Found

### Critical (Must Fix)
[List with locations and suggested fixes]

### Important (Should Fix)
[List with locations and suggested fixes]

### Minor (Nice to Have)
[List with locations and suggested fixes]

## Positive Observations
- [What was done well]

## Corrected Code (if needed)
```[language]
[corrected version]
```

## Recommendations
1. [Priority recommendation]
2. [Secondary recommendation]
```

## 5. Provide Actionable Feedback

For each issue:
1. **Location**: Specific line/section
2. **Problem**: What's wrong
3. **Impact**: Why it matters
4. **Solution**: How to fix it (with code if helpful)

Be constructive and educational in feedback, especially for tutorial code where the goal is teaching readers.
