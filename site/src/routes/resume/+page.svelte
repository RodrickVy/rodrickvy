<script lang="ts">
	import Seo from '$lib/components/Seo.svelte';
	import '@fontsource-variable/inter';
	import { resume as r } from '$lib/resume';
</script>

<Seo
	title="Resume"
	description="Resume of {r.name}, {r.title} in {r.contact.location}. CompTIA Security+ certified."
/>
<svelte:head>
	<!-- Keeps the page with your phone number out of search results. -->
	<meta name="robots" content="noindex" />
</svelte:head>

<div class="wrap toolbar no-print">
	<a class="mono back" href="/">← Home</a>
	<a class="download mono" href={r.pdf} download>Download PDF ↓</a>
</div>

<article class="sheet" aria-label="Resume">
	<header class="top">
		<h1>{r.name}</h1>
		<p class="title">{r.title}</p>
		<p class="contact">
			<span>{r.contact.location}</span>
			<a href="tel:{r.contact.phone.replace(/\D/g, '')}">{r.contact.phone}</a>
			<a href="mailto:{r.contact.email}">{r.contact.email}</a>
			<a href="https://www.{r.contact.linkedin}">{r.contact.linkedin}</a>
		</p>
	</header>

	<section>
		<h2>Summary</h2>
		<p>{r.summary}</p>
	</section>

	<section>
		<h2>Technical Skills</h2>
		<ul class="skills">
			{#each r.skills as s (s.label)}
				<li><strong>{s.label}:</strong> {s.items}</li>
			{/each}
		</ul>
	</section>

	<section>
		<h2>Certification</h2>
		{#each r.certifications as c (c.name)}
			<p class="row"><span><strong>{c.name}</strong> | {c.issuer}</span><span>{c.year}</span></p>
		{/each}
	</section>

	<section>
		<h2>Relevant Experience</h2>
		{#each r.experience as job (job.role + job.org)}
			<div class="job">
				<h3 class="row"><span>{job.role}</span><span class="dates">{job.dates}</span></h3>
				<p class="where"><span class="org">{job.org}</span>, {job.location}</p>
				<ul>
					{#each job.points as point, i (i)}<li>{point}</li>{/each}
				</ul>
			</div>
		{/each}
	</section>

	<section>
		<h2>Volunteer Experience</h2>
		{#each r.volunteer as job (job.role + job.org)}
			<div class="job">
				<h3 class="row"><span>{job.role}</span><span class="dates">{job.dates}</span></h3>
				<p class="where"><span class="org">{job.org}</span>, {job.location}</p>
				<ul>
					{#each job.points as point, i (i)}<li>{point}</li>{/each}
				</ul>
			</div>
		{/each}
	</section>

	<section>
		<h2>Projects</h2>
		<ul class="plain">
			{#each r.projects as p (p.name)}
				<li><strong>{p.name}:</strong> {p.text}</li>
			{/each}
		</ul>
	</section>

	<section>
		<h2>Education</h2>
		{#each r.education as e (e.credential)}
			<p><strong>{e.credential}</strong> | {e.school}, {e.location}</p>
		{/each}
	</section>
</article>

<style>
	.toolbar {
		display: flex;
		justify-content: space-between;
		align-items: center;
		max-width: calc(8.5in + 2 * var(--gutter));
		padding-block: 1.5rem;
	}
	.back {
		color: var(--muted);
		text-decoration: none;
	}
	.back:hover {
		color: var(--accent);
	}
	.download {
		background: var(--accent);
		color: var(--accent-ink);
		text-decoration: none;
		padding: 0.65rem 1.1rem;
		border-radius: 3px;
	}
	.download:hover {
		filter: brightness(1.1);
	}

	/* The sheet is always black on white, like paper, in both themes. */
	.sheet {
		--ink: #16161a;
		--soft: #4a4a52;
		--rule: #d9d6cf;
		--red: #c8321c;
		width: min(8.5in, calc(100% - 2 * var(--gutter)));
		margin: 0 auto;
		padding: clamp(1.25rem, 5vw, 0.55in) clamp(1.25rem, 5vw, 0.6in);
		background: #fff;
		color: var(--ink);
		font-family: "Inter Variable", system-ui, sans-serif;
		font-size: 9.4pt;
		line-height: 1.35;
		border-radius: 3px;
		box-shadow: 0 1px 2px rgb(0 0 0 / 0.2), 0 12px 40px rgb(0 0 0 / 0.25);
	}
	.top {
		border-bottom: 2px solid var(--ink);
		padding-bottom: 0.7em;
		margin-bottom: 0.2em;
	}
	h1 {
		font-family: var(--font);
		font-size: 22pt;
		font-weight: 800;
		letter-spacing: -0.02em;
		text-transform: uppercase;
		line-height: 1;
	}
	.title {
		margin: 0.35em 0 0.45em;
		font-size: 11pt;
		font-weight: 600;
		color: var(--red);
	}
	.contact {
		display: flex;
		flex-wrap: wrap;
		gap: 0.2em 0;
		margin: 0;
		color: var(--soft);
	}
	.contact > :not(:last-child)::after {
		content: '|';
		margin: 0 0.6em;
		color: var(--rule);
	}
	.contact a {
		color: inherit;
		text-decoration: none;
	}
	section {
		margin-top: 0.75em;
	}
	h2 {
		font-size: 9pt;
		font-weight: 700;
		letter-spacing: 0.06em;
		text-transform: uppercase;
		border-bottom: 1px solid var(--rule);
		padding-bottom: 0.2em;
		margin-bottom: 0.45em;
	}
	p {
		margin: 0;
	}
	ul {
		margin: 0.25em 0 0;
		padding-left: 1.1em;
	}
	li {
		margin: 0.12em 0;
	}
	li::marker {
		color: var(--soft);
	}
	.skills,
	.plain {
		list-style: none;
		padding: 0;
	}
	.row {
		display: flex;
		justify-content: space-between;
		gap: 1em;
	}
	.row > :first-child {
		flex: 1;
	}
	.job + .job {
		margin-top: 0.6em;
	}
	h3 {
		font-size: 10pt;
		font-weight: 700;
		letter-spacing: 0;
		line-height: 1.3;
	}
	.org {
		font-weight: 600;
		color: var(--ink);
	}
	.dates {
		font-weight: 500;
		white-space: nowrap;
		color: var(--soft);
	}
	.where {
		color: var(--soft);
		font-size: 9pt;
	}

	@media (max-width: 40rem) {
		.row {
			flex-direction: column;
			gap: 0;
		}
	}

	@page {
		size: letter;
		margin: 0.4in 0.5in;
	}
	@media print {
		.sheet {
			width: auto;
			padding: 0;
			box-shadow: none;
			border-radius: 0;
		}
		.row {
			flex-direction: row;
		}
		.job,
		h2 {
			break-inside: avoid;
			break-after: avoid;
		}
	}
</style>
