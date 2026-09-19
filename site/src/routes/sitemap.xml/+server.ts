import { site } from '$lib/site';
import { getProjects } from '$lib/server/projects';

export const prerender = true;

export function GET() {
	const pages = [
		{ loc: site.url, lastmod: undefined as string | undefined },
		{ loc: `${site.url}/projects`, lastmod: undefined },
		...getProjects().map((p) => ({ loc: `${site.url}/projects/${p.slug}`, lastmod: p.date }))
	];
	const body = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
${pages.map((p) => `  <url><loc>${p.loc}</loc>${p.lastmod ? `<lastmod>${p.lastmod}</lastmod>` : ''}</url>`).join('\n')}
</urlset>`;
	return new Response(body, { headers: { 'Content-Type': 'application/xml' } });
}
