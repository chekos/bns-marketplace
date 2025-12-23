---
description: Analyze content for SEO optimization and provide recommendations
---

When /seo is used with:

$ARGUMENTS

Perform a comprehensive SEO analysis of the provided content or URL.

## Step 1: Understand the Content

If a URL is provided:
- Fetch and analyze the page content
- Extract current meta tags, headings, and content

If content/text is provided:
- Analyze the provided content directly
- Identify the main topic and keywords

If a topic is provided:
- Perform keyword research for that topic
- Provide optimization guidelines

## Step 2: Keyword Analysis

1. Identify the primary keyword/topic
2. Research related keywords and search intent
3. Consider Spanish-language variations (Mexico, Spain, Argentina)
4. Find long-tail opportunities

## Step 3: On-Page Analysis

Analyze and provide recommendations for:
- Title tag (currently vs. recommended, character count)
- Meta description (currently vs. recommended, character count)
- Heading structure (H1, H2s, H3s)
- Keyword placement and density
- Internal linking opportunities
- Image optimization (alt text)

## Step 4: Provide Recommendations

## Output Format

```markdown
# SEO Analysis: [Topic/Title]

**Target Keyword**: [Primary keyword]
**Search Intent**: Informational / Commercial / Transactional

## Overall Score: X/10

### Title Tag
**Current**: [Current or N/A]
**Recommended**: [Optimized title - max 60 chars]
**Character Count**: X/60

### Meta Description
**Current**: [Current or N/A]
**Recommended**: [Optimized description - max 160 chars]
**Character Count**: X/160

### Keyword Opportunities

#### Primary Keyword
- **Keyword**: [keyword]
- **Estimated Volume**: [if available]
- **Difficulty**: Low/Medium/High

#### Secondary Keywords
1. [keyword] - [brief note]
2. [keyword] - [brief note]
3. [keyword] - [brief note]

#### Long-tail Opportunities
- [long-tail keyword]
- [long-tail keyword]

### Content Optimization

#### Heading Structure
- H1: [Recommendation]
- Suggested H2s:
  - [H2 suggestion with keyword]
  - [H2 suggestion]

#### Content Gaps
Based on search intent, consider adding:
1. [Missing section/topic]
2. [Missing section/topic]

### Technical Recommendations

| Priority | Issue | Recommendation |
|----------|-------|----------------|
| High | [Issue] | [Fix] |
| Medium | [Issue] | [Fix] |

### Quick Wins
1. [Most impactful, easiest change]
2. [Second priority]
3. [Third priority]

### Spanish SEO Notes
- Regional keyword variations to consider: [list]
- Recommended anchor text patterns: [examples]
```

## Notes

- Prioritize recommendations by impact and ease
- Be specific and actionable
- Include character counts for meta elements
- Consider the tacosdedatos Spanish-speaking audience
- Reference the seo-guidelines skill for detailed best practices
