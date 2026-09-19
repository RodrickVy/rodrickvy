import adapter from '@sveltejs/adapter-static';
import { vitePreprocess } from '@sveltejs/vite-plugin-svelte';

/** @type {import('@sveltejs/kit').Config} */
export default {
	preprocess: vitePreprocess(),
	kit: {
		// Every page is server-rendered at build time into plain HTML,
		// so crawlers get full content and Firebase Hosting serves it from the CDN.
		adapter: adapter({ fallback: '404.html' }),
		prerender: { handleHttpError: 'warn' }
	}
};
