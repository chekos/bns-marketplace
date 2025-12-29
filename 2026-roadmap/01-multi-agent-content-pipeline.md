# Multi-Agent Content Pipeline

**Category:** Architecture
**Quarter:** Q1-Q2
**T-shirt Size:** XL

## Why This Matters

The bns-marketplace has assembled a complete "virtual newsroom" across 7 plugins: writers (tdd-editor), designers (tdd-design), SEO specialists (tdd-growth), technical reviewers (tdd-tech), community managers (tdd-community), and revenue strategists (tdd-revenue). But today, these plugins operate in complete isolation. A user must manually invoke each one, copy outputs between them, and coordinate the workflow themselves.

Connecting these plugins into an integrated content pipeline would be transformative. Imagine: describe an article idea once, and watch as agents research, draft, fact-check, edit, design visuals, optimize for SEO, craft social posts, and schedule publication—all orchestrated automatically. This turns a fragmented toolkit into an autonomous content operation.

## Current State

- 7 plugins with 22 commands, 25 agents, and 41 skills
- Each plugin works independently with no awareness of others
- Users must manually:
  - Invoke `/pitch` to evaluate an idea
  - Then invoke `/tutorial` or equivalent to draft
  - Then invoke fact-checker agent
  - Then invoke design commands
  - Then invoke SEO analysis
  - Then invoke social media crafters
- No shared state, no handoffs, no workflow memory

## Proposed Future State

A unified content production system where:

```
User: "Write an article about using DuckDB for local data analysis"

Pipeline:
├─ tdd-editor: Evaluates pitch, assigns to beat-reporter agent
├─ tdd-tech: Researches DuckDB, drafts tutorial outline
├─ tdd-editor: Copy-editor refines, fact-checker verifies
├─ tdd-design: Generates header image, diagrams
├─ tdd-growth: Optimizes SEO, crafts social posts for 5 platforms
├─ tdd-revenue: Identifies sponsorship opportunities
└─ Output: Complete article package ready for publication
```

Key capabilities:
- **Workflow definitions**: YAML/JSON files that define multi-step pipelines
- **Handoff protocol**: Standardized way for agents to pass context
- **Progress tracking**: TodoWrite-like visibility across the whole pipeline
- **Checkpoint/resume**: Ability to pause, review, and continue
- **Parallel execution**: Independent steps run concurrently

## Key Deliverables

- [ ] Design workflow definition schema (YAML format)
- [ ] Implement inter-plugin communication protocol
- [ ] Create orchestration engine that invokes plugins in sequence
- [ ] Build shared context/state management
- [ ] Add pipeline visualization (mermaid diagrams in real-time)
- [ ] Develop 3 reference pipelines:
  - [ ] Full article production (research → publish)
  - [ ] Content refresh (existing → updated + new social)
  - [ ] Event coverage (announce → live → recap)
- [ ] Implement checkpoint/resume functionality
- [ ] Add rollback capability for failed steps

## Prerequisites

- Cross-plugin shared state mechanism (see initiative #03)
- Standardized output formats across all plugins
- Agent capability registry (what can each agent do?)

## Risks & Open Questions

- How do we handle failures mid-pipeline? Full rollback or partial?
- Should pipelines be synchronous (wait for each step) or async (parallel where possible)?
- How do we expose pipeline progress to users in Claude Code's UI?
- What's the right granularity for workflow steps?
- Should we support conditional branching (if fact-check fails → different path)?

## Notes

- The `Task` tool with sub-agents already demonstrates multi-agent coordination within a single plugin (see `bns-dev/commands/resolve-pr-comments.md`)
- The `tacosdedatos` use case is perfect for this: a small team (possibly one person) running a full publication operation
- Consider integration with existing CI/CD patterns—pipelines could trigger on git events
