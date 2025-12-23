---
name: technical-writing
description: |
  Load when creating tutorials, explaining technical concepts, writing documentation,
  or any content that involves code, data, or technical procedures. Contains
  guidelines for clear, effective technical communication based on Google's
  technical writing principles.
---

# Technical Writing Skill

## Core Philosophy

> "Every engineer is also a writer." — Google Technical Writing

Technical writing is a learnable skill, not an innate talent. The goal is clear, effective communication that helps readers accomplish tasks.

## Fundamental Principles

### Clarity First
- Say what you mean, simply and directly
- Use short sentences (aim for under 26 words)
- One idea per sentence
- Prefer active voice over passive voice

### Know Your Audience
- **Experts**: Can handle jargon, focus on new information
- **Intermediate**: Explain context, define terms on first use
- **Beginners**: Start from fundamentals, no assumptions

### Structure for Scanning
- Use descriptive headings
- Lead with the main point
- Use bullet points for lists (3+ items)
- Use numbered lists for sequences

## Writing Guidelines

### Word Choice
```
Avoid              → Prefer
utilize            → use
leverage           → use
in order to        → to
prior to           → before
subsequent         → after
facilitate         → help, enable
regarding          → about
in the event that  → if
```

### Technical Terms
- Define jargon on first use
- Use consistent terminology throughout
- Create a glossary for complex documents
- Bold terms on first definition

### Pronouns
- Use "you" for the reader
- Use "we" sparingly (only when appropriate)
- Avoid ambiguous pronouns (it, this, that)
- Be explicit about what you're referring to

## Code Documentation

### Inline Comments
```python
# BAD: What the code does (obvious)
x = x + 1  # increment x

# GOOD: Why it's done
x = x + 1  # Account for zero-indexing in display
```

### Function Documentation
```python
def calculate_metrics(data: pd.DataFrame, threshold: float = 0.5) -> dict:
    """Calculate accuracy and precision metrics from prediction data.

    Args:
        data: DataFrame with 'actual' and 'predicted' columns
        threshold: Classification threshold for binary predictions

    Returns:
        Dictionary containing 'accuracy', 'precision', and 'recall' keys

    Raises:
        ValueError: If required columns are missing

    Example:
        >>> df = pd.DataFrame({'actual': [1, 0, 1], 'predicted': [0.8, 0.3, 0.6]})
        >>> metrics = calculate_metrics(df)
        >>> print(metrics['accuracy'])
        0.667
    """
```

### Code Blocks in Tutorials
- Always specify the language tag
- Provide context before the code
- Show expected output when helpful
- Keep examples focused (one concept at a time)

## Tutorial Structure

### Standard Format
```markdown
# [Tutorial Title]

## What You'll Learn
- Outcome 1
- Outcome 2
- Outcome 3

## Prerequisites
- Requirement 1
- Requirement 2

## Setup
[Environment setup instructions]

## Step 1: [First Action]
[Explanation]
[Code]
[Result]

## Step 2: [Second Action]
[Continue pattern...]

## Complete Example
[Full working code]

## Next Steps
[Where to go from here]

## Resources
[Further reading]
```

### Step-by-Step Instructions
1. Start with an action verb (Install, Create, Run)
2. Be specific about what to do
3. Show the expected result
4. Handle common errors

## Explaining Complex Concepts

### The Analogy Approach
1. Identify the core concept
2. Find a familiar analogue
3. Map the comparison explicitly
4. Note where the analogy breaks down

### Example
```markdown
**DataFrame** is like a spreadsheet:
- Rows are individual records
- Columns are fields/variables
- Unlike spreadsheets, operations apply to entire columns at once
```

### The Progressive Disclosure Pattern
1. Simple definition (one sentence)
2. Expanded explanation (one paragraph)
3. Concrete example
4. Edge cases and nuances
5. Advanced usage

## Quality Checklist

Before publishing technical content:
- [ ] All code examples have been tested
- [ ] Language tags on all code blocks
- [ ] Consistent terminology throughout
- [ ] Jargon defined on first use
- [ ] Active voice predominant
- [ ] Steps are in logical order
- [ ] Prerequisites clearly stated
- [ ] Expected outputs shown
- [ ] Links to further resources

## Accessibility

### For Code
- Use semantic code block formatting
- Avoid color as the only differentiator
- Provide alt text for code images (never use images of code)

### For Content
- Use descriptive link text (not "click here")
- Provide text alternatives for diagrams
- Use sufficient color contrast

## Spanish Language Considerations

### Technical Terms
- Keep widely-used English terms (API, DataFrame, commit)
- Translate conceptual terms (flujo de trabajo, conjunto de datos)
- Be consistent with term choices

### Code vs. Prose
- Code remains in English
- Variable names in English
- Comments can be in Spanish for Spanish tutorials
- Explanatory prose in Spanish

## Resources

- [Google Technical Writing Courses](https://developers.google.com/tech-writing)
- [Microsoft Style Guide](https://docs.microsoft.com/style-guide/)
- [Write the Docs](https://www.writethedocs.org/)
