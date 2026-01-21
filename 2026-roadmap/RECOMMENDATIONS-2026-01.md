# Roadmap Recommendations - January 2026

Generated from X algorithm analysis session and roadmap review.

## Context

After analyzing the X/Twitter algorithm repository and updating tdd-growth skills, I reviewed the 2026 roadmap and identified opportunities to accelerate the Autonomous Newsroom vision.

## What Was Built This Session

| Plugin | Addition | Purpose |
|--------|----------|---------|
| **tdd-growth** | `tweet-crafter` updates | January 2026 algorithm signals, hook formulas |
| **tdd-growth** | `twitter-campaign-planner` updates | Author diversity, OON reach, troubleshooting |
| **tdd-growth** | `content-to-social` skill | Cross-platform distribution pipeline |
| **tdd-editor** | `hook-formulas.md` reference | Universal hook patterns for all content |

## Quick Wins (Do Now)

These can be done without major architectural changes:

### 1. Cross-Reference Skills Between Plugins
Skills should link to each other. Example from `content-to-social`:
```markdown
## Related Skills
- `tweet-crafter` — X/Twitter optimization
- `linkedin-post-crafter` — LinkedIn optimization
```

**Status:** Started in this session.

### 2. Shared Reference Files
Create `/agents/shared/` folder for content used across plugins:
- `tacosdedatos-voice.md` — Voice guidelines (used by editor, writer, social)
- `engagement-benchmarks.md` — KPIs across platforms
- `content-pillars.md` — Topic categories and percentages

### 3. Consistent Version Bumping
Create a script or skill to bump versions across all plugins:
```bash
# Example: bump-versions.sh
for plugin in tdd-*; do
  # Update plugin.json version
done
```

### 4. Skill Discovery Command
A `/skills` command that lists all available skills across plugins with descriptions.

## Next High-Value Skills

### Priority 1: `tacosdedatos-pipeline`
**Plugin:** tdd-editor (or new tdd-pipeline)
**Purpose:** Orchestrate the full content production workflow

```
Idea → Pitch → Draft → Edit → Design → SEO → Social → Publish
```

**Status:** Building now.

### Priority 2: `trend-monitor`
**Plugin:** tdd-growth or tdd-editor
**Purpose:** Scan data science news sources for content ideas

Sources to monitor:
- Reddit: r/datascience, r/Python, r/MachineLearning
- Hacker News: data/ML tags
- X/Twitter: data science accounts
- arXiv: new papers in relevant categories

Output: Daily/weekly pitch candidates with relevance scores.

### Priority 3: `content-refresh`
**Plugin:** tdd-editor
**Purpose:** Update old articles with new information

Workflow:
1. Identify articles older than 6 months
2. Check if topic has new developments
3. Generate update recommendations
4. Create refresh draft
5. Update SEO and republish

### Priority 4: `article-to-newsletter`
**Plugin:** tdd-editor
**Purpose:** Convert standalone blog posts to newsletter format

Adds:
- Personal intro
- tacosdedatos voice
- CTA and community invitation
- Cross-references to past content

## Foundation Work (Q1 Priority)

### Initiative #02: Plugin Testing Framework

Start simple:
1. **YAML validation** — All plugin.json and SKILL.md frontmatter valid
2. **Link checking** — All referenced files exist
3. **Skill coverage** — Every skill has required sections
4. **Cross-reference validation** — Links between skills resolve

Implementation approach:
```bash
# tests/validate-plugins.sh
for skill in */skills/*/SKILL.md; do
  # Check YAML frontmatter
  # Check required sections
  # Validate references
done
```

### Initiative #03: Cross-Plugin Orchestration

The `tacosdedatos-pipeline` skill is a proof-of-concept for this. Key patterns:
- Skills reference other skills by path
- Output format standardization
- Checkpoint system for human review

## Moonshot Phases

### Phase 1: Skill Interconnection (Now - Q1)
- Skills reference each other ✓
- Shared reference files
- Pipeline skills that orchestrate others

### Phase 2: Testing + Orchestration (Q1-Q2)
- Automated validation
- Orchestration engine that invokes skills
- Progress tracking across pipeline

### Phase 3: Real Integrations (Q2-Q3)
- MCP servers for platform APIs
- Buffer/Hootsuite for scheduling
- Analytics feedback loop

### Phase 4: Autonomous Operation (Q3-Q4)
- Trend monitoring triggers pipelines
- Human checkpoints at key stages
- Learning from performance data

## Metrics to Track

| Metric | Current | Q2 Target | Q4 Target |
|--------|---------|-----------|-----------|
| Skills with cross-references | ~5% | 50% | 90% |
| Automated test coverage | 0% | 40% | 80% |
| Pipeline skills | 1 | 3 | 5 |
| Human hours per article | 6-8 | 4-5 | 1-2 |
| Platforms auto-distributed to | 0 | 2 | 5 |

## Next Actions

1. [x] Create `content-to-social` skill
2. [x] Add hook formulas to tdd-editor
3. [ ] Create `tacosdedatos-pipeline` skill
4. [ ] Add shared reference files
5. [ ] Start plugin validation tests
6. [ ] Create `trend-monitor` skill
7. [ ] Document skill interconnection patterns

---

*Generated: January 2026*
*Session: X algorithm analysis + roadmap review*
