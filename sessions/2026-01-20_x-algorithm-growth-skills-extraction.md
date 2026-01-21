# X Algorithm Analysis & Growth Skills Extraction

**Date:** 2026-01-20
**Objective:** Clone the X/Twitter algorithm repository, extract social media growth insights, and create/update skills in the tdd-growth and tdd-editor plugins with actionable guidelines.

---

## Summary

Successfully analyzed the X/Twitter Phoenix algorithm repository and created 6 new skills plus updated 2 existing skills across the tdd-growth and tdd-editor plugins. Also created a comprehensive 2026 roadmap recommendations document. Final versions: tdd-growth v0.7.0, tdd-editor v0.7.0.

## The Journey

### What Didn't Work
- Initial attempt to create a third skill (`x-algorithm-optimizer`) was rejected by the simplicity reviewer — YAGNI principle applied. Better to update existing skills than create redundant ones.
- SSH agent issues required switching to HTTPS for git push.
- GitHub Projects (classic) deprecation warning on PR edit commands (non-blocking).

### What Worked
- Using `/lfg` workflow to orchestrate the full process: plan → deepen → work → review
- Parallel research agents for deepening the plan
- Simplicity-first approach: update existing skills instead of creating new ones
- Cross-referencing skills between plugins
- Creating an orchestration skill (`tacosdedatos-pipeline`) that chains multiple skills together

## The Solution

### Key Findings

**X Algorithm Insights (January 2026):**

| Signal | Impact |
|--------|--------|
| Video content | 5x engagement vs text (0.42% vs 0.08%) |
| External links (non-Premium) | Zero median engagement penalty |
| Premium in-network boost | 4x visibility |
| Premium out-of-network boost | 2x visibility |
| Author diversity | Repeated author content penalized via exponential decay |
| Replies | 2x value of retweets |
| First 30 min engagement | Critical for distribution |

**Key Algorithm Files Analyzed:**
- `/tmp/x-algorithm/home-mixer/scorers/weighted_scorer.rs` — Engagement weights
- `/tmp/x-algorithm/home-mixer/scorers/author_diversity_scorer.rs` — Echo chamber penalties
- `/tmp/x-algorithm/home-mixer/scorers/oon_scorer.rs` — Out-of-network reach

### Skills Created/Updated

| Skill | Plugin | Type | Purpose |
|-------|--------|------|---------|
| `tweet-crafter` | tdd-growth | Updated | Algorithm signals table, hook formulas, pre-publish checklist |
| `twitter-campaign-planner` | tdd-growth | Updated | Author diversity, OON reach, troubleshooting, shadowban recovery |
| `content-to-social` | tdd-growth | New | Cross-platform distribution (newsletter → X/LinkedIn/Instagram/Bluesky) |
| `trend-monitor` | tdd-growth | New | Scan news sources for content ideas |
| `hook-formulas.md` | tdd-editor | New | Universal hook patterns reference (6 categories) |
| `tacosdedatos-pipeline` | tdd-editor | New | Full production orchestration (5 phases, 4 checkpoints) |
| `content-refresh` | tdd-editor | New | Update old articles, preserve SEO |
| `article-to-newsletter` | tdd-editor | New | Convert articles → newsletter format |

### Key Insights

1. **YAGNI applies to skills** — Don't create new skills when updating existing ones serves the purpose.

2. **Hook formulas are universal** — Same psychological patterns work for tweets, newsletters, and articles.

3. **Pipeline skills are valuable** — Orchestrating multiple skills together (like `tacosdedatos-pipeline`) demonstrates the path to the Autonomous Newsroom vision.

4. **Cross-referencing matters** — Skills should link to related skills for discoverability.

5. **Human checkpoints are essential** — Even autonomous pipelines need human approval at key stages (pitch, draft, final, publish).

## Lessons Learned

1. **Use `/lfg` for complex workflows** — The orchestrated command sequence (plan → deepen → work → review) works well for multi-step tasks.

2. **Read simplicity reviewer feedback** — It correctly identified that 3 skills was over-engineering.

3. **Version bumps accumulate** — Started at 0.4.0/0.5.0, ended at 0.7.0 after multiple additions.

4. **Save recommendations** — Creating `RECOMMENDATIONS-2026-01.md` captured action items that would otherwise be lost in conversation.

5. **SSH issues can be bypassed** — Switch to HTTPS (`git remote set-url origin https://...`) when SSH agent fails.

## Related Resources

### Files Created
- `2026-roadmap/RECOMMENDATIONS-2026-01.md` — Action items and priorities
- `plans/feat-x-algorithm-growth-skills.md` — Original plan document
- All skill files in `tdd-growth/skills/` and `tdd-editor/skills/`

### PR
- https://github.com/chekos/bns-marketplace/pull/3 (merged)

### X Algorithm Repository
- Cloned to `/tmp/x-algorithm`
- Key directories: `home-mixer/scorers/`, `phoenix/`, `candidate-pipeline/`

### Roadmap Initiatives This Aligns With
- Initiative #01: Multi-Agent Content Pipeline
- Initiative #08: Multi-Platform Distribution
- Moonshot: The Autonomous Newsroom

### Remaining Work (from recommendations)
- [ ] Add shared reference files across plugins
- [ ] Start plugin validation tests (Initiative #02)
- [ ] Document skill interconnection patterns
