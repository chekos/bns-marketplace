# Internationalization Framework

**Category:** Scalability
**Quarter:** Q4
**T-shirt Size:** M

## Why This Matters

The marketplace serves two audiences with different language needs:
- **bns-dev**: English-speaking developers worldwide
- **tdd-* plugins**: Spanish-speaking tacosdedatos audience (Mexico, Spain, Argentina, etc.)

Currently, content is hardcoded in one language per plugin. This limits:
- **Reach**: Can't serve both audiences with same plugin
- **Consistency**: Spanish skills can't be easily adapted for English users
- **Community**: Non-Spanish speakers can't contribute to tdd-* plugins
- **Growth**: The tdd-growth skills for SEO vary by language but aren't structured for it

An i18n framework would make the marketplace truly global.

## Current State

- bns-dev commands: English
- tdd-* plugins: Mix of English (technical terms) and Spanish (user-facing)
- No i18n infrastructure
- Templates hardcode Spanish phrases:
  ```
  "¡Hola [Nombre]! Aquí está todo lo que necesitas saber."
  ```
- Spanish SEO notes embedded in skills but not structured:
  ```markdown
  ### Spanish SEO Notes
  - Regional keyword variations to consider: [list]
  ```

## Proposed Future State

Structured internationalization across all plugins:

```
Plugin Structure:
├── commands/
│   └── seo.md                    # Base command (language-agnostic)
├── i18n/
│   ├── en/
│   │   ├── strings.yaml          # English strings
│   │   └── examples.yaml         # English examples
│   ├── es/
│   │   ├── strings.yaml          # Spanish strings
│   │   └── examples.yaml         # Spanish examples
│   └── es-MX/                    # Mexican Spanish variant
│       └── examples.yaml
└── skills/
    └── seo-guidelines/
        └── SKILL.md              # References i18n strings
```

Usage in commands:
```markdown
# Welcome message uses user's language preference
{{i18n.welcome_message}}

# Examples adapt to regional context
{{i18n.example.greeting}}
```

Language detection and switching:
```bash
/config language es-MX    # Set preferred language
/seo --lang en            # Override for single command
```

## Key Deliverables

- [ ] Design i18n string format (YAML with interpolation)
- [ ] Create string extraction tooling
- [ ] Implement language preference detection
- [ ] Build string substitution engine
- [ ] Extract English strings from bns-dev
- [ ] Extract Spanish strings from tdd-* plugins
- [ ] Create translation contribution guidelines
- [ ] Add language switching command/config
- [ ] Implement regional variants support (es-MX, es-ES, es-AR)
- [ ] Create translation status dashboard
- [ ] Document translation workflow

## Prerequisites

- Cross-Plugin Orchestration (#03) for centralized config
- Template Marketplace (#09) for community translations

## Risks & Open Questions

- How do we handle mixed-language technical content (code in English, explanations in Spanish)?
- Should translations be community-contributed or professional?
- How do we keep translations in sync with English base?
- What's the fallback when a translation is missing?
- Regional variants: how granular should we go?
- How does i18n interact with AI-generated content?

## Notes

- The tdd-growth skills already have regional considerations (LATAM, Spain)
- Consider Crowdin or similar for community translations
- SEO keywords are language-specific—already partially handled
- Start with bns-dev (smaller) before tackling tdd-* suite
- Machine translation could bootstrap, human review for quality
- Anthropic's Claude speaks Spanish well—could assist with translations
