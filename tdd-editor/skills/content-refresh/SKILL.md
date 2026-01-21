---
name: content-refresh
description: |
  Update existing articles with new information, fix outdated content, and republish for renewed reach.
  Use when content is 6+ months old, tools/libraries have updated, or there's new information
  to add. Maintains SEO value while providing fresh value to readers.
---

# Content Refresh

Breathe new life into existing content without starting from scratch.

## When to Use This Skill

Refresh content when:
- **Age**: Article is 6+ months old
- **Outdated info**: Tools, versions, or best practices have changed
- **New developments**: Something significant happened in the topic area
- **Performance dip**: Traffic declining on previously popular content
- **SEO opportunity**: Keyword rankings dropping, competitors publishing

**Not for:**
- Content that needs complete rewrite (use `tacosdedatos-pipeline`)
- Evergreen content still performing well (leave it alone)
- Content on deprecated/dead topics (archive instead)

## The Refresh Process

```
┌─────────────────────────────────────────────────────────────┐
│                    CONTENT REFRESH                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  PHASE 1: AUDIT                                             │
│  ┌─────────────┐                                            │
│  │ Select      │ → Analyze → Score → [DECISION]            │
│  │ Content     │   current   refresh  Refresh / Archive /  │
│  └─────────────┘   state     need     Leave                 │
│                                                             │
│  PHASE 2: RESEARCH                                          │
│  ┌─────────────┐                                            │
│  │ What's New? │ → Gather → Identify gaps                  │
│  └─────────────┘   updates                                  │
│                                                             │
│  PHASE 3: UPDATE                                            │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐     │
│  │ Fix Outdated│ → │ Add New     │ → │ Update SEO  │      │
│  │ Information │   │ Content     │   │ Metadata    │      │
│  └─────────────┘    └─────────────┘    └─────────────┘     │
│                                                             │
│  PHASE 4: REPUBLISH                                         │
│  ┌─────────────┐                                            │
│  │ Update Date │ → Social promotion → Track performance    │
│  └─────────────┘                                            │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

## Phase 1: Content Audit

### Audit Checklist

For each piece of content, evaluate:

```markdown
## Content Audit: [Article Title]

**URL**: [link]
**Published**: [date]
**Last updated**: [date]
**Age**: [X months]

### Performance Metrics
- Monthly views (current): [X]
- Monthly views (peak): [X]
- Trend: [↑ Growing / → Stable / ↓ Declining]
- Top keywords: [list]
- Keyword rankings: [positions]

### Content Health

| Aspect | Status | Notes |
|--------|--------|-------|
| Code examples | ✅/⚠️/❌ | [Still work? Current syntax?] |
| Tool versions | ✅/⚠️/❌ | [Current versions mentioned?] |
| Links | ✅/⚠️/❌ | [Any broken links?] |
| Screenshots | ✅/⚠️/❌ | [UI still looks like this?] |
| Best practices | ✅/⚠️/❌ | [Still recommended approach?] |
| Statistics/data | ✅/⚠️/❌ | [Numbers still accurate?] |

### Refresh Score

| Factor | Score (1-5) | Weight | Weighted |
|--------|-------------|--------|----------|
| Outdated content | [X] | 30% | [X] |
| Traffic potential | [X] | 25% | [X] |
| Update effort | [X] | 20% | [X] |
| Strategic value | [X] | 15% | [X] |
| Competition | [X] | 10% | [X] |
| **Total** | | | **[X]/5** |

### Decision

- [ ] **Refresh** (Score > 3.5): Worth updating
- [ ] **Minor update** (Score 2.5-3.5): Quick fixes only
- [ ] **Archive** (Score < 2.5): Mark as outdated or remove
- [ ] **Leave** (Content still accurate): No action needed
```

### Batch Audit Template

For auditing multiple articles:

```markdown
# Content Audit: [Month Year]

## Summary
- Articles audited: [X]
- Needs refresh: [X]
- Minor updates: [X]
- Archive candidates: [X]
- No action: [X]

## Refresh Queue (Priority Order)

| Article | Age | Score | Effort | Priority |
|---------|-----|-------|--------|----------|
| [Title] | Xmo | X.X | S/M/L | 🔴 High |
| [Title] | Xmo | X.X | S/M/L | 🟡 Medium |
| [Title] | Xmo | X.X | S/M/L | 🟢 Low |

## Archive Candidates

| Article | Reason |
|---------|--------|
| [Title] | [Topic deprecated / No longer relevant] |
```

## Phase 2: Research Updates

### What to Research

```
For the article topic, find:

1. VERSION UPDATES
   - Current versions of tools/libraries mentioned
   - New features added since publication
   - Deprecations or breaking changes

2. NEW DEVELOPMENTS
   - Recent news in this topic area
   - New tools that should be mentioned
   - Changed best practices

3. COMMUNITY FEEDBACK
   - Comments on original article
   - Questions people ask about this topic
   - Common misconceptions to address

4. COMPETITOR CONTENT
   - What have others published since?
   - What angles are they covering?
   - Gaps we can fill
```

### Research Output

```markdown
## Research: [Article Title]

### Version Updates

| Tool/Library | Article Version | Current Version | Breaking Changes? |
|--------------|-----------------|-----------------|-------------------|
| [Name] | X.X | Y.Y | Yes/No |

### New Developments

1. **[Development 1]**
   - What: [Description]
   - Impact: [How it affects the article]
   - Action: [What to update]

2. **[Development 2]**
   ...

### Community Questions (to address)

- [Question 1]
- [Question 2]

### Competitor Content

| Competitor | What they cover | Our opportunity |
|------------|-----------------|-----------------|
| [URL] | [Summary] | [Gap we can fill] |
```

## Phase 3: Update Content

### Update Types

| Type | Scope | When to Use |
|------|-------|-------------|
| **Quick fix** | Typos, broken links, version numbers | Minor issues |
| **Section update** | Rewrite one section | New information for part of article |
| **Major refresh** | Multiple sections, new content | Significant changes needed |
| **Full rewrite** | Start over | Too much has changed |

### Update Checklist

```markdown
## Updates Made: [Article Title]

### Content Updates

- [ ] Fixed outdated information:
  - [Specific fix 1]
  - [Specific fix 2]

- [ ] Added new content:
  - [New section/paragraph 1]
  - [New section/paragraph 2]

- [ ] Updated code examples:
  - [Code block 1]: [What changed]
  - [Code block 2]: [What changed]

- [ ] Fixed/updated links:
  - [Old link] → [New link]

- [ ] Updated screenshots:
  - [Screenshot 1]: [What changed]

### SEO Updates

- [ ] Updated title tag (if needed)
- [ ] Updated meta description
- [ ] Added new keywords: [list]
- [ ] Updated internal links
- [ ] Checked/added schema markup

### Quality Check

- [ ] Read through entire updated article
- [ ] All code examples tested
- [ ] Voice still authentic tacosdedatos
- [ ] No new AI-speak introduced
- [ ] Flows naturally with updates
```

### Preserving SEO Value

**DO:**
- Keep the same URL
- Maintain core content structure
- Update the publish date (shows freshness)
- Add "Updated: [Date]" note at top
- Keep successful keywords

**DON'T:**
- Change the URL
- Remove content that ranks well
- Completely restructure without reason
- Delete sections that get traffic
- Over-optimize for new keywords

### Update Note Template

Add at the top of refreshed articles:

```markdown
> **Actualizado en [Month Year]**: Este artículo fue actualizado para incluir
> [brief description of what's new]. La versión original fue publicada en [original date].
```

## Phase 4: Republish

### Republish Checklist

```markdown
## Republish: [Article Title]

### Pre-Publish

- [ ] All updates complete
- [ ] SEO metadata updated
- [ ] "Updated" note added
- [ ] Publish date updated
- [ ] Old comments preserved (if applicable)

### Publish

- [ ] Article republished
- [ ] Sitemap updated (automatic usually)
- [ ] Google Search Console: Request reindex

### Promotion

- [ ] Social posts created (use `content-to-social`)
- [ ] Newsletter mention planned
- [ ] Internal links from other articles checked

### Tracking

- [ ] Set reminder to check performance in 2 weeks
- [ ] Note baseline metrics for comparison
```

### Social Promotion for Refreshed Content

Frame refreshed content appropriately:

```
❌ Don't: "Check out my article about X!"
   (Feels like you're recycling old content)

✅ Do: "Actualicé mi guía sobre X con [new thing].
        Si la leíste antes, hay cosas nuevas que te van a interesar:"
   (Transparency + value proposition)
```

## Refresh Calendar

Suggested cadence:

| Frequency | Activity |
|-----------|----------|
| **Monthly** | Quick audit of top 10 performing articles |
| **Quarterly** | Full audit of all content |
| **Annually** | Major refresh of pillar content |

### Annual Refresh Schedule

```markdown
# Content Refresh Calendar 2026

## Q1 (Jan-Mar)
- [ ] Audit all content from 2024
- [ ] Refresh top 5 tutorials
- [ ] Archive deprecated content

## Q2 (Apr-Jun)
- [ ] Refresh Python/Pandas content (version updates)
- [ ] Update tool comparison articles

## Q3 (Jul-Sep)
- [ ] Refresh beginner content
- [ ] Update "getting started" guides

## Q4 (Oct-Dec)
- [ ] Annual roundup/review articles
- [ ] Prepare pillar content for next year
```

## Metrics to Track

### Before/After Comparison

```markdown
## Refresh Results: [Article Title]

| Metric | Before | After (2 weeks) | After (1 month) |
|--------|--------|-----------------|-----------------|
| Monthly views | X | X | X |
| Avg. time on page | X | X | X |
| Bounce rate | X% | X% | X% |
| Keyword rankings | X | X | X |
| Social shares | X | X | X |

### Assessment
- **ROI**: [Worth it / Marginal / Not worth it]
- **Learnings**: [What worked, what didn't]
```

## Integration with Pipeline

```
trend-monitor
    ↓
[Identifies topics to refresh]
    ↓
content-refresh (this skill)
    ↓
[Updated article]
    ↓
content-to-social
    ↓
[Promotion of refreshed content]
```

## Related Skills

- `tacosdedatos-editor` — Quality review for updates
- `tacosdedatos-seo` — SEO optimization
- `content-to-social` — Promotion after refresh
- `trend-monitor` — Identifies refresh opportunities
