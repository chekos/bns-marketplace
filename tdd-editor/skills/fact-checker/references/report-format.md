# Fact-Check Report Format

Standard output format for fact-checking reports.

---

## Report Template

```markdown
# Fact-Check Report: [Article Title]

**Date**: [YYYY-MM-DD]
**Verdict**: [VERIFIED / ISSUES FOUND / NEEDS HUMAN REVIEW]
**Claims checked**: [N]
**Issues found**: [N]

---

## Summary

[1-2 sentence summary of findings]

---

## Claims Verified

### [Claim 1 - VERIFIED]
> [Quoted claim from article]

**Category**: [Technical / Statistical / Attribution]
**Verification**: [How it was verified]
**Source**: [Link or reference]

---

### [Claim 2 - FALSE]
> [Quoted claim from article]

**Category**: [Technical / Statistical / Attribution]
**Issue**: [What's wrong]
**Correction**: [Suggested fix]
**Source**: [Link proving correction]

---

### [Claim 3 - NEEDS REVIEW]
> [Quoted claim from article]

**Category**: [Technical / Statistical / Attribution]
**Reason**: [Why human review needed]
**Suggested action**: [What to check]

---

## Code Execution Results

| Code Block | Location | Result |
|------------|----------|--------|
| [description] | Line X | ✓ Runs / ✗ Error: [msg] |

---

## Recommendations

1. [Specific recommendation]
2. [Specific recommendation]
```

---

## Verdict Definitions

| Verdict | Meaning | Action Required |
|---------|---------|-----------------|
| **VERIFIED** | All claims check out | None - ready to publish |
| **ISSUES FOUND** | One or more claims are incorrect | Fix before publishing |
| **NEEDS HUMAN REVIEW** | Claims that can't be auto-verified | Editor must decide |

---

## Claim Status Icons

Use consistently throughout reports:

- ✓ **VERIFIED** — Claim is accurate
- ✗ **FALSE** — Claim is incorrect
- ⚠ **NEEDS REVIEW** — Cannot verify automatically
- ~ **OUTDATED** — Was true, now outdated

---

## Example Report

```markdown
# Fact-Check Report: "Construye tu primer equipo de IA esta tarde"

**Date**: 2024-12-12
**Verdict**: ISSUES FOUND
**Claims checked**: 8
**Issues found**: 2

---

## Summary

Most technical claims verified. Found one outdated API reference and one broken code example.

---

## Claims Verified

### Claude API pricing - VERIFIED
> "Claude Sonnet costs $3 per million input tokens"

**Category**: Technical
**Verification**: Checked Anthropic pricing page
**Source**: https://anthropic.com/pricing

---

### Installation command - FALSE
> `pip install anthropic-sdk`

**Category**: Technical
**Issue**: Package name is wrong
**Correction**: `pip install anthropic`
**Source**: https://pypi.org/project/anthropic/

---

### "Multi-agent frameworks are the future" - NEEDS REVIEW
> "Según expertos de la industria, los frameworks multi-agente serán estándar en 2025"

**Category**: Attribution
**Reason**: No specific expert cited, prediction claim
**Suggested action**: Either cite specific source or soften language

---

## Code Execution Results

| Code Block | Location | Result |
|------------|----------|--------|
| Basic API call | Section 2 | ✓ Runs |
| Multi-agent setup | Section 4 | ✗ Error: ModuleNotFoundError |

---

## Recommendations

1. Fix package name: `anthropic-sdk` → `anthropic`
2. Update multi-agent code example (missing import)
3. Consider citing source for industry prediction or rephrasing
```
