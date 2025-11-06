---
allowed-tools: [Bash(gh*), Bash(git*), Read, Edit, Write, Grep, TodoWrite, Task]
description: Systematically resolve all comments and issues in the current PR
---

Resolve all unresolved comments in the current PR systematically.

Focus areas (if specified): #$ARGUMENTS

## Phase 1: Discover All Comments

Use these tested GitHub API patterns to get complete comment data:

```bash
# Get current repo variables
PR_NUM=$(gh pr view --json number | jq -r '.number')
OWNER=$(gh repo view --json owner | jq -r '.owner.login')
REPO=$(gh repo view --json name | jq -r '.name')

# Get code review comments (comments on specific lines)
gh api repos/$OWNER/$REPO/pulls/$PR_NUM/comments | jq '.[] | {id: .id, author: .author.login, body: .body, created_at: .created_at, in_reply_to_id: .in_reply_to_id}'

# Get review summaries
gh api repos/$OWNER/$REPO/pulls/$PR_NUM/reviews | jq '.[] | select(.state == "COMMENTED") | {id: .id, author: .author.login, body: .body, submitted_at: .submitted_at}'

# Get general PR comments
gh pr view --json comments | jq '.comments[] | {id: .id, author: .author.login, body: .body, created_at: .created_at}'
```

## Phase 2: Classify and Prioritize

Classify comments by urgency using this pattern:

```bash
gh api repos/$OWNER/$REPO/pulls/$PR_NUM/comments | jq '.[] | {
  id: .id,
  author: .author.login,
  body: .body,
  type: (if .body | test("(MUST|must|required|critical|blocking|error|fail)"; "i") then "HIGH_PRIORITY"
        elif .body | test("(should|suggest|recommend|consider|maybe|could)"; "i") then "MEDIUM_PRIORITY"
        elif .body | test("(nit|minor|style|typo|optional)"; "i") then "LOW_PRIORITY"
        else "UNKNOWN" end),
  actionable: (.body | test("(fix|change|add|remove|update|modify|implement|create|delete)"; "i"))
}'
```

Filter for unresolved comments:

```bash
gh api repos/$OWNER/$REPO/pulls/$PR_NUM/comments | jq '.[] | select(.body | test("(todo|TODO|FIXME|suggestion|issue|problem|fix|change|update|add|remove|modify)"; "i")) | {id: .id, body: .body, author: .author.login}'
```

## Phase 3: Plan Resolution

Using TodoWrite, create a resolution plan prioritized by urgency (HIGH → MEDIUM → LOW).

### Consider Parallel Processing

Use parallel resolution when:
- Multiple comments exist in different files
- Comments request independent changes
- No comment explicitly depends on another's resolution
- You need to resolve many comments quickly

If using parallel approach:

```bash
# Get actionable comments with file locations
gh api repos/$OWNER/$REPO/pulls/$PR_NUM/comments | jq '.[] | select(.body | test("(suggestion|todo|fix|change|update|add|remove|modify|issue)"; "i")) | {
  id: .id,
  file: .path,
  line: .line,
  body: .body,
  author: .author.login,
  created_at: .created_at,
  action_required: true
}' > unresolved_comments.json

# Group by file for parallel processing
jq 'group_by(.file) | map({file: .[0].file, comments: map({id, line, body, author})})' unresolved_comments.json
```

You can then spawn parallel tasks (using Task tool) for independent file groups.

## Phase 4: Implement Solutions

Work through your TodoWrite list:
- Mark each as `in_progress` before starting
- Make code changes using Edit/Write
- Mark as `completed` when done

## Phase 5: Quality Assurance

Before committing, verify quality:

```bash
# Run project linter (adjust for your project)
bundle exec standardrb  # Ruby/Rails
# or: npm run lint      # Node.js
# or: black .           # Python

# Run project tests (adjust for your project)
bin/rails test          # Rails
# or: npm test          # Node.js
# or: pytest            # Python

# Verify CI status
gh pr checks

# Check merge readiness
gh pr view --json mergeable | jq '.mergeable'
```

## Phase 6: Commit and Verify

Commit changes:

```bash
git add .
git commit -m "Address PR review comments

- Fixed [issue 1]
- Updated [issue 2]
- Clarified [issue 3]"

git push
```

Verify all comments addressed:

```bash
gh api repos/$OWNER/$REPO/pulls/$PR_NUM/comments | jq '.[] | {id: .id, body: .body | split("\n")[0], status: "NEEDS_VERIFICATION"}'
```
