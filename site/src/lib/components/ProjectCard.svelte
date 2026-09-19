<script lang="ts">
	import { projectImage } from '$lib/images';
	import type { Picture, ProjectMeta } from '$lib/types';

	let { project, index }: { project: ProjectMeta; index: number } = $props();

	const pics = $derived(project.images.map(projectImage).filter((p): p is Picture => !!p));
	// Phone screenshots (tall and narrow) sit side by side; photos fill the frame.
	const portrait = $derived(pics.length > 0 && pics[0].img.h / pics[0].img.w > 1.6);
	const shown = $derived(portrait ? pics.slice(0, 2) : pics.slice(0, 1));
	const initials = $derived(
		project.title
			.split(/\s+/)
			.slice(0, 2)
			.map((w) => w[0])
			.join('')
	);
</script>

<article class="card">
	<div class="cover" class:portrait>
		{#each shown as pic, i (pic.img.src)}
			<enhanced:img
				src={pic}
				alt={i === 0 ? `${project.title} preview` : ''}
				sizes={portrait ? '12rem' : '(min-width: 64rem) 34rem, (min-width: 40rem) 50vw, 100vw'}
				loading={index < 2 ? 'eager' : 'lazy'}
			/>
		{:else}
			<div class="blank" aria-hidden="true"><span>{initials}</span></div>
		{/each}
	</div>
	<div class="body">
		<p class="label">
			<span class="idx">P/{String(index + 1).padStart(2, '0')}</span>
			{#if project.status}<span class="status">{project.status}</span>{/if}
		</p>
		<h3><a href="/projects/{project.slug}">{project.title}</a></h3>
		<p class="summary">{project.summary}</p>
		<ul class="tags" aria-label="Technologies">
			{#each project.tags.slice(0, 4) as tag (tag)}<li class="mono">{tag}</li>{/each}
		</ul>
		<span class="more mono" aria-hidden="true">Read more →</span>
	</div>
</article>

<style>
	.card {
		position: relative;
		display: flex;
		flex-direction: column;
		background: var(--surface);
		border: 1px solid var(--line);
		border-radius: 4px;
		overflow: hidden;
		transition:
			border-color 0.2s,
			transform 0.2s;
	}
	.card:hover,
	.card:focus-within {
		border-color: var(--accent);
		transform: translateY(-3px);
	}
	.cover {
		aspect-ratio: 16 / 10;
		overflow: hidden;
		border-bottom: 1px solid var(--line);
		background: var(--bg);
	}
	.cover :global(img) {
		width: 100%;
		height: 100%;
		object-fit: cover;
		transition: transform 0.4s;
	}
	.card:hover .cover :global(img) {
		transform: scale(1.03);
	}
	.cover.portrait {
		display: flex;
		justify-content: center;
		align-items: flex-start;
		gap: 0.75rem;
		padding: 1.25rem 1.25rem 0;
		background-image: radial-gradient(var(--line) 1px, transparent 1px);
		background-size: 14px 14px;
	}
	.cover.portrait :global(picture) {
		flex: 0 1 40%;
	}
	.cover.portrait :global(img) {
		height: auto;
		object-fit: contain;
		border-radius: 10px 10px 0 0;
		border: 1px solid var(--line);
		border-bottom: 0;
	}
	.blank {
		height: 100%;
		display: grid;
		place-items: center;
		background-image:
			linear-gradient(var(--line) 1px, transparent 1px),
			linear-gradient(90deg, var(--line) 1px, transparent 1px);
		background-size: 24px 24px;
		background-position: center;
	}
	.blank span {
		font-size: clamp(3rem, 8vw, 5rem);
		font-weight: 800;
		letter-spacing: -0.05em;
		color: var(--accent);
		background: var(--bg);
		padding: 0 0.3em;
	}
	.body {
		display: flex;
		flex-direction: column;
		gap: 0.6rem;
		padding: 1.25rem 1.25rem 1.4rem;
		flex: 1;
	}
	.body p {
		margin: 0;
	}
	.label {
		display: flex;
		align-items: center;
		gap: 0.6rem;
	}
	.idx {
		color: var(--accent);
	}
	.status {
		display: inline-flex;
		align-items: center;
		gap: 0.4rem;
		color: var(--text);
		border: 1px solid var(--line);
		border-radius: 2px;
		padding: 0.05rem 0.45rem;
	}
	.status::before {
		content: '';
		width: 6px;
		height: 6px;
		border-radius: 50%;
		background: var(--accent);
		animation: pulse 1.6s ease-in-out infinite;
	}
	@keyframes pulse {
		50% {
			opacity: 0.25;
		}
	}
	h3 {
		font-size: 1.5rem;
	}
	h3 a {
		text-decoration: none;
	}
	/* Whole card is clickable, but only the title is a link for screen readers. */
	h3 a::after {
		content: '';
		position: absolute;
		inset: 0;
	}
	.summary {
		color: var(--muted);
		font-size: 1rem;
	}
	.tags {
		display: flex;
		flex-wrap: wrap;
		gap: 0.4rem;
		list-style: none;
		margin: 0.2rem 0 0;
		padding: 0;
	}
	.tags li {
		font-size: 0.72rem;
		border: 1px solid var(--line);
		border-radius: 2px;
		padding: 0.1rem 0.45rem;
		color: var(--muted);
	}
	.more {
		margin-top: auto;
		padding-top: 0.6rem;
		color: var(--accent);
	}
</style>
