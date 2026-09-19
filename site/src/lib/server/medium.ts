import { site } from '$lib/site';
import type { Post } from '$lib/types';

const decode = (s: string) =>
	s
		.replace(/<!\[CDATA\[([\s\S]*?)\]\]>/g, '$1')
		.replace(/&amp;/g, '&')
		.replace(/&#39;|&apos;/g, "'")
		.replace(/&quot;/g, '"')
		.trim();

// Pulled once at build time; if Medium is unreachable the section just links to the blog.
export async function getLatestPosts(fetchFn: typeof fetch, limit = 3): Promise<Post[]> {
	try {
		const res = await fetchFn(site.mediumFeed, { signal: AbortSignal.timeout(6000) });
		if (!res.ok) return [];
		const xml = await res.text();
		return [...xml.matchAll(/<item>([\s\S]*?)<\/item>/g)].slice(0, limit).map(([, item]) => ({
			title: decode(item.match(/<title>([\s\S]*?)<\/title>/)?.[1] ?? ''),
			url: decode(item.match(/<link>([\s\S]*?)<\/link>/)?.[1] ?? '').split('?')[0],
			date: new Date(item.match(/<pubDate>([\s\S]*?)<\/pubDate>/)?.[1] ?? '').toISOString().slice(0, 10)
		}));
	} catch {
		return [];
	}
}
