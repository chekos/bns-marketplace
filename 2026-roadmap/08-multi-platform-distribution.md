# Multi-Platform Distribution

**Category:** Scalability
**Quarter:** Q3
**T-shirt Size:** L

## Why This Matters

Currently, the marketplace only works with Claude Code. But developers use many AI assistants:
- VSCode with GitHub Copilot, Cody, or Continue
- JetBrains IDEs with AI Assistant or Copilot
- Web-based tools like ChatGPT, Gemini
- Open-source options like Ollama with Open WebUI

By limiting to Claude Code, we limit our audience. The commands, agents, and skills in this marketplace are largely portable—they're markdown-based prompts and workflows. Expanding distribution would:
- **Grow the user base** dramatically
- **Reduce Claude Code dependency risk**
- **Enable hybrid workflows** (different tools for different tasks)
- **Increase community contributions**

## Current State

- Claude Code is the only supported platform
- Plugin format is Claude Code-specific
- README mentions Droid/Factory but it's not well-documented
- The `claude-plugins` CLI suggests some abstraction exists
- Core content (markdown prompts) is platform-agnostic

## Proposed Future State

Universal plugin distribution:

```
Platforms Supported:
├── Claude Code (native)
├── VSCode Extension
│   ├── Integrates with Claude, GPT-4, local models
│   └── Commands as VSCode command palette entries
├── JetBrains Plugin
│   ├── AI Assistant integration
│   └── Commands as IDE actions
├── Web Interface
│   ├── Standalone web app
│   └── Works with any model via API
└── CLI Tool
    ├── Platform-agnostic
    └── Works with Ollama, OpenRouter, etc.

Plugin Format:
├── universal-plugin.yaml  # Platform-agnostic definition
├── prompts/              # Portable markdown prompts
├── adapters/
│   ├── claude-code/
│   ├── vscode/
│   ├── jetbrains/
│   └── web/
└── assets/
```

## Key Deliverables

- [ ] Define universal plugin format specification
- [ ] Extract platform-agnostic core from current plugins
- [ ] Create VSCode extension skeleton
- [ ] Build JetBrains plugin skeleton
- [ ] Develop web interface for plugin execution
- [ ] Implement CLI tool with model-agnostic backend
- [ ] Create adapter layer for platform-specific features
- [ ] Write conversion tools (Claude Code → Universal)
- [ ] Document platform-specific limitations
- [ ] Set up multi-platform testing matrix

## Prerequisites

- Plugin Testing Framework (#02) for cross-platform validation
- Clear separation of prompt content from platform mechanics

## Risks & Open Questions

- How do we handle platform-specific features (like Claude's artifacts)?
- Which platforms should we prioritize?
- Maintenance burden of 5+ platforms?
- Should we contribute to existing multi-platform tools instead?
- How do we handle different model capabilities?
- Licensing considerations for different ecosystems?

## Notes

- The "Droid Factory" mentioned in README suggests this direction
- Continue.dev has a similar marketplace for prompts
- Most skill content (e.g., SEO guidelines) is already universal
- Agent definitions need most adaptation (tool permissions vary)
- Consider starting with CLI tool—simplest to build and test
- Web interface could enable non-developer users
