<script lang="ts">
	import '@fontsource-variable/bricolage-grotesque';
	import '@fontsource/jetbrains-mono/400.css';
	import '../app.css';
	import { page } from '$app/state';
	import { site } from '$lib/site';

	let { children } = $props();

	const socials = [
		{ label: 'YouTube', href: site.socials.youtube }
	];
</script>

<a class="skip" href="#main">Skip to content</a>

<header class="wrap bar no-print">
	<a class="mark" href="/" aria-label="{site.name}, home">
		<span aria-hidden="true">{site.shortName}</span><span class="cursor" aria-hidden="true"></span>
	</a>
	<nav aria-label="Primary">
		<a href="/projects" aria-current={page.url.pathname.startsWith('/projects') ? 'page' : undefined}>Projects</a>
		<a href={site.links.medium} rel="me noopener" target="_blank">Blog</a>
		<a href={site.links.resume}>Resume</a>
	</nav>
</header>

<main id="main">
	{@render children()}
</main>

<footer class="wrap foot no-print">
	<p class="mono">© {new Date().getFullYear()} {site.name}</p>
	<ul aria-label="Social media">
		{#each socials as s (s.label)}
			<li><a class="mono" href={s.href} rel="me noopener" target="_blank">{s.label}</a></li>
		{/each}
	</ul>
</footer>

<style>
	.bar {
		display: flex;
		align-items: center;
		justify-content: space-between;
		gap: 1rem;
		padding-block: 1.25rem;
	}
	.mark {
		font-weight: 800;
		font-size: 1.25rem;
		letter-spacing: -0.03em;
		text-decoration: none;
		display: inline-flex;
		align-items: center;
		gap: 0.2rem;
	}
	.cursor {
		width: 0.55em;
		height: 0.9em;
		background: var(--accent);
		animation: blink 1.1s steps(1) infinite;
	}
	@keyframes blink {
		50% {
			opacity: 0;
		}
	}
	nav {
		display: flex;
		gap: clamp(0.9rem, 3vw, 2rem);
	}
	nav a {
		font-family: var(--mono);
		font-size: 0.8125rem;
		text-transform: lowercase;
		text-decoration: none;
		color: var(--muted);
		transition: color 0.15s;
	}
	nav a:hover,
	nav a[aria-current='page'] {
		color: var(--text);
	}
	.foot {
		display: flex;
		flex-wrap: wrap;
		justify-content: space-between;
		align-items: center;
		gap: 1rem;
		padding-block: 2.5rem;
		margin-top: 6rem;
		border-top: 1px solid var(--line);
	}
	.foot p {
		margin: 0;
		color: var(--muted);
	}
	.foot ul {
		display: flex;
		gap: 1.5rem;
		list-style: none;
		margin: 0;
		padding: 0;
	}
	.foot a {
		text-decoration: none;
		color: var(--muted);
	}
	.foot a:hover {
		color: var(--accent);
	}
</style>
