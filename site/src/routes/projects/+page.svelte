<script lang="ts">
	import Seo from '$lib/components/Seo.svelte';
	import ProjectCard from '$lib/components/ProjectCard.svelte';

	let { data } = $props();
</script>

<Seo
	title="Projects"
	description="Security homelabs, networking builds, and software projects by Rodrick Vyizigiro, each with a write-up of what was built and learned."
/>

<section class="wrap">
	<p class="label">// index</p>
	<h1>Projects</h1>
	<p class="intro">Things I've built, broken, and secured, from homelab networks to web and mobile apps.</p>
	<div class="grid">
		{#each data.projects as project, i (project.slug)}
			<ProjectCard {project} index={i} />
		{/each}
	</div>
</section>

<style>
	section {
		padding-top: clamp(2.5rem, 8vw, 5rem);
	}
	h1 {
		font-size: clamp(3rem, 10vw, 6rem);
		font-weight: 800;
		letter-spacing: -0.045em;
		margin-top: 1rem;
	}
	.intro {
		color: var(--muted);
		max-width: 50ch;
		margin: 1rem 0 2.5rem;
	}
	.grid {
		display: grid;
		grid-template-columns: repeat(auto-fill, minmax(min(100%, 20rem), 1fr));
		gap: 1.25rem;
	}
</style>
