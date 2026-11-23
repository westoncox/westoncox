#!/usr/bin/env bash
# Stop: before Claude finishes, (1) scan changed files for private homelab details
# (this repo is PUBLIC) and (2) run `npm run check` (astro check + build).
# On failure, exit 2 so Claude fixes it first.
set -u
input=$(cat)
[ "$(printf '%s' "$input" | jq -r '.stop_hook_active // false')" = "true" ] && exit 0
cd "${CLAUDE_PROJECT_DIR:-.}" || exit 0

# Changed + untracked files, excluding this script (it contains the patterns).
changed=$( { git diff --name-only HEAD 2>/dev/null; git ls-files --others --exclude-standard 2>/dev/null; } |
  sort -u | grep -v '^\.claude/hooks/check\.sh$' || true)
[ -z "$changed" ] && exit 0

# Private IPv4 ranges, internal hostnames, and the private homelab repo's name.
private='(^|[^0-9])(10\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}|192\.168\.[0-9]{1,3}\.[0-9]{1,3}|172\.(1[6-9]|2[0-9]|3[01])\.[0-9]{1,3}\.[0-9]{1,3})|\.lab\.westoncox\.com|home\.westoncox\.com|fam''lab'
hits=$(printf '%s\n' "$changed" | while IFS= read -r f; do
  [ -f "$f" ] && grep -EnH "$private" "$f" 2>/dev/null
done)
if [ -n "$hits" ]; then
  echo "Private homelab details in a PUBLIC repo — remove them before finishing:" >&2
  printf '%s\n' "$hits" | head -n 20 >&2
  exit 2
fi

if ! out=$(npm run --silent check 2>&1); then
  echo "npm run check failed — fix before finishing:" >&2
  printf '%s\n' "$out" | tail -n 40 >&2
  exit 2
fi
exit 0
