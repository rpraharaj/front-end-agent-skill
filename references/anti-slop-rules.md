# Anti-Slop Rules (premium UI)

These patterns read as "AI-generated" regardless of subject. They are banned as **unchosen defaults**. If the locked design system or the brief explicitly specifies one of them (Terminal CRT green, Warm-Sophisticate cream and serif, Editorial hairlines), keep it and write the deviation in the lock summary. Where the brief leaves an axis free, spend that freedom on a choice specific to THIS brief, not a default.

## Banned-by-default patterns
1. **Cream `#F4F1EA` background + high-contrast serif display + terracotta accent.** (Default look #1.)
2. **Near-black background + single bright acid-green or vermilion accent.** (Default look #2.)
3. **Broadsheet layout: hairline rules, zero border-radius, dense newspaper columns.** (Default look #3.)
4. **Centered-only hero with `<h1>` + one accent CTA + big-number statistic.** Template answer.
5. **Inter as the default body+display without deliberation.**
6. **Uniform 1rem (or any single) border-radius across all elements.**
7. **Purple gradient blobs as the only visual interest.**
8. **Numbered markers (01 / 02 / 03) when content is NOT a true sequence.**
9. **Standard vertical `100vh` sizing on screen-height components.** That leaves layout-jumping bugs on mobile browsers. Use `100dvh` or `min-h-[100dvh]`.
10. **Proportional layouts on tabular numbers.** Dashboards and charts look sloppy when numbers dynamically jitter or shift column layouts. Use `tabular-nums` or `font-variant-numeric: tabular-nums` for numeric data.
11. **Single-word orphans in headings or blocks.** Do not leave single words dangling on their own line. Enforce `text-wrap: balance` (Tailwind `text-balance`) on headlines and `text-wrap: pretty` (Tailwind `text-pretty`) on paragraphs.

## Required quality floor (non-negotiable)
- Responsive down to mobile.
- Visible keyboard focus on all interactive elements.
- `prefers-reduced-motion` respected (disable non-essential animation).
- Accessible color contrast (WCAG AA).
- Real copy, not lorem ipsum; active voice, sentence case.
- Semantic HTML landmarks: `<main>`, `<nav>`, `<header>`, `<footer>` — no `<div>` soup.
- One `<h1>` per page; heading hierarchy not skipped (`<h1>` → `<h2>` → `<h3>`).
- All `<img>` elements have an `alt` attribute (meaningful text or `alt=""` for decorative).
- All form inputs have an associated `<label>` or `aria-label`.
- See `references/a11y-floor.md` for full structural a11y rules and `references/performance-floor.md` for Core Web Vitals / Lighthouse targets.


## Self-critique move
Before delivering: remove one accessory ("before leaving the house, remove one thing"). If a planned element matches a banned pattern, replace it and write one sentence on why the replacement fits the brief.
