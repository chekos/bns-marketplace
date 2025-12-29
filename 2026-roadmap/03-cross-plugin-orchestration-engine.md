# Cross-Plugin Orchestration Engine

**Category:** Architecture
**Quarter:** Q2
**T-shirt Size:** XL

## Why This Matters

Today's plugins are silos. Each plugin has commands, agents, and skills—but they cannot invoke each other. The tdd-editor can't ask tdd-design to generate an image. The tdd-growth can't request tdd-editor to optimize content for SEO while writing. This isolation limits what's possible.

An orchestration engine would allow:
- **Composition**: Build complex workflows from simple plugins
- **Specialization**: Each plugin stays focused on its domain
- **Reuse**: Share capabilities across the ecosystem
- **Evolution**: Add new plugins without modifying existing ones

This is the foundation for the Multi-Agent Content Pipeline (#01) and many other transformative capabilities.

## Current State

- Plugins are completely isolated
- No mechanism for one plugin to call another
- No shared state between plugins
- No way to pass context from one agent to another across plugins
- Users must manually copy/paste outputs between plugins
- Each plugin re-implements common patterns (e.g., web research, file reading)

## Proposed Future State

An orchestration layer that enables:

```yaml
# Example: Design agent requesting SEO analysis
invoke:
  plugin: tdd-growth
  command: seo
  args:
    content: $current_article_draft
  on_complete:
    inject_into: design_context
```

Core capabilities:

1. **Plugin Registry**: Catalog of all installed plugins and their capabilities
2. **Invocation Protocol**: Standard way to call across plugins
3. **Context Passing**: Share state between plugin invocations
4. **Return Handling**: Process outputs from invoked plugins
5. **Dependency Management**: Ensure required plugins are available

## Key Deliverables

- [ ] Design plugin capability manifest format
- [ ] Implement plugin registry service
- [ ] Create invocation protocol specification
- [ ] Build context serialization/deserialization
- [ ] Add cross-plugin invocation to agent tools
- [ ] Implement dependency resolution
- [ ] Create debugging/tracing for cross-plugin calls
- [ ] Document orchestration patterns and best practices
- [ ] Build 3 example orchestrations:
  - [ ] Editor → Designer (request illustration)
  - [ ] Tech → Editor (request copy edit)
  - [ ] Growth → All (content distribution workflow)

## Prerequisites

- Plugin Testing Framework (#02) to validate interactions
- Standardized plugin metadata format

## Risks & Open Questions

- How do we prevent circular dependencies (A calls B calls A)?
- What's the security model for cross-plugin calls?
- How do we handle version mismatches between plugins?
- Should this be synchronous or asynchronous?
- How does this interact with Claude Code's native agent spawning?
- What happens when an invoked plugin fails?
- Performance implications of deep call chains?

## Notes

- The existing `Task` tool provides a model for agent spawning within plugins
- Consider event-based architecture (pub/sub) as alternative to direct invocation
- Look at microservices orchestration patterns (Temporal, Step Functions) for inspiration
- Could leverage MCP for plugin-to-plugin communication
- Start with simple request/response before adding async patterns
