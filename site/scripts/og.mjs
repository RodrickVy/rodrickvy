// Regenerates static/og.png and static/apple-touch-icon.png: node scripts/og.mjs
import sharp from 'sharp';
import { readFileSync } from 'node:fs';

const og = `<svg xmlns="http://www.w3.org/2000/svg" width="1200" height="630">
  <defs><pattern id="g" width="40" height="40" patternUnits="userSpaceOnUse"><path d="M40 0H0V40" fill="none" stroke="#1d1d20" stroke-width="1"/></pattern></defs>
  <rect width="1200" height="630" fill="#0c0c0d"/><rect width="1200" height="630" fill="url(#g)"/>
  <text x="80" y="120" font-family="Consolas,monospace" font-size="24" fill="#9c9a94">// VANCOUVER, BC · SECURITY+</text>
  <text x="74" y="300" font-family="Arial Black,Arial,sans-serif" font-weight="900" font-size="128" fill="#edebe5" letter-spacing="-5">RODRICK</text>
  <text x="74" y="420" font-family="Arial Black,Arial,sans-serif" font-weight="900" font-size="128" fill="#ff5a43" letter-spacing="-5">VYIZIGIRO</text>
  <text x="80" y="530" font-family="Arial,sans-serif" font-size="40" fill="#edebe5">Curious about security. Serious about the craft.</text>
  <rect x="1080" y="498" width="22" height="40" fill="#ff5a43"/>
</svg>`;

await sharp(Buffer.from(og)).png({ compressionLevel: 9 }).toFile('static/og.png');
await sharp(readFileSync('static/favicon.svg')).resize(180, 180).png().toFile('static/apple-touch-icon.png');
console.log('done');
