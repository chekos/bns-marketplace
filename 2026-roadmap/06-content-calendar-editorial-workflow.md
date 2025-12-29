# Content Calendar & Editorial Workflow

**Category:** New Feature
**Quarter:** Q2
**T-shirt Size:** L

## Why This Matters

Content operations need planning. Questions like "What are we publishing this week?", "Who's working on what?", and "When does this need to be ready?" currently have no answer in the marketplace. The plugins help create content but provide no framework for managing the content pipeline.

A content calendar transforms the marketplace from a collection of tools into a production system. It enables:
- **Visibility**: See what's coming and what's in progress
- **Coordination**: Avoid conflicts and ensure coverage
- **Accountability**: Track assignments and deadlines
- **Consistency**: Maintain publishing cadence

## Current State

- No content planning capability
- No way to track article status (idea → draft → review → published)
- No assignment mechanism (who's working on what)
- No deadline tracking
- No publishing schedule
- Users manage this externally (Notion, spreadsheets, etc.)

## Proposed Future State

An integrated editorial workflow:

```
/calendar show          # View upcoming content
/calendar plan "topic"  # Add to calendar
/calendar assign #ID    # Assign to agent/person
/calendar status #ID    # Update status

Content Pipeline:
┌──────────┐   ┌──────────┐   ┌──────────┐   ┌──────────┐   ┌──────────┐
│  Idea    │ → │  Draft   │ → │  Review  │ → │  Ready   │ → │ Published│
└──────────┘   └──────────┘   └──────────┘   └──────────┘   └──────────┘
```

Calendar view:
```
Week of Jan 13, 2026
───────────────────────────────────────────────────
Mon │ "DuckDB Tutorial" [DRAFT] @beat-reporter
Tue │ ─
Wed │ "Python 3.14 Features" [REVIEW] @copy-editor
Thu │ "Community Spotlight: María" [READY]
Fri │ Newsletter issue #42 [SCHEDULED]
───────────────────────────────────────────────────
```

## Key Deliverables

- [ ] Design content item schema (id, title, status, assignee, dates)
- [ ] Implement local calendar storage (JSON/YAML file)
- [ ] Create calendar commands:
  - [ ] `/calendar show [week|month]`
  - [ ] `/calendar add "title" --date DATE`
  - [ ] `/calendar status ID --status STATUS`
  - [ ] `/calendar assign ID --to ASSIGNEE`
- [ ] Build status pipeline (idea → draft → review → ready → published)
- [ ] Add due date tracking and reminders
- [ ] Create recurring content support (weekly newsletter)
- [ ] Implement calendar sync with GitHub Issues (optional)
- [ ] Build calendar visualization (ASCII or markdown table)
- [ ] Add content analytics (publishing velocity, completion rates)

## Prerequisites

- Shared state mechanism for calendar data
- Cross-Plugin Orchestration (#03) for assigning to agents

## Risks & Open Questions

- Where does calendar data live? Local file vs. external service?
- How do we sync across multiple users/machines?
- Should this integrate with external calendars (Google, Notion)?
- What granularity for status? 5 stages enough?
- How do we handle missed deadlines?
- Integration with GitHub Projects for the bns-dev use case?

## Notes

- The `tdd-editor/commands/pitch.md` already evaluates content ideas—integrate with calendar
- Consider Substack's scheduled publishing feature as prior art
- The calendar could generate automated "what's coming" social posts
- Start simple with local YAML, add sync later
- Could leverage git for multi-user collaboration on calendar
