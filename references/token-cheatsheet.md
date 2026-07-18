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

## 4. Radius & elevation — one decision, applied
- Radius: choose ONE (e.g. 0.75rem soft, or 0px sharp editorial). Apply everywhere; the "uniform radius" ban means don't mix 4px buttons with 24px cards arbitrarily — be consistent *or* have a stated reason.
- Elevation: prefer 1px hairline borders (premium, low-noise) over heavy drop shadows. If shadows, use a single soft, low-opacity token.

## 5. Motion — serve the subject
- One orchestrated moment (page-load reveal OR scroll-triggered signature) beats scattered effects.
- Always wrap in `@media (prefers-reduced-motion: reduce)` to disable non-essential motion.

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

**Default by system:**
- Dark-only: Dark Private-Client, Dark-Luxe, Terminal Hacker, Conversational AI, Minimal-Tech (dark variant)
- Light-only: Editorial, Boutique E-Commerce, Organics & Wellness
- Either/both: Minimal-Tech, Warm-Sophisticate, Neo-Brutalist

**If "both with toggle" is chosen**, define a `:root` block for each mode and wire a `data-theme` toggle:
```css
/* Dark (default) */
:root, :root[data-theme="dark"] {
  --color-bg:      #0A0B0E;
  --color-surface: rgba(255,255,255,0.035);
  --color-ink:     #F3F4F6;
  --color-muted:   #7E828E;
  --color-accent:  #C9A24B;
}

/* Light override */
:root[data-theme="light"] {
  --color-bg:      #F4F5F7;
  --color-surface: rgba(255,255,255,0.85);
  --color-solid:   #FFFFFF;
  --color-line:    rgba(0,0,0,0.08);
  --color-ink:     #111318;
  --color-muted:   #6B6F7A;
  --color-accent:  #C9A24B;  /* accent stays the same — it's the brand */
}
```

```js
// Theme toggle (wire to a button)
function toggleTheme() {
  const current = document.documentElement.dataset.theme || 'dark';
  document.documentElement.dataset.theme = current === 'dark' ? 'light' : 'dark';
  localStorage.setItem('theme', document.documentElement.dataset.theme);
}
// Persist across reloads
document.documentElement.dataset.theme = localStorage.getItem('theme') || 'dark';
```

**Contrast check both modes separately** — a UI that passes contrast in dark often fails in light.

