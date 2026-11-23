#!/usr/bin/env bash
# PostToolUse(Edit|Write): format the touched file with the project's prettier.
# Never blocks: always exits 0.
set -u
file=$(jq -r '.tool_input.file_path // empty')
[ -z "$file" ] || [ ! -f "$file" ] && exit 0
root="${CLAUDE_PROJECT_DIR:-$(pwd)}"
prettier="$root/node_modules/.bin/prettier"

case "$file" in
  *.astro|*.js|*.mjs|*.ts|*.json|*.css|*.md|*.yml|*.yaml|*.html)
    [ -x "$prettier" ] && { (cd "$root" && "$prettier" --write --log-level warn "$file") >&2 || true; } ;;
esac
exit 0
