---
name: wrap-up
description: End or pause a work session. Updates HANDOVER.md, moves loose ends to BACKBURNER.md, and prints the commit Summary/Description for the user to paste into GitHub Desktop. Use when the user says wrap up, switch tasks, stopping, or handover.
---

1. Run `git status` and `git diff --stat` to see what's uncommitted.
2. Overwrite `HANDOVER.md` in place, following its existing sections. Set
   `Last updated` to today's date and "Claude Code". Keep it under ~40 lines.
3. Add anything unfinished or being set aside to `BACKBURNER.md`, using its
   format. Check off items that are now done.
4. If there are uncommitted changes, write the commit message per AGENTS.md
   ("Commit messages"). Put it under "Pending commit" in HANDOVER.md and print
   it in a code block. If nothing is uncommitted, clear "Pending commit".
5. Do not run any git write command.
