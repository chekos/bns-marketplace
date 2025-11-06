# Claude Code PR Comment Resolution System Prompt

You are using Claude Code to systematically resolve all comments, to-dos, and issues in a pull request. Claude Code operates directly in your terminal, understands context, maintains awareness of your entire project structure, and takes action by performing real operations like editing files and creating commits.

## Context Awareness

Claude Code automatically understands the current git branch and PR context. You don't need to specify which PR you're working on - Claude Code will:

- Detect the current branch
- Understand associated PR context
- See all PR comments and review threads automatically

## Workflow Approach

Follow the research/plan/implement pattern that significantly improves performance for problems requiring deeper thinking:

### Phase 1: Research & Analysis

```
Please analyze this PR and all its comments comprehensively. Look for:
1. All unresolved review comments and conversations
2. To-do items mentioned in comments
3. Requested changes from code reviews
4. Questions that need responses

Use the GitHub API systematically to get complete data about all comment types.
```

### Phase 2: Planning

```
Based on your analysis, create a detailed plan to address all unresolved items.
Group them by type (code changes, documentation, responses to questions).
Prioritize based on importance and dependencies.
Use TodoWrite tool to track progress systematically.
```

### Phase 3: Implementation

```
Now implement the solutions for each item in the plan:
- Make the requested code changes
- Update documentation as needed
- Prepare responses to questions
- Ensure all changes maintain code quality and pass tests
- Mark each todo as completed when finished
```

### Phase 4: Resolution & Verification

```
After addressing all items:
1. Run linting and tests to verify everything works
2. Create a summary of all changes made
3. Commit the changes with a clear message
4. Verify all review comments have been addressed
```

## Correct GitHub API Commands for Comment Retrieval

The key is to use the right API endpoints that actually work. Here are the tested, working commands:

### 1. Get Current PR Number and Basic Info

```bash
# Get current PR details
gh pr status

# View PR with all comments (readable format)
gh pr view --comments
```

### 2. Get All Review Comments (Code-Level Comments)

```bash
# Get review comments (comments on specific lines of code)
gh api repos/{owner}/{repo}/pulls/{pr_number}/comments | jq '.[] | {id: .id, author: .author.login, body: .body, created_at: .created_at, in_reply_to_id: .in_reply_to_id}'

# For current repo, use variables:
gh api repos/$(gh repo view --json owner,name | jq -r '.owner.login')/$(gh repo view --json owner,name | jq -r '.name')/pulls/$(gh pr view --json number | jq -r '.number')/comments
```

### 3. Get All Review Summaries

```bash
# Get review summaries (approve/request changes/comment)
gh api repos/{owner}/{repo}/pulls/{pr_number}/reviews | jq '.[] | select(.state == "COMMENTED") | {id: .id, author: .author.login, body: .body, submitted_at: .submitted_at}'
```

### 4. Get Issue Comments (General PR Comments)

```bash
# Get general PR discussion comments
gh pr view --json comments | jq '.comments[] | {id: .id, author: .author.login, body: .body, created_at: .created_at}'
```

### 5. Filter for Unresolved Comments Based on Content Analysis

Since GitHub doesn't have a "resolved" status for individual comments, you need to analyze content:

```bash
# Look for comments that indicate unresolved issues
gh api repos/{owner}/{repo}/pulls/{pr_number}/comments | jq '.[] | select(.body | test("(todo|TODO|FIXME|suggestion|issue|problem|fix|change|update|add|remove|modify)"; "i")) | {id: .id, body: .body, author: .author.login}'
```

### 6. Advanced: Check for Comments Without Follow-up Responses

```bash
# Get all comments and check which ones don't have replies
gh api repos/{owner}/{repo}/pulls/{pr_number}/comments | jq 'group_by(.in_reply_to_id // .id) | map(select(length == 1 and .[0].in_reply_to_id == null)) | flatten | .[] | {id: .id, body: .body, needs_response: true}'
```

## Practical Comment Resolution Workflow

### Step 1: Comprehensive Comment Discovery

```bash
# Run all these in parallel for complete picture:
gh pr view --comments  # Human-readable overview
gh api repos/$(gh repo view --json owner,name | jq -r '.owner.login')/$(gh repo view --json owner,name | jq -r '.name')/pulls/$(gh pr view --json number | jq -r '.number')/comments | jq '.[] | {id: .id, author: .author.login, body: .body, created_at: .created_at, in_reply_to_id: .in_reply_to_id}'
gh api repos/$(gh repo view --json owner,name | jq -r '.owner.login')/$(gh repo view --json owner,name | jq -r '.name')/pulls/$(gh pr view --json number | jq -r '.number')/reviews | jq '.[] | select(.state == "COMMENTED") | {id: .id, author: .author.login, body: .body, submitted_at: .submitted_at}'
```

### Step 2: Intelligent Comment Classification

```bash
# Classify comments by urgency and type
gh api repos/$(gh repo view --json owner,name | jq -r '.owner.login')/$(gh repo view --json owner,name | jq -r '.name')/pulls/$(gh pr view --json number | jq -r '.number')/comments | jq '.[] | {
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

### Step 3: Smart Resolution Tracking

```bash
# Create a resolution checklist based on comment content
gh api repos/$(gh repo view --json owner,name | jq -r '.owner.login')/$(gh repo view --json owner,name | jq -r '.name')/pulls/$(gh pr view --json number | jq -r '.number')/comments | jq -r '.[] | select(.body | test("(todo|TODO|FIXME|suggestion|issue|problem|fix|change|update|add|remove|modify)"; "i")) | "- [ ] Comment \(.id) by \(.author.login): \(.body | split("\n")[0] | .[0:100])..."'
```

## Parallel Processing for Comment Resolution

Claude Code can coordinate multiple sub-agents to fix different unresolved comments simultaneously, dramatically speeding up PR resolution.

### When to Use Parallel Sub-Agents

Analyze the unresolved comments and use parallel processing when:

- Multiple comments exist in different files
- Comments request independent changes
- No comment explicitly depends on another's resolution
- You need to resolve many comments quickly

### Advanced Parallel Resolution Pattern

```bash
# 1. First, get comprehensive comment analysis
echo "=== UNRESOLVED PR COMMENTS ANALYSIS ==="
PR_NUM=$(gh pr view --json number | jq -r '.number')
OWNER=$(gh repo view --json owner | jq -r '.owner.login')
REPO=$(gh repo view --json name | jq -r '.name')

# 2. Get all actionable comments with location context
gh api repos/$OWNER/$REPO/pulls/$PR_NUM/comments | jq '.[] | select(.body | test("(suggestion|todo|fix|change|update|add|remove|modify|issue)"; "i")) | {
  id: .id,
  file: .path,
  line: .line,
  body: .body,
  author: .author.login,
  created_at: .created_at,
  action_required: true
}' > unresolved_comments.json

# 3. Group by file for parallel processing
jq 'group_by(.file) | map({file: .[0].file, comments: map({id, line, body, author})})' unresolved_comments.json

# 4. Create parallel work plan
echo "=== PARALLEL RESOLUTION PLAN ==="
jq -r '.[] | "File: \(.file)\nComments: \(.comments | length)\nActions: \(.comments | map(.body | split("\n")[0]) | join("; "))\n"' unresolved_comments.json
```

### Parallel Sub-Agent Spawning Pattern

```
You: These comments look independent. Let's resolve them in parallel.

Claude: Analyzing unresolved comments...
Found 8 actionable comments across 4 files:

**Parallel Resolution Plan:**
- Sub-Agent 1: `app/models/chat.rb` (2 comments)
  - Remove undefined tools from available_tools
  - Fix feature flag check
- Sub-Agent 2: `app/tools/search_emails.rb` (3 comments)
  - Fix N+1 query with preloading
  - Remove TODO comment
  - Add caching strategy
- Sub-Agent 3: `test/` files (2 comments)
  - Fix test hygiene issues
  - Update test patterns
- Sub-Agent 4: `app/tools/concerns/` (1 comment)
  - Consider EmailFormatter location

Spawning 4 parallel sub-agents...
[Each agent works independently on their assigned files]
```

## Quality Assurance & Verification

### Before Committing Changes

```bash
# 1. Verify all tests pass
bundle exec standardrb  # or your linter
bin/rails test          # or your test command

# 2. Check that all comments have been addressed
echo "=== VERIFICATION: Checking comment resolution ==="
gh api repos/$OWNER/$REPO/pulls/$PR_NUM/comments | jq '.[] | {id: .id, body: .body | split("\n")[0], status: "NEEDS_VERIFICATION"}'

# 3. Create resolution summary
echo "=== RESOLUTION SUMMARY ==="
git log --oneline -n 5  # Show recent commits
git diff --stat HEAD~1  # Show what changed
```

### Post-Resolution Validation

```bash
# Verify the PR is ready for merge
gh pr checks            # Check CI status
gh pr view --json mergeable | jq '.mergeable'  # Check merge status
```

## Custom Slash Commands

For repeated workflows, store these improved templates:

### Enhanced Sequential Resolution

`.claude/commands/resolve-pr-comments.md`:

```markdown
Please resolve all comments and issues in the current PR systematically:

**Phase 1: Discovery**

1. Use the correct GitHub API endpoints to gather ALL comments
2. Classify comments by priority and actionability
3. Create a TodoWrite plan for systematic resolution

**Phase 2: Implementation**  
4. Work through each comment systematically 5. Make code changes, run tests, verify fixes 6. Mark todos as completed when finished

**Phase 3: Verification** 7. Run full linting and test suite 8. Verify all comments have been addressed 9. Commit with descriptive message 10. Provide comprehensive resolution summary

**Focus Areas:** $ARGUMENTS
```

### Parallel Resolution Command

`.claude/commands/parallel-resolve.md`:

```markdown
Analyze and resolve PR comments in parallel:

1. **Discovery**: Get all actionable comments with file grouping
2. **Planning**: Create parallel work assignments by file/area
3. **Execution**: Spawn sub-agents for independent comment groups
4. **Coordination**: Monitor progress and handle dependencies
5. **Integration**: Merge all changes and verify compatibility
6. **Quality**: Run comprehensive tests and validation

Target: Resolve $ARGUMENTS comments in parallel
```

This enhanced approach provides robust, tested methods for finding and resolving ALL types of PR comments efficiently.
