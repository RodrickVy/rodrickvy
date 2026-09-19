import matter from 'gray-matter';
import { marked } from 'marked';
import type { Project } from '$lib/types';

// Each Markdown file in src/content/projects becomes a project page.
const files = import.meta.glob<string>('/src/content/projects/*.md', {
	eager: true,
	query: '?raw',
	import: 'default'
});

const projects: Project[] = Object.entries(files)
	.map(([path, raw]) => {
		const { data, content } = matter(raw);
		return {
			slug: path.split('/').pop()!.replace(/\.md$/, ''),
			title: data.title,
			summary: data.summary,
			date: new Date(data.date).toISOString().slice(0, 10),
			status: data.status,
			images: data.images ?? [],
			tags: data.tags ?? [],
			links: data.links ?? [],
			html: marked.parse(content, { async: false })
		};
	})
	.sort((a, b) => b.date.localeCompare(a.date));

export const getProjects = () => projects.map(({ html: _html, ...meta }) => meta);
export const getProject = (slug: string) => projects.find((p) => p.slug === slug);
