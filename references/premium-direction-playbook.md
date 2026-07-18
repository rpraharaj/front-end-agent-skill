# Premium Direction Playbook

`design-systems.md` gives you palettes. This file tells you **which direction to actually ship** when the brief says "premium / modern / sophisticated" — and which one quietly fails. It exists because a compliant, anti-slop UI was rejected as "lame / generic SaaS" in the reference session. The fix was a *distinctive direction* plus *real craft signals*, not more rules.

## The trap: "compliant" ≠ "premium"
A UI can pass every anti-slop and a11y check and still read as a generic SaaS template: flat white cards, all-Inter type, numbers in boxes, no motion, no depth. That is the exact output that got rejected. Premium is a *direction*, not a checklist.

## Proven direction: Dark Private-Client
Used for a real-estate CRM mockup that passed the user's "premium" bar. Why it works: a near-black canvas + a single warm accent dodges **all three AI-slop defaults** (cream/serif/terracotta, black/acid-green, broadsheet hairlines) while feeling like private-banking software.

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
Add a light-mode override (`:root.light{ --bg:#F4F5F7; --surface:rgba(255,255,255,.85); ... }`) behind a theme toggle.

### Craft signals that sell "premium"
1. **Dark canvas + ambient glow** — two radial-gradients (one warm, one cool) behind a near-black base. Never flat gray.
2. **Glass cards** — translucent surface + `backdrop-filter: blur(8px)` + soft inset highlight; lift on hover.
3. **Serif display (Fraunces) only on big numbers** — the "private bank" feel without going decorative everywhere. Body stays Inter.
4. **Real data viz, not stat boxes** — area/line charts, per-KPI sparklines, a donut for mix, progress bars. Trust comes from data.
5. **One accent, used sparingly** — bronze on logo, primary button, chart line only.
6. **Motion & depth** — hover lift/translate, gradient depth on buttons, a `⌘K` command-palette hint.

### When to use
Real estate, finance, wealth, "private client", luxury — any brief where trust + exclusivity matter. **Default to this for those.** Reserve light/editorial for docs-heavy products.

## Other directions (shorthand)
- **Minimal-Tech (Linear/Vercel):** great for dev tools, BUT rendered plainly it *is* the generic-SaaS look. Only pick it for explicitly dev/productivity briefs, and add a signature element + motion.
- **Warm-Sophisticate (Arc/Raycast):** consumer/lifestyle; softer radii, tactile.
- **Editorial (Stripe/Notion):** fintech/docs with credibility cues; light, ruled, 8px grid.
- **Dark-Luxe (portfolio):** muted gold `#D4AF37` + Playfair; product/portfolio, not dashboards.

## Verify a single-file HTML UI without a live browser
When the browser toolchain is unavailable:
1. Extract the `<script>` block and run `node --check` (catches JS syntax errors).
2. Assert HTML tag balance (every `<section>`/`<div>`/`<svg>` open/close pair).
3. Run `scripts/audit-ui.sh <dir>` (reduced-motion, focus-visible, no placeholder copy, slop flags).

Never claim a screenshot you could not produce — state the checks you ran instead.

## Build it as a real app, not a static mockup
For "make it interactive / fully interactive" briefs, the difference between a mockup and an app is **state + event wiring**:
- Render every section from JS data arrays; never hardcode table rows.
- Give every nav item its **own view** (toggle `hidden` on `<section>` blocks) — a nav that only toasts is a decoy.
- Wire modals/drawers/palette to real handlers; advance-stage and add-listing must **mutate the data array and re-render**, not just toast.
- Reuse one chart/drawer/toast core across views.

## Premium Implementation Recipes (Copy-Pasteable Boilerplates)

These visual construction patterns are tested to produce extremely high-end haptic designs instantly.

### 1. The Concentric "Double-Bezel" Card (Tailwind CSS)
Avoid placing flat containers on raw backgrounds. Use nested bezels with nested concentric border radii ($R_{\text{inner}} = R_{\text{outer}} - \text{Padding}$) and inset gradients:

```html
<!-- Outer Shell Container (R_outer = 24px/1.5rem, padding = 8px/0.5rem) -->
<div class="p-2 bg-white/[0.02] border border-white/[0.06] rounded-[24px]">
  <!-- Inner Core Container (R_inner = 24 - 8 = 16px/1rem) -->
  <div class="p-6 bg-[#141519]/90 border border-white/[0.04] shadow-[inset_0_1px_1.5px_rgba(255,255,255,0.06)] rounded-[16px]">
    <!-- Card content goes here -->
  </div>
</div>
```

### 2. Ambient radial-glow background (Dark Private-Client / Tech-Luxe)
To avoid standard flat gray backgrounds, layer warm and cool radial gradients behind content:

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
Premium feel comes from depth that responds to interaction. The lift + subtle glow on hover signals "this is interactive" without screaming. The `will-change: transform` prevents paint jitter.

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
Data trust — even a tiny 60×24 sparkline on a KPI card signals "this is real data." No chart library needed. Use `tabular-nums` on the label to prevent column jitter.

```html
<!-- KPI card with sparkline — Dark Private-Client palette -->
<div class="card-lift p-2 bg-white/[0.02] border border-white/[0.06] rounded-[24px]">
  <div class="p-5 bg-[#141519]/90 border border-white/[0.04] rounded-[16px]">
    <p class="text-[#7E828E] text-xs tracking-wide uppercase mb-1">Revenue MTD</p>
    <p class="text-[#F3F4F6] text-2xl font-[Fraunces] tabular-nums mb-3">$248,391</p>
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
A command palette is a craft signal — it says "power users live here." Even a static demonstration of the pattern lifts the perceived sophistication of any dashboard. Wire it to real search on any key handler.

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
