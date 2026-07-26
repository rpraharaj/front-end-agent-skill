# Subject-Led Direction Playbook

`design-systems.md` supplies complete visual contracts. This file helps choose **which direction fits the subject** when a brief says "premium / modern / sophisticated." Those words describe execution quality, not a palette or effect. Never infer dark mode, glass, glow, bronze, luxury, or card-heavy composition from them.

## The trap: "compliant" ≠ "premium"
A UI can pass every anti-slop and a11y check and still read as a generic SaaS template: flat white cards, all-Inter type, numbers in boxes, no motion, no depth. Premium is deliberate execution of an appropriate direction, not a checklist or a reusable visual costume.

## Subject-led selection matrix

| Product need | Strong candidates | Avoid assuming |
|---|---|---|
| Dense operational dashboard or technical workflow | Minimal-Tech, Editorial | Glass, luxury styling, decorative serif |
| Welcoming, human, community-oriented service | Warm-Sophisticate, Organics | Dark finance styling, metallic accents |
| Documentation, credibility, structured content | Editorial | Bento-card dashboards, ambient glow |
| Trust, discretion, exclusivity, private high-value relationships | Dark Private-Client | Bright consumer styling |
| Luxury product storytelling or portfolio | Dark-Luxe, Boutique | Dense operational dashboard patterns |
| Bold creative utility | Neo-Brutalist | Soft glass or diffused gradients |
| Conversation-first workflow | Conversational AI | Persistent dense navigation competing with input |
| Developer terminal or server operations | Terminal Hacker | Proportional typography, rounded cards |

Choose from the product's domain, audience, emotional tone, content density, and primary interaction. If two systems fit, recommend one and explain the tradeoff. Do not combine them.

## Dark Private-Client recipe
Use this only when the product genuinely serves private, high-value, trust-sensitive relationships such as wealth, private real estate, or luxury client services. Its near-black canvas and warm accent are system-specific tools, not general premium defaults.

### Tokens (verified in the reference build — copy directly)
```
--bg:#0A0B0E; --surface:rgba(255,255,255,.035); --solid:#141519;
--line:rgba(255,255,255,.08); --ink:#F3F4F6; --ink-2:#C7C9D1; --muted:#7E828E;
--accent:#C9A24B;                 /* surgical warm bronze — NOT neon, NOT purple */
--accent-soft:rgba(201,162,75,.14);
--slate:#6E8BA8; --good:#5BB98C; --warn:#D98B5F; --rose:#C76B7E;
--d-display:"Fraunces",Georgia,serif;   /* serif ONLY on hero numbers */
--d-body:"Inter",system-ui,sans-serif;
```
Add a light-mode override behind a theme toggle using the `[data-theme]` convention in
`references/token-cheatsheet.md` §8 — `:root[data-theme="light"]{ --bg:#F4F5F7; --surface:rgba(255,255,255,.85); … }`.
Use that one convention everywhere; do not mix it with a `.light` class.

### Craft signals that sell "premium"
1. **Dark canvas + ambient glow** — two radial-gradients (one warm, one cool) behind a near-black base. Never flat gray.
2. **Glass cards** — translucent surface + `backdrop-filter: blur(8px)` + soft inset highlight; lift on hover.
3. **Serif display (Fraunces) only on big numbers** — the "private bank" feel without going decorative everywhere. Body stays Inter.
4. **Real data viz, not stat boxes** — area/line charts, per-KPI sparklines, a donut for mix, progress bars. Trust comes from data.
5. **One accent, used sparingly** — bronze on logo, primary button, chart line only.
6. **Motion & depth** — hover lift/translate, gradient depth on buttons, a `⌘K` command-palette hint.

### When to use
Consider it when discretion, exclusivity, and high-value relationships are *actual product qualities* —
private wealth, private real estate, luxury client services.

**It is a candidate, never a default.** Domain alone does not select it: a real-estate
product for high-volume agents wants Minimal-Tech or a Table-First console; a
community credit union wants Warm-Sophisticate. Run the selection matrix above on
audience, density, and primary interaction before reaching for this. If you cannot
write one sentence on why *this* product needs discretion, pick a different system.

## Other directions (shorthand)
- **Minimal-Tech (Linear/Vercel):** great for dev tools, BUT rendered plainly it *is* the generic-SaaS look. Only pick it for explicitly dev/productivity briefs, and add a signature element + motion.
- **Warm-Sophisticate (Arc/Raycast):** consumer/lifestyle; softer radii, tactile.
- **Editorial (Stripe/Notion):** fintech/docs with credibility cues; light, ruled, 8px grid.
- **Dark-Luxe (portfolio):** muted gold `#D4AF37` + Playfair; product/portfolio, not dashboards.

## Verify a single-file HTML UI — fallback only, when no browser exists

> **Render first.** If any browser or screenshot tool is available, use it —
> `bash scripts/shoot.sh <file>` or your own browser tooling, then run the rubric in
> `references/critique-loop.md`. Looking at the rendered screen is the highest-leverage
> quality check available and nothing below substitutes for it. The steps here are what you
> fall back to when rendering is genuinely impossible.

When the browser toolchain is unavailable:
1. Extract the `<script>` block and run `node --check` (catches JS syntax errors).
2. Assert HTML tag balance (every `<section>`/`<div>`/`<svg>` open/close pair).
3. Run `scripts/audit-ui.sh <dir>` (reduced-motion, focus-visible, breakpoints, alt text, no placeholder copy, slop flags).
4. State explicitly that the UI was **not** visually verified, and which checks you ran instead.

Never claim a screenshot you could not produce.

## Build it as a real app, not a static mockup
For "make it interactive / fully interactive" briefs, the difference between a mockup and an app is **state + event wiring**:
- Render every section from JS data arrays; never hardcode table rows.
- Give every nav item its **own view** (toggle `hidden` on `<section>` blocks) — a nav that only toasts is a decoy.
- Wire modals/drawers/palette to real handlers; advance-stage and add-listing must **mutate the data array and re-render**, not just toast.
- Reuse one chart/drawer/toast core across views.

## System-Scoped Implementation Recipes

> ⛔ **These are not a house style and not a shortcut to "premium."** Each recipe belongs
> to specific systems and is **explicitly forbidden** in others by `references/design-systems.md`.
> Applying them by default is the exact failure this skill exists to prevent — it produces
> the dark-glass-and-bronze look on every brief regardless of subject.
>
> **Gate before using any recipe below:** name the locked system from Step 3, then confirm
> the recipe's "Belongs to" line includes it. If it doesn't, do not use the recipe — build
> the equivalent from that system's own effects contract instead.

| Recipe | Belongs to | Forbidden in |
|---|---|---|
| 1. Double-bezel card | Dark Private-Client, Warm-Sophisticate | Minimal-Tech, Editorial, Organics, Boutique, Neo-Brutalist, Terminal |
| 2. Ambient radial glow | Dark Private-Client | Editorial, Organics, Boutique, Terminal, Neo-Brutalist, Minimal-Tech (beyond one hero glow) |
| 3. Glassmorphism nav | Dark Private-Client, Warm-Sophisticate | Editorial, Boutique, Organics, Neo-Brutalist, Terminal, Minimal-Tech |
| 4. Hover-lift card | Dark Private-Client, Warm-Sophisticate, Minimal-Tech (subtle) | Editorial, Dark-Luxe, Boutique, Organics |
| 5. Skeleton loading | Any system — restyle the shimmer to the locked palette | — |
| 6. Inline SVG sparkline | Any data-bearing system — restyle to the locked palette | — |
| 7. Command palette | Command-Bar-First architectures, Minimal-Tech, Dark Private-Client | Boutique, Organics, Dark-Luxe |

**Equivalents when a recipe is forbidden.** Editorial gets hierarchy from ruled bands and
oversized type, not bezels. Organics separates sections by background color shift, not glass.
Neo-Brutalist uses a hard `4px 4px 0 #000` offset, not a soft lift. Terminal uses ASCII
box-drawing frames. Boutique uses full-bleed imagery and a slide-over drawer. Each system's
"Signature spatial move" in `design-systems.md` is the recipe for that system.

### 1. The Concentric "Double-Bezel" Card (Tailwind CSS)
*Belongs to: Dark Private-Client, Warm-Sophisticate. Forbidden elsewhere — see table above.*

Within those systems, avoid placing flat containers on raw backgrounds. Use nested bezels with nested concentric border radii ($R_{\text{inner}} = R_{\text{outer}} - \text{Padding}$) and inset gradients:

```html
<!-- Outer Shell Container (R_outer = 24px/1.5rem, padding = 8px/0.5rem) -->
<div class="p-2 bg-white/[0.02] border border-white/[0.06] rounded-[24px]">
  <!-- Inner Core Container (R_inner = 24 - 8 = 16px/1rem) -->
  <div class="p-6 bg-[#141519]/90 border border-white/[0.04] shadow-[inset_0_1px_1.5px_rgba(255,255,255,0.06)] rounded-[16px]">
    <!-- Card content goes here -->
  </div>
</div>
```

### 2. Ambient radial-glow background
*Belongs to: Dark Private-Client only. Forbidden in Editorial, Organics, Boutique, Terminal, Neo-Brutalist; Minimal-Tech permits at most one restrained hero glow.*

Within that system, layer warm and cool radial gradients behind content instead of a flat gray field:

```html
<div class="relative min-h-[100dvh] bg-[#0A0B0E] text-[#F3F4F6] overflow-hidden">
  <!-- Warm Amber Glow (Top-Left) -->
  <div class="pointer-events-none absolute top-[-10%] left-[-10%] w-[50%] h-[50%] rounded-full bg-[radial-gradient(circle,rgba(201,162,75,0.07)_0%,transparent_70%)] blur-[80px]"></div>
  <!-- Cool Slate/Slate Glow (Bottom-Right) -->
  <div class="pointer-events-none absolute bottom-[-10%] right-[-10%] w-[60%] h-[60%] rounded-full bg-[radial-gradient(circle,rgba(110,139,168,0.05)_0%,transparent_70%)] blur-[100px]"></div>

  <!-- Content Layer -->
  <div class="relative z-10">
    <!-- Main page markup -->
  </div>
</div>
```

### 3. Glassmorphism Navigation Bar
*Belongs to: Dark Private-Client, Warm-Sophisticate. Forbidden in Editorial, Boutique, Organics, Neo-Brutalist, Terminal, Minimal-Tech — those use an opaque or unblurred nav.*

```html
<nav class="sticky top-0 z-50 w-full border-b border-white/[0.06] bg-[#0A0B0E]/60 backdrop-blur-md">
  <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
    <div class="flex h-16 items-center justify-between">
      <!-- nav links -->
    </div>
  </div>
</nav>
```

### 4. Hover-Lift Card Animation (with `prefers-reduced-motion` guard)
*Belongs to: Dark Private-Client, Warm-Sophisticate, Minimal-Tech (2px, not 4px). Forbidden in Editorial, Dark-Luxe, Boutique, Organics — "hover lift on every container" is named in their forbidden lists.*

In those systems, depth that responds to interaction signals "this is interactive" without screaming. The `will-change: transform` prevents paint jitter.

```css
/* In globals.css — define once, reuse everywhere */
.card-lift {
  transition: transform 220ms ease, box-shadow 220ms ease;
  will-change: transform;
}
.card-lift:hover {
  transform: translateY(-4px);
  box-shadow: 0 16px 40px rgba(0, 0, 0, 0.35), 0 0 0 1px rgba(255,255,255,0.06);
}
@media (prefers-reduced-motion: reduce) {
  .card-lift {
    transition: none;
  }
  .card-lift:hover {
    transform: none;
    /* Keep the border glow — it's not motion */
    box-shadow: 0 0 0 1px rgba(255,255,255,0.1);
  }
}
```

```html
<!-- Usage (Tailwind equivalent) -->
<div class="card-lift p-2 bg-white/[0.02] border border-white/[0.06] rounded-[24px] cursor-pointer">
  <!-- card content -->
</div>
```

### 5. Skeleton Loading State
*Belongs to: any system — but restyle the shimmer and the container to the locked palette. The markup below uses Dark Private-Client tokens and a double-bezel wrapper; strip both if your system forbids them.*

Skeletons signal "content is coming" and prevent jarring blank-white flashes. The shimmer animation uses a moving gradient that respects `prefers-reduced-motion` (degrades to a static pulse).

```html
<!-- Skeleton card — matches the double-bezel card dimensions -->
<div class="p-2 bg-white/[0.02] border border-white/[0.06] rounded-[24px] overflow-hidden">
  <div class="p-6 bg-[#141519]/90 border border-white/[0.04] rounded-[16px] space-y-4">
    <!-- Avatar skeleton -->
    <div class="skeleton h-10 w-10 rounded-full"></div>
    <!-- Title skeleton -->
    <div class="skeleton h-5 w-3/4 rounded-md"></div>
    <!-- Body skeletons -->
    <div class="skeleton h-4 w-full rounded-md"></div>
    <div class="skeleton h-4 w-5/6 rounded-md"></div>
  </div>
</div>

<style>
  .skeleton {
    background: linear-gradient(
      90deg,
      rgba(255,255,255,0.04) 25%,
      rgba(255,255,255,0.08) 50%,
      rgba(255,255,255,0.04) 75%
    );
    background-size: 200% 100%;
    animation: shimmer 1.6s infinite linear;
  }
  @keyframes shimmer {
    0%   { background-position: 200% 0; }
    100% { background-position: -200% 0; }
  }
  @media (prefers-reduced-motion: reduce) {
    .skeleton {
      animation: none;
      background: rgba(255,255,255,0.05);
    }
  }
</style>
```

### 6. Inline SVG Sparkline / Mini-Chart
*Belongs to: any data-bearing system — swap the hardcoded hexes below for your locked tokens. The wrapper shown is Dark Private-Client; replace it with your system's container model.*

Data trust — even a tiny 60×24 sparkline on a KPI card signals "this is real data." No chart library needed. Use `tabular-nums` on the label to prevent column jitter.

```html
<!-- KPI card with sparkline — Dark Private-Client palette -->
<div class="card-lift p-2 bg-white/[0.02] border border-white/[0.06] rounded-[24px]">
  <div class="p-5 bg-[#141519]/90 border border-white/[0.04] rounded-[16px]">
    <p class="text-[#7E828E] text-xs tracking-wide uppercase mb-1">Revenue MTD</p>
    <!-- font-[family-name:…] is required in Tailwind v4; bare font-[Fraunces] is parsed as a font-weight and silently does nothing. -->
    <p class="text-[#F3F4F6] text-2xl font-[family-name:var(--font-display)] tabular-nums mb-3">$248,391</p>
    <!-- Sparkline SVG — replace polyline points with real data coordinates -->
    <svg viewBox="0 0 120 32" width="120" height="32" aria-hidden="true" style="overflow:visible">
      <!-- Area fill -->
      <defs>
        <linearGradient id="sg" x1="0" y1="0" x2="0" y2="1">
          <stop offset="0%" stop-color="#C9A24B" stop-opacity="0.25"/>
          <stop offset="100%" stop-color="#C9A24B" stop-opacity="0"/>
        </linearGradient>
      </defs>
      <polygon
        points="0,28 12,22 24,24 36,18 48,20 60,14 72,16 84,10 96,12 108,6 120,8 120,32 0,32"
        fill="url(#sg)"
      />
      <!-- Line -->
      <polyline
        points="0,28 12,22 24,24 36,18 48,20 60,14 72,16 84,10 96,12 108,6 120,8"
        fill="none"
        stroke="#C9A24B"
        stroke-width="1.5"
        stroke-linecap="round"
        stroke-linejoin="round"
      />
      <!-- Terminal dot -->
      <circle cx="120" cy="8" r="3" fill="#C9A24B"/>
    </svg>
    <p class="text-[#5BB98C] text-xs mt-1">↑ 12.4% vs last month</p>
  </div>
</div>
```

**Adapting to real data:** Map your data array to SVG coordinates with:
```js
// points: data[], width: 120, height: 32
function toSparkPoints(data, w, h) {
  const min = Math.min(...data), max = Math.max(...data);
  return data.map((v, i) => {
    const x = (i / (data.length - 1)) * w;
    const y = h - ((v - min) / (max - min || 1)) * (h - 4) - 2;
    return `${x.toFixed(1)},${y.toFixed(1)}`;
  }).join(' ');
}
```

### 7. Command-Palette `⌘K` Dialog
*Belongs to: Command-Bar-First architectures, Minimal-Tech, Dark Private-Client. Forbidden in Boutique, Organics, Dark-Luxe — a power-user affordance on a browsing surface is decoration.*

A command palette is a craft signal for products where people work daily — it says "power users live here." Do not add one to a marketing page or storefront.

**Accessibility requirement before shipping this:** the markup below opens a `aria-modal="true"` dialog but does **not** trap focus or make the background inert — Tab escapes to the page behind it, which fails the a11y floor. Either use a native `<dialog>` with `.showModal()` (focus trap and inertness for free), or add an explicit focus trap and `inert` on the page wrapper. The version below is a layout starting point, not a finished component.

```html
<!-- ⌘K overlay: toggle .hidden on the wrapper via JS -->
<div id="cmd-palette" class="hidden fixed inset-0 z-[100] flex items-start justify-center pt-[18vh]" role="dialog" aria-modal="true" aria-label="Command palette">
  <!-- Scrim -->
  <div id="cmd-scrim" class="absolute inset-0 bg-black/50 backdrop-blur-sm" onclick="closePalette()"></div>
  <!-- Panel -->
  <div class="relative w-full max-w-xl mx-4 bg-[#141519] border border-white/[0.08] rounded-2xl shadow-2xl overflow-hidden">
    <!-- Search bar -->
    <div class="flex items-center gap-3 px-4 py-3 border-b border-white/[0.06]">
      <svg class="w-4 h-4 text-[#7E828E] shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/></svg>
      <input id="cmd-input" type="text" placeholder="Search or jump to…" autocomplete="off"
        class="flex-1 bg-transparent text-[#F3F4F6] placeholder-[#7E828E] text-sm outline-none" />
      <kbd class="text-[10px] text-[#7E828E] bg-white/[0.06] px-1.5 py-0.5 rounded font-mono">ESC</kbd>
    </div>
    <!-- Results list -->
    <ul class="max-h-72 overflow-y-auto py-2" role="listbox">
      <li class="px-4 py-2 text-[0.7rem] text-[#7E828E] uppercase tracking-widest">Suggested</li>
      <li role="option" tabindex="0"
        class="flex items-center gap-3 px-4 py-2.5 text-sm text-[#C7C9D1] hover:bg-white/[0.05] focus:bg-white/[0.05] rounded-lg mx-1 cursor-pointer outline-none focus-visible:ring-1 focus-visible:ring-[#C9A24B]">
        <svg class="w-4 h-4 text-[#7E828E]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" aria-hidden="true"><path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>
        Dashboard
      </li>
      <!-- Repeat <li> items for each command -->
    </ul>
  </div>
</div>

<script>
  // Wire ⌘K / Ctrl+K
  document.addEventListener('keydown', e => {
    if ((e.metaKey || e.ctrlKey) && e.key === 'k') { e.preventDefault(); openPalette(); }
    if (e.key === 'Escape') closePalette();
  });
  function openPalette() {
    document.getElementById('cmd-palette').classList.remove('hidden');
    setTimeout(() => document.getElementById('cmd-input').focus(), 10);
  }
  function closePalette() {
    document.getElementById('cmd-palette').classList.add('hidden');
  }
</script>
```
