---
name: article-to-newsletter
description: |
  Convert standalone blog posts or articles into tacosdedatos newsletter format.
  Use when you have existing content (your own or curated) that needs the personal touch,
  community invitation, and voice that makes tacosdedatos newsletters distinctive.
---

# Article to Newsletter Converter

Transform articles into newsletter editions with the tacosdedatos voice.

## When to Use This Skill

Use to convert:
- **Your blog posts** → Newsletter editions
- **Tutorial drafts** → Newsletter format
- **Curated external content** → Commentary + curation edition
- **Conference talks/slides** → Written newsletter version
- **Twitter threads** → Expanded newsletter content

**Not for:**
- Writing from scratch (use `tacosdedatos-pipeline`)
- Quick social posts (use `content-to-social`)
- Content that doesn't fit newsletter format

## Newsletter vs Article: Key Differences

| Aspect | Article | Newsletter |
|--------|---------|------------|
| **Voice** | Can be formal/neutral | Must be personal, conversational |
| **Opening** | Hook about topic | Personal connection + hook |
| **Relationship** | Reader ↔ Content | Reader ↔ Author ↔ Content |
| **CTA** | Optional | Required (community, reply, share) |
| **Length** | As long as needed | Sweet spot 1,200-1,800 words |
| **Structure** | Topic-driven | Relationship-driven |

## The Conversion Process

```
┌─────────────────────────────────────────────────────────────┐
│              ARTICLE → NEWSLETTER CONVERSION                │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  INPUT: Source Article                                      │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ [Original article content]                          │   │
│  └─────────────────────────────────────────────────────┘   │
│                         ↓                                   │
│  STEP 1: Extract Core Value                                 │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ • Main insight                                      │   │
│  │ • Key takeaways                                     │   │
│  │ • Best examples/code                                │   │
│  │ • Quotable moments                                  │   │
│  └─────────────────────────────────────────────────────┘   │
│                         ↓                                   │
│  STEP 2: Add Personal Layer                                 │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ • Personal intro (why this matters to YOU)          │   │
│  │ • Vulnerability moment                              │   │
│  │ • Your journey with this topic                      │   │
│  │ • Behind-the-scenes context                         │   │
│  └─────────────────────────────────────────────────────┘   │
│                         ↓                                   │
│  STEP 3: Apply tacosdedatos Voice                          │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ • Spanish-first with natural code-switching         │   │
│  │ • Conversational tone ("tú" not "usted")           │   │
│  │ • Cultural grounding                                │   │
│  │ • Anti-AI markers removed                           │   │
│  └─────────────────────────────────────────────────────┘   │
│                         ↓                                   │
│  STEP 4: Add Community Elements                            │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ • Cross-references to past content                  │   │
│  │ • Reader questions to answer                        │   │
│  │ • Community invitation                              │   │
│  │ • Single, clear CTA                                 │   │
│  └─────────────────────────────────────────────────────┘   │
│                         ↓                                   │
│  OUTPUT: Newsletter Edition                                 │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ [Complete newsletter ready for Substack/Beehiiv]    │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

## Step 1: Extract Core Value

Read the source article and identify:

```markdown
## Source Analysis: [Article Title]

**Main insight**:
[The ONE thing readers should learn/understand]

**Key takeaways** (3-5 max):
1. [Takeaway 1]
2. [Takeaway 2]
3. [Takeaway 3]

**Best examples/code**:
- [Example 1 to keep]
- [Code snippet to keep]

**Quotable moments**:
- "[Quote 1]"
- "[Quote 2]"

**What to cut** (not essential for newsletter):
- [Section that's too detailed]
- [Tangent that doesn't serve main point]
```

## Step 2: Add Personal Layer

The personal layer is what makes newsletters different from articles.

### Personal Intro Template

```markdown
[Opening line that connects YOU to the topic]

[1-2 sentences about your journey/experience with this]

[Transition to the content: "So let me show you..." / "Esto es lo que aprendí..." ]
```

### Personal Elements to Add

| Element | Purpose | Example |
|---------|---------|---------|
| **Your story** | Connection | "La primera vez que intenté esto, fallé..." |
| **Vulnerability** | Trust | "Tardé 3 meses en entender esto..." |
| **Behind-the-scenes** | Authenticity | "Escribí esto porque un lector preguntó..." |
| **Opinion** | Perspective | "Honestamente, creo que la mayoría lo hace mal..." |
| **Context** | Relevance | "Esto me ha servido mucho en mi trabajo actual..." |

### Questions to Answer

Before converting, answer:

1. **Why do I care about this topic?**
2. **What's my personal experience with it?**
3. **What mistake did I make that readers can avoid?**
4. **Why am I sharing this NOW?**
5. **What do I want readers to DO after reading?**

## Step 3: Apply tacosdedatos Voice

### Voice Checklist

```markdown
## Voice Check

### Language
- [ ] Spanish-first
- [ ] English only for untranslatable tech terms
- [ ] Natural code-switching
- [ ] "Tú" not "usted"

### Tone
- [ ] Conversational, not formal
- [ ] Peer-to-peer, not teacher-to-student
- [ ] Confident but humble
- [ ] Optimistic realism (honest about challenges)

### Anti-AI Markers
- [ ] No "It's important to note"
- [ ] No "In conclusion"
- [ ] No empty antitheses ("No es X. Es Y." without real contrast)
- [ ] No generic filler phrases

### Cultural Grounding
- [ ] Specific references (not generic "Latino culture")
- [ ] Mexican/LATAM context where relevant
- [ ] Metaphors that feel authentic
```

### Voice Transformation Examples

**Before (generic article):**
> "It's important to note that data cleaning is a crucial step in any data analysis workflow. In this tutorial, we will explore various techniques for handling missing values."

**After (tacosdedatos newsletter):**
> "Nadie te dice cuánto tiempo vas a pasar limpiando datos. Yo pensaba que iba a ser como el 10% de mi trabajo. Spoiler: es más como el 70%. Pero después de años haciendo esto, encontré algunos trucos que me ahorran horas cada semana."

**Before (formal):**
> "Furthermore, the implementation of this methodology requires careful consideration of the underlying assumptions."

**After (tacosdedatos):**
> "Pero ojo — esto no funciona para todos los casos. Te cuento cuándo sí y cuándo no vale la pena."

## Step 4: Add Community Elements

### Cross-References

Link to related past content:

```markdown
Si te interesa esto, también te puede servir:
- [Artículo relacionado 1](link) — donde hablé de [tema]
- [Artículo relacionado 2](link) — para los que quieren ir más profundo
```

### Reader Questions

If applicable, reference reader questions:

```markdown
Un lector me preguntó la semana pasada: "[pregunta]"

Esta es mi respuesta...
```

### Community Invitation

End with a clear invitation:

```markdown
## Para cerrar

[Summary/reflection in 2-3 sentences]

**¿Tú qué opinas?** [Specific question to prompt replies]

Responde a este correo — leo todas las respuestas.

[Single CTA: Subscribe / Share / Check out resource]
```

## Newsletter Structure Template

```markdown
# [Title - Hook Format]

[Personal intro - 2-3 sentences connecting you to the topic]

---

## [Main Section 1]

[Content adapted from article with personal commentary woven in]

[Code example if applicable]

[Personal anecdote or insight]

## [Main Section 2]

[Continue pattern...]

---

## En resumen

[3-5 bullet takeaways]

## Para cerrar

[1-2 sentences of reflection or call to action]

**[Question to readers]**

---

Si te gustó esto:
- [CTA 1: Share with someone]
- [CTA 2: Related content]

Hasta la próxima,
[Your name]
```

## Conversion Checklist

Before publishing the converted newsletter:

```markdown
## Conversion Complete: [Title]

### Structure
- [ ] Personal intro added
- [ ] Content trimmed to 1,200-1,800 words
- [ ] Sections flow naturally
- [ ] Closing is a reframe, not a recap

### Voice
- [ ] Reads like tacosdedatos (not generic)
- [ ] Coffee test passed (would say this to a friend?)
- [ ] Anti-AI markers removed
- [ ] Spanish-first with natural English

### Community
- [ ] Cross-references added
- [ ] Question for readers included
- [ ] Single clear CTA
- [ ] Reply invitation present

### Technical
- [ ] Code examples work
- [ ] Links valid
- [ ] Images included/described
- [ ] SEO metadata ready
```

## Output Format

```markdown
# Newsletter Edition: [Title]

## Metadata
- **Subject lines** (3 options):
  1. [Option 1]
  2. [Option 2]
  3. [Option 3]
- **Preview text**: [First line that shows in inbox]
- **Word count**: [X]
- **Reading time**: [X min]
- **Content pillar**: [Educational / Community / BTS / Promo]

## Content

[Full newsletter content here]

---

## Notes for Publishing
- **Publish date**: [Suggested date]
- **Social posts**: [Use content-to-social skill]
- **Cross-references**: [Links to add in CMS]
```

## Source Type Variations

### Converting Your Own Blog Post

Focus: Add personal layer that might have been removed for "professional" blog

### Converting External Content (Curation)

Focus: Your commentary and perspective on someone else's work

```markdown
## Template for Curated Content

[Personal intro: Why this caught your attention]

---

Esta semana encontré [article/resource] de [author] y tenía que compartirlo.

**Lo que me gustó:**
[Your commentary]

**Mi take:**
[Your perspective/addition]

**Lo que me hubiera gustado ver:**
[Constructive addition]

[Link to original with proper attribution]

---

[Continue with your own thoughts/additions]
```

### Converting Twitter Thread

Focus: Expand on the compressed format

```markdown
## Thread → Newsletter Process

1. Gather all tweets in order
2. Expand each point (threads are compressed)
3. Add context that was cut for character limits
4. Weave into continuous narrative
5. Add personal intro and community elements
```

### Converting Talk/Slides

Focus: Add narrative that was delivered verbally

```markdown
## Talk → Newsletter Process

1. Use slides as outline
2. Add the "spoken" context
3. Include anecdotes from Q&A
4. Add resources mentioned verbally
5. Convert to readable format (not bullet-heavy)
```

## Related Skills

- `tacosdedatos-editor` — Quality review
- `tacosdedatos-pipeline` — Full production workflow
- `content-to-social` — Promote the newsletter
- `subject-line-optimizer` — Newsletter subject lines
