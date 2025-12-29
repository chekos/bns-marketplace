# Visual Brand System Completion

**Category:** Technical Debt
**Quarter:** Q1
**T-shirt Size:** M

## Why This Matters

The tdd-design plugin contains brand guidelines with placeholder values everywhere: `#XXXXXX` for colors, undefined typography scales, and incomplete asset specifications. For a plugin dedicated to maintaining brand consistency, having an incomplete brand system is a fundamental contradiction.

Completing the brand system ensures:
- **Consistency**: All generated visuals follow the same design language
- **Speed**: Agents can make decisions without asking for colors every time
- **Quality**: Professional output that represents tacosdedatos well
- **Onboarding**: New contributors understand the visual standards

## Current State

From `tdd-design/agents/brand-guardian.md`:
```markdown
- Primary: #XXXXXX
- Secondary: #XXXXXX
- Accent: #XXXXXX
```

Similar placeholders exist in:
- `tdd-design/agents/graphic-designer.md` (lines 73-75)
- `tdd-design/agents/ui-specialist.md` (lines 98-99)
- `tdd-design/agents/brand-guardian.md` (lines 52-68)

Issues:
- No actual color values defined
- Typography scale is generic
- Spacing system is incomplete
- No asset library references
- Image generation prompts can't reference brand colors

## Proposed Future State

A complete, production-ready brand system:

```yaml
# brand-system.yaml
colors:
  primary:
    base: "#1E40AF"      # tacosdedatos blue
    light: "#3B82F6"
    dark: "#1E3A8A"
  accent:
    taco: "#F97316"      # signature orange
    data: "#10B981"      # data green
  neutral:
    text: "#1F2937"
    background: "#F9FAFB"
    border: "#E5E7EB"
  semantic:
    success: "#22C55E"
    warning: "#EAB308"
    error: "#EF4444"

typography:
  fonts:
    heading: "Inter"
    body: "Inter"
    code: "JetBrains Mono"
  scale:
    xs: "0.75rem"    # 12px
    sm: "0.875rem"   # 14px
    base: "1rem"     # 16px
    lg: "1.125rem"   # 18px
    xl: "1.25rem"    # 20px
    2xl: "1.5rem"    # 24px
    3xl: "1.875rem"  # 30px
    4xl: "2.25rem"   # 36px

spacing:
  unit: "4px"
  scale: [0, 1, 2, 3, 4, 5, 6, 8, 10, 12, 16, 20, 24, 32, 40, 48, 64]

assets:
  logo:
    primary: "assets/logo-primary.svg"
    monochrome: "assets/logo-mono.svg"
    icon: "assets/icon.svg"
```

## Key Deliverables

- [ ] Define actual color palette for tacosdedatos
- [ ] Document typography system with font choices
- [ ] Create spacing/sizing scale
- [ ] Replace all #XXXXXX placeholders with real values
- [ ] Create brand-system.yaml as single source of truth
- [ ] Update all agent files to reference the brand system
- [ ] Add logo and icon assets
- [ ] Create color contrast validation (accessibility)
- [ ] Document dark mode variant
- [ ] Add image generation prompt templates with brand colors

## Prerequisites

Decision from tacosdedatos on actual brand identity (colors, fonts, etc.)

## Risks & Open Questions

- Is there an existing tacosdedatos brand guide somewhere?
- Should the brand system support theming (multiple brands)?
- How do we keep brand-system.yaml in sync with agent markdown files?
- Should image generation prompts hard-code colors or reference the system?

## Notes

- The `tdd-design/skills/tacosdedatos-illustrator/SKILL.md` already has some style guidance
- Consider generating CSS variables from the brand system
- Gemini image generation prompts could include color hex codes directly
- This is quick to implement but high-value—do early in Q1
