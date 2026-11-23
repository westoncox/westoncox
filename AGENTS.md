# westoncox.com: agent instructions

Shared instructions for every coding agent (Claude Code, Codex, others).
This repo is the public website of **Weston Cox Design LLC** (westoncox.com) and
also the owner's GitHub profile repo: `README.md` shows on github.com/westoncox.

## This repo is PUBLIC

- Never commit private details: internal hostnames, private IP addresses,
  home-network or smart-home configuration, family information, secrets, or
  references to the owner's private repos. The Stop hook scans changed files
  for these.
- Public contact details are set in `src/site.ts` (email, Google Voice number,
  city and state). Don't add others, such as a street address or personal cell.
- The legal name **"Weston Cox Design LLC"** must stay visible in the footer
  and the contact section. Apple Business verification depends on it.

## Rules

- **No git writes, ever.** No add, commit, checkout, pull, fetch, stash,
  merge, push, and so on. The owner commits and pushes in GitHub Desktop.
  Read-only git (`status`, `diff`, `log`, `show`) is fine.
- **Never read, print, or edit secrets** (`.env*` except `.env.example`,
  `*.pem`, `*.key`).
- Prefer FOSS, mature dependencies. Add an npm package only when it clearly
  earns its place, and say why.
- Verification: `npm run check` (astro check + build). The Stop hook runs it.

## Stack

- Astro (static output), deployed to GitHub Pages by
  `.github/workflows/deploy.yml` on push to `main`. The custom domain is set
  in the repo's Pages settings, and DNS lives in Cloudflare.
- Fonts are self-hosted via `@fontsource-variable/*`. No third-party trackers.
- Layout: `src/pages/` (routes), `src/layouts/Base.astro`, `src/components/`,
  `src/styles/global.css`, `src/site.ts` (business details).
- Portfolio images go in `src/assets/work/`. Name them `NN-title.jpg`: the
  number sets the order and the title becomes the alt text.
- Software projects get one Markdown file each in `src/content/projects/`,
  with the schema in `src/content.config.ts`.

## Commit messages (after every agreed, completed change)

Output a ready-to-paste block for GitHub Desktop:

    Summary: <outcome-first, imperative, ≤ 50 chars>
    Description:            (only when the "why" isn't obvious)
    - <what changed for visitors, and why>

Also record it under "Pending commit" in `HANDOVER.md`.

## Handoff protocol

- **Session start:** read `HANDOVER.md`.
- **Before stopping or switching tasks:** overwrite `HANDOVER.md` in place
  (keep it under ~40 lines). Put parked items in `BACKBURNER.md`.
