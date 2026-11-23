@AGENTS.md
@HANDOVER.md

## Claude Code specifics

- The rules above are also enforced in `.claude/settings.json`, through deny
  rules plus hooks in `.claude/hooks/`:
  - the Bash guard blocks git writes and secret access
  - prettier formats each file after an edit
  - the Stop hook runs a privacy scan and then `npm run check`
- `/wrap-up` updates HANDOVER.md and BACKBURNER.md and prints the commit
  Summary/Description.
