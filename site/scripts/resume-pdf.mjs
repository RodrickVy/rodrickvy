// Renders /resume to static/Rodrick-Vyizigiro-Resume.pdf with headless Chrome.
// Usage: npm run resume:pdf   (set CHROME=/path/to/chrome if it isn't found)
import { spawn, execFileSync } from 'node:child_process';
import { existsSync } from 'node:fs';
import { resolve } from 'node:path';

const candidates = [
	process.env.CHROME,
	'C:/Program Files/Google/Chrome/Application/chrome.exe',
	'C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe',
	'/Applications/Google Chrome.app/Contents/MacOS/Google Chrome',
	'/usr/bin/google-chrome',
	'/usr/bin/chromium'
].filter(Boolean);
const chrome = candidates.find((p) => existsSync(p));
if (!chrome) throw new Error('Chrome not found. Set the CHROME environment variable.');

const port = 4399;
const out = resolve('static/Rodrick-Vyizigiro-Resume.pdf');
const server = spawn('npx', ['vite', 'preview', '--port', String(port), '--strictPort'], { shell: true });

try {
	// Wait for the preview server to answer.
	for (let i = 0; ; i++) {
		try {
			if ((await fetch(`http://localhost:${port}/resume`)).ok) break;
		} catch {}
		if (i > 60) throw new Error('Preview server did not start');
		await new Promise((r) => setTimeout(r, 500));
	}
	execFileSync(chrome, [
		'--headless=new',
		'--disable-gpu',
		'--no-pdf-header-footer',
		'--virtual-time-budget=5000',
		`--print-to-pdf=${out}`,
		`http://localhost:${port}/resume`
	], { stdio: 'ignore' });
	console.log(`Wrote ${out}`);
} finally {
	if (process.platform === 'win32') execFileSync('taskkill', ['/pid', String(server.pid), '/T', '/F'], { stdio: 'ignore' });
	else server.kill();
}
