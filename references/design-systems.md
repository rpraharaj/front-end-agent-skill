# Bundled Premium Design Systems

Pick EXACTLY ONE per brief. Each supplies palette + type + spacing rhythm so output is cohesive by construction. Never mix two.

## 1. Minimal-Tech (Linear / Vercel)
- **Palette:** Ink `#0B0B0F`, Surface `#16161A`, Mist `#F7F8FA`, Accent `#5E6AD2` (Linear indigo), Muted `#8A8F98`.
- **Type:** Display `Inter Tight` / `Geist`; Body `Inter` / `Geist`; Mono `Geist Mono` / `JetBrains Mono`.
- **Rhythm:** Tight 4px grid, hairline 1px dividers, generous negative space, subtle gradients only on hero glow.
- **Signature spatial move:** Hairline `1px` horizontal rules divide every section; inline monospace badges sit flush in text; hero has a single subtle radial glow — everything else is raw negative space. If you add a drop shadow or a rounded pill button, it stops being Minimal-Tech.
- **Best for:** SaaS dashboards, dev tools, productivity apps.

## 2. Warm-Sophisticate (Arc / Raycast)
- **Palette:** Cocoa `#1C1410`, Sand `#EDE6DD`, Clay `#C2410C`-ish terracotta accent used sparingly, Gold `#B8893B`, Cream `#F5EFE6`.
- **Type:** Display `Fraunces` / `Instrument Serif`; Body `Inter` / `Söhne`-like; Mono `IBM Plex Mono`.
- **Rhythm:** Soft large radii (16–24px), layered shadows, tactile, friendly-but-premium.
- **Signature spatial move:** Layered translucent panels stacked with visible depth (2–3 z-levels you can feel); a warm ambient glow behind the primary action area; rounded everything — if an element has a sharp corner, it breaks the system.
- **Best for:** Consumer apps, lifestyle, creative tools, onboarding.

## 3. Editorial (Stripe / Notion)
- **Palette:** Paper `#FFFFFF`, Ink `#1A1F36`, Slate `#425466`, Accent `#635BFF` (Stripe purple) or `#0A85D1`; Line `#E3E8EE`.
- **Type:** Display `Söhne` / `Camphor` (or `General Sans`); Body `Inter`; Mono `Berkeley Mono`-like.
- **Rhythm:** Strong typographic hierarchy, ruled sections, data-dense but airy, precise 8px grid.
- **Signature spatial move:** Hero headline is oversized (clamp 3rem–6rem) with a ruled `1px` underline; content breaks into full-width ruled horizontal bands — not cards. Tabular data sits in bordered grids, not floating panels. The typography IS the layout; if you use cards instead of rules, it stops being Editorial.
- **Best for:** Fintech, docs, marketing with credibility cues.

## 4. Dark Private-Client (real estate / finance / wealth) — DEFAULT for "premium"
- **Palette:** Bg `#0A0B0E`, Surface `rgba(255,255,255,.035)`, Solid `#141519`, Line `rgba(255,255,255,.08)`, Ink `#F3F4F6`, Muted `#7E828E`, **Accent `#C9A24B`** (surgical warm bronze — NOT neon, NOT purple), Slate `#6E8BA8`, Good `#5BB98C`, Warn `#D98B5F`, Rose `#C76B7E`.
- **Type:** Display `Fraunces` (serif, **only on big numbers**) / Body `Inter`; pairing gives the "private-bank" feel without going decorative.
- **Rhythm:** Near-black canvas + two radial ambient glows (warm + cool), glassy blurred cards that lift on hover, one sparing accent, real charts/sparklines/donut, subtle motion.
- **Signature spatial move:** Two large `blur(80px)` radial glows pinned behind the content layer (one warm top-left, one cool bottom-right) on a near-black canvas; all cards are glass (`backdrop-filter: blur(8px)` + translucent surface) and lift `translateY(-4px)` on hover. Serif (Fraunces) appears ONLY on hero KPI numbers, nowhere else. See `references/premium-direction-playbook.md` for verified copy-paste boilerplate.
- **Best for:** Real estate CRM, finance, wealth, "private client", luxury — any brief where trust + exclusivity matter. **This is the default for "premium / modern / sophisticated" briefs** (see `premium-direction-playbook.md`). It dodges all three AI-slop defaults while reading as premium.

## 5. Dark-Luxe (premium product / portfolio)
- **Palette:** Void `#0A0A0B`, Graphite `#1A1A1D`, Pearl `#EDEDED`, Accent `#D4AF37` (muted gold) or `#E8C547`; Muted `#6B6B70`.
- **Type:** Display `Playfair Display` / `Cormorant`; Body `Inter` / `Spline Sans`; Mono `Space Mono`.
- **Rhythm:** High contrast, thin rules, lots of black, one metallic accent, cinematic hero.
- **Signature spatial move:** Full-viewport cinematic hero with a single large product image or typographic lockup at 80–100dvh; below the fold everything collapses to narrow single-column with extreme vertical whitespace between items. The gold accent appears on exactly one element per screen — never twice at the same level.
- **Best for:** Portfolios, luxury, agencies, launch pages.

## 6. Boutique E-Commerce (Luxury fashion / storefront)
- **Palette:** Ivory `#FAF9F6`, Obsidian `#111111`, Clay `#C2410C` (muted terracotta) or Gold `#D4AF37` used sparingly; Border `#E5E5E5`.
- **Type:** Display `Cormorant Garamond` (italicized, elegant) / Body `Plus Jakarta Sans` or `Inter`.
- **Rhythm:** Extreme whitespace, full-aspect zoom-on-hover images, floating slide-over shopping drawers, and thin 1px separators.
- **Signature spatial move:** Full-bleed portrait-aspect product photography (no border-radius, no shadow) as the primary visual; a slide-over drawer handles cart/detail — nothing navigates away. Zero border-radius on every element; `1px` separators only; price in an elegant serif. If you use a card grid, it stops being Boutique.
- **Best for:** Luxury storefronts, fashion catalogs, designer merchandise checkouts.

## 7. Neo-Brutalist (Indie-Hacker / Figma-style utility)
- **Palette:** Bone `#FBFBFA`, Ink `#000000`, Pastels (Lavender `#E0D7FF`, Mint `#E3F9E9`, Butter `#FFF7D6`).
- **Type:** Display `Clash Display` / `Syne`; Body `Space Grotesk` or `Plus Jakarta Sans`.
- **Rhythm:** Sharp 2px solid black borders, flat solid black shadow offsets (`shadow-[4px_4px_0px_#000000]`), zero gradients, zero rounded button pills.
- **Signature spatial move:** Every interactive element (button, card, input) has a hard `4px 4px 0 #000` flat shadow offset and a `2px solid #000` border — no blur, no opacity. Hover state shifts the element `translate(4px, 4px)` and removes the shadow (it "presses in"). Zero gradients, zero border-radius. If anything has a rounded corner or a box-shadow with blur, it is not Neo-Brutalist.
- **Best for:** Indie hacker startups, bold creative utilities, design portfolio indexes.

## 8. Conversational AI Workspace (Chat / Custom Agents)
- **Palette:** Void `#09090B`, Input `#18181B`, Slate Line `#27272A`, Text `#F4F4F5`, Accent `#3F3F46` or glowing surgical cyan `#06B6D4`.
- **Type:** Display `Geist Sans` / `Cabinet Grotesk`; Body `Geist` or `Inter`; Mono `Geist Mono`.
- **Rhythm:** Centered prompt input bars with subtle highlights, responsive collateral sidebars with collapsible drawer links, streaming text blocks, and fluid bubble hover transitions.
- **Signature spatial move:** A single centered input bar (full-width, pill or rounded-xl, softly glowing on focus) dominates the lower third of the viewport; the upper area is a scrollable message canvas with alternating alignment (user right, assistant left). Nothing competes with the input for visual weight. If you add a sidebar by default, make it collapsible — the input must always feel primary.
- **Best for:** Conversational bots, custom editor dashboards, AI-chat canvases.

## 9. Organics & Wellness (Apple-esque Light / Calm App style)
- **Palette:** Sage background `#E2ECE9`, Canvas Bone `#FAF9F6`, Muted Charcoal `#2D312E`, Forest Accent `#2F5233` or Pale Rose `#F5E6E8`.
- **Type:** Display `Outfit` / `Cabinet Grotesk`; Body `Inter` or `Plus Jakarta Sans`.
- **Rhythm:** Large soft rounded borders (20-32px), deep diffused low-opacity ambient shadows, soothing color overlays, and highly generous whitespace paddings.
- **Signature spatial move:** Full-width sage/bone color-wash sections with 80–100px vertical padding between them; no hard lines or borders — sections transition by background color shift only. Illustration or photography bleeds to the section edge with no border-radius clipping. If you use a card with a visible border, it breaks the softness.
- **Best for:** Healthcare, mindfulness apps, organic e-commerce, environmental utilities.

## 10. Terminal Hacker & Retro-Tech (Command Line / Developer Docs)
- **Palette:** Terminal Black `#0A0A0A`, CRT Green `#33FF33` (or Amber `#FFB000`), Muted Grey `#555555`, Dark Border `#1C1C1C`.
- **Type:** 100% Monospace: `JetBrains Mono` / `SF Mono` / `Geist Mono`.
- **Rhythm:** Strict monospaced vertical rhythm grids, ascii border decorations, terminal-command prompt symbols, zero rounded corners, glowing text blurs.
- **Signature spatial move:** Every element snaps to a monospaced character grid; decorative borders are made from ASCII box-drawing characters (`┌──┐`, `│`, `└──┘`); the primary accent (CRT green or amber) is applied as `text-shadow: 0 0 8px currentColor` glow only — never as a fill. Zero border-radius anywhere. If any font is not monospace, it breaks the system immediately.
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

### 3. CSS Custom Properties — All 10 Systems (copy-paste `:root` blocks)
Copy the block for your chosen system into `globals.css`. Every system exposes the same variable names so layout code works across systems without changes.

```css
/* ── 1. Minimal-Tech (Linear / Vercel) ─────────────────────── */
:root {
  --color-bg:      #0B0B0F;
  --color-surface: #16161A;
  --color-solid:   #1E1E24;
  --color-line:    rgba(255,255,255,0.07);
  --color-ink:     #F7F8FA;
  --color-muted:   #8A8F98;
  --color-accent:  #5E6AD2;        /* Linear indigo */
  --font-display:  'Inter Tight', 'Geist', sans-serif;
  --font-body:     'Inter', 'Geist', sans-serif;
  --font-mono:     'Geist Mono', 'JetBrains Mono', monospace;
  --radius-base:   0.5rem;
}

/* ── 2. Warm-Sophisticate (Arc / Raycast) ───────────────────── */
:root {
  --color-bg:      #1C1410;
  --color-surface: #251C16;
  --color-solid:   #2E231B;
  --color-line:    rgba(255,255,255,0.06);
  --color-ink:     #EDE6DD;
  --color-muted:   #A09080;
  --color-accent:  #B8893B;        /* warm gold */
  --font-display:  'Fraunces', 'Instrument Serif', Georgia, serif;
  --font-body:     'Inter', system-ui, sans-serif;
  --font-mono:     'IBM Plex Mono', monospace;
  --radius-base:   1.25rem;
}

/* ── 3. Editorial (Stripe / Notion) ────────────────────────── */
:root {
  --color-bg:      #FFFFFF;
  --color-surface: #F7F8FA;
  --color-solid:   #F0F2F5;
  --color-line:    #E3E8EE;
  --color-ink:     #1A1F36;
  --color-muted:   #425466;
  --color-accent:  #635BFF;        /* Stripe purple */
  --font-display:  'General Sans', 'Söhne', sans-serif;
  --font-body:     'Inter', system-ui, sans-serif;
  --font-mono:     'Berkeley Mono', 'Fira Code', monospace;
  --radius-base:   0.5rem;
}

/* ── 4. Dark Private-Client ★ DEFAULT for "premium" ────────── */
:root {
  --color-bg:      #0A0B0E;
  --color-surface: rgba(255,255,255,0.035);
  --color-solid:   #141519;
  --color-line:    rgba(255,255,255,0.08);
  --color-ink:     #F3F4F6;
  --color-ink-2:   #C7C9D1;
  --color-muted:   #7E828E;
  --color-accent:  #C9A24B;        /* surgical warm bronze */
  --color-accent-soft: rgba(201,162,75,0.14);
  --color-slate:   #6E8BA8;
  --color-good:    #5BB98C;
  --color-warn:    #D98B5F;
  --color-rose:    #C76B7E;
  --font-display:  'Fraunces', Georgia, serif;   /* ONLY on big numbers */
  --font-body:     'Inter', system-ui, sans-serif;
  --font-mono:     'Geist Mono', monospace;
  --radius-base:   1rem;
}

/* ── 5. Dark-Luxe (premium product / portfolio) ─────────────── */
:root {
  --color-bg:      #0A0A0B;
  --color-surface: #141415;
  --color-solid:   #1A1A1D;
  --color-line:    rgba(255,255,255,0.06);
  --color-ink:     #EDEDED;
  --color-muted:   #6B6B70;
  --color-accent:  #D4AF37;        /* muted gold */
  --font-display:  'Playfair Display', 'Cormorant', Georgia, serif;
  --font-body:     'Spline Sans', 'Inter', system-ui, sans-serif;
  --font-mono:     'Space Mono', monospace;
  --radius-base:   0.25rem;
}

/* ── 6. Boutique E-Commerce (luxury fashion / storefront) ────── */
:root {
  --color-bg:      #FAF9F6;
  --color-surface: #FFFFFF;
  --color-solid:   #F5F4F1;
  --color-line:    #E5E5E5;
  --color-ink:     #111111;
  --color-muted:   #888888;
  --color-accent:  #D4AF37;        /* restrained gold */
  --font-display:  'Cormorant Garamond', Georgia, serif;
  --font-body:     'Plus Jakarta Sans', 'Inter', system-ui, sans-serif;
  --font-mono:     'IBM Plex Mono', monospace;
  --radius-base:   0rem;           /* zero radius — fashion editorial */
}

/* ── 7. Neo-Brutalist (Indie-Hacker / utility) ──────────────── */
:root {
  --color-bg:      #FBFBFA;
  --color-surface: #FFFFFF;
  --color-solid:   #F5F5F4;
  --color-line:    #000000;        /* hard black borders */
  --color-ink:     #000000;
  --color-muted:   #555555;
  --color-accent:  #E0D7FF;        /* lavender pastel */
  --color-accent-2: #E3F9E9;      /* mint pastel */
  --font-display:  'Clash Display', 'Syne', sans-serif;
  --font-body:     'Space Grotesk', 'Plus Jakarta Sans', system-ui, sans-serif;
  --font-mono:     'Space Mono', monospace;
  --radius-base:   0rem;           /* zero radius — brutalist */
}

/* ── 8. Conversational AI Workspace ────────────────────────── */
:root {
  --color-bg:      #09090B;
  --color-surface: #18181B;
  --color-solid:   #27272A;
  --color-line:    rgba(255,255,255,0.06);
  --color-ink:     #F4F4F5;
  --color-muted:   #A1A1AA;
  --color-accent:  #06B6D4;        /* surgical cyan */
  --font-display:  'Geist Sans', 'Cabinet Grotesk', system-ui, sans-serif;
  --font-body:     'Geist', 'Inter', system-ui, sans-serif;
  --font-mono:     'Geist Mono', monospace;
  --radius-base:   0.75rem;
}

/* ── 9. Organics & Wellness (Apple-esque / Calm) ───────────── */
:root {
  --color-bg:      #E2ECE9;
  --color-surface: #FAF9F6;
  --color-solid:   #F0EDE8;
  --color-line:    rgba(45,49,46,0.12);
  --color-ink:     #2D312E;
  --color-muted:   #6B7268;
  --color-accent:  #2F5233;        /* forest green */
  --font-display:  'Outfit', 'Cabinet Grotesk', sans-serif;
  --font-body:     'Inter', 'Plus Jakarta Sans', system-ui, sans-serif;
  --font-mono:     'IBM Plex Mono', monospace;
  --radius-base:   1.5rem;
}

/* ── 10. Terminal Hacker & Retro-Tech ───────────────────────── */
:root {
  --color-bg:      #0A0A0A;
  --color-surface: #111111;
  --color-solid:   #1C1C1C;
  --color-line:    #1C1C1C;
  --color-ink:     #33FF33;        /* CRT green */
  --color-muted:   #555555;
  --color-accent:  #FFB000;        /* amber */
  --font-display:  'JetBrains Mono', 'SF Mono', monospace;
  --font-body:     'Geist Mono', 'JetBrains Mono', monospace;
  --font-mono:     'JetBrains Mono', monospace;
  --radius-base:   0rem;           /* zero radius — terminal aesthetic */
}
```

> **How to use:** Copy the matching block, paste into your `globals.css` or `<style>` tag, then reference tokens as `var(--color-bg)`, `var(--font-display)`, etc. throughout all components. Never hardcode hex values in component files — always go through these variables so the system remains swappable.

