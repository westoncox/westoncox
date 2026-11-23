# Handover

**Last updated:** 2026-11-23 (Claude Code)

## Current focus

Launching v1 of westoncox.com: a one-page design/photo site with contact details, plus `/projects` and `/privacy`.

## State

- The Astro site builds (`npm run check` passes). The gallery is empty until images land in `src/assets/work/`.
- **Draft copy needs the owner's approval:** the intro paragraph and the services list in `src/pages/index.astro`.
- Deploy workflow is ready; the repo's Pages settings still need Source = GitHub Actions and the custom domain.

## Next steps

- Owner:
  - set up the DNS records and email routing (checklist kept outside this public repo)
  - set the Pages source and custom domain
  - push
- Add the portfolio images, numbered and named.
- Replace the placeholder favicon with the real "wc" logo once it's available.

## Pending commit

    Summary: Launch westoncox.com v1 on Astro
    Description:
    - One-page site: intro, work gallery, services, contact (LLC name shown)
    - Projects and privacy pages; GitHub Pages deploy workflow
    - Agent rules, guard/format/check hooks, wrap-up skill

## Gotchas

- This is a public repo: the Stop hook blocks private IPs and internal hostnames.
- Empty-collection warnings from `astro build` are expected until the first project is added.
