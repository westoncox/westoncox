import { defineCollection } from "astro:content";
import { glob } from "astro/loaders";
import { z } from "astro/zod";

// One Markdown file per public project in src/content/projects/.
const projects = defineCollection({
  loader: glob({ pattern: "**/*.md", base: "./src/content/projects" }),
  schema: ({ image }) =>
    z.object({
      title: z.string(),
      summary: z.string(),
      kind: z.enum(["web app", "iOS Shortcut", "script", "plugin", "automation", "other"]),
      url: z.string().url().optional(),
      repo: z.string().url().optional(),
      date: z.coerce.date(),
      draft: z.boolean().default(false),
      // Paths are relative to the Markdown file, e.g. ./clcphotos/01-dashboard.png
      screenshots: z.array(z.object({ src: image(), alt: z.string() })).default([]),
    }),
});

export const collections = { projects };
