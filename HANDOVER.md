# Handover

**Last updated:** 2026-11-24 (Claude Code)

## Current focus

westoncox.com v1 is live (custom domain, HTTPS enforced). Adding the portfolio.

## State

- 28 portfolio images are in `src/assets/work/`, from the owner's Squarespace export. They were resized to a
  2000px long edge, converted to sRGB (one was CMYK) and named for their alt text. `npm run check` passes.
- One image (a child's portrait) was held back for the owner to decide on.
- **Draft copy needs the owner's approval:** the intro paragraph and the services list in `src/pages/index.astro`.

## Next steps

- Owner: approve or edit the draft copy.
- Owner: check the order and alt-text names of the work images (rename files to reorder).
- Replace the placeholder favicon with the real "wc" logo; add an OG image.

## Pending commit

    Summary: Add portfolio images to the work gallery
    Description:
    - 28 pieces from the old Squarespace site, resized to 2000px, sRGB
    - File names set the order and the alt text

## Gotchas

- This is a public repo: the Stop hook blocks private IPs and internal hostnames.
- Empty-collection warnings from `astro build` are expected until the first project is added.
- Gallery thumbnails are square crops; the lightbox shows the full image.
