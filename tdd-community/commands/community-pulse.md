---
description: Generate a community health report with engagement metrics and insights
---

When /community-pulse is used with the following context:

$ARGUMENTS

Generate a comprehensive community health report following these steps:

## 1. Gather Context

If specific data is provided, use it. Otherwise, create a template for manual data entry.

Key metrics to assess:
- **Growth**: New members, total members
- **Engagement**: Active members, messages, response rates
- **Retention**: Return rate, churn indicators
- **Satisfaction**: NPS, sentiment, feedback themes
- **Events**: Attendance, participation
- **Content**: Popular topics, resource usage

## 2. Community Health Framework

### Health Indicators

| Indicator | Healthy | Warning | Critical |
|-----------|---------|---------|----------|
| DAU/MAU | >30% | 15-30% | <15% |
| Question response rate | >90% | 70-90% | <70% |
| Response time | <4h | 4-24h | >24h |
| New member retention (7d) | >60% | 40-60% | <40% |
| NPS | >50 | 20-50 | <20 |
| Intro completion | >80% | 50-80% | <50% |

### Qualitative Signals

**Positive Signs**
- Organic conversations (without prompts)
- Members helping members
- User-generated content
- Referrals and mentions
- Diverse voices participating

**Warning Signs**
- Same few people dominating
- Unanswered questions piling up
- Declining event attendance
- Increased moderation incidents
- Members leaving silently

## 3. Report Template

Generate a report in this format:

```markdown
# 📊 Community Pulse Report
**Period**: [Date range]
**Prepared by**: Community Director

---

## Executive Summary

[2-3 sentences on overall community health]

**Overall Health**: 🟢 Healthy / 🟡 Needs Attention / 🔴 Critical

---

## 📈 Key Metrics

### Growth
| Metric | This Period | Previous | Change |
|--------|-------------|----------|--------|
| Total Members | [X] | [X] | [+/- X%] |
| New Members | [X] | [X] | [+/- X%] |
| Member Exits | [X] | [X] | [+/- X%] |
| Net Growth | [X] | [X] | [+/- X%] |

**Growth Status**: 🟢/🟡/🔴

### Engagement
| Metric | This Period | Previous | Change |
|--------|-------------|----------|--------|
| DAU (avg) | [X] | [X] | [+/- X%] |
| MAU | [X] | [X] | [+/- X%] |
| DAU/MAU Ratio | [X%] | [X%] | [+/- X%] |
| Messages/Day | [X] | [X] | [+/- X%] |
| Active Threads | [X] | [X] | [+/- X%] |

**Engagement Status**: 🟢/🟡/🔴

### Retention
| Metric | This Period | Previous | Change |
|--------|-------------|----------|--------|
| 7-Day Retention | [X%] | [X%] | [+/- X%] |
| 30-Day Retention | [X%] | [X%] | [+/- X%] |
| Intro Completion | [X%] | [X%] | [+/- X%] |
| Re-engaged Members | [X] | [X] | [+/- X%] |

**Retention Status**: 🟢/🟡/🔴

### Support & Response
| Metric | This Period | Previous | Change |
|--------|-------------|----------|--------|
| Questions Asked | [X] | [X] | [+/- X%] |
| Questions Answered | [X] | [X] | [+/- X%] |
| Response Rate | [X%] | [X%] | [+/- X%] |
| Avg Response Time | [X hrs] | [X hrs] | [+/- X%] |

**Support Status**: 🟢/🟡/🔴

---

## 🎯 Satisfaction

### NPS Score
**Current NPS**: [X]
**Previous NPS**: [X]
**Trend**: ↑/↓/→

| Category | Count | % |
|----------|-------|---|
| Promoters (9-10) | [X] | [X%] |
| Passives (7-8) | [X] | [X%] |
| Detractors (0-6) | [X] | [X%] |

### Feedback Themes

**What members love** 💚
1. "[Quote or theme]"
2. "[Quote or theme]"
3. "[Quote or theme]"

**Areas for improvement** 🟡
1. "[Feedback theme]"
2. "[Feedback theme]"
3. "[Feedback theme]"

---

## 🎉 Events

### Event Performance
| Event | Date | Registered | Attended | Rating |
|-------|------|------------|----------|--------|
| [Event 1] | [Date] | [X] | [X] | [X/5] |
| [Event 2] | [Date] | [X] | [X] | [X/5] |

### Event Insights
- **Best performer**: [Event name] - [Why]
- **Opportunity**: [Insight]
- **Upcoming**: [Events planned]

---

## 🔥 Top Activity

### Most Active Channels
1. #[channel] - [X messages]
2. #[channel] - [X messages]
3. #[channel] - [X messages]

### Popular Topics This Period
1. [Topic] - [X discussions]
2. [Topic] - [X discussions]
3. [Topic] - [X discussions]

### Member Spotlights ⭐
- **Most Helpful**: [Name] - [X questions answered]
- **Most Engaged**: [Name] - [Contribution]
- **Rising Star**: [Name] - [New member showing promise]

---

## 🛡️ Moderation

| Metric | Count |
|--------|-------|
| Warnings Issued | [X] |
| Timeouts | [X] |
| Bans | [X] |
| Reports Received | [X] |
| Reports Resolved | [X] |

**Notable Incidents**: [Brief summary if any]

**Moderation Health**: 🟢/🟡/🔴

---

## 📋 Action Items

### Immediate (This Week)
- [ ] [High priority action]
- [ ] [High priority action]

### Short-term (This Month)
- [ ] [Medium priority action]
- [ ] [Medium priority action]

### Strategic (This Quarter)
- [ ] [Long-term initiative]
- [ ] [Long-term initiative]

---

## 💡 Recommendations

### What's Working - Keep Doing
1. [Strategy that's working]
2. [Activity that's effective]

### What Needs Attention
1. **[Area]**: [Issue and recommended action]
2. **[Area]**: [Issue and recommended action]

### New Initiatives to Consider
1. [Idea based on data]
2. [Idea based on feedback]

---

## 📅 Next Pulse

**Next Report**: [Date]
**Key Metrics to Watch**: [Specific focus areas]
```

## 4. Insights Generation

Based on the data (or template), generate insights:

### Trend Analysis
```markdown
## Trend Analysis

### Positive Trends 📈
- [Trend 1]: [What's improving and why it matters]
- [Trend 2]: [What's improving and why it matters]

### Concerning Trends 📉
- [Trend 1]: [What's declining and what to do]
- [Trend 2]: [What's declining and what to do]

### Stable Areas ➡️
- [Area]: [Why it's stable, whether that's good or concerning]
```

### Segment Analysis
```markdown
## Member Segments

### Power Users (Daily active)
- Count: [X]
- Trend: [Growing/Shrinking]
- Health: [Assessment]

### Regular Members (Weekly active)
- Count: [X]
- Trend: [Growing/Shrinking]
- Health: [Assessment]

### Lurkers (Monthly or less)
- Count: [X]
- Trend: [Growing/Shrinking]
- Opportunity: [How to activate]

### At-Risk Members
- Count: [X]
- Common characteristics: [Patterns]
- Recommended action: [Strategy]
```

## 5. Quick Pulse (Abbreviated Version)

For quick check-ins:

```markdown
# ⚡ Quick Pulse: [Date]

## Health Score: [X/10]

### 3 Wins This Week
1. ✅ [Win]
2. ✅ [Win]
3. ✅ [Win]

### 3 Concerns
1. ⚠️ [Concern]
2. ⚠️ [Concern]
3. ⚠️ [Concern]

### Top 3 Actions
1. 🎯 [Action]
2. 🎯 [Action]
3. 🎯 [Action]

**Next check-in**: [Date]
```

## Output Format

```markdown
# Community Pulse Generated

**Report Type**: [Full / Quick / Custom]
**Period Covered**: [Date range]
**Data Completeness**: [Complete / Partial / Template for manual entry]

---

[The report]

---

## How to Use This Report

1. **Review with team**: [Cadence suggestion]
2. **Share with community**: [What to share publicly]
3. **Track actions**: [How to follow up]
4. **Archive**: [Where to store]

## Data Needed for Next Report
- [ ] [Data point to collect]
- [ ] [Data point to collect]
- [ ] [Survey to run]
```
