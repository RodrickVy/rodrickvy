import type { Picture } from '$lib/types';

// Every image in src/lib/assets/projects is converted to AVIF/WebP at build time.
const modules = import.meta.glob<{ default: Picture }>('$lib/assets/projects/*.{png,jpg,jpeg,webp}', {
	eager: true,
	query: { enhanced: true }
});

const byName = new Map(
	Object.entries(modules).map(([path, mod]) => [path.split('/').pop()!, mod.default])
);

export const projectImage = (file?: string) => (file ? byName.get(file) : undefined);
