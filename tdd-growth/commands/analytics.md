---
description: Generate performance reports or analyze metrics
---

When /analytics is used with:

$ARGUMENTS

Generate an analytics report or analysis based on the provided data or request.

## Step 1: Determine Report Type

Based on the request, identify which report format is needed:
- **Weekly summary**: Quick overview of key metrics
- **Monthly report**: Comprehensive analysis with trends
- **Content analysis**: Deep dive on specific content performance
- **Channel analysis**: Focus on specific channel (newsletter, social, web)
- **Custom analysis**: Specific metrics or questions

## Step 2: Gather Context

If metrics are provided:
- Parse and organize the data
- Identify the time period
- Note any data gaps

If metrics are NOT provided:
- Ask clarifying questions about what data is available
- Provide a template for data collection
- Offer to create a framework for future tracking

## Step 3: Generate Report

Use the appropriate template based on report type.

## Output Formats

### Weekly Summary Template

```markdown
# Weekly Performance: [Date Range]

## Headline Metrics
| Metric | This Week | vs. Last Week | Status |
|--------|-----------|---------------|--------|
| Newsletter Subs | X | +/-Y | 🟢/🟡/🔴 |
| Open Rate | X% | +/-Y% | 🟢/🟡/🔴 |
| Website Sessions | X | +/-Y% | 🟢/🟡/🔴 |
| Social Followers | X | +/-Y | 🟢/🟡/🔴 |

## Key Insights
1. [Insight with supporting data]
2. [Insight with supporting data]

## Wins
- [What worked well]

## Areas to Watch
- [Concern or opportunity]

## Recommendations
1. [Action item with expected impact]
2. [Action item with expected impact]
```

### Monthly Report Template

```markdown
# Monthly Growth Report: [Month Year]

## Executive Summary
[2-3 sentence overview]

## Newsletter
| Metric | This Month | Previous | Change | Benchmark |
|--------|------------|----------|--------|-----------|
| Subscribers | X | Y | +/-Z% | - |
| Open Rate | X% | Y% | +/-% | 40%+ |
| Click Rate | X% | Y% | +/-% | 2-5% |
| Unsubscribe | X% | Y% | +/-% | <0.5% |

### Top Performers
1. [Best edition with metrics]
2. [Second best with metrics]

### Insights
[Analysis of trends]

## Website
| Metric | This Month | Previous | Change |
|--------|------------|----------|--------|
| Sessions | X | Y | +/-% |
| Organic Traffic | X | Y | +/-% |
| Avg. Duration | X:XX | Y:YY | +/-% |

### Top Content
1. [Page] - X views
2. [Page] - X views

## Social Media
### Twitter/X
- Followers: X (+/-Y)
- Engagement Rate: X%
- Top Post: [Description]

### LinkedIn
- Followers: X (+/-Y)
- Engagement Rate: X%
- Top Post: [Description]

## Key Learnings
1. [Learning and implication]
2. [Learning and implication]

## Recommendations
### High Priority
1. [Recommendation with rationale]

### Medium Priority
1. [Recommendation]

## Goals for Next Month
| Goal | Target | Current |
|------|--------|---------|
| [Goal] | X | Y |
```

### Content Performance Template

```markdown
# Content Analysis: [Title]

## Overview
- Published: [Date]
- Type: [Tutorial/Article/Guide]
- Topic: [Topic]

## Performance Metrics
| Metric | Value | vs. Average |
|--------|-------|-------------|
| Pageviews | X | +/-Y% |
| Time on Page | X:XX | +/-Y% |
| Bounce Rate | X% | +/-Y% |

## Traffic Sources
| Source | Sessions | % of Total |
|--------|----------|------------|
| Organic | X | Y% |
| Social | X | Y% |
| Newsletter | X | Y% |

## Insights
- [What worked]
- [What could improve]

## Recommendations
1. [Actionable recommendation]
2. [Actionable recommendation]
```

### Data Collection Template (when no data provided)

```markdown
# Analytics Tracking Setup

To generate reports, we need to track the following metrics:

## Newsletter Metrics (from Substack/beehiiv)
- Total subscribers
- Open rate
- Click rate
- Unsubscribes

## Website Metrics (from Google Analytics)
- Sessions
- Unique users
- Traffic by source
- Top pages

## Social Metrics
### Twitter/X (from Analytics)
- Follower count
- Impressions
- Engagement rate

### LinkedIn (from Analytics)
- Follower count
- Impressions
- Engagement rate

---

Please provide any of the above metrics and I'll generate a report.
```

## Notes

- Always include comparisons (week-over-week, month-over-month)
- Color code status: 🟢 On track, 🟡 Watch, 🔴 Needs attention
- Make recommendations specific and actionable
- Reference analytics-frameworks skill for detailed guidance
