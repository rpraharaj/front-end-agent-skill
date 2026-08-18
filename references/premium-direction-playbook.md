# Subject-Led Direction Playbook

`design-systems.md` supplies complete visual contracts and tokens. This file helps choose
**which direction fits the subject** when a brief says "premium / modern / sophisticated."
Those words describe execution quality, not a palette or effect. Never infer dark mode,
glass, glow, bronze, luxury, or card-heavy composition from them.

## The trap: "compliant" ≠ "premium"
A UI can pass every anti-slop and a11y check and still read as a generic SaaS template: flat white cards, all-Inter type, numbers in boxes, no motion, no depth. Premium is deliberate execution of an appropriate direction, not a checklist or a reusable visual costume.

**The other trap:** treating Dark Private-Client as the house style. Near-black + bronze + glass is one system for one kind of product. A care queue, a high-volume sales CRM, and a docs site that ship in that costume have failed the selection, even if the pixels are polished.

## Subject-led selection matrix

| Product need | Strong candidates | Avoid assuming |
|---|---|---|
| Dense operational dashboard or technical workflow | Minimal-Tech, Editorial | Glass, luxury styling, decorative serif |
| High-volume CRM, queue, inbox, care coordination | Minimal-Tech, Editorial, Organics | Dark Private-Client, Dark-Luxe |
| Welcoming, human, community-oriented service | Warm-Sophisticate, Organics | Dark finance styling, metallic accents |
| Documentation, credibility, structured content | Editorial | Bento-card dashboards, ambient glow |
| Trust, discretion, exclusivity, *stated* private high-value relationships | Dark Private-Client | Bright consumer styling; also do not pick this from the word "CRM" alone |
| Luxury product storytelling or portfolio | Dark-Luxe, Boutique | Dense operational dashboard patterns |
| Bold creative utility | Neo-Brutalist | Soft glass or diffused gradients |
| Conversation-first workflow | Conversational AI | Persistent dense navigation competing with input |
| Developer terminal or server operations | Terminal Hacker | Proportional typography, rounded cards |

Choose from the product's domain, audience, emotional tone, content density, and primary interaction. If two systems fit, recommend one and explain the tradeoff. Do not combine them.

## Craft cards (same weight)

Tokens, type, and forbidden lists live in `references/design-systems.md`. Do not copy another system's hexes into these recipes. Each card is: when, the one spatial move, one build, one don't.

### Minimal-Tech
- **When:** Dev tools, productivity, high-volume agent CRM, dense tables. Not "because it looks like Linear."
- **Move:** Hairline `1px` rules and negative space replace cards. One restrained hero glow at most.
- **Build:** The table or action list *is* the surface — recipe 1.
- **Don't:** Glass, bronze, Fraunces, double bezels, a five-card KPI row (`F1` / `F13`).

### Editorial
- **When:** Review, docs, credibility, weekly records, light operational overviews.
- **Move:** Typography is the layout. Full-width ruled bands, not floating cards.
- **Build:** Recipe 2. Tabular data sits in a bordered grid, flush with the band.
- **Don't:** Glass, ambient glow, hover-lift on every container, bento KPI dashboards.

### Organics
- **When:** Community, care, wellness, human service. Church / school / clinic ops that should feel warm, not clinical.
- **Move:** Sections separate by background color shift. No hard cards, no hairline chrome.
- **Build:** Recipe 3. Generous vertical padding; the selected person or action is the only highlight.
- **Don't:** Finance glass, metallic accents, dark luxury canvas, a node-graph of a to-do list (`F3`).

### Dark Private-Client
- **When:** Only if you can write one sentence on why *this* product needs discretion (private wealth, private-client real estate, luxury relationship work). High-volume listings and community CRMs do not qualify.
- **Move:** Near-black canvas, two radial glows, glass on *selected* cards, Fraunces on hero KPI numbers only.
- **Build:** Recipes 7–9. Tokens stay in `design-systems.md`.
- **Don't:** Pick it because the brief said "premium," "CRM," or "real estate."

Warm-Sophisticate, Dark-Luxe, Boutique, Neo-Brutalist, Conversational AI, and Terminal use the same discipline: lock the contract in `design-systems.md`, then build that system's signature spatial move. Do not borrow DPC glass to make them "feel premium."

## Verify a single-file HTML UI — fallback only, when no browser exists

> **Render first.** If any browser or screenshot tool is available, use it —
> `bash scripts/shoot.sh <file>` or your own browser tooling, then run the rubric in
> `references/critique-loop.md` with the defects in `references/critique-fails.md`.
> Looking at the rendered screen is the highest-leverage quality check available and
> nothing below substitutes for it.

When the browser toolchain is unavailable:
1. Extract the `<script>` block and run `node --check` (catches JS syntax errors).
2. Assert HTML tag balance (every `<section>`/`<div>`/`<svg>` open/close pair).
3. Run `scripts/audit-ui.sh <dir>`.
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
> Applying Dark Private-Client recipes by default is the failure this skill exists to prevent.
>
> **Gate before using any recipe below:** name the locked system from Step 3, then confirm
> the recipe's "Belongs to" line includes it. If it doesn't, do not use the recipe — build
> the equivalent from that system's own effects contract instead.

| Recipe | Belongs to | Forbidden in |
|---|---|---|
| 1. Hairline data row | Minimal-Tech, Editorial (tables) | Organics, Boutique, Dark-Luxe, Neo-Brutalist |
| 2. Ruled band | Editorial | Dark Private-Client glass cards, Organics color fields as a substitute |
| 3. Color-field section | Organics | Minimal-Tech, Editorial, Terminal, Neo-Brutalist |
| 4. Skeleton loading | Any — restyle to the locked palette and container | — |
| 5. Inline SVG sparkline | Any data-bearing system — restyle to locked tokens | Do not wrap in a DPC bezel unless that system is locked |
| 6. Command palette | Command-Bar-First, Minimal-Tech, Dark Private-Client | Boutique, Organics, Dark-Luxe |
| 7. Double-bezel card | Dark Private-Client, Warm-Sophisticate | Minimal-Tech, Editorial, Organics, Boutique, Neo-Brutalist, Terminal |
| 8. Ambient radial glow | Dark Private-Client | Editorial, Organics, Boutique, Terminal, Neo-Brutalist, Minimal-Tech (beyond one hero glow) |
| 9. Glassmorphism nav | Dark Private-Client, Warm-Sophisticate | Editorial, Boutique, Organics, Neo-Brutalist, Terminal, Minimal-Tech |
| 10. Hover-lift card | Dark Private-Client, Warm-Sophisticate, Minimal-Tech (2px) | Editorial, Dark-Luxe, Boutique, Organics |

Markup below uses `var(--color-*)` from the locked system. Hardcoded bronze / near-black appears only in recipes 7–9.

### 1. Hairline data row
*Belongs to: Minimal-Tech, Editorial tables. Forbidden in Organics (use color fields) and Boutique (use imagery).*

The list is the UI. No card around the table.

```html
<ul class="m-0 p-0" style="border-top: 1px solid var(--color-line)">
  <li class="flex items-center gap-3 py-2" style="border-bottom: 1px solid var(--color-line)">
    <button type="button" class="flex-1 text-left min-h-11">
      <span class="block" style="color: var(--color-ink)">Follow up with Maria Thompson</span>
      <span class="block text-sm" style="color: var(--color-muted)">Prayer request · May 11</span>
    </button>
    <span class="tabular-nums text-sm" style="color: var(--color-muted)">May 18</span>
  </li>
</ul>
```

Selected row: a 3px start-edge rule in `var(--color-accent)`, not a filled card. That is the signature for a queue.

### 2. Ruled band
*Belongs to: Editorial. Forbidden as a glass/bezel substitute in other systems.*

```html
<section class="py-10" style="border-top: 1px solid var(--color-line); border-bottom: 1px solid var(--color-line)">
  <h2 class="text-3xl m-0 mb-4" style="font-family: var(--font-display); color: var(--color-ink)">
    Next actions
  </h2>
  <!-- recipe 1 table sits flush in the band — not in a card -->
</section>
```

If you put this band inside a rounded elevated card, it stops being Editorial.

### 3. Color-field section
*Belongs to: Organics. Forbidden in Minimal-Tech and Editorial (those use rules, not washes).*

```html
<section class="px-8 py-20" style="background: var(--color-bg); color: var(--color-ink)">
  <p class="m-0 mb-2 text-sm" style="color: var(--color-muted)">This week</p>
  <p class="m-0 text-5xl tabular-nums" style="font-family: var(--font-display)">128</p>
  <p class="mt-2 mb-0" style="color: var(--color-muted)">People cared for</p>
</section>
```

Next section uses `var(--color-surface)` or `var(--color-solid)` — no `1px` divider, no card radius. If you add a border, it breaks Organics.

### 4. Skeleton loading
*Belongs to: any system. Restyle to the locked palette. Do not use a double-bezel wrapper unless recipe 7 is allowed.*

```html
<div class="space-y-3" aria-hidden="true">
  <div class="skeleton h-10 w-10 rounded-full"></div>
  <div class="skeleton h-5 w-3/4"></div>
  <div class="skeleton h-4 w-full"></div>
</div>
<style>
  .skeleton {
    border-radius: 4px;
    background: color-mix(in srgb, var(--color-ink) 8%, transparent);
  }
  @media (prefers-reduced-motion: no-preference) {
    .skeleton {
      background: linear-gradient(
        90deg,
        color-mix(in srgb, var(--color-ink) 6%, transparent) 25%,
        color-mix(in srgb, var(--color-ink) 12%, transparent) 50%,
        color-mix(in srgb, var(--color-ink) 6%, transparent) 75%
      );
      background-size: 200% 100%;
      animation: shimmer 1.6s infinite linear;
    }
    @keyframes shimmer {
      to { background-position: -200% 0; }
    }
  }
</style>
```

### 5. Inline SVG sparkline
*Belongs to: any data-bearing system. Put it in that system's container, not a DPC bezel.*

```html
<figure class="m-0">
  <figcaption class="text-sm mb-1" style="color: var(--color-muted)">People cared for · 7 days</figcaption>
  <p class="text-2xl tabular-nums m-0 mb-2" style="color: var(--color-ink)">128</p>
  <svg viewBox="0 0 120 32" width="120" height="32" aria-hidden="true">
    <polyline
      points="0,28 20,22 40,24 60,14 80,16 100,10 120,8"
      fill="none"
      stroke="var(--color-accent)"
      stroke-width="1.5"
      stroke-linecap="round"
      stroke-linejoin="round"
    />
  </svg>
</figure>
```

Use `tabular-nums` on the label. Map real data to points; do not invent fake-precise series.

### 6. Command-palette `⌘K`
*Belongs to: Command-Bar-First, Minimal-Tech, Dark Private-Client. Forbidden on Boutique, Organics, Dark-Luxe, and marketing pages.*

Use a native `<dialog>` with `.showModal()` so focus trap and inertness come for free. Style with locked tokens. Do not copy a bronze ring unless Dark Private-Client is locked.

### 7. Concentric double-bezel card
*Belongs to: Dark Private-Client, Warm-Sophisticate. Forbidden elsewhere.*

```html
<div class="p-2 rounded-[24px]" style="background: color-mix(in srgb, var(--color-ink) 2%, transparent); border: 1px solid var(--color-line)">
  <div class="p-6 rounded-[16px]" style="background: var(--color-solid); border: 1px solid var(--color-line)">
    <!-- content -->
  </div>
</div>
```

Inner radius = outer radius − padding. Equal nested radii look wrong.

### 8. Ambient radial glow
*Belongs to: Dark Private-Client only.*

```html
<div class="relative min-h-[100dvh] overflow-hidden" style="background: var(--color-bg); color: var(--color-ink)">
  <div class="pointer-events-none absolute top-[-10%] left-[-10%] w-1/2 h-1/2 rounded-full blur-[80px]"
       style="background: radial-gradient(circle, color-mix(in srgb, var(--color-accent) 12%, transparent), transparent 70%)"></div>
  <div class="relative z-10"><!-- content --></div>
</div>
```

One warm glow is enough if a second hue is not in the token plan. Do not add this to Editorial or Organics "for depth."

### 9. Glass navigation
*Belongs to: Dark Private-Client, Warm-Sophisticate. Forbidden in Minimal-Tech, Editorial, Organics, Boutique, Neo-Brutalist, Terminal.*

```html
<nav class="sticky top-0 z-50 w-full" style="border-bottom: 1px solid var(--color-line); background: color-mix(in srgb, var(--color-bg) 60%, transparent); backdrop-filter: blur(12px)">
  <div class="flex h-16 items-center justify-between px-6"><!-- links --></div>
</nav>
```

Provide a solid `var(--color-bg)` fallback under `prefers-reduced-transparency`.

### 10. Hover-lift
*Belongs to: Dark Private-Client and Warm-Sophisticate at 4px; Minimal-Tech at 2px. Forbidden in Editorial, Dark-Luxe, Boutique, Organics.*

```css
.card-lift { transition: transform 220ms ease; }
.card-lift:hover { transform: translateY(-4px); } /* Minimal-Tech: -2px */
@media (prefers-reduced-motion: reduce) {
  .card-lift, .card-lift:hover { transition: none; transform: none; }
}
```
