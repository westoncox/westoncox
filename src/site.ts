// Single source for business details shown across the site.
// Apple Business verification checks the legal name, so keep it exact.
export const SITE = {
  legalName: "Weston Cox Design LLC",
  person: "Weston Cox",
  tagline: "design + photo + creative",
  description:
    "Weston Cox — graphic designer, photographer, and maker of small software tools. Weston Cox Design LLC, Dalton, Georgia.",
  email: "hello@westoncox.com",
  phone: "(706) 237-8348",
  phoneHref: "tel:+17062378348",
  location: "Dalton, Georgia",
  social: [
    { label: "Instagram", href: "https://www.instagram.com/westoncoxdesign/" },
    { label: "Facebook", href: "https://www.facebook.com/westoncoxdesign/" },
    { label: "LinkedIn", href: "https://www.linkedin.com/in/westoncox/" },
    { label: "GitHub", href: "https://github.com/westoncox" },
  ],
} as const;
