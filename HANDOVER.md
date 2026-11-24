# Handover

**Last updated:** 2026-11-24 (Claude Code)

## Current focus

westoncox.com v1 is live (custom domain, HTTPS enforced). Adding projects (CLC Photos) and the real favicon.

## State

- 28 portfolio images are in `src/assets/work/`, from the owner's Squarespace export. They were resized to a
  2000px long edge, converted to sRGB (one was CMYK) and named for their alt text. `npm run check` passes.
- One image (a child's portrait) was held back for the owner to decide on.
- Intro and services copy in `src/pages/index.astro` were edited by the owner.
- `/projects` features CLC Photos (`src/content/projects/clcphotos.md`). Admin screenshots pending: demo data only,
  no customer or student names, no admin URL visible. Project pages never link to admin areas.
- Favicon is the old multicolor "wc" logo (`public/favicon.ico`, `icon-512.png`, `apple-touch-icon.png`).

## Next steps

- Owner: supply CLC admin screenshots; review the CLC Photos text.
- Owner: check the order and alt-text names of the work images (rename files to reorder).
- Add an OG image (the logo or a work collage).

## Pending commit

    Summary: Feature CLC Photos; use the wc logo favicon
    Description:
    - Update intro and services copy
    - Projects render their Markdown body and optional screenshots
    - Gallery takes an images prop; each gallery has its own lightbox
    - Replace the placeholder favicon with the original multicolor logo

## Gotchas

- This is a public repo: the Stop hook blocks private IPs and internal hostnames.
- Empty-collection warnings from `astro build` are expected until the first project is added.
- Gallery thumbnails are square crops; the lightbox shows the full image.
