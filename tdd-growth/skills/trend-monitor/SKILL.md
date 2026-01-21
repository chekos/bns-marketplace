---
name: trend-monitor
description: |
  Scan data science and tech news sources for timely content ideas.
  Use daily or weekly to discover trending topics, emerging tools, and conversation starters
  for tacosdedatos content. Returns pitch candidates ranked by relevance and timeliness.
---

# Trend Monitor

Discover what the data science community is talking about right now.

## When to Use This Skill

Use on a regular cadence:
- **Daily**: Quick scan for breaking news and viral discussions
- **Weekly**: Deep scan for emerging trends and content opportunities
- **Ad-hoc**: When planning content calendar or looking for inspiration

## Sources to Monitor

### Primary Sources (Data Science Focus)

| Source | Type | Signal |
|--------|------|--------|
| **Reddit** | Community | What practitioners are struggling with |
| r/datascience | Discussion | Career, tools, techniques |
| r/Python | Technical | Libraries, updates, tutorials |
| r/MachineLearning | Research | Papers, breakthroughs, debates |
| r/dataengineering | Infrastructure | Pipelines, tools, architecture |
| **Hacker News** | Tech news | What's getting attention |
| Show HN | Launches | New tools and projects |
| Ask HN | Questions | Common problems |
| **X/Twitter** | Real-time | What influencers are discussing |
| Data science accounts | Opinions | Hot takes, debates |
| Tool announcements | News | New releases |
| **GitHub Trending** | Code | What developers are building |
| Python repos | Libraries | Emerging tools |
| Data repos | Datasets | New resources |

### Secondary Sources

| Source | Type | Best For |
|--------|------|----------|
| **arXiv** | Research | Cutting-edge papers |
| cs.LG, stat.ML | ML papers | New techniques |
| **Dev.to / Medium** | Tutorials | What people are learning |
| Data science tags | Articles | Tutorial gaps |
| **YouTube** | Video | Popular explanations |
| Data channels | Tutorials | What's getting views |
| **Newsletters** | Curated | What curators find important |
| Data Elixir, TLDR | Aggregators | Pre-filtered content |

### LATAM-Specific Sources

| Source | Language | Focus |
|--------|----------|-------|
| **Twitter LATAM** | Spanish | Regional discussions |
| Data science en español | Spanish | Community conversations |
| **Reddit en español** | Spanish | r/programacion, r/cienciadedatos |
| **YouTube español** | Spanish | Tutorial demand |

## Monitoring Process

### Step 1: Source Scan

For each source, look for:

```
SIGNALS TO TRACK:
├── 🔥 High engagement (upvotes, comments, shares)
├── 📈 Rapid growth (trending, viral)
├── ❓ Unanswered questions (content gaps)
├── 🆕 New releases (tools, libraries, updates)
├── 💬 Active debates (controversial topics)
└── 🇲🇽 LATAM relevance (Spanish content needs)
```

### Step 2: Relevance Filtering

Score each finding against tacosdedatos criteria:

| Criterion | Weight | Questions |
|-----------|--------|-----------|
| **Audience fit** | 30% | Would our readers care? |
| **Timeliness** | 25% | Is this happening now? |
| **Unique angle** | 20% | Can we add value others aren't? |
| **Expertise match** | 15% | Can we speak authentically? |
| **Content pillar** | 10% | Does it fit our categories? |

### Step 3: Pitch Generation

For top candidates, generate pitch summaries:

```markdown
## Trend: [Topic Name]

**Source**: [Where discovered]
**Signal strength**: 🔥🔥🔥 (1-5 fires)
**Timeliness**: [Breaking / This week / Emerging]

**What's happening**:
[2-3 sentence summary]

**Why it matters for our audience**:
[Connection to tacosdedatos readers]

**Potential angles**:
1. [Angle 1 - e.g., tutorial]
2. [Angle 2 - e.g., opinion piece]
3. [Angle 3 - e.g., comparison]

**Competition check**:
- [Existing content on this topic]
- [Our differentiation opportunity]

**Recommended action**: [Write now / Queue for next week / Monitor]
```

## Output Format

### Daily Scan Output

```markdown
# Trend Monitor: [Date]

## 🔥 Hot Right Now (Act Today)

### 1. [Trend Name]
- **Source**: [Reddit/HN/Twitter]
- **Signal**: [X upvotes / X comments / trending]
- **Quick take**: [One sentence]
- **Action**: [Suggested response]

### 2. [Trend Name]
...

## 📈 Building Momentum (This Week)

### 1. [Trend Name]
...

## 👀 Worth Watching (Monitor)

- [Topic 1]: [Why watching]
- [Topic 2]: [Why watching]

## 📊 Source Stats

| Source | Items Scanned | Relevant | Hot |
|--------|---------------|----------|-----|
| Reddit | X | X | X |
| HN | X | X | X |
| Twitter | X | X | X |
```

### Weekly Deep Scan Output

```markdown
# Weekly Trend Report: [Week of Date]

## Executive Summary

**Top opportunity**: [Best content idea this week]
**Emerging theme**: [Pattern across sources]
**Community mood**: [What people are feeling]

## Pitch Candidates (Ranked)

### 🥇 Priority 1: [Topic]
[Full pitch summary - see template above]

### 🥈 Priority 2: [Topic]
[Full pitch summary]

### 🥉 Priority 3: [Topic]
[Full pitch summary]

## Trend Analysis

### What's Rising
- [Trend 1]: [Why it's growing]
- [Trend 2]: [Why it's growing]

### What's Fading
- [Topic 1]: [Why declining interest]
- [Topic 2]: [Why declining interest]

### Evergreen Opportunities
- [Topic that's always relevant]
- [Topic that's always relevant]

## LATAM-Specific Insights

### Spanish Content Gaps
- [Topic with no good Spanish coverage]
- [Topic with no good Spanish coverage]

### Regional Trends
- [LATAM-specific trend]
- [Mexico-specific trend]

## Recommended Content Calendar

| Day | Topic | Type | Why Now |
|-----|-------|------|---------|
| Mon | [Topic] | Tutorial | [Reason] |
| Wed | [Topic] | Opinion | [Reason] |
| Fri | [Topic] | Roundup | [Reason] |

## Sources Summary

### Most Active This Week
1. [Source]: [Key discussion]
2. [Source]: [Key discussion]

### New Sources Discovered
- [New blog/newsletter/account to follow]
```

## Search Queries

### Reddit Searches

```
# r/datascience
site:reddit.com/r/datascience [topic] after:2024-01-01
sort:top time:week

# Cross-subreddit
(site:reddit.com/r/datascience OR site:reddit.com/r/Python) [topic]
```

### Hacker News Searches

```
# Via Algolia HN Search
https://hn.algolia.com/?q=[topic]&type=story&dateRange=pastWeek&sort=byPopularity

# Show HN launches
https://hn.algolia.com/?q=show%20hn%20[topic]&type=story
```

### Twitter/X Searches

```
# Trending in data science
(data science OR machine learning OR python) min_faves:100 lang:en
(ciencia de datos OR aprendizaje automático) min_faves:50 lang:es

# From specific accounts
from:@account [topic]
```

### GitHub Trending

```
# Trending Python repos
https://github.com/trending/python?since=weekly

# Topic-specific
https://github.com/topics/[topic]?o=desc&s=stars
```

## Automation Ideas

### Daily Automated Checks

```yaml
# Potential automation (for future MCP integration)
schedule: "0 6 * * *"  # 6 AM daily

sources:
  reddit:
    subreddits: [datascience, Python, MachineLearning]
    sort: hot
    limit: 25

  hackernews:
    type: topstories
    limit: 30
    filter: [data, python, ml, ai]

  twitter:
    lists: [data-science-influencers]
    min_engagement: 100

output:
  format: markdown
  destination: daily-trends.md
  notify: true
```

## Integration with Pipeline

Trend Monitor feeds into the content pipeline:

```
trend-monitor
    ↓
[Pitch candidates]
    ↓
tacosdedatos-pipeline (Phase 1: Ideation)
    ↓
[Human selects from candidates]
    ↓
[Content production begins]
```

## Quality Checklist

Before reporting a trend:

- [ ] Verified across multiple sources?
- [ ] Not just one viral post?
- [ ] Relevant to tacosdedatos audience?
- [ ] We can add unique value?
- [ ] Timing makes sense?
- [ ] Not already covered recently?

## Anti-Patterns

| Mistake | Problem | Solution |
|---------|---------|----------|
| Chasing every trend | Exhaustion, off-brand content | Filter ruthlessly |
| Ignoring LATAM | Missing core audience | Always check Spanish sources |
| Only English sources | Incomplete picture | Balance with Spanish content |
| Reacting too slow | Trend already peaked | Daily monitoring, quick response |
| No unique angle | "Me too" content | Always find differentiation |

## Related Skills

- `tacosdedatos-pipeline` — Full content production
- `beat-reporter` agent — Research and drafting
- `content-to-social` — Distribution after creation
