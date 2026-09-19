import { getProjects } from '$lib/server/projects';
import { getLatestPosts } from '$lib/server/medium';

export async function load({ fetch }) {
	return {
		projects: getProjects().slice(0, 4),
		total: getProjects().length,
		posts: await getLatestPosts(fetch)
	};
}
