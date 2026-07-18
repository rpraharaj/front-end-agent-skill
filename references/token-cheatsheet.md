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
