---
name: docs-as-code
description: |
  Load when working on documentation systems, README files, API docs, or
  implementing documentation workflows. Contains best practices for treating
  documentation as code with version control, automation, and CI/CD integration.
---

# Docs-as-Code Skill

## Core Philosophy

> "Documentation should be treated like code: version-controlled, reviewed, tested, and continuously deployed."

Docs-as-Code means writing documentation with the same tools and workflows as software development.

## Fundamental Principles

### 1. Version Control
- Store docs in Git alongside code
- Track changes with meaningful commits
- Use branches for content development
- Review docs via pull requests

### 2. Plain Text Formats
```markdown
# Preferred formats:
- Markdown (.md) - Most common, widely supported
- reStructuredText (.rst) - Python ecosystem standard
- AsciiDoc (.adoc) - Technical documentation

# Avoid:
- Word documents
- Google Docs (for primary source)
- PDFs as source (OK as output)
```

### 3. Automation
- Auto-generate docs from code (docstrings)
- Build and deploy via CI/CD
- Validate links and formatting
- Run spelling and grammar checks

### 4. Single Source of Truth
- One canonical location for each piece of information
- Link to authoritative sources, don't duplicate
- Update in one place, publish to many

## Documentation Hierarchy

Structure documentation from simple to complex:

```
1. Code itself (good naming = self-documenting)
   ↓
2. Inline comments (explain "why")
   ↓
3. Docstrings (API contracts)
   ↓
4. README.md (entry point, quick start)
   ↓
5. docs/ directory (detailed guides)
   ↓
6. External docs site (comprehensive reference)
```

## README.md Template

```markdown
# Project Name

One-sentence description of what this project does.

## Quick Start

```bash
pip install project-name
```

```python
from project import main_function
result = main_function(data)
```

## Installation

### Requirements
- Python 3.10+
- Dependencies listed in `pyproject.toml`

### Install from PyPI
```bash
pip install project-name
# Or with uv (faster)
uv pip install project-name
```

### Install from Source
```bash
git clone https://github.com/org/project.git
cd project
uv sync  # Install dependencies
cd project
pip install -e .
```

## Usage

### Basic Example
[Simple use case with code]

### Advanced Example
[More complex use case]

## Documentation

Full documentation available at: [docs.project.com](https://docs.project.com)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

[MIT](LICENSE)
```

## Docs Directory Structure

```
docs/
├── index.md              # Documentation home
├── getting-started/
│   ├── installation.md
│   ├── quickstart.md
│   └── configuration.md
├── guides/
│   ├── basic-usage.md
│   ├── advanced-topics.md
│   └── best-practices.md
├── reference/
│   ├── api.md            # Auto-generated from docstrings
│   ├── cli.md
│   └── configuration.md
├── tutorials/
│   ├── tutorial-1.md
│   └── tutorial-2.md
├── contributing/
│   ├── development.md
│   ├── testing.md
│   └── releasing.md
└── changelog.md
```

## Documentation Tools

### Python Ecosystem
```yaml
# mkdocs.yml for MkDocs
site_name: Project Name
theme:
  name: material
plugins:
  - search
  - mkdocstrings:
      handlers:
        python:
          selection:
            docstring_style: google
nav:
  - Home: index.md
  - Getting Started: getting-started/
  - API Reference: reference/api.md
```

### Sphinx (Python standard)
```python
# conf.py
extensions = [
    'sphinx.ext.autodoc',
    'sphinx.ext.napoleon',
    'sphinx.ext.viewcode',
]
```

### JavaScript/TypeScript
- TypeDoc for TypeScript
- JSDoc for JavaScript
- Docusaurus for documentation sites

## CI/CD Integration

### GitHub Actions Workflow
```yaml
# .github/workflows/docs.yml
name: Documentation

on:
  push:
    branches: [main]
    paths:
      - 'docs/**'
      - 'src/**/*.py'
  pull_request:
    paths:
      - 'docs/**'

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Setup Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.11'

      - name: Install dependencies
        run: pip install -e ".[docs]"

      - name: Build docs
        run: mkdocs build --strict

      - name: Check links
        run: |
          pip install linkchecker
          linkchecker site/

  deploy:
    needs: build
    if: github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: pip install mkdocs-material
      - run: mkdocs gh-deploy --force
```

## Documentation Maintenance

### When to Update
- **Same commit as code changes**: Documentation stays in sync
- **Before merging**: Block PRs without docs updates for new features
- **Regularly**: Schedule periodic reviews

### When to Delete
Delete documentation that is:
- Demonstrably incorrect
- No longer relevant
- Causing confusion
- Duplicating other sources

> "Fresh, accurate documentation beats extensive outdated materials."

### Freshness Indicators
```markdown
---
last_updated: 2024-01-15
status: current  # or: needs-review, deprecated
applies_to: v2.0+
---
```

## Quality Standards

### Link Validation
```bash
# Check for broken links
linkchecker docs/
# Or use markdown-link-check
find docs -name "*.md" | xargs markdown-link-check
```

### Spell Checking
```yaml
# .github/workflows/spellcheck.yml
- name: Spell check
  uses: rojopolis/spellcheck-github-actions@v0
  with:
    config_path: .spellcheck.yml
```

### Style Checking
```bash
# Vale for prose linting
vale docs/
```

## Changelog Best Practices

### Format (Keep a Changelog)
```markdown
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/),
and this project adheres to [Semantic Versioning](https://semver.org/).

## [Unreleased]

### Added
- New feature description

### Changed
- Change description

### Fixed
- Bug fix description

## [1.0.0] - 2024-01-15

### Added
- Initial release with core functionality
```

## Documentation Review Checklist

- [ ] Accurate and up-to-date
- [ ] Clear and concise
- [ ] Properly formatted
- [ ] Links work
- [ ] Code examples tested
- [ ] Spelling/grammar checked
- [ ] Follows style guide
- [ ] Accessible (alt text, semantic markup)

## Resources

- [Write the Docs - Docs as Code](https://www.writethedocs.org/guide/docs-as-code/)
- [Google Documentation Best Practices](https://google.github.io/styleguide/docguide/best_practices.html)
- [Docs Like Code](https://www.docslikecode.com/) by Anne Gentle
- [Modern Technical Writing](https://www.amazon.com/Modern-Technical-Writing-Introduction-Documentation-ebook/dp/B01A2QL9SS) by Andrew Etter
