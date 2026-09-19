export type Picture = {
	sources: Record<string, string>;
	img: { src: string; w: number; h: number };
};

export type ProjectMeta = {
	slug: string;
	title: string;
	summary: string;
	date: string;
	status?: string;
	images: string[];
	tags: string[];
	links: { label: string; url: string }[];
};

export type Project = ProjectMeta & { html: string };

export type Post = { title: string; url: string; date: string };
