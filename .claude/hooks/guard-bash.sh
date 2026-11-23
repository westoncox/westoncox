#!/usr/bin/env bash
# PreToolUse(Bash): block git writes (the owner commits/pushes in GitHub Desktop)
# and secret-file access. Exit 2 = block; stderr is shown to Claude.
set -u
cmd=$(jq -r '.tool_input.command // empty')
[ -z "$cmd" ] && exit 0

# `git [global opts like -C dir / --no-pager] <write-subcommand>`, anywhere in a compound command.
git_prefix='(^|[^[:alnum:]_-])git([[:space:]]+-[[:alnum:]-]+(=[^[:space:]]+)?([[:space:]]+[^-[:space:]][^[:space:]]*)?)*[[:space:]]+'
writes='(add|commit|checkout|switch|restore|reset|rebase|merge|pull|fetch|push|stash|cherry-pick|revert|tag|rm|mv|clean|worktree|apply|am|gc|init|clone)'
if printf '%s' "$cmd" | grep -Eq "${git_prefix}${writes}([[:space:];&|)]|$)" ||
  printf '%s' "$cmd" | grep -Eq "${git_prefix}branch[[:space:]]+(-[dDmMcC]|[^-[:space:]])"; then
  echo "Blocked: agents never run git write commands here. The owner commits and pushes in GitHub Desktop; provide a Summary/Description instead." >&2
  exit 2
fi

# Strip allowed template files before scanning for secret paths.
scan=$(printf '%s' "$cmd" | sed -E 's/\.env\.example//g')
if printf '%s' "$scan" | grep -Eq '(^|[^[:alnum:]_])\.env([^[:alnum:]_]|$)|\.env\.[[:alnum:]_.-]+|\.pem([^[:alnum:]_]|$)|\.key([^[:alnum:]_]|$)|id_(rsa|ed25519|ecdsa)'; then
  echo "Blocked: command references a secret file (.env, *.pem, *.key, SSH key). Ask the owner to handle secrets directly." >&2
  exit 2
fi
exit 0
