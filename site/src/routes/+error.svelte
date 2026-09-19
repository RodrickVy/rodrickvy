<script lang="ts">
	import { page } from '$app/state';
</script>

<svelte:head><title>{page.status} · Rodrick Vyizigiro</title><meta name="robots" content="noindex" /></svelte:head>

<section class="wrap">
	<p class="label">// error {page.status}</p>
	<h1>Access denied<span>.</span></h1>
	<p>Just kidding. This page doesn't exist. <a href="/">Head back home →</a></p>
</section>

<style>
	section {
		padding-block: clamp(4rem, 15vw, 9rem);
	}
	h1 {
		font-size: clamp(2.75rem, 10vw, 6rem);
		font-weight: 800;
		letter-spacing: -0.04em;
		margin: 1rem 0;
	}
	span,
	a {
		color: var(--accent);
	}
	p:last-child {
		color: var(--muted);
	}
</style>
