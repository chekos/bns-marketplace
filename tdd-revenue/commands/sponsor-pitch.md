---
description: Generate a personalized sponsor pitch email for a company
---

When `/sponsor-pitch` is used with:

$ARGUMENTS

Generate a personalized sponsor outreach email for the specified company.

## Step 1: Research the Company

Before writing the pitch, research:
1. What the company does and who they target
2. Recent news (funding, launches, hiring)
3. Why they're a good fit for our audience
4. Best hook to open with

Use WebSearch if needed to find recent company information.

## Step 2: Analyze Fit

Assess the sponsor-audience alignment:
- **Audience relevance**: How well does their product match our readers?
- **Timing signals**: Any recent events suggesting they need awareness?
- **Budget likelihood**: Size/stage suggesting marketing budget?

## Step 3: Craft the Pitch

Write a personalized cold email using this structure:

### Subject Line
- Under 50 characters
- Specific to the company
- Creates curiosity or relevance

### Email Body
1. **Hook** (1 sentence): Reference something specific about them
2. **Value prop** (2-3 sentences): Who we reach and why it matters to them
3. **Proof** (1 sentence): Quick metrics
4. **CTA** (1 sentence): Clear next step

### Keep it:
- Under 150 words
- Personalized, not generic
- Focused on their benefit
- Easy to respond to

## Output Format

```markdown
# Sponsor Pitch: [Company Name]

## Research Summary
- **Company**: [What they do]
- **Target customer**: [Who they sell to]
- **Recent news**: [Relevant activity]
- **Fit assessment**: [High/Medium/Low] - [Why]

## Pitch Email

**Subject**: [Subject line]

---

[Email body]

---

## Follow-up Notes
- **Best time to send**: [Recommendation]
- **Follow-up plan**: [Day 3, Day 7, Day 14]
- **Alternative hooks**: [Other angles to try]
```

## Example

For input: `DataDog`

```markdown
# Sponsor Pitch: DataDog

## Research Summary
- **Company**: Cloud monitoring and analytics platform
- **Target customer**: DevOps, SREs, data engineers
- **Recent news**: Launched new ML-powered alerting feature
- **Fit assessment**: High - Our data engineer audience uses monitoring tools

## Pitch Email

**Subject**: DataDog + [X]k data engineers in LATAM?

---

Hi [Name],

Saw DataDog just launched the new ML alerting feature - congrats on the release!

I run [Newsletter], reaching [X] data engineers and practitioners across Latin America. Many are building the exact monitoring infrastructure your platform helps with.

Quick stats: [X] subscribers, [X]% open rate, [X]% sponsor CTR.

Would you be open to a 15-min call to explore sponsorship?

Best,
[Your Name]

---

## Follow-up Notes
- **Best time to send**: Tuesday-Thursday, 9-10 AM EST
- **Follow-up plan**: Day 3 bump, Day 7 value-add, Day 14 break-up
- **Alternative hooks**: Could reference their LATAM expansion or Spanish docs
```
