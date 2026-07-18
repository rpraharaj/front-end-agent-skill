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
