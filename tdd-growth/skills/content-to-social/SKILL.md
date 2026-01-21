---
name: content-to-social
description: |
  Transform newsletter editions or articles into platform-optimized social posts.
  Use when you have a published newsletter/article and need to promote it across
  X/Twitter, LinkedIn, Instagram, and Bluesky. Generates a complete social media
  bundle with platform-specific adaptations, not cross-posted copies.
---

# Content-to-Social Pipeline

Transform a single piece of content into optimized posts for every platform.

## When to Use This Skill

Use after publishing a newsletter edition or article:
- tacosdedatos edition just went out → generate social promotion bundle
- New blog post published → create platform-specific announcements
- Tutorial completed → distribute across channels

**Not for**: Creating original social content (use platform-specific skills directly).

## The Pipeline

```
Newsletter/Article
       ↓
   Extract Core Elements
       ↓
   ┌─────────┬─────────┬─────────┬─────────┐
   ↓         ↓         ↓         ↓         ↓
X/Twitter LinkedIn Instagram Bluesky  Subject Line
   ↓         ↓         ↓         ↓         ↓
tweet-   linkedin-  instagram- bluesky-  subject-line-
crafter  post-      post-      post-     optimizer
         crafter    crafter    crafter
   ↓         ↓         ↓         ↓         ↓
   └─────────┴─────────┴─────────┴─────────┘
                     ↓
            Social Media Bundle
```

## Step 1: Extract Core Elements

Read the source content and extract:

| Element | What to Find | Use For |
|---------|--------------|---------|
| **Main insight** | The ONE thing readers learn | All platforms |
| **Hook/opening** | First compelling line | X, LinkedIn, Bluesky |
| **Data points** | Statistics, metrics, numbers | X threads, LinkedIn |
| **Quotable lines** | Memorable phrases | All platforms |
| **Visual opportunities** | Code snippets, diagrams, charts | Instagram, X |
| **Transformation story** | Before/after narrative | LinkedIn, Instagram |
| **Key takeaways** | 3-5 bullet points | X thread, carousel |

## Step 2: Platform Adaptation Matrix

Each platform needs different treatment:

| Platform | Format | Tone | Link Handling | Best For |
|----------|--------|------|---------------|----------|
| **X/Twitter** | Long-form article or thread | Conversational, punchy | In-app browser (Oct 2025+) | Tech audience, quick insights |
| **LinkedIn** | Single post, document carousel | Professional, story-driven | In comments or native | Career/professional angle |
| **Instagram** | Carousel, Stories, Reel | Visual, educational | Link in bio | Data viz, tutorials |
| **Bluesky** | Thread or single post | Conversational, authentic | Direct links OK | Early adopters, tech |

## Step 3: Generate Platform Content

For each platform, use the corresponding skill:

### X/Twitter → `tweet-crafter`

**Adapt for:**
- Long-form article (preferred) OR thread format
- Hook in first 280 characters
- Video content if possible (5x engagement)
- Spanish with natural code-switching

**Generate:**
1. Long-form article with key insights
2. Alternative: 5-7 tweet thread
3. Single tweet teaser with link

### LinkedIn → `linkedin-post-crafter`

**Adapt for:**
- Professional/career angle
- Story format with transformation
- Longer form (1,300+ chars perform well)
- Link in first comment

**Generate:**
1. Story-format post (problem → journey → insight)
2. Carousel document (if visual content available)

### Instagram → `instagram-post-crafter`

**Adapt for:**
- Visual-first (carousel or single image)
- Educational carousel with takeaways
- Spanish captions
- Hashtags for discovery

**Generate:**
1. Carousel concept (5-10 slides)
2. Caption with CTA to link in bio
3. Story sequence (optional)

### Bluesky → `bluesky-post-crafter`

**Adapt for:**
- Authentic, conversational tone
- Thread for longer content
- Direct links (no penalty)
- Early adopter tech audience

**Generate:**
1. Thread or single post
2. Direct link to full content

## Step 4: Output Bundle

Return a complete social media bundle:

```markdown
# Social Media Bundle: [Content Title]

**Source**: [Newsletter/Article link]
**Generated**: [Date]

---

## X/Twitter

### Option A: Long-Form Article
[Full long-form content]

### Option B: Thread
1/ [Hook tweet]

2/ [Key insight 1]

3/ [Key insight 2]

...

### Option C: Single Tweet
[Teaser with link]

**Suggested posting time**: [Day, Time PST]
**Media needed**: [Description if any]

---

## LinkedIn

### Post
[Full LinkedIn post]

### First Comment
[Link + additional context]

**Media needed**: [Carousel/image description if any]

---

## Instagram

### Carousel Concept
Slide 1: [Hook/title]
Slide 2: [Point 1]
...
Slide N: [CTA]

### Caption
[Caption text with hashtags]

**Image specs**: 1080x1080 or 1080x1350

---

## Bluesky

### Thread/Post
[Bluesky content]

---

## Posting Schedule

| Platform | Day | Time (PST) | Format |
|----------|-----|------------|--------|
| X/Twitter | [Day] | [Time] | Long-form |
| LinkedIn | [Day] | [Time] | Story post |
| Instagram | [Day] | [Time] | Carousel |
| Bluesky | [Day] | [Time] | Thread |

## Cross-Promotion Notes

- [Any platform-specific considerations]
- [Engagement strategy for first hour]
```

## Platform-Specific Guidelines

### Timing Recommendations

| Platform | Best Days | Best Times (PST) |
|----------|-----------|------------------|
| X/Twitter | Tue-Thu | 9-11 AM, 7-9 PM |
| LinkedIn | Tue-Thu | 7-8 AM, 12 PM |
| Instagram | Mon, Wed | 11 AM, 7-9 PM |
| Bluesky | Weekdays | Evenings |

### Engagement Strategy

For first hour after posting on each platform:
1. **X/Twitter**: Reply to every comment, engage with QTs
2. **LinkedIn**: Respond to comments, engage with others' posts
3. **Instagram**: Reply to comments, respond to Story reactions
4. **Bluesky**: Engage in replies, boost with additional context

## Content Transformation Examples

### Newsletter Opening → Platform Hooks

**Original newsletter opening:**
> "Esta semana descubrí que el 73% de mi código de Pandas era innecesario. Después de 5 años usando esta librería, un video de YouTube me mostró patrones que cambiaron todo."

**X/Twitter (long-form):**
> "73% de mi código de Pandas era innecesario.
>
> Después de 5 años usando esta librería, descubrí patrones que cambiaron todo.
>
> Te cuento los 3 más importantes 🧵"

**LinkedIn:**
> "Llevo 5 años escribiendo código de Pandas.
>
> Esta semana descubrí que el 73% era innecesario.
>
> No fue un curso caro. No fue un bootcamp.
>
> Fue un video de YouTube de 12 minutos.
>
> Esto es lo que aprendí (y por qué cambió mi forma de trabajar):"

**Instagram carousel:**
> Slide 1: "73% de mi código de Pandas era INNECESARIO"
> Slide 2: "5 años usando Pandas..."
> Slide 3: "Hasta que vi este video"
> ...

**Bluesky:**
> "descubrí que el 73% de mi código de pandas era innecesario lol
>
> 5 años usando esta librería y un video de youtube me enseñó más que cualquier curso
>
> un hilo con los 3 patrones que más me ayudaron:"

## Quality Checklist

Before delivering the bundle:

- [ ] Each platform version is genuinely different (not copy-paste)
- [ ] Hooks are platform-appropriate
- [ ] Links handled correctly per platform
- [ ] Tone matches platform culture
- [ ] Spanish/English balance appropriate
- [ ] Visual content needs identified
- [ ] Posting times recommended
- [ ] First-hour engagement strategy included

## Related Skills

- `tweet-crafter` — X/Twitter optimization
- `linkedin-post-crafter` — LinkedIn optimization
- `instagram-post-crafter` — Instagram feed posts
- `instagram-stories-crafter` — Instagram Stories
- `bluesky-post-crafter` — Bluesky optimization
- `subject-line-optimizer` — Newsletter subject lines
