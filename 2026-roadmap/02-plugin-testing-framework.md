# Plugin Testing Framework

**Category:** Testing
**Quarter:** Q1
**T-shirt Size:** L

## Why This Matters

The marketplace currently has **zero tests**. No unit tests, no integration tests, no validation of any kind. This means:

- Command syntax errors go undetected until runtime
- YAML frontmatter mistakes break commands silently
- Skill references to non-existent files aren't caught
- Agent tool permissions could be misconfigured
- Breaking changes between plugins have no safety net

For a project aspiring to be the definitive Claude Code plugin marketplace, this is a critical gap. Every professional software project needs tests—and so does this one.

## Current State

- 0 test files across the entire repository
- No CI/CD pipeline to run tests
- No linting for markdown/YAML syntax
- No validation of:
  - Command frontmatter schema
  - Agent configuration
  - Skill file structure
  - Cross-references between files
  - Required fields (description, name, etc.)
- Manual verification is the only quality gate

## Proposed Future State

A comprehensive testing infrastructure that:

1. **Validates all plugins on every commit** via GitHub Actions
2. **Catches structural errors** before they reach users
3. **Enables confident refactoring** with regression detection
4. **Documents expected behavior** through test cases
5. **Provides test utilities** for plugin developers

Test categories:

```
tests/
├── schema/           # JSON schema validation
│   ├── command.schema.json
│   ├── agent.schema.json
│   ├── skill.schema.json
│   └── plugin.schema.json
├── unit/             # Individual component tests
│   ├── test_frontmatter_parsing.py
│   ├── test_argument_substitution.py
│   └── test_tool_permissions.py
├── integration/      # Cross-plugin tests
│   ├── test_skill_references.py
│   └── test_agent_invocations.py
├── smoke/            # End-to-end command execution
│   └── test_commands_load.py
└── fixtures/         # Test data and mocks
```

## Key Deliverables

- [ ] Define JSON schemas for all plugin file types
- [ ] Create schema validation tool (`python -m bns_test validate`)
- [ ] Write unit tests for frontmatter parsing
- [ ] Add integration tests for cross-file references
- [ ] Implement smoke tests that verify commands load correctly
- [ ] Set up GitHub Actions CI pipeline
- [ ] Add pre-commit hooks for local validation
- [ ] Create test fixtures for each plugin type
- [ ] Document testing standards in CONTRIBUTING.md
- [ ] Add coverage reporting

## Prerequisites

None—this is foundational and should be done first.

## Risks & Open Questions

- What testing framework? Python (pytest) seems natural given existing Python code
- Should we test actual Claude Code execution, or just structure validation?
- How do we test commands that require external services (gh CLI, Gemini API)?
- Do we need mock Claude Code runtime?
- Should plugins be able to include their own tests?

## Notes

- The Python scripts in `tdd-design/skills/image-generation/scripts/` would benefit immediately from tests
- Consider property-based testing for schema validation
- Could use markdownlint for consistent markdown formatting
- GitHub Actions provides free CI for public repos
- Look at how other Claude Code plugin projects handle testing (if any exist)
