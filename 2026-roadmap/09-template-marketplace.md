# Template Marketplace

**Category:** New Feature
**Quarter:** Q3
**T-shirt Size:** M

## Why This Matters

The marketplace currently has one owner (chekos) and a fixed set of plugins. But the real power of plugin systems comes from community contributions. Think:
- npm for Node.js
- Homebrew for macOS
- VSCode extensions

A template marketplace would enable:
- **Community growth**: Others can contribute plugins
- **Specialization**: Niche use cases get covered
- **Quality improvement**: Competition raises the bar
- **Discovery**: Users find plugins they didn't know they needed

Beyond full plugins, a marketplace for smaller units (individual skills, agents, commands) would lower the barrier to contribution.

## Current State

- Single marketplace with 7 plugins
- All plugins by one author (chekos)
- No contribution mechanism beyond PRs to this repo
- No discovery beyond reading README
- No ratings, reviews, or usage data
- Skills are duplicated across plugins (e.g., image-prompt-writer)

## Proposed Future State

A community-driven template ecosystem:

```
marketplace.claude-plugins.dev
├── Plugins
│   ├── Featured
│   │   ├── bns-dev (★★★★★ 4.8, 2.3K users)
│   │   └── tdd-suite (★★★★☆ 4.2, 890 users)
│   ├── Categories
│   │   ├── Development (34)
│   │   ├── Content & Writing (28)
│   │   ├── Design (15)
│   │   └── Analytics (12)
│   └── New & Updated
│       └── ...
├── Skills
│   ├── seo-optimizer (standalone)
│   ├── fact-checker (standalone)
│   └── ...
├── Agents
│   ├── code-reviewer
│   └── ...
└── Templates
    ├── React PR Review
    ├── Newsletter Issue
    └── ...
```

Discovery features:
- Search by keyword, category, language
- Sort by popularity, rating, recency
- Filter by compatibility (Claude Code version, tools needed)
- Preview skills/commands before installing

## Key Deliverables

- [ ] Design contribution guidelines (CONTRIBUTING.md)
- [ ] Create plugin/skill/agent submission process
- [ ] Build marketplace website (static site with search)
- [ ] Implement plugin validation and security review
- [ ] Add versioning and dependency management
- [ ] Create ratings and reviews system
- [ ] Build usage statistics collection
- [ ] Enable one-click installation from web
- [ ] Develop quality badges (verified, popular, etc.)
- [ ] Create author profiles and reputation system
- [ ] Document monetization options (premium plugins?)

## Prerequisites

- Plugin Testing Framework (#02) for automated validation
- Plugin Analytics (#07) for usage data

## Risks & Open Questions

- Who moderates submissions? Quality control process?
- How do we prevent malicious plugins?
- Should there be paid/premium plugins?
- How do we handle plugin dependencies?
- What's the namespace strategy (avoid collisions)?
- How do we handle abandoned plugins?

## Notes

- Start simple: curated list of community plugins in AWESOME.md
- GitHub Topics could provide basic categorization
- Consider adopting existing package registry patterns
- Security is critical—plugins run with high privileges
- Could start with "recipes" (workflows using existing plugins)
