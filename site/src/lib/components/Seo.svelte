<script lang="ts">
	import { page } from '$app/state';
	import { site } from '$lib/site';

	type Props = {
		title?: string;
		description?: string;
		image?: string;
		type?: 'website' | 'article' | 'profile';
		jsonLd?: Record<string, unknown>;
	};
	let { title, description = site.description, image = '/og.png', type = 'website', jsonLd }: Props = $props();

	const fullTitle = $derived(title ? `${title} · ${site.name}` : `${site.name} · ${site.tagline}`);
	const canonical = $derived(site.url + (page.url.pathname === '/' ? '' : page.url.pathname));
	const imageUrl = $derived(site.url + new URL(image, site.url).pathname);
	// Escape "<" so content can never close the script tag early.
	const ld = $derived(jsonLd ? JSON.stringify(jsonLd).replace(/</g, '\u003c') : '');
</script>

<svelte:head>
	<title>{fullTitle}</title>
	<meta name="description" content={description} />
	<link rel="canonical" href={canonical} />
	<meta property="og:type" content={type} />
	<meta property="og:site_name" content={site.name} />
	<meta property="og:title" content={fullTitle} />
	<meta property="og:description" content={description} />
	<meta property="og:url" content={canonical} />
	<meta property="og:image" content={imageUrl} />
	<meta name="twitter:card" content="summary_large_image" />
	<meta name="twitter:title" content={fullTitle} />
	<meta name="twitter:description" content={description} />
	<meta name="twitter:image" content={imageUrl} />
	{#if ld}
		{@html `<script type="application/ld+json">${ld}</script>`}
	{/if}
</svelte:head>
