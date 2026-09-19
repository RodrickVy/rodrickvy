<script lang="ts">
	import Seo from '$lib/components/Seo.svelte';
	import ProjectCard from '$lib/components/ProjectCard.svelte';
	import { site } from '$lib/site';
	import badge from '$lib/assets/security-plus.png?enhanced';

	let { data } = $props();

	const links = [
		{ label: 'LinkedIn', href: site.links.linkedin, external: true },
		{ label: 'GitHub', href: site.links.github, external: true },
		{ label: 'Medium', href: site.links.medium, external: true },
		{ label: 'Resume', href: site.links.resume, external: false }
	];

	const spec = [
		['cert', 'CompTIA Security+'],
		['role', site.jobTitle],
		['lab', 'AD · OPNsense · VLANs · Proxmox'],
		['open to', site.seeking]
	];

	const jsonLd = {
		'@context': 'https://schema.org',
		'@graph': [
			{
				'@type': 'Person',
				'@id': `${site.url}/#person`,
				name: site.name,
				url: site.url,
				jobTitle: site.jobTitle,
				description: site.description,
				knowsAbout: site.skills,
				hasCredential: {
					'@type': 'EducationalOccupationalCredential',
					name: site.cert.name,
					url: site.cert.verify,
					recognizedBy: { '@type': 'Organization', name: site.cert.issuer },
					credentialCategory: 'certification'
				},
				address: { '@type': 'PostalAddress', addressLocality: 'Vancouver', addressRegion: 'BC', addressCountry: 'CA' },
				sameAs: [site.links.linkedin, site.links.github, site.links.medium, ...Object.values(site.socials)]
			},
			{
				'@type': 'WebSite',
				'@id': `${site.url}/#website`,
				url: site.url,
				name: site.name,
				publisher: { '@id': `${site.url}/#person` }
			}
		]
	};
</script>

<Seo type="profile" {jsonLd} />

<section class="wrap hero" aria-labelledby="name">
	<p class="label">// {site.location}</p>
	<h1 id="name">Rodrick<br /><span>Vyizigiro</span></h1>
	<p class="tagline">Curious about security.<br />Serious about the <em>craft</em>.</p>
	<p class="about">{site.description}</p>

	<ul class="links" aria-label="Profiles">
		{#each links as l (l.label)}
			<li>
				<a
					href={l.href}
					class:primary={l.label === 'Resume'}
					rel={l.external ? 'me noopener' : undefined}
					target={l.external ? '_blank' : undefined}
				>
					{l.label}<span aria-hidden="true">{l.external ? '↗' : '→'}</span>
				</a>
			</li>
		{/each}
	</ul>

	<dl class="spec">
		{#each spec as [k, v] (k)}
			<div><dt>{k}</dt><dd>{v}</dd></div>
		{/each}
	</dl>
</section>

<section class="wrap block" aria-labelledby="work">
	<header class="head">
		<h2 id="work"><span class="label">01 /</span> Projects</h2>
		<a class="mono all" href="/projects">All {data.total} projects →</a>
	</header>
	<div class="grid">
		{#each data.projects as project, i (project.slug)}
			<ProjectCard {project} index={i} />
		{/each}
	</div>
</section>

<section class="wrap block" aria-labelledby="certs">
	<header class="head">
		<h2 id="certs"><span class="label">02 /</span> Certifications</h2>
	</header>
	<a class="cert" href={site.cert.verify} rel="noopener" target="_blank">
		<enhanced:img src={badge} alt="{site.cert.name} certification badge" sizes="7rem" loading="lazy" />
		<span>
			<span class="label">{site.cert.issuer}</span>
			<strong>{site.cert.name}</strong>
			<span class="mono verify">Verify on Credly ↗</span>
		</span>
	</a>
</section>

<section class="wrap block" aria-labelledby="writing">
	<header class="head">
		<h2 id="writing"><span class="label">03 /</span> Writing</h2>
		<a class="mono all" href={site.links.medium} rel="me noopener" target="_blank">Medium ↗</a>
	</header>
	{#if data.posts.length}
		<ol class="posts">
			{#each data.posts as post (post.url)}
				<li>
					<a href={post.url} rel="noopener" target="_blank">
						<span class="title">{post.title}</span>
						<time class="mono" datetime={post.date}>{post.date}</time>
					</a>
				</li>
			{/each}
		</ol>
	{:else}
		<p class="note">
			I write up what I learn in the lab: notes, walkthroughs, and mistakes worth sharing.
			<a href={site.links.medium} rel="me noopener" target="_blank">Read the blog on Medium ↗</a>
		</p>
	{/if}
</section>

<style>
	.hero {
		padding-block: clamp(3rem, 10vw, 7rem) 3rem;
	}
	h1 {
		font-size: clamp(3.25rem, 13vw, 9.5rem);
		font-weight: 800;
		letter-spacing: -0.045em;
		line-height: 0.88;
		margin: 1.25rem 0 1.75rem;
		text-transform: uppercase;
	}
	h1 span {
		color: var(--accent);
	}
	.tagline {
		font-size: clamp(1.4rem, 3.5vw, 2.1rem);
		font-weight: 500;
		letter-spacing: -0.02em;
		line-height: 1.2;
		margin: 0;
		max-width: 22ch;
	}
	.tagline em {
		font-style: normal;
		font-family: var(--mono);
		font-size: 0.85em;
		color: var(--accent);
	}
	.about {
		max-width: 56ch;
		color: var(--muted);
		margin: 1.25rem 0 2rem;
	}
	.links {
		display: flex;
		flex-wrap: wrap;
		gap: 0.6rem;
		list-style: none;
		margin: 0;
		padding: 0;
	}
	.links a {
		display: inline-flex;
		gap: 0.5rem;
		align-items: center;
		font-family: var(--mono);
		font-size: 0.875rem;
		text-decoration: none;
		padding: 0.6rem 1rem;
		border: 1px solid var(--line);
		border-radius: 3px;
		transition:
			border-color 0.15s,
			color 0.15s;
	}
	.links a:hover {
		border-color: var(--accent);
		color: var(--accent);
	}
	.links a.primary {
		background: var(--accent);
		border-color: var(--accent);
		color: var(--accent-ink);
	}
	.links a.primary:hover {
		color: var(--accent-ink);
		filter: brightness(1.1);
	}
	.spec {
		margin: 3rem 0 0;
		max-width: 40rem;
		font-family: var(--mono);
		font-size: 0.8125rem;
		border-top: 1px solid var(--line);
	}
	.spec div {
		display: flex;
		gap: 0.75rem;
		padding: 0.6rem 0;
		border-bottom: 1px solid var(--line);
	}
	.spec dt {
		flex: 0 0 5.5rem;
		color: var(--muted);
		text-transform: uppercase;
		letter-spacing: 0.1em;
		font-size: 0.72rem;
		padding-top: 0.1rem;
	}
	.spec dd {
		margin: 0;
	}
	.block {
		padding-top: clamp(3rem, 8vw, 5rem);
	}
	.head {
		display: flex;
		justify-content: space-between;
		align-items: baseline;
		gap: 1rem;
		margin-bottom: 1.75rem;
	}
	h2 {
		font-size: clamp(2rem, 5vw, 3rem);
		font-weight: 700;
	}
	h2 .label {
		vertical-align: middle;
		margin-right: 0.3rem;
	}
	.all {
		color: var(--muted);
		text-decoration: none;
		white-space: nowrap;
	}
	.all:hover {
		color: var(--accent);
	}
	.grid {
		display: grid;
		grid-template-columns: repeat(auto-fill, minmax(min(100%, 20rem), 1fr));
		gap: 1.25rem;
	}
	.cert {
		display: inline-flex;
		align-items: center;
		gap: 1.25rem;
		padding: 1rem 1.75rem 1rem 1rem;
		background: var(--surface);
		border: 1px solid var(--line);
		border-radius: 4px;
		text-decoration: none;
		transition: border-color 0.2s;
	}
	.cert:hover {
		border-color: var(--accent);
	}
	.cert :global(img) {
		width: 6rem;
		height: 6rem;
	}
	.cert > span {
		display: flex;
		flex-direction: column;
		gap: 0.2rem;
	}
	.cert strong {
		font-size: 1.4rem;
		letter-spacing: -0.02em;
	}
	.verify {
		color: var(--accent);
	}
	.posts {
		list-style: none;
		margin: 0;
		padding: 0;
		border-top: 1px solid var(--line);
	}
	.posts a {
		display: flex;
		justify-content: space-between;
		align-items: baseline;
		gap: 1rem;
		padding: 1.1rem 0;
		border-bottom: 1px solid var(--line);
		text-decoration: none;
	}
	.posts .title {
		font-size: 1.2rem;
		font-weight: 500;
	}
	.posts a:hover .title {
		color: var(--accent);
	}
	.posts time {
		color: var(--muted);
		white-space: nowrap;
	}
	.note {
		max-width: 56ch;
		color: var(--muted);
		margin: 0;
	}
	.note a {
		color: var(--accent);
	}
</style>
