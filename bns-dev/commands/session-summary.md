---
description: Create a structured summary of the current conversation and save it to sessions/
allowed-tools: [Bash(mkdir*), Read, Write, Glob]
---

# Session Summary

Create a structured summary of the current conversation.

## Process

1. **Create sessions directory** if it doesn't exist:
   ```bash
   mkdir -p sessions
   ```

2. **Analyze the conversation** to identify:
   - Main objective/question
   - Approaches tried (successes and failures)
   - Final solution or answer
   - Key discoveries along the way
   - Lessons for similar future situations

3. **Generate a descriptive slug** from the main topic (kebab-case, 3-5 words)

4. **Write the summary** to `sessions/YYYY-MM-DD_<slug>.md`

5. **Confirm** the file location to the user

## Output Format

```markdown
# <Title>

**Date:** YYYY-MM-DD
**Objective:** What we were trying to accomplish

---

## Summary
Brief description of outcome

## The Journey

### What Didn't Work
- Failed attempts and why they failed

### What Worked
- The successful approach

## The Solution

### Key Findings
Details of what was discovered/solved

### Code/Queries (if applicable)
Working examples

### Key Insights
Important takeaways

## Lessons Learned
What to remember for next time

## Related Resources
- Links, tables, files discovered
```

## Naming Convention

File: `YYYY-MM-DD_<slug>.md`

Examples:
- `2026-01-05_sms-segmentation-query-search.md`
- `2026-01-05_warehouse-cost-analysis.md`
- `2026-01-05_dbt-model-debugging.md`
