import { getProjects } from '$lib/server/projects';

export const load = () => ({ projects: getProjects() });
