# Bundled Premium Design Systems

Pick EXACTLY ONE per brief. Each supplies palette + type + spacing rhythm so output is cohesive by construction. Never mix two.

## 1. Minimal-Tech (Linear / Vercel)
- **Palette:** Ink `#0B0B0F`, Surface `#16161A`, Mist `#F7F8FA`, Accent `#5E6AD2` (Linear indigo), Muted `#8A8F98`.
- **Type:** Display `Inter Tight` / `Geist`; Body `Inter` / `Geist`; Mono `Geist Mono` / `JetBrains Mono`.
- **Rhythm:** Tight 4px grid, hairline 1px dividers, generous negative space, subtle gradients only on hero glow.
- **Best for:** SaaS dashboards, dev tools, productivity apps.

## 2. Warm-Sophisticate (Arc / Raycast)
- **Palette:** Cocoa `#1C1410`, Sand `#EDE6DD`, Clay `#C2410C`-ish terracotta accent used sparingly, Gold `#B8893B`, Cream `#F5EFE6`.
- **Type:** Display `Fraunces` / `Instrument Serif`; Body `Inter` / `Söhne`-like; Mono `IBM Plex Mono`.
- **Rhythm:** Soft large radii (16–24px), layered shadows, tactile, friendly-but-premium.
- **Best for:** Consumer apps, lifestyle, creative tools, onboarding.

## 3. Editorial (Stripe / Notion)
- **Palette:** Paper `#FFFFFF`, Ink `#1A1F36`, Slate `#425466`, Accent `#635BFF` (Stripe purple) or `#0A85D1`; Line `#E3E8EE`.
- **Type:** Display `Söhne` / `Camphor` (or `General Sans`); Body `Inter`; Mono `Berkeley Mono`-like.
- **Rhythm:** Strong typographic hierarchy, ruled sections, data-dense but airy, precise 8px grid.
- **Best for:** Fintech, docs, marketing with credibility cues.

## 4. Dark Private-Client (real estate / finance / wealth) — DEFAULT for "premium"
- **Palette:** Bg `#0A0B0E`, Surface `rgba(255,255,255,.035)`, Solid `#141519`, Line `rgba(255,255,255,.08)`, Ink `#F3F4F6`, Muted `#7E828E`, **Accent `#C9A24B`** (surgical warm bronze — NOT neon, NOT purple), Slate `#6E8BA8`, Good `#5BB98C`, Warn `#D98B5F`, Rose `#C76B7E`.
- **Type:** Display `Fraunces` (serif, **only on big numbers**) / Body `Inter`; pairing gives the "private-bank" feel without going decorative.
- **Rhythm:** Near-black canvas + two radial ambient glows (warm + cool), glassy blurred cards that lift on hover, one sparing accent, real charts/sparklines/donut, subtle motion.
- **Best for:** Real estate CRM, finance, wealth, "private client", luxury — any brief where trust + exclusivity matter. **This is the default for "premium / modern / sophisticated" briefs** (see `premium-direction-playbook.md`). It dodges all three AI-slop defaults while reading as premium.

## 5. Dark-Luxe (premium product / portfolio)
- **Palette:** Void `#0A0A0B`, Graphite `#1A1A1D`, Pearl `#EDEDED`, Accent `#D4AF37` (muted gold) or `#E8C547`; Muted `#6B6B70`.
- **Type:** Display `Playfair Display` / `Cormorant`; Body `Inter` / `Spline Sans`; Mono `Space Mono`.
- **Rhythm:** High contrast, thin rules, lots of black, one metallic accent, cinematic hero.
- **Best for:** Portfolios, luxury, agencies, launch pages.

## 6. Boutique E-Commerce (Luxury fashion / storefront)
- **Palette:** Ivory `#FAF9F6`, Obsidian `#111111`, Clay `#C2410C` (muted terracotta) or Gold `#D4AF37` used sparingly; Border `#E5E5E5`.
- **Type:** Display `Cormorant Garamond` (italicized, elegant) / Body `Plus Jakarta Sans` or `Inter`.
- **Rhythm:** Extreme whitespace, full-aspect zoom-on-hover images, floating slide-over shopping drawers, and thin 1px separators.
- **Best for:** Luxury storefronts, fashion catalogs, designer merchandise checkouts.

## 7. Neo-Brutalist (Indie-Hacker / Figma-style utility)
- **Palette:** Bone `#FBFBFA`, Ink `#000000`, Pastels (Lavender `#E0D7FF`, Mint `#E3F9E9`, Butter `#FFF7D6`).
- **Type:** Display `Clash Display` / `Syne`; Body `Space Grotesk` or `Plus Jakarta Sans`.
- **Rhythm:** Sharp 2px solid black borders, flat solid black shadow offsets (`shadow-[4px_4px_0px_#000000]`), zero gradients, zero rounded button pills.
- **Best for:** Indie hacker startups, bold creative utilities, design portfolio indexes.

## 8. Conversational AI Workspace (Chat / Custom Agents)
- **Palette:** Void `#09090B`, Input `#18181B`, Slate Line `#27272A`, Text `#F4F4F5`, Accent `#3F3F46` or glowing surgical cyan `#06B6D4`.
- **Type:** Display `Geist Sans` / `Cabinet Grotesk`; Body `Geist` or `Inter`; Mono `Geist Mono`.
- **Rhythm:** Centered prompt input bars with subtle highlights, responsive collateral sidebars with collapsible drawer links, streaming text blocks, and fluid bubble hover transitions.
- **Best for:** Conversational bots, custom editor dashboards, AI-chat canvases.

## 9. Organics & Wellness (Apple-esque Light / Calm App style)
- **Palette:** Sage background `#E2ECE9`, Canvas Bone `#FAF9F6`, Muted Charcoal `#2D312E`, Forest Accent `#2F5233` or Pale Rose `#F5E6E8`.
- **Type:** Display `Outfit` / `Cabinet Grotesk`; Body `Inter` or `Plus Jakarta Sans`.
- **Rhythm:** Large soft rounded borders (20-32px), deep diffused low-opacity ambient shadows, soothing color overlays, and highly generous whitespace paddings.
- **Best for:** Healthcare, mindfulness apps, organic e-commerce, environmental utilities.

## 10. Terminal Hacker & Retro-Tech (Command Line / Developer Docs)
- **Palette:** Terminal Black `#0A0A0A`, CRT Green `#33FF33` (or Amber `#FFB000`), Muted Grey `#555555`, Dark Border `#1C1C1C`.
- **Type:** 100% Monospace: `JetBrains Mono` / `SF Mono` / `Geist Mono`.
- **Rhythm:** Strict monospaced vertical rhythm grids, ascii border decorations, terminal-command prompt symbols, zero rounded corners, glowing text blurs.
- **Best for:** Hacker command lines, developer document hubs, server status monitors.

> Add new systems here as you curate them. Each entry must be self-contained (palette + type + rhythm + best-for).

## Typography Loaders & Fallback Configuration

To prevent standard system fallbacks from making premium designs look cheap, use these copy-pasteable configurations:

### 1. Next.js App Router Setup (`next/font/google`)
Load the fonts in your root layout `src/app/layout.tsx` and pass them as CSS variables:

```typescript
import { Inter, Geist, Geist_Mono, Instrument_Serif, Fraunces, Playfair_Display, Cormorant_Garamond, Plus_Jakarta_Sans, Space_Grotesk, Outfit } from "next/font/google";

// Minimal-Tech / Conversational AI Fonts
export const geistSans = Geist({ subsets: ["latin"], variable: "--font-body" });
export const geistMono = Geist_Mono({ subsets: ["latin"], variable: "--font-mono" });

// Display Serifs (Warm-Sophisticate / Dark Private-Client / Luxe / Boutique)
export const instrumentSerif = Instrument_Serif({ weight: "400", subsets: ["latin"], variable: "--font-display" });
export const fraunces = Fraunces({ subsets: ["latin"], variable: "--font-display" });
export const playfairDisplay = Playfair_Display({ subsets: ["latin"], variable: "--font-display" });
export const cormorantGaramond = Cormorant_Garamond({ weight: "400", subsets: ["latin"], variable: "--font-display" });

// Display Sans & Body Alternates (Organics / Brutalist / Boutique)
export const plusJakartaSans = Plus_Jakarta_Sans({ subsets: ["latin"], variable: "--font-body" });
export const spaceGrotesk = Space_Grotesk({ subsets: ["latin"], variable: "--font-body" });
export const outfit = Outfit({ subsets: ["latin"], variable: "--font-display" });
```

### 2. Google Fonts HTML Imports (Vite / Static HTML)
Include these standard Google Font imports in your `<head>` block:

```html
<!-- Google Fonts Imports -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Instrument+Serif&family=Fraunces:ital,opsz,wght@0,9..144,100..900;1,9..144,100..900&family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Cormorant+Garamond:ital,wght@0,300..700;1,300..700&family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&family=Space+Grotesk:wght@300..700&family=Outfit:wght@100..900&family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
```

### 3. Font Pairings CSS Custom Properties Mapping
Ensure the display and body variables map correctly in `globals.css`:

```css
/* Boutique E-Commerce mapping */
:root {
  --font-display: 'Cormorant Garamond', Georgia, serif;
  --font-body: 'Plus Jakarta Sans', 'Inter', system-ui, sans-serif;
}

/* Neo-Brutalist mapping */
:root {
  --font-display: 'Clash Display', 'Syne', sans-serif;
  --font-body: 'Space Grotesk', system-ui, sans-serif;
}

/* Organics / Wellness mapping */
:root {
  --font-display: 'Outfit', sans-serif;
  --font-body: 'Inter', system-ui, sans-serif;
}
```
