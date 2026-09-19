# rodrickvy portfolio

SvelteKit site, server-rendered to static HTML at build time and served by Firebase Hosting.

```bash
npm install
npm run dev       # local dev at http://localhost:5173
npm run build     # prerender to ./build
npm run deploy    # build + firebase deploy (run `firebase login` once first)
```

## Editing

- **Name, tagline, bio, links, socials:** `src/lib/site.ts`
- **Add a project:** create `src/content/projects/<slug>.md` with frontmatter
  (`title`, `summary`, `date`, `tags`, optional `status`, `cover`, `links`) and a Markdown body.
  Put its cover image in `src/lib/assets/projects/` and set `cover: <filename>`.
  Images are converted to AVIF/WebP automatically.
- **Resume:** save it as `static/resume.pdf`.
- **Share image:** edit and run `node scripts/og.mjs`.

The sitemap and project pages are generated automatically.
