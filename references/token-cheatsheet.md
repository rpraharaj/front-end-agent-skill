# Token Cheatsheet (premium UI)

How to build a cohesive palette + type scale for a brief. Use this alongside
`templates/design-brief.md`. The goal: tokens that *feel* intentional and hang
together, not a random grab of pretty colors.

## 1. Color — the 60/30/10 discipline
A premium surface is mostly neutral with one accent doing the heavy lifting.
- **60% base/background** — a single neutral you commit to (near-white OR near-black; not both fighting). Name it (e.g. "Mist #F5F6F8" or "Ink #0B0B0F").
- **30% surface/structure** — one step away from base for cards, dividers, rules.
- **10% accent** — ONE accent, used with restraint (buttons, links, the signature). Saturated but not neon.
- **Muted** — a desaturated version of ink for secondary text/captions (aim ≥ 4.5:1 contrast on base).

Rule: if you need a second accent, you didn't pick a strong enough first one.

## 2. Type — roles, not fonts
Assign each role deliberately; 2 faces max (3 only if data/mono is essential).
- **Display** — characterful, used *sparingly* (headlines, the signature). Wide tracking or a distinctive serif/geometric face.
- **Body** — neutral, highly legible at small sizes. This is NOT where personality lives.
- **Mono/utility** — only for data, code, captions, ids.

Deliberate pairing, not Inter-by-default:
- Tech/minimal: `Geist` / `Inter Tight` (display) + `Inter` (body)
- Editorial: `General Sans` / `Camphor` (display) + `Inter` (body)
- Warm/sophisticate: `Fraunces` / `Instrument Serif` (display) + `Inter` (body)
- Dark-luxe: `Playfair Display` / `Cormorant` (display) + `Spline Sans` (body)

## 3. Scale — a real modular scale
Pick a ratio (1.2 minor-third is safe; 1.25 major-third for more drama) and derive:
- xs 0.75rem · sm 0.875 · base 1 · lg 1.125 · xl 1.25 · 2xl 1.5 · 3xl 1.875 · 4xl 2.25 · 5xl 3rem
Set `--step-*` CSS vars so spacing and type share one rhythm.

## 3a. Spacing — the scale that separates amateur from professional

**The #1 tell of an unprofessional UI is arbitrary spacing.** 13px here, 18px there, 22px
somewhere else. Pick one base unit and use only multiples of it — never a value off the scale.

```css
:root {
  --space-1: 0.25rem;  /*  4px — icon gaps, inline nudges     */
  --space-2: 0.5rem;   /*  8px — tight pairs, chip padding    */
  --space-3: 0.75rem;  /* 12px — control padding              */
  --space-4: 1rem;     /* 16px — default gap, card padding sm */
  --space-6: 1.5rem;   /* 24px — card padding, grid gutters   */
  --space-8: 2rem;     /* 32px — between related blocks       */
  --space-12: 3rem;    /* 48px — between sections             */
  --space-16: 4rem;    /* 64px — major section breaks         */
  --space-24: 6rem;    /* 96px — hero / page rhythm           */
}
```

**Base unit by density** (set in Step 1, from the brief's job — not by taste):
- **Compact** (dense operational tools, tables, trading) → 4px base
- **Standard** (most apps and dashboards) → 8px base
- **Spacious** (marketing, portfolio, wellness) → 8px base, but jump two steps between sections

**Proximity law — the rule most builds break:** related things must sit *closer together*
than unrelated things. A label 16px above its value but 16px from the next card reads as
one undifferentiated mush. Inside a group use `--space-2`/`--space-3`; between groups use
`--space-8` or more. If everything is one gap value, you have no hierarchy.

## 4. Radius & elevation — one decision, applied
- Radius: choose ONE (e.g. 0.75rem soft, or 0px sharp editorial). Apply everywhere; the "uniform radius" ban means don't mix 4px buttons with 24px cards arbitrarily — be consistent *or* have a stated reason.
  - Nesting exception: concentric radii. Inner radius = outer radius − padding. A 16px inner in a 24px outer with 8px padding is correct; two equal radii nested look wrong.
- Elevation: prefer 1px hairline borders (premium, low-noise) over heavy drop shadows. If shadows, use a single soft, low-opacity token.

**Elevation scale — at most three levels.** More than three and nothing reads as elevated.

```css
:root {
  --elev-0: none;                                    /* flush — the page surface     */
  --elev-1: 0 1px 2px rgba(0,0,0,0.06);              /* resting cards, inputs        */
  --elev-2: 0 8px 24px rgba(0,0,0,0.10);             /* hover, dropdowns, popovers   */
  --elev-3: 0 24px 64px rgba(0,0,0,0.18);            /* modals, drawers, palette     */
}
```
Dark systems raise opacity and add a hairline ring (`0 0 0 1px rgba(255,255,255,0.06)`) —
shadow alone is nearly invisible on a near-black canvas. Whether shadows are used *at all*
is the locked system's decision: Editorial, Boutique and Neo-Brutalist forbid soft elevation.

## 5. Motion — serve the subject
- One orchestrated moment (page-load reveal OR scroll-triggered signature) beats scattered effects.
- Always wrap in `@media (prefers-reduced-motion: reduce)` to disable non-essential motion.

**Commit to duration and easing as tokens** — "subtle motion" in an effects contract is not
a spec. Undecided timing is why builds feel either sluggish or twitchy.

```css
:root {
  --dur-instant: 100ms;  /* state flips: checkbox, toggle, press          */
  --dur-fast:    180ms;  /* hover, focus ring, color transitions          */
  --dur-base:    240ms;  /* card lift, dropdown, tab switch               */
  --dur-slow:    400ms;  /* drawer, modal, page-level reveal              */

  --ease-out:    cubic-bezier(0.16, 1, 0.3, 1);    /* things entering — decelerate */
  --ease-in-out: cubic-bezier(0.65, 0, 0.35, 1);   /* things moving between states */
}
```
Rules: entrances decelerate (`--ease-out`); never `linear` on anything spatial; never animate
`width`/`height`/`top`/`left` — use `transform` and `opacity`; anything over 400ms feels broken
in a tool (reserve it for deliberate cinematic reveals in Dark-Luxe).

## 9. Interaction-state tokens

Define once, apply to every button, link, row, card, tab and input. Ad-hoc per-component
states are why a screen feels assembled from different products. Full requirements and the
non-happy-path data states are in `references/ui-states.md`.

```css
:root {
  --state-hover-bg:    color-mix(in srgb, var(--color-ink) 6%, transparent);
  --state-active-bg:   color-mix(in srgb, var(--color-ink) 10%, transparent);
  --state-selected-bg: var(--color-accent-soft);
  --state-disabled-opacity: 0.45;
  --focus-ring: 2px solid var(--color-accent);
  --focus-ring-offset: 3px;
}
```

Check the focus ring against **every** background it can land on — an accent ring that is
visible on the canvas can vanish on an accent-tinted selected row.

## 6. Contrast floor (non-negotiable)
- Body text ≥ 4.5:1 on its background.
- Large display text ≥ 3:1.
- Never rely on color alone to convey state (pair with icon/label).

## 7. Responsive breakpoints — plan upfront, not as an afterthought
Default targets: **375px mobile · 768px tablet · 1280px desktop.** Define the layout shift for each in the worksheet before writing code.

Common layout shifts per breakpoint:
| Element | Mobile (375px) | Tablet (768px) | Desktop (1280px) |
|---|---|---|---|
| Navigation | Bottom tab bar or hamburger | Icon-only sidebar | Full sidebar or top nav |
| Grid | 1 column | 2 columns | 3–4 columns |
| Hero type | `clamp(1.75rem, 5vw, 2.5rem)` | `clamp(2rem, 4vw, 3rem)` | `clamp(2.5rem, 3vw, 4rem)` |
| Padding | 16px horizontal | 24px horizontal | 48px horizontal |
| Cards | Full-width stacked | 2-up grid | Bento or 3-up |
| Ambient glows | Hidden (performance) | Optional | Visible |

**CSS pattern (mobile-first):**
```css
/* Mobile base styles */
.grid { grid-template-columns: 1fr; gap: 12px; }

@media (min-width: 768px) {
  .grid { grid-template-columns: repeat(2, 1fr); gap: 16px; }
}
@media (min-width: 1280px) {
  .grid { grid-template-columns: repeat(3, 1fr); gap: 20px; }
}
```

Rule: if the layout doesn't change between breakpoints, you haven't thought about it — every section should have an explicit rule for what changes at 768px.

## 8. Theme mode — dark-only, light-only, or both
Decide in Step 1 of the brief. Do not add a theme toggle as an afterthought.

**Default by system** (each system appears exactly once):
- Dark-only: Dark Private-Client, Dark-Luxe, Terminal Hacker, Conversational AI
- Light-only: Editorial, Boutique E-Commerce, Organics & Wellness
- Either/both: Minimal-Tech, Warm-Sophisticate, Neo-Brutalist

Minimal-Tech is listed as either/both deliberately: its Linear/Vercel register works on a
near-black *or* a near-white canvas. Pick one in Step 1 and commit — "supports both" is a
decision to build and test two palettes, not a way to defer the choice.

**If "both with toggle" is chosen**, define a `:root` block for each mode and wire a `data-theme` toggle. Hexes below are a light operational example — replace them with the locked system's tokens from `design-systems.md`. Do not treat bronze-on-black as the snippet to copy.
```css
/* Light (default) */
:root, :root[data-theme="light"] {
  --color-bg:      #ffffff;
  --color-surface: #f7f8fa;
  --color-ink:     #1a1f36;
  --color-muted:   #425466;
  --color-accent:  #2f5233;
}

/* Dark override */
:root[data-theme="dark"] {
  --color-bg:      #0b0b0f;
  --color-surface: #16161a;
  --color-solid:   #1e1e24;
  --color-line:    rgba(255,255,255,0.08);
  --color-ink:     #f7f8fa;
  --color-muted:   #8a8f98;
  --color-accent:  #2f5233;  /* accent stays the same — it's the brand */
}
```

```js
// Theme toggle (wire to a button)
function toggleTheme() {
  const current = document.documentElement.dataset.theme || 'light';
  document.documentElement.dataset.theme = current === 'light' ? 'dark' : 'light';
  localStorage.setItem('theme', document.documentElement.dataset.theme);
}
// Persist across reloads
document.documentElement.dataset.theme = localStorage.getItem('theme') || 'light';
```

**Contrast check both modes separately** — a UI that passes contrast in dark often fails in light.

