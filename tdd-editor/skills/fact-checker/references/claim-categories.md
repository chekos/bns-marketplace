# Claim Categories

How to identify and categorize verifiable claims in tacosdedatos content.

---

## Technical Claims

Claims about code, tools, APIs, or technical capabilities.

### Identification Signals
- Version numbers: "Python 3.10+", "requires Node 18"
- API behavior: "returns JSON", "accepts POST requests"
- Code syntax: any code block or inline code
- Tool capabilities: "Claude can...", "pandas supports..."
- Performance: "10x faster", "O(n) complexity"

### Verification Method
1. **Code snippets** → Execute in sandbox to verify they run
2. **API claims** → Check official documentation via web search
3. **Version requirements** → Verify against release notes
4. **Capability claims** → Test directly or find authoritative source

### Common Issues
- Outdated version numbers (tools update frequently)
- Deprecated syntax (especially Python 2 vs 3)
- Platform-specific behavior stated as universal
- Hallucinated function names or parameters

---

## Statistical Claims

Claims involving numbers, percentages, studies, or benchmarks.

### Identification Signals
- Percentages: "80% of developers", "reduces by 50%"
- Specific numbers: "10 million users", "3 second load time"
- Study references: "según un estudio", "research shows"
- Comparisons: "faster than", "more popular than"
- Rankings: "the most used", "top 3 frameworks"

### Verification Method
1. **Cited statistics** → Find original source via web search
2. **Benchmark claims** → Cross-reference with published benchmarks
3. **Study mentions** → Locate actual study, verify methodology
4. **Comparison claims** → Find data supporting the comparison

### Common Issues
- Statistics from outdated studies
- Misattributed or fabricated study references
- Cherry-picked benchmarks
- Percentages without sample size context

---

## Attribution Claims

Claims about quotes, sources, links, or who said what.

### Identification Signals
- Direct quotes: anything in quotation marks
- Paraphrased statements: "X said that...", "según X..."
- Link references: URLs, "link to documentation"
- Source citations: author names, publication names
- "Official" claims: "officially announced", "according to the docs"

### Verification Method
1. **Direct quotes** → Web search to find original source
2. **URLs** → Check if link is valid and points to claimed content
3. **Author attribution** → Verify person actually said/wrote this
4. **Publication references** → Confirm article/paper exists

### Common Issues
- Misattributed quotes (wrong person credited)
- Paywalled or dead links
- Quotes taken out of context
- Non-existent publications or articles

---

## Claim Priority

Not all claims require equal scrutiny. Prioritize:

| Priority | Claim Type | Reason |
|----------|------------|--------|
| **High** | Code that readers will copy | Broken code destroys trust |
| **High** | Statistics used to support arguments | Wrong numbers mislead decisions |
| **High** | Quotes attributed to named people | Misattribution is unethical |
| **Medium** | Version numbers and requirements | Causes setup frustration |
| **Medium** | Tool comparisons | Influences reader choices |
| **Low** | Hyperbolic claims ("everyone uses") | Rhetorical, not literal |
| **Low** | Subjective assessments ("elegant code") | Opinion, not fact |

---

## Flags for Human Review

Some claims cannot be verified programmatically. Flag these:

- **Insider knowledge**: "I heard from a Google engineer..."
- **Future predictions**: "will be deprecated in 2025"
- **Personal anecdotes**: "in my experience at Company X..."
- **Unpublished data**: "our internal benchmarks show..."
- **Controversial interpretations**: claims about intent or motivation
