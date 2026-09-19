import { error } from '@sveltejs/kit';
import { getProject, getProjects } from '$lib/server/projects';

export const entries = () => getProjects().map(({ slug }) => ({ slug }));

export function load({ params }) {
	const project = getProject(params.slug);
	if (!project) error(404, 'Project not found');
	return { project };
}
