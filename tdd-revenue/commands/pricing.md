---
description: Analyze and recommend pricing for a product or service
---

When `/pricing` is used with:

$ARGUMENTS

Analyze the product/service and provide pricing recommendations.

## Step 1: Understand the Product

Gather information about:
- What the product/service is
- Who it's for (target audience)
- What problem it solves
- How it compares to alternatives
- Current stage (new, existing, redesign)

## Step 2: Value Analysis

Calculate the value delivered:

### For Courses/Educational Products
- Time saved learning independently
- Salary increase potential
- Career advancement value
- Implementation time savings

### For Templates/Tools
- Hours saved per use
- Error reduction value
- Professional quality improvement
- Recurring time savings

### For Services
- Outcome value to client
- Opportunity cost of DIY
- Risk reduction
- Speed to result

## Step 3: Market Research

Consider:
- What do competitors charge?
- What's the next best alternative?
- What's the audience's budget?
- Regional purchasing power (for LATAM)

## Step 4: Price Recommendation

Develop a pricing strategy with:
- Recommended price point
- Tier structure (if applicable)
- Regional pricing adjustments
- Launch vs. regular pricing

## Output Format

```markdown
# Pricing Analysis: [Product/Service Name]

## Product Summary
- **Type**: [Course/Template/Service/etc.]
- **Target audience**: [Who it's for]
- **Core problem solved**: [What it fixes]

---

## Value Analysis

### Quantifiable Value
| Benefit | Value Calculation |
|---------|-------------------|
| Time saved | [X] hours × $[hourly rate] = $[X] |
| [Benefit 2] | [Calculation] = $[X] |
| [Benefit 3] | [Calculation] = $[X] |
| **Total Annual Value** | **$[X]** |

### Qualitative Value
- [Non-quantifiable benefit 1]
- [Non-quantifiable benefit 2]

---

## Market Comparison

| Competitor/Alternative | Price | Notes |
|-----------------------|-------|-------|
| [Competitor 1] | $[X] | [How they compare] |
| [Competitor 2] | $[X] | [How they compare] |
| DIY Alternative | $[X] (time cost) | [Effort required] |

---

## Recommended Pricing

### Primary Recommendation: $[X]

**Rationale**: [Why this price makes sense]

**Value-to-price ratio**: [X]x (customers get $[value] for $[price])

### Tier Structure (if applicable)

| Tier | Price | Includes | Target Buyer |
|------|-------|----------|--------------|
| Basic | $[X] | [Features] | [Who] |
| Pro | $[X] | [Features] | [Who] |
| Premium | $[X] | [Features] | [Who] |

### Regional Pricing (LATAM Adjustments)

| Region | Base Price | Adjusted | Discount |
|--------|-----------|----------|----------|
| US/Spain | $[X] | $[X] | — |
| Mexico | $[X] | $[X] | -[X]% |
| Colombia | $[X] | $[X] | -[X]% |
| Argentina | $[X] | $[X] | -[X]% |

---

## Launch Strategy

### Phase 1: Early Bird
- **Price**: $[X] ([X]% off)
- **Duration**: [X] days or first [X] buyers
- **Purpose**: Reward early supporters, validate demand

### Phase 2: Launch Week
- **Price**: $[X] ([X]% off)
- **Duration**: [X] days
- **Bonuses**: [List any launch bonuses]

### Phase 3: Regular Price
- **Price**: $[X]
- **Ongoing promotions**: [Quarterly sales, etc.]

---

## Financial Projections

### Unit Economics
| Metric | Value |
|--------|-------|
| Price | $[X] |
| Payment processing | -$[X] |
| Platform fees | -$[X] |
| **Net per sale** | **$[X]** |

### Revenue Scenarios

| Scenario | Units | Revenue |
|----------|-------|---------|
| Conservative | [X] | $[X] |
| Base case | [X] | $[X] |
| Optimistic | [X] | $[X] |

---

## Recommendations

### Do
- [Recommendation 1]
- [Recommendation 2]
- [Recommendation 3]

### Avoid
- [Anti-pattern 1]
- [Anti-pattern 2]

### Test
- [Something to validate]
- [Something to monitor]
```

## Price Sensitivity Notes

For different product types, consider these ranges:

**Mini-courses (1-2 hours)**: $19-49
**Standard courses (3-5 hours)**: $79-149
**Flagship courses (10+ hours)**: $199-499

**Templates**: $9-49
**Template bundles**: $29-99

**eBooks**: $9-29
**Comprehensive guides**: $29-49

**Consulting (hourly)**: $100-300
**Workshops (half-day)**: $500-1,500
**Workshops (full-day)**: $1,500-3,000
