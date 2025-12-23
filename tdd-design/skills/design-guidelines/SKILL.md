---
name: design-guidelines
description: Load tacosdedatos brand guidelines and visual standards. Use this skill when you need to reference brand colors, typography, visual identity, or design system documentation. Points to the authoritative source documents in agents/shared/.
---

# Design Guidelines

Reference loader for tacosdedatos brand and visual standards.

---

## Primary Reference Documents

All authoritative design documentation lives in `agents/shared/`:

### Illustration Style Guide

**`agents/shared/illustration-style-guide.md`**

The comprehensive guide for all AI-generated illustrations. Contains:
- Color palette with hex codes
- 7 illustration style modes
- Prompt templates for each mode
- Negative prompts
- Human figure guidelines
- Brand mascot (El Taco) documentation
- Quality checklist
- Example gallery reference

**Use for**: Creating post banners, validating illustrations, writing prompts

### Published Examples

**`agents/shared/example-post-banners/`**

14 published post banners that demonstrate the visual style in practice. Reference these to understand what successful tacosdedatos illustrations look like.

### Voice & Brand Analysis

| Document | Contents |
|----------|----------|
| `00-voice-analysis.md` | Writing voice, tone, personality |
| `01-structure-analysis.md` | Content structure patterns |
| `02-content-pattern-analysis.md` | Content types and patterns |
| `03-style-analysis.md` | Writing style, signature phrases |
| `04-engagement-analysis.md` | Engagement techniques |
| `brand-voice.md` | Brand voice summary |
| `editorial-guidelines.md` | Editorial standards |

---

## Quick Reference: Color Palette

### Primary Colors

| Color | Hex | Usage |
|-------|-----|-------|
| Negro Mezquite | `#121212` | Primary dark background |
| Teal Oscuro | `#1a2e35` | Alternative dark background |
| Naranja Cálido | `#D4812A` | Warm background variant |
| Crema Nevada | `#F1FAEE` | Primary light, text, lines, cards |

### Accent Colors

| Color | Hex | Usage |
|-------|-----|-------|
| Rojo Fuego | `#E63946` | High-contrast warm accent |
| Azul Niebla | `#A8DADC` | Cool accent, teal family |
| Naranja Cempasúchil | `#F4A261` | Warm accent |
| Verde Maguey | `#4E937A` | Nature, growth themes |

### Extended Palette (Data Visualization)

| Color | Hex |
|-------|-----|
| Morado Bugambilia | `#8E3A59` |
| Gris Basalto | `#4D4D4D` |

---

## Quick Reference: Illustration Modes

| Mode | Best For |
|------|----------|
| **Abstract/Geometric** | Technical, conceptual, architecture |
| **Paper-Cut/Layered** | Evolution, progression, before/after |
| **Surrealist/Evocative** | Reflective, philosophical, emotional |
| **Nature + Tech Fusion** | Growth, learning, organic processes |
| **Atmospheric/Cinematic** | Personal narratives, journeys |
| **Playful Cartoon** | Tutorials, how-tos, team content |
| **Data Dashboard** | Analytics, data analysis |

---

## Quick Reference: Do's and Don'ts

### Do

- Use colors from the defined palette
- Include subtle grain/risograph texture
- Create clear visual metaphors
- Leave generous negative space
- Use landscape aspect ratios (16:9, 3:2)
- Stylize human figures appropriately

### Don't

- Use photorealistic imagery
- Include embedded text or labels
- Use stock illustration style
- Overcrowd compositions
- Use bright/neon colors outside palette
- Create generic corporate visuals

---

## Related Skills

| Skill | Purpose |
|-------|---------|
| **tacosdedatos-illustrator** | End-to-end illustration creation |
| **image-prompt-writer** | Craft optimized generation prompts |
| **image-validator** | Quality check illustrations |
| **gemini-imagegen** | Low-level Gemini API usage |

---

## Asset Specifications

### Post Banners

- **Aspect ratio**: 16:9 or 3:2 (landscape)
- **Resolution**: 2K recommended
- **Format**: JPG (Gemini default) or PNG
- **Style**: One of the 7 defined modes

### Social Media

| Platform | Dimensions |
|----------|-----------|
| Twitter/X | 1200x675 |
| Instagram | 1080x1080 |
| LinkedIn | 1200x627 |
| Open Graph | 1200x630 |

---

## Loading Guidelines

When you need detailed information, read the full source documents:

```
Read: agents/shared/illustration-style-guide.md
```

This skill provides quick reference. The source documents are authoritative.
