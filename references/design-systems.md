# Bundled Premium Design Systems

During variant exploration, each candidate must use exactly one system, though different candidates may explore different compatible systems. After the user selects a candidate, lock EXACTLY ONE system for the final brief and build. Never mix two systems inside a candidate or final implementation.

## Effects contract rule
Every system owns its background, surfaces, navigation, containers, elevation, and motion. Apply the whole contract, not merely its colors and fonts. There are no global glass, glow, card, radius, shadow, or animation defaults. If an effect is listed as forbidden for the selected system, remove it from scaffolds and inherited components.

## 1. Minimal-Tech (Linear / Vercel)
- **Palette:** Ink `#0B0B0F`, Surface `#16161A`, Mist `#F7F8FA`, Accent `#5E6AD2` (Linear indigo), Muted `#8A8F98`.
- **Type:** Display `Inter Tight` / `Geist`; Body `Inter` / `Geist`; Mono `Geist Mono` / `JetBrains Mono`.
- **Rhythm:** Tight 4px grid, hairline 1px dividers, generous negative space, subtle gradients only on hero glow.
- **Effects contract:** Raw near-black background; unblurred solid surfaces; restrained top navigation or compact sidebar; rules and negative space replace floating cards; little or no shadow; fast opacity/position transitions.
- **Forbidden:** Glassmorphism, metallic accents, double-bezel cards, soft consumer shadows, decorative ambient glows beyond one restrained hero glow.
- **Signature spatial move:** Hairline `1px` horizontal rules divide every section; inline monospace badges sit flush in text; hero has a single subtle radial glow — everything else is raw negative space. If you add a drop shadow or a rounded pill button, it stops being Minimal-Tech.
- **Best for:** SaaS dashboards, dev tools, productivity apps.

## 2. Warm-Sophisticate (Arc / Raycast)
- **Palette:** Cocoa `#1C1410`, Sand `#EDE6DD`, Clay `#C2410C`-ish terracotta accent used sparingly, Gold `#B8893B`, Cream `#F5EFE6`.
- **Type:** Display `Fraunces` / `Instrument Serif`; Body `Inter` / `Söhne`-like; Mono `IBM Plex Mono`.
- **Rhythm:** Soft large radii (16–24px), layered shadows, tactile, friendly-but-premium.
- **Effects contract:** Warm tonal background; layered translucent panels; friendly navigation integrated into the first surface; rounded containers with visibly stepped depth; soft warm shadows; tactile spring-like motion.
- **Forbidden:** Cold finance glass, bronze-on-black luxury treatment, sharp editorial rules, hard offset shadows.
- **Signature spatial move:** Layered translucent panels stacked with visible depth (2–3 z-levels you can feel); a warm ambient glow behind the primary action area; rounded everything — if an element has a sharp corner, it breaks the system.
- **Best for:** Consumer apps, lifestyle, creative tools, onboarding.

## 3. Editorial (Stripe / Notion)
- **Palette:** Paper `#FFFFFF`, Ink `#1A1F36`, Slate `#425466`, Accent `#635BFF` (Stripe purple) or `#0A85D1`; Line `#E3E8EE`.
- **Type:** Display `Instrument Sans` (Google-available; `Söhne` / `General Sans` if you have a license); Body `Inter`; Mono `Geist Mono`.
- **Rhythm:** Strong typographic hierarchy, ruled sections, data-dense but airy, precise 8px grid.
- **Effects contract:** Paper background; opaque surfaces; typographic top navigation; full-width ruled bands and bordered data grids instead of cards; no drop shadows; restrained underline and reveal motion.
- **Forbidden:** Glassmorphism, ambient glows, bento-card dashboards, double bezels, hover lift on every container.
- **Signature spatial move:** Hero headline is oversized (clamp 3rem–6rem) with a ruled `1px` underline; content breaks into full-width ruled horizontal bands — not cards. Tabular data sits in bordered grids, not floating panels. The typography IS the layout; if you use cards instead of rules, it stops being Editorial.
- **Best for:** Fintech, docs, marketing with credibility cues.

## 4. Dark Private-Client (real estate / finance / wealth)
- **Palette:** Bg `#0A0B0E`, Surface `rgba(255,255,255,.035)`, Solid `#141519`, Line `rgba(255,255,255,.08)`, Ink `#F3F4F6`, Muted `#7E828E`, **Accent `#C9A24B`** (surgical warm bronze — NOT neon, NOT purple), Slate `#6E8BA8`, Good `#5BB98C`, Warn `#D98B5F`, Rose `#C76B7E`.
- **Type:** Display `Fraunces` (serif, **only on big numbers**) / Body `Inter`; pairing gives the "private-bank" feel without going decorative.
- **Rhythm:** Near-black canvas + two radial ambient glows (warm + cool), glassy blurred cards that lift on hover, one sparing accent, real charts/sparklines/donut, subtle motion.
- **Effects contract:** Near-black layered background; translucent glass surfaces; restrained glass navigation; concentric cards only where hierarchy benefits; soft dark elevation with subtle inset highlights; slow hover lift and chart motion.
- **Forbidden:** Bright consumer gradients, neon accents, glass on every nested element, serif body copy, decorative gold used without a private-client rationale.
- **Signature spatial move:** Two large `blur(80px)` radial glows pinned behind the content layer (one warm top-left, one cool bottom-right) on a near-black canvas; selected cards may use glass (`backdrop-filter: blur(8px)` + translucent surface) and lift `translateY(-4px)` on hover. Serif (Fraunces) appears ONLY on hero KPI numbers, nowhere else.
- **Best for:** Private-client wealth and luxury relationship products where you can write one sentence on why *this* product needs discretion. Not high-volume agent CRMs, community tools, or anything that only said "premium."

## 5. Dark-Luxe (premium product / portfolio)
- **Palette:** Void `#0A0A0B`, Graphite `#1A1A1D`, Pearl `#EDEDED`, Accent `#D4AF37` (muted gold) or `#E8C547`; Muted `#6B6B70`.
- **Type:** Display `Playfair Display` / `Cormorant`; Body `Inter` / `Spline Sans`; Mono `Space Mono`.
- **Rhythm:** High contrast, thin rules, lots of black, one metallic accent, cinematic hero.
- **Effects contract:** Deep black cinematic background; opaque graphite surfaces; minimal transparent navigation; image-led or typographic single-column sections; almost no card elevation; slow cinematic reveal.
- **Forbidden:** Dashboard bento grids, widespread glass cards, multiple gold highlights at one level, playful spring motion.
- **Signature spatial move:** Full-viewport cinematic hero with a single large product image or typographic lockup at 80–100dvh; below the fold everything collapses to narrow single-column with extreme vertical whitespace between items. The gold accent appears on exactly one element per screen — never twice at the same level.
- **Best for:** Portfolios, luxury, agencies, launch pages.

## 6. Boutique E-Commerce (Luxury fashion / storefront)
- **Palette:** Ivory `#FAF9F6`, Obsidian `#111111`, Clay `#C2410C` (muted terracotta) or Gold `#D4AF37` used sparingly; Border `#E5E5E5`.
- **Type:** Display `Cormorant Garamond` (italicized, elegant) / Body `Plus Jakarta Sans` or `Inter`.
- **Rhythm:** Extreme whitespace, full-aspect zoom-on-hover images, floating slide-over shopping drawers, and thin 1px separators.
- **Effects contract:** Ivory editorial background; flat opaque surfaces; minimal top navigation; full-bleed imagery and slide-over drawers instead of cards; no shadows except the drawer edge; image zoom and drawer motion only.
- **Forbidden:** Glassmorphism, ambient glows, rounded cards, bento grids, floating metric panels.
- **Signature spatial move:** Full-bleed portrait-aspect product photography (no border-radius, no shadow) as the primary visual; a slide-over drawer handles cart/detail — nothing navigates away. Zero border-radius on every element; `1px` separators only; price in an elegant serif. If you use a card grid, it stops being Boutique.
- **Best for:** Luxury storefronts, fashion catalogs, designer merchandise checkouts.

## 7. Neo-Brutalist (Indie-Hacker / Figma-style utility)
- **Palette:** Bone `#FBFBFA`, Ink `#000000`, Pastels (Lavender `#E0D7FF`, Mint `#E3F9E9`, Butter `#FFF7D6`).
- **Type:** Display `Clash Display` / `Syne`; Body `Space Grotesk` or `Plus Jakarta Sans`.
- **Rhythm:** Sharp 2px solid black borders, flat solid black shadow offsets (`shadow-[4px_4px_0px_#000000]`), zero gradients, zero rounded button pills.
- **Effects contract:** Flat bone background; opaque pastel surfaces; blunt utility navigation; bordered blocks; hard offset shadows without blur; press-in motion that collapses the offset.
- **Forbidden:** Glass, blur, gradients, ambient glow, rounded corners, soft elevation.
- **Signature spatial move:** Every interactive element (button, card, input) has a hard `4px 4px 0 #000` flat shadow offset and a `2px solid #000` border — no blur, no opacity. Hover state shifts the element `translate(4px, 4px)` and removes the shadow (it "presses in"). Zero gradients, zero border-radius. If anything has a rounded corner or a box-shadow with blur, it is not Neo-Brutalist.
- **Best for:** Indie hacker startups, bold creative utilities, design portfolio indexes.

## 8. Conversational AI Workspace (Chat / Custom Agents)
- **Palette:** Void `#09090B`, Input `#18181B`, Slate Line `#27272A`, Text `#F4F4F5`, Accent `#3F3F46` or glowing surgical cyan `#06B6D4`.
- **Type:** Display `Geist Sans` / `Cabinet Grotesk`; Body `Geist` or `Inter`; Mono `Geist Mono`.
- **Rhythm:** Centered prompt input bars with subtle highlights, responsive collateral sidebars with collapsible drawer links, streaming text blocks, and fluid bubble hover transitions.
- **Effects contract:** Dark quiet canvas; solid input and message surfaces; collapsible navigation; the prompt input is the dominant container; subtle focus glow only; fluid streaming and message transitions.
- **Forbidden:** Persistent dense sidebar, metallic accents, decorative ambient glows, KPI bento cards competing with the prompt.
- **Signature spatial move:** A single centered input bar (full-width, pill or rounded-xl, softly glowing on focus) dominates the lower third of the viewport; the upper area is a scrollable message canvas with alternating alignment (user right, assistant left). Nothing competes with the input for visual weight. If you add a sidebar by default, make it collapsible — the input must always feel primary.
- **Best for:** Conversational bots, custom editor dashboards, AI-chat canvases.

## 9. Organics & Wellness (Apple-esque Light / Calm App style)
- **Palette:** Sage background `#E2ECE9`, Canvas Bone `#FAF9F6`, Muted Charcoal `#2D312E`, Forest Accent `#2F5233` or Pale Rose `#F5E6E8`.
- **Type:** Display `Outfit` / `Cabinet Grotesk`; Body `Inter` or `Plus Jakarta Sans`.
- **Rhythm:** Large soft rounded borders (20-32px), deep diffused low-opacity ambient shadows, soothing color overlays, and highly generous whitespace paddings.
- **Effects contract:** Sage and bone color-field background; mostly borderless opaque surfaces; quiet light navigation; sections separated by color shifts rather than cards; very diffuse low-opacity shadows; gentle fade and expansion.
- **Forbidden:** Glassmorphism, metallic accents, dark luxury canvas, double-bezel cards, hard dividers, sharp hover lift.
- **Signature spatial move:** Full-width sage/bone color-wash sections with 80–100px vertical padding between them; no hard lines or borders — sections transition by background color shift only. Illustration or photography bleeds to the section edge with no border-radius clipping. If you use a card with a visible border, it breaks the softness.
- **Best for:** Healthcare, mindfulness apps, organic e-commerce, environmental utilities.

## 10. Terminal Hacker & Retro-Tech (Command Line / Developer Docs)
- **Palette:** Terminal Black `#0A0A0A`, CRT Green `#33FF33` (or Amber `#FFB000`), Muted Grey `#555555`, Dark Border `#1C1C1C`.
- **Type:** 100% Monospace: `JetBrains Mono` / `SF Mono` / `Geist Mono`.
- **Rhythm:** Strict monospaced vertical rhythm grids, ascii border decorations, terminal-command prompt symbols, zero rounded corners, glowing text blurs.
- **Effects contract:** Flat terminal-black background; opaque black surfaces; command-line navigation; ASCII-framed regions; no physical elevation; cursor, type, and restrained text-glow motion.
- **Forbidden:** Proportional fonts, glass, blurred panels, rounded cards, gradient fills, ambient color blobs.
- **Signature spatial move:** Every element snaps to a monospaced character grid; decorative borders are made from ASCII box-drawing characters (`┌──┐`, `│`, `└──┘`); the primary accent (CRT green or amber) is applied as `text-shadow: 0 0 8px currentColor` glow only — never as a fill. Zero border-radius anywhere. If any font is not monospace, it breaks the system immediately.
- **Best for:** Hacker command lines, developer document hubs, server status monitors.

> Add new systems here as you curate them. Each entry must be self-contained (palette + type + rhythm + best-for).

---

## Deriving a new system (when none of the ten fit)

These ten skew professional, corporate and luxury. They do **not** cover children's
education, games, music and media players, social feeds, sports, food, travel, consumer
health, or anything that should feel loud, playful or joyful. Forcing such a brief into
Dark Private-Client or Minimal-Tech produces a serious-looking product that is wrong for
its audience — a worse failure than any slop pattern.

**Derive instead of forcing.** A derived system is a first-class option in Step 3; it is not
"no system." It must be written out with the same completeness as the ten above, and it
locks exactly as hard.

### Trigger
Derive when you cannot complete this sentence honestly: *"System X fits because the product's
audience, emotional register and interaction model all match its Best-for line."* Two out of
three is not a fit.

### Procedure

1. **Name it** — a real name that states the register: "Playground Bright", "Studio Print",
   "Field Utility". A named system can be violated; an unnamed vibe cannot.
2. **Write the eight-part contract**, in this order and completely:
   - **Palette** — 4–6 named hex values, 60/30/10 allocation stated
   - **Type** — display + body + optional mono, each with a *usage rule* ("display on hero numbers only")
   - **Rhythm** — spacing base unit, grid, density register
   - **Background treatment** — what the canvas is
   - **Surface / container model** — cards? bands? borderless fields? bordered grids?
   - **Elevation** — how many levels, borders or shadows
   - **Motion character** — durations and easing register
   - **Forbidden effects** — at least four, and they must have teeth. "No glass, no ambient
     glow, no bezel, no hover lift" is a real contract; "avoid clutter" is not.
3. **Write the signature spatial move** — the one paragraph that says what makes this system
   recognisable, ending in the sentence "If you do X, it stops being <Name>."
4. **Sanity-check against anti-slop** — a derived system is not a licence to ship the
   banned defaults. Run `anti-slop-rules.md` against the contract itself before locking.
5. **Record it in the worksheet** §3 in full, and append it to this file if it is reusable.

### Derivation shortcuts that are legitimate

- **Re-register an existing system.** Organics with a brighter, higher-chroma palette and a
  rounder display face becomes a credible children's-app system while keeping Organics'
  borderless-color-field contract. State the parent and exactly what you changed.
- **Invert a system.** Editorial on a dark canvas with the same ruled-band contract is a
  distinct, coherent direction.
- **Constrain a system.** Minimal-Tech with monospace numerals everywhere and no accent at
  all is a legitimate "instrument panel" derivation.

What is **not** legitimate: taking one system's colors, another's typography and a third's
container model. That is not derivation, it is the mixing failure the whole file exists to
prevent.

## Typography Loaders & Fallback Configuration

> **A `font-family` naming a face you never loaded fails silently** — the browser drops to
> the next fallback and the screen renders in Georgia or system-ui. Nothing in the audit
> catches this. Verify the face is actually loaded before you call typography "done."

### 0. Font availability — check before specifying

Not every face named above is loadable from Google Fonts. These are **not** on Google Fonts
and will silently fall back unless you self-host a licensed copy:

| Face named in a system | Source | Google-available substitute to use instead |
|---|---|---|
| Söhne, Camphor | Klim / commercial | **Instrument Sans** (Editorial display) |
| General Sans | Fontshare | **Instrument Sans** |
| Clash Display | Fontshare | **Syne** (Neo-Brutalist display) |
| Cabinet Grotesk | Fontshare | **Outfit** or **Geist** |
| Berkeley Mono | commercial | **Geist Mono** or **JetBrains Mono** |

Everything else named in the ten systems — Inter, Inter Tight, Geist, Geist Mono, Fraunces,
Instrument Serif, Playfair Display, Cormorant Garamond, Plus Jakarta Sans, Space Grotesk,
Space Mono, Syne, Outfit, Spline Sans, JetBrains Mono, IBM Plex Mono, Fira Code — is on
Google Fonts. `scripts/scaffold-html.sh` already loads the correct set per system.

### 1. Next.js App Router Setup (`next/font/google`)

Load **only the two or three faces your locked system needs** — not the whole list. Each
loaded family costs a network request and a render-blocking decision.

```typescript
// src/app/layout.tsx
import { Fraunces, Inter } from "next/font/google";

// One face per ROLE. Two faces both assigned variable:"--font-display" would
// collide — whichever class lands last on <html> wins, silently.
const display = Fraunces({ subsets: ["latin"], variable: "--font-display", display: "swap" });
const body    = Inter({ subsets: ["latin"], variable: "--font-body", display: "swap" });

export default function RootLayout({ children }: { children: React.ReactNode }) {
  // The .variable classes MUST be applied to <html> (or <body>) — defining the
  // font objects without mounting their classes loads nothing.
  return (
    <html lang="en" className={`${display.variable} ${body.variable}`}>
      <body>{children}</body>
    </html>
  );
}
```

Swap the two imports per system: `Inter_Tight`+`Inter` (Minimal-Tech), `Instrument_Sans`+`Inter`
(Editorial), `Playfair_Display`+`Inter` (Dark-Luxe), `Cormorant_Garamond`+`Plus_Jakarta_Sans`
(Boutique), `Syne`+`Space_Grotesk` (Neo-Brutalist), `Outfit`+`Inter` (Organics),
`Geist`+`Geist` (Conversational AI), `JetBrains_Mono` alone (Terminal).

### 2. Google Fonts HTML Imports (Vite / Static HTML)

> ⚠️ **Trim this to your system's two faces before shipping.** The line below loads eight
> families — roughly 300KB of render-blocking font CSS and a guaranteed Lighthouse
> performance hit. It is a menu to copy *from*, not a tag to paste as-is.
> `scripts/scaffold-html.sh` already emits the correct trimmed URL per system.

```html
<!-- Google Fonts Imports — DELETE every family your locked system does not use -->
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
  --font-display:  'Instrument Sans', 'General Sans', sans-serif;
  --font-body:     'Inter', system-ui, sans-serif;
  --font-mono:     'Geist Mono', 'Fira Code', monospace;
  --radius-base:   0.5rem;
}

/* ── 4. Dark Private-Client ───────────────────────────── */
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
>
> **Tailwind v4:** paste the declarations inside `@theme { … }` instead of `:root { … }` —
> same variable names, straight swap of the wrapper. That emits the tokens into `:root`
> (so `var(--color-bg)` still works) *and* generates `bg-bg` / `text-ink` / `font-display`
> utilities. Do **not** write both a `:root` block and `@theme { --color-ink: var(--color-ink) }`;
> that is a self-reference that resolves to nothing as soon as the `:root` block sits in a
> cascade layer. If you need the indirection, give the two sides different names
> (`:root{--ink:…}` + `@theme inline{--color-ink:var(--ink)}`).
