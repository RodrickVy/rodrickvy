<script lang="ts">
	import Seo from '$lib/components/Seo.svelte';
	import { projectImage } from '$lib/images';
	import { site } from '$lib/site';
	import type { Picture } from '$lib/types';

	let { data } = $props();
	const p = $derived(data.project);
	const pics = $derived(p.images.map(projectImage).filter((x): x is Picture => !!x));
	const pic = $derived(pics[0]);

	const jsonLd = $derived({
		'@context': 'https://schema.org',
		'@type': 'CreativeWork',
		name: p.title,
		abstract: p.summary,
		dateCreated: p.date,
		keywords: p.tags.join(', '),
		url: `${site.url}/projects/${p.slug}`,
		author: { '@type': 'Person', name: site.name, url: site.url }
	});
</script>

<Seo title={p.title} description={p.summary} type="article" image={pic?.img.src} {jsonLd} />

<article class="wrap">
	<nav aria-label="Breadcrumb" class="mono crumbs">
		<a href="/">home</a> / <a href="/projects">projects</a> / <span aria-current="page">{p.slug}</span>
	</nav>

	<header>
		<p class="label">
			<time datetime={p.date}>{new Date(p.date).toLocaleDateString('en-CA', { year: 'numeric', month: 'long', timeZone: 'UTC' })}</time>
			{#if p.status}<span class="status">{p.status}</span>{/if}
		</p>
		<h1>{p.title}</h1>
		<p class="summary">{p.summary}</p>
		<ul class="tags" aria-label="Technologies">
			{#each p.tags as tag (tag)}<li class="mono">{tag}</li>{/each}
		</ul>
		{#if p.links.length}
			<p class="actions">
				{#each p.links as l (l.url)}
					<a href={l.url} rel="noopener" target="_blank" class="mono">{l.label} ↗</a>
				{/each}
			</p>
		{/if}
	</header>

	{#if pics.length}
		<div class="gallery" class:single={pics.length === 1}>
			{#each pics as img, i (img.img.src)}
				<figure class:tall={img.img.h / img.img.w > 1.6}>
					<enhanced:img
						src={img}
						alt="{p.title}, image {i + 1} of {pics.length}"
						sizes={pics.length === 1 ? '(min-width: 72rem) 67rem, 100vw' : '(min-width: 48rem) 33rem, 100vw'}
						fetchpriority={i === 0 ? 'high' : undefined}
						loading={i === 0 ? 'eager' : 'lazy'}
					/>
				</figure>
			{/each}
		</div>
	{/if}

	<div class="prose">
		{@html p.html}
	</div>

	<a class="back mono" href="/projects">← All projects</a>
</article>

<style>
	article {
		padding-top: 2rem;
	}
	.crumbs {
		color: var(--muted);
	}
	.crumbs a {
		text-decoration: none;
	}
	.crumbs a:hover {
		color: var(--accent);
	}
	header {
		max-width: 48rem;
		padding-block: clamp(2rem, 6vw, 4rem) 2rem;
	}
	h1 {
		font-size: clamp(2.5rem, 8vw, 5rem);
		font-weight: 800;
		letter-spacing: -0.04em;
		margin: 0.75rem 0 1rem;
	}
	.summary {
		font-size: 1.25rem;
		color: var(--muted);
		margin: 0 0 1.25rem;
	}
	.tags {
		display: flex;
		flex-wrap: wrap;
		gap: 0.4rem;
		list-style: none;
		margin: 0;
		padding: 0;
	}
	.tags li {
		font-size: 0.75rem;
		border: 1px solid var(--line);
		border-radius: 2px;
		padding: 0.15rem 0.5rem;
		color: var(--muted);
	}
	.actions {
		display: flex;
		flex-wrap: wrap;
		gap: 0.6rem;
		margin: 1.5rem 0 0;
	}
	.actions a {
		text-decoration: none;
		padding: 0.55rem 0.95rem;
		background: var(--accent);
		color: var(--accent-ink);
		border-radius: 3px;
	}
	.status {
		margin-left: 0.5rem;
		color: var(--text);
		border: 1px solid var(--accent);
		border-radius: 2px;
		padding: 0.05rem 0.45rem;
	}
	.gallery {
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(min(100%, 18rem), 1fr));
		gap: 1rem;
		margin-bottom: 3rem;
	}
	.gallery.single {
		grid-template-columns: 1fr;
	}
	figure {
		margin: 0;
		border: 1px solid var(--line);
		border-radius: 4px;
		overflow: hidden;
		background: var(--surface);
	}
	figure :global(picture) {
		display: contents;
	}
	figure :global(img) {
		width: 100%;
		height: 100%;
		object-fit: cover;
	}
	/* Phone screenshots: show whole, centred, not cropped. */
	figure.tall {
		display: grid;
		place-items: center;
		padding: 1.5rem;
		background-image: radial-gradient(var(--line) 1px, transparent 1px);
		background-size: 14px 14px;
	}
	figure.tall :global(img) {
		width: auto;
		max-height: 34rem;
		object-fit: contain;
		border-radius: 12px;
		border: 1px solid var(--line);
	}
	.prose {
		max-width: 44rem;
	}
	.prose :global(h2) {
		font-size: 1.6rem;
		margin: 2.5rem 0 0.75rem;
	}
	.prose :global(h2)::before {
		content: '# ';
		font-family: var(--mono);
		color: var(--accent);
		font-size: 0.8em;
	}
	.prose :global(ul) {
		padding-left: 1.2rem;
	}
	.prose :global(li) {
		margin: 0.35rem 0;
	}
	.prose :global(li::marker) {
		color: var(--accent);
	}
	.prose :global(a) {
		color: var(--accent);
	}
	.prose :global(code) {
		font-family: var(--mono);
		font-size: 0.9em;
		background: var(--surface);
		border: 1px solid var(--line);
		padding: 0.05rem 0.3rem;
		border-radius: 2px;
	}
	.prose :global(pre) {
		background: var(--surface);
		border: 1px solid var(--line);
		padding: 1rem;
		overflow-x: auto;
		border-radius: 4px;
	}
	.prose :global(pre code) {
		border: 0;
		padding: 0;
	}
	.prose :global(img) {
		border-radius: 4px;
		border: 1px solid var(--line);
	}
	.back {
		display: inline-block;
		margin-top: 3rem;
		color: var(--muted);
		text-decoration: none;
	}
	.back:hover {
		color: var(--accent);
	}
</style>
