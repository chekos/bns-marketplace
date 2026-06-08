#!/usr/bin/env bash
# Watch a tunelito comments file and exit (printing its contents) the moment it changes.
# Exiting is the point: when run as a background process, the exit hands control back to
# the agent so it can read the new comments and act. Re-run after each cycle.
#
# Usage:  watch_comments.sh <comments-file> [poll-seconds]
# Example: run in the background ->  watch_comments.sh ./comments.md 3
set -u

f="${1:?usage: watch_comments.sh <comments-file> [poll-seconds]}"
interval="${2:-3}"

# Modification signature: "<mtime>-<size>", portable across macOS (stat -f) and Linux (stat -c).
sig() {
  if [ -f "$f" ]; then
    stat -f '%m-%z' "$f" 2>/dev/null || stat -c '%Y-%s' "$f" 2>/dev/null || echo "exists"
  else
    echo "none"
  fi
}

base="$(sig)"
while :; do
  cur="$(sig)"
  if [ "$cur" != "$base" ] && [ "$cur" != "none" ]; then
    echo "=== comments changed ==="
    cat "$f"
    exit 0
  fi
  sleep "$interval"
done
