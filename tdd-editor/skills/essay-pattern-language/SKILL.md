---
name: essay-pattern-language
description: Use this skill to evaluate, score, and improve essays using Michael Dean's Pattern Language framework. Based on Christopher Alexander's architectural pattern language concept, this provides a systematic approach with 27 interconnected patterns organized into 3 dimensions (Idea, Form, Voice) and 9 elements. Use for essay evaluation, scoring (1-5 per pattern), identifying weaknesses, providing targeted feedback, and guiding systematic improvement.
---

# Essay Pattern Language

This skill codifies Michael Dean's comprehensive system for essay mastery based on Christopher Alexander's pattern language concept. Rather than fragmented writing advice, it offers 27 interconnected patterns organized hierarchically for systematic evaluation and improvement.

## When to Use This Skill

Use this skill for:
- Evaluating essay drafts against a comprehensive quality framework
- Scoring essays quantitatively (1-5 on each of 27 patterns)
- Identifying specific weaknesses and prioritizing improvements
- Providing targeted, actionable feedback on any dimension
- Guiding systematic improvement across Idea, Form, and Voice
- Teaching essay craft through concrete, measurable criteria
- Self-assessment and deliberate practice planning

## The Pattern Language Architecture

### Three Dimensions

| Dimension | Creates | Classical Rhetoric | Focus |
|-----------|---------|-------------------|-------|
| **Idea** | A "center" | Ethos (character) | Substance and conceptual foundation |
| **Form** | A "line" | Logos (reason) | Linear progression and structure |
| **Voice** | A "texture" | Pathos (emotion) | Stylistic rendering and experience |

### Nine Elements (Three per Dimension)

**Idea Dimension:**
1. **Material** - Curating stories, references, evidence
2. **Thesis** - The unifying concept providing cohesion
3. **Title** - Ultimate compression as invitation and souvenir

**Form Dimension:**
4. **Story** - Tension-building devices for engagement
5. **Structure** - Logical ordering and thematic clarity
6. **Flow** - Paragraph-level micro-arcs maintaining momentum

**Voice Dimension:**
7. **Spirit** - Authorial attitude and subtext
8. **Sound** - Rhythm, repetition, sonic patterns
9. **Sight** - Imagery and evocative word choice

### Twenty-Seven Patterns

Each element contains approximately 3 patterns - the smallest recurring design problems with solutions applicable infinitely without repetition. See reference files for complete pattern definitions.

## Core Principles

### The Language Metaphor

Like musical notes combining into symphonies or letters forming literature, patterns interlock to enable infinite original compositions. Mastery requires fluency, not templates.

### Interconnectedness

No pattern exists in isolation. Each depends on:
- Larger patterns containing it
- Surrounding patterns at similar scale
- Smaller patterns embedded within

Improving one pattern strengthens connected patterns through network effects.

### Non-Linearity

Writers can enter the system anywhere, following individual weaknesses to strengthen the entire network.

## The 6 Primary Use Cases

### 1. Complete Essay Evaluation

When the user says: "Evaluate this essay" or "Score my draft"

**Process:**
1. Read all reference files to understand the 27 patterns
2. Read the essay completely for overall impression
3. Score each pattern 1-5 using `references/scoring-rubric.md`
4. Calculate dimension and overall scores
5. Output using `references/evaluation-template.md`
6. Identify top 3 weaknesses and top 3 strengths
7. Provide specific improvement recommendations

**Critical reminders:**
- Quote specific passages to justify scores
- Be rigorous but fair - most essays are 2-3 on most patterns
- Identify interconnected weaknesses (fixing one may fix others)
- Prioritize high-leverage improvements

### 2. Dimension-Specific Analysis

When the user says: "Analyze the voice" or "How's my structure?"

**Process:**
1. Read relevant dimension reference file:
   - Idea: `references/idea-dimension.md`
   - Form: `references/form-dimension.md`
   - Voice: `references/voice-dimension.md`
2. Score only the 9 patterns in that dimension
3. Provide detailed feedback with specific examples
4. Suggest targeted exercises for weak patterns

### 3. Single Pattern Deep Dive

When the user says: "Help me improve my thesis" or "My titles are weak"

**Process:**
1. Read the relevant reference file for that element
2. Analyze current performance on that specific pattern
3. Explain the pattern's mechanics and importance
4. Show examples of strong vs. weak execution
5. Provide specific revision suggestions
6. Suggest deliberate practice exercises

### 4. Comparative Analysis

When the user says: "Compare these two versions" or "Which draft is better?"

**Process:**
1. Score both essays on all 27 patterns
2. Create side-by-side comparison
3. Identify which version excels in each dimension
4. Explain specific differences that drive score changes
5. Recommend whether to pursue Version A, B, or hybrid

### 5. Improvement Planning

When the user says: "What should I focus on?" or "Help me get better"

**Process:**
1. Review recent evaluations or evaluate current work
2. Identify consistent weakness patterns
3. Map interconnections - which weaknesses cluster together?
4. Create prioritized improvement plan based on:
   - Network effects (fixing X improves Y and Z)
   - Current competency level
   - User's goals and genre
5. Suggest specific exercises for top 3 priorities

### 6. Teaching Mode

When the user says: "Explain the pattern language" or "Teach me about [element]"

**Process:**
1. Start with the three dimensions and their purposes
2. Introduce the 9 elements as the core framework
3. Explain how patterns are specific, recurring solutions
4. Use examples from great essays to illustrate
5. Connect back to Aristotle's rhetoric (ethos, logos, pathos)
6. Emphasize that fluency comes from practice, not templates

## Scoring Guidelines

### The 1-5 Scale

| Score | Level | Description |
|-------|-------|-------------|
| **1** | Absent/Broken | Pattern not present or actively hurts the essay |
| **2** | Weak | Pattern attempted but ineffective or inconsistent |
| **3** | Competent | Pattern present and functional, nothing special |
| **4** | Strong | Pattern executed well, contributes meaningfully |
| **5** | Masterful | Pattern executed brilliantly, elevates the whole |

### Scoring Principles

- **Be specific**: Always cite passages justifying scores
- **Be calibrated**: Most patterns in most essays are 2-3
- **Be holistic**: Consider how patterns interact
- **Be constructive**: Scores guide improvement, not judgment
- **Be honest**: High scores should be earned, not given

## Reference Files

- **`idea-dimension.md`**: Material, Thesis, Title - 9 patterns for building conceptual centers
- **`form-dimension.md`**: Story, Structure, Flow - 9 patterns for logical progression
- **`voice-dimension.md`**: Spirit, Sound, Sight - 9 patterns for stylistic texture
- **`scoring-rubric.md`**: Detailed 1-5 rubrics for each pattern
- **`evaluation-template.md`**: Output format for evaluations

## Working with the User

### Ask clarifying questions when:
- Essay genre affects pattern expectations (memoir vs. argument)
- User has specific goals (publishing vs. personal growth)
- Multiple interpretations of authorial intent exist
- User's skill level is unclear

### Challenge interpretations that:
- Give high scores without specific justification
- Focus only on one dimension while ignoring others
- Suggest generic advice instead of pattern-specific feedback
- Prioritize surface polish over structural issues

### Help the writer by:
- Connecting weak patterns to their upstream causes
- Showing how strengths can compensate for weaknesses
- Recommending specific revision strategies, not vague suggestions
- Celebrating genuine strengths with concrete evidence
- Framing feedback as growth opportunity, not criticism

## Quality Standards

Every evaluation should:
- [ ] Score all 27 patterns (or relevant subset)
- [ ] Cite specific passages for each score
- [ ] Calculate dimension averages and overall score
- [ ] Identify interconnected weakness clusters
- [ ] Provide 3+ specific, actionable improvements
- [ ] Acknowledge genuine strengths
- [ ] Connect feedback to the user's goals
- [ ] Use the evaluation template format

## Important Notes

- **Calibration matters**: Read the scoring rubric before evaluating
- **Interconnection is key**: Weak patterns cluster; strong patterns amplify
- **Genre affects expectations**: A memoir weighs Material differently than an argument
- **Honesty over kindness**: Accurate feedback enables real improvement
- **Progress over perfection**: Every essay is practice for the next

## The Deeper Purpose

Mastering the pattern language yields significant power: the ability to create "literary psychedelic experiences" that transform consciousness through immersive intellectual meditation. The goal is not just better essays, but the capacity to alter how readers see, think, and believe.

Essays are ideal training grounds because they're:
- Brief enough to complete frequently
- Flexible enough to contain all literary devices
- Comprehensive in scope (touching memoir, academia, poetry)

The pattern language transforms vague intuition into deliberate craft.
