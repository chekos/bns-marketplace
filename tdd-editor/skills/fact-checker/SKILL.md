---
name: fact-checker
description: Verify claims in tacosdedatos content before publication. Use this skill when reviewing drafts for factual accuracy, checking code examples work correctly, validating statistics and sources, or verifying quotes and attributions. Produces a structured fact-check report with verdicts for each claim. For deep verification requiring extended research, delegate to the fact-checker subagent instead.
---

# Fact-Checker

Verify technical, statistical, and attribution claims in tacosdedatos content.

**References**:
- `references/claim-categories.md` — Claim types and verification methods
- `references/report-format.md` — Report template and examples

---

## Verification Workflow

### Step 1: Extract Claims

Scan the content and extract all verifiable claims:

1. **Technical claims** — Code, APIs, versions, tool capabilities
2. **Statistical claims** — Numbers, percentages, study references
3. **Attribution claims** — Quotes, sources, links

See `references/claim-categories.md` for identification signals.

### Step 2: Prioritize

Focus verification effort on high-impact claims:

| Priority | Examples |
|----------|----------|
| **High** | Code readers will copy, statistics supporting arguments, named quotes |
| **Medium** | Version numbers, tool comparisons |
| **Low** | Hyperbolic rhetoric, subjective assessments |

### Step 3: Verify Each Claim

**Technical claims:**
```
1. Code snippets → Execute to verify they run
2. API behavior → Web search for official docs
3. Version claims → Check release notes
```

**Statistical claims:**
```
1. Find original source via web search
2. Verify the number matches
3. Check if data is current
```

**Attribution claims:**
```
1. Web search for original quote/source
2. Verify link validity
3. Confirm attribution accuracy
```

### Step 4: Flag for Human Review

Mark claims that cannot be automatically verified:
- Insider knowledge or personal anecdotes
- Future predictions
- Unpublished/internal data
- Controversial interpretations

### Step 5: Generate Report

Produce a structured report using the template in `references/report-format.md`.

**Verdicts:**
- **VERIFIED** — All claims check out
- **ISSUES FOUND** — Corrections needed before publishing
- **NEEDS HUMAN REVIEW** — Editor must decide on flagged items

---

## Quick Check vs Deep Verification

| Scope | Use Case | Approach |
|-------|----------|----------|
| **Quick check** | Pre-publication review | This skill: scan, verify obvious claims, flag concerns |
| **Deep verification** | Investigative piece, controversial topic | Delegate to fact-checker subagent for extended research |

---

## Code Verification

For code blocks, attempt execution when possible:

```python
# Run code in sandbox
# Capture: success/failure, output, errors
# Report: which blocks run, which fail
```

**Report format for code:**

| Code Block | Location | Result |
|------------|----------|--------|
| API example | Section 2 | ✓ Runs |
| Data pipeline | Section 4 | ✗ Error: missing import |

---

## Common Issues in tacosdedatos Content

| Issue | Detection | Recommendation |
|-------|-----------|----------------|
| Outdated package names | Package not found on pip/npm | Check current package name |
| Deprecated API syntax | Code runs but with warnings | Update to current syntax |
| Broken links | 404 or redirect to unrelated page | Find updated URL or remove |
| Misattributed quotes | Original source says different | Correct attribution or rephrase |
| Stale statistics | Data >2 years old | Find current data or note date |

---

## Output Format

Always produce a report following the template in `references/report-format.md`.

**Minimum report contents:**
1. Overall verdict (VERIFIED / ISSUES FOUND / NEEDS HUMAN REVIEW)
2. Summary of findings
3. List of claims checked with individual verdicts
4. Code execution results (if applicable)
5. Specific recommendations for fixes
