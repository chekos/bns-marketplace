---
description: Generate a monthly or quarterly revenue report
---

When `/revenue-report` is used with:

$ARGUMENTS

Generate a comprehensive revenue report for the specified period.

## Step 1: Determine Report Type

Based on the arguments:
- **"monthly" or specific month**: Generate monthly report
- **"quarterly" or "Q1/Q2/Q3/Q4"**: Generate quarterly report
- **"ytd"**: Generate year-to-date report
- **No specification**: Default to previous month

## Step 2: Gather Data

For the report period, collect:
- Revenue by stream (sponsorships, products, subs, etc.)
- Expenses by category
- Key metrics (subscribers, open rate, etc.)
- Comparison periods (previous period, same period last year)

If data is not provided, create a template with clear placeholders.

## Step 3: Analysis

Calculate:
- Period-over-period changes
- Year-over-year changes (if applicable)
- Budget variance (if budget exists)
- Trends and patterns

## Output Format: Monthly Report

```markdown
# Revenue Report: [Month Year]

**Prepared**: [Date]
**Period**: [Start date] to [End date]

---

## Executive Summary

[2-3 sentences summarizing performance: Was it a good month? What drove results? Any concerns?]

**Key Highlights**:
- [Top highlight 1]
- [Top highlight 2]
- [Challenge or concern]

---

## Revenue Performance

### Summary

| Metric | This Month | Last Month | Change | YTD Total |
|--------|------------|------------|--------|-----------|
| Total Revenue | $[X] | $[X] | [+/-X%] | $[X] |
| Total Expenses | $[X] | $[X] | [+/-X%] | $[X] |
| Net Profit | $[X] | $[X] | [+/-X%] | $[X] |
| Profit Margin | [X]% | [X]% | [+/-X pts] | [X]% |

### Revenue by Stream

| Source | Amount | % of Total | vs. Last Month | vs. Budget |
|--------|--------|-----------|----------------|------------|
| Sponsorships | $[X] | [X]% | [+/-X%] | [+/-X%] |
| Products | $[X] | [X]% | [+/-X%] | [+/-X%] |
| Subscriptions | $[X] | [X]% | [+/-X%] | [+/-X%] |
| Consulting | $[X] | [X]% | [+/-X%] | [+/-X%] |
| Affiliate | $[X] | [X]% | [+/-X%] | [+/-X%] |
| **Total** | **$[X]** | **100%** | **[+/-X%]** | **[+/-X%]** |

### Revenue Trend (Last 6 Months)

| Month | Sponsors | Products | Subs | Other | Total |
|-------|----------|----------|------|-------|-------|
| [M-5] | $[X] | $[X] | $[X] | $[X] | $[X] |
| [M-4] | $[X] | $[X] | $[X] | $[X] | $[X] |
| [M-3] | $[X] | $[X] | $[X] | $[X] | $[X] |
| [M-2] | $[X] | $[X] | $[X] | $[X] | $[X] |
| [M-1] | $[X] | $[X] | $[X] | $[X] | $[X] |
| **This Month** | **$[X]** | **$[X]** | **$[X]** | **$[X]** | **$[X]** |

---

## Expenses

### By Category

| Category | Amount | % of Revenue | vs. Last Month |
|----------|--------|-------------|----------------|
| Platform fees | $[X] | [X]% | [+/-X%] |
| Payment processing | $[X] | [X]% | [+/-X%] |
| Software/Tools | $[X] | [X]% | [+/-X%] |
| Contractors | $[X] | [X]% | [+/-X%] |
| Marketing | $[X] | [X]% | [+/-X%] |
| Professional services | $[X] | [X]% | [+/-X%] |
| Other | $[X] | [X]% | [+/-X%] |
| **Total** | **$[X]** | **[X]%** | **[+/-X%]** |

### Notable Expenses
- [Any unusual or one-time expenses]
- [Any cost savings achieved]

---

## Key Metrics

### Audience

| Metric | Value | vs. Last Month |
|--------|-------|----------------|
| Total Subscribers | [X] | [+/-X%] |
| New Subscribers | [X] | [+/-X%] |
| Unsubscribes | [X] | [+/-X%] |
| Net Growth | [X] | [+/-X%] |
| Open Rate | [X]% | [+/-X pts] |
| Click Rate | [X]% | [+/-X pts] |

### Revenue Efficiency

| Metric | Value | Benchmark |
|--------|-------|-----------|
| Revenue per Subscriber | $[X] | $[X] |
| Revenue per Email Sent | $[X] | $[X] |
| Sponsor Fill Rate | [X]% | [X]% |

---

## Stream Deep Dives

### Sponsorships

| Sponsor | Placement | Revenue | Notes |
|---------|-----------|---------|-------|
| [Sponsor 1] | Primary | $[X] | [New/Renewal] |
| [Sponsor 2] | Secondary | $[X] | [New/Renewal] |
| **Total** | | **$[X]** | |

**Pipeline status**: [X] active deals worth $[X]

### Products

| Product | Units | Revenue | Notes |
|---------|-------|---------|-------|
| [Product 1] | [X] | $[X] | [Context] |
| [Product 2] | [X] | $[X] | [Context] |
| **Total** | **[X]** | **$[X]** | |

### Subscriptions

- **Total paid subs**: [X]
- **MRR**: $[X]
- **New this month**: [X]
- **Churned**: [X]
- **Net change**: [+/-X]

---

## Analysis & Insights

### What Worked
1. [Win 1 with context]
2. [Win 2 with context]

### Challenges
1. [Challenge 1 with context]
2. [Challenge 2 with context]

### Opportunities Identified
1. [Opportunity 1]
2. [Opportunity 2]

---

## Next Month Focus

### Priorities
1. [Priority 1] — Target: [Metric]
2. [Priority 2] — Target: [Metric]
3. [Priority 3] — Target: [Metric]

### Revenue Target
- **Next month target**: $[X]
- **Confidence level**: [High/Medium/Low]
- **Key drivers**: [What will drive it]

---

## Appendix

### Data Sources
- [Where revenue data came from]
- [Where subscriber data came from]

### Notes
- [Any caveats or data quality issues]
- [Methodology notes]
```

## Output Format: Quarterly Report

For quarterly reports, add:
- Quarter-over-quarter trends
- Year-over-year comparison
- Revenue mix analysis
- Updated annual forecast
- Strategic recommendations

## If Data Not Provided

Create the report template with clear `[PLACEHOLDER]` markers and include:
- List of data needed to complete
- Suggested data sources
- Instructions for filling in
