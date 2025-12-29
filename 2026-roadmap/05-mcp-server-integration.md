# MCP Server Integration

**Category:** Integration
**Quarter:** Q2
**T-shirt Size:** L

## Why This Matters

The plugins currently rely on:
- **WebSearch/WebFetch** for research (generic, rate-limited)
- **Bash with gh CLI** for GitHub operations (good)
- **Bash with Python scripts** for image generation (works but fragile)

MCP (Model Context Protocol) servers provide structured, reliable integrations with external services. Instead of scraping websites or parsing CLI output, MCP servers offer clean APIs with proper error handling, authentication, and rate limiting.

For a content operation, MCP servers could provide:
- **Real-time social analytics** instead of manual dashboard checks
- **Direct publishing** to platforms instead of copying text
- **Content management** integration with CMS systems
- **Database access** for subscriber/revenue data

## Current State

- No MCP server usage anywhere in the marketplace
- External integrations are ad-hoc:
  - GitHub: via `gh` CLI (solid)
  - Image gen: via Python scripts calling Gemini API
  - Social media: via WebFetch (limited, no write access)
  - Analytics: manual (users check dashboards)
- No structured way to add new integrations

## Proposed Future State

A suite of MCP servers that enable real integrations:

```
mcp-servers/
├── social/
│   ├── bluesky-mcp/       # Post, read mentions, analytics
│   ├── twitter-mcp/       # Tweet, read metrics
│   ├── linkedin-mcp/      # Post articles, analytics
│   └── instagram-mcp/     # Post images, story analytics
├── publishing/
│   ├── substack-mcp/      # Publish newsletters, stats
│   ├── ghost-mcp/         # Blog publishing
│   └── wordpress-mcp/     # Post creation
├── analytics/
│   ├── plausible-mcp/     # Web analytics
│   └── posthog-mcp/       # Product analytics
└── media/
    └── cloudinary-mcp/    # Image/video management
```

Usage in commands:
```markdown
---
allowed-tools: [mcp__bluesky__post, mcp__substack__publish]
---
```

## Key Deliverables

- [ ] Survey which MCP servers already exist in the ecosystem
- [ ] Identify top 5 integration needs for tacosdedatos
- [ ] Implement or adopt Bluesky MCP server (high priority per growth skills)
- [ ] Implement Substack MCP server (newsletter is core)
- [ ] Create MCP server template for consistent development
- [ ] Document MCP configuration for plugin users
- [ ] Add MCP servers to marketplace installation
- [ ] Create fallback patterns (when MCP unavailable, use web)
- [ ] Build integration tests with mock MCP servers

## Prerequisites

- Claude Code MCP support (already available)
- API keys/OAuth for target platforms

## Risks & Open Questions

- Which MCP servers already exist that we could adopt?
- How do we handle API authentication securely?
- What's the maintenance burden for 10+ MCP servers?
- Should we build or buy/adopt?
- How do we test MCP servers without live API access?
- Rate limiting across plugins using same MCP server?

## Notes

- Bluesky's AT Protocol is well-documented—good first MCP target
- Substack has an unofficial API that could be wrapped
- The `tdd-growth/skills/bluesky-*` files show the platform is prioritized
- Consider community contributions for platform-specific MCP servers
- Security review needed before any write operations go live
