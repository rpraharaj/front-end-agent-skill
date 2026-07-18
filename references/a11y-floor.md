# Accessibility Floor (Google WCAG 2.1 AA)

This file covers **structural accessibility** — the items not already audited by `scripts/audit-ui.sh` (contrast, focus-visible, reduced-motion are handled there). Check every rule before marking a build complete.

---

## 1. Semantic HTML Structure (non-negotiable)

Premium UIs are not `<div>` soup. Screen readers and search engines depend on landmark elements.

### Required landmarks — every page must have:
```html
<header>…</header>       <!-- site/page header, contains <nav> -->
<nav aria-label="Main">…</nav>   <!-- primary navigation -->
<main>…</main>           <!-- the page's unique content; ONE per page -->
<footer>…</footer>       <!-- site footer -->
```

### Heading hierarchy — strictly sequential, never skipped:
- **One `<h1>` per page** — the page title, not the site name.
- `<h2>` for major sections under the `<h1>`.
- `<h3>` for sub-sections — do NOT jump from `<h1>` to `<h3>`.
- Never use heading tags for visual sizing alone — use CSS for that.

```html
<!-- ✅ correct -->
<h1>Portfolio Dashboard</h1>
  <h2>Asset Allocation</h2>
    <h3>Equity Breakdown</h3>
  <h2>Recent Activity</h2>

<!-- ❌ wrong — skips h2 -->
<h1>Portfolio Dashboard</h1>
  <h3>Asset Allocation</h3>
```

### Sections with labels:
```html
<!-- Named sections help screen readers navigate -->
<section aria-labelledby="section-heading-id">
  <h2 id="section-heading-id">Asset Allocation</h2>
  …
</section>
```

---

## 2. Image Alt Text (required on every `<img>`)

| Image type | Alt rule | Example |
|---|---|---|
| Meaningful / informational | Describe what the image conveys | `alt="Portfolio equity allocation donut: 62% stocks, 28% bonds"` |
| Decorative (pure visual) | Empty alt, no screen-reader noise | `alt=""` |
| SVG icons (inline) | `aria-hidden="true"` + visible label nearby | `<svg aria-hidden="true">…</svg>` |
| Next.js `<Image>` | Same rules, `alt` prop required | `<Image src="…" alt="…" />` |

```html
<!-- ✅ meaningful image -->
<img src="chart.png" alt="Revenue trend: $1.2M in Q1, $1.8M in Q2" width="800" height="400" />

<!-- ✅ decorative -->
<img src="divider.png" alt="" role="presentation" />

<!-- ✅ icon SVG -->
<svg aria-hidden="true" focusable="false">…</svg>
<span class="sr-only">Settings</span>
```

> **Agent rule:** Never generate `<img src="…">` without an `alt` attribute. If you don't know the image content, write `alt="[describe what this image shows]"` as a placeholder that makes the omission visible.

---

## 3. Form Labels (every input must have one)

Placeholder text is NOT a label. It disappears when the user types.

```html
<!-- ✅ correct: explicit label -->
<label for="client-search">Search clients</label>
<input id="client-search" type="search" placeholder="Name or ID…" />

<!-- ✅ correct: aria-label for icon-button inputs -->
<input type="search" aria-label="Search clients" placeholder="Name or ID…" />

<!-- ❌ wrong: placeholder only -->
<input type="text" placeholder="Search clients" />
```

**Required for all form elements:** `<input>`, `<select>`, `<textarea>`, custom autocomplete, date pickers, sliders.

---

## 4. Interactive Elements: Use Native Where Possible

```html
<!-- ✅ use native button — gets keyboard + role for free -->
<button type="button" onclick="openModal()">Open detail</button>

<!-- ❌ div-as-button — needs extra ARIA to be accessible -->
<div onclick="openModal()">Open detail</div>

<!-- If you MUST use a non-native element: -->
<div role="button" tabindex="0"
     onclick="openModal()"
     onkeydown="e.key==='Enter'&&openModal()">
  Open detail
</div>
```

**Rule:** native `<button>`, `<a href>`, `<input>`, `<select>` always before custom ARIA roles.

---

## 5. ARIA Live Regions (dynamic content)

Any content that updates without a page load must announce itself to screen readers.

```html
<!-- For streaming text, toast notifications, counters -->
<div aria-live="polite" aria-atomic="true" class="sr-only" id="status">
  <!-- JS updates textContent here -->
</div>

<!-- For critical alerts (errors, session expiry) -->
<div role="alert">Session expires in 5 minutes.</div>
```

| Live value | Use case |
|---|---|
| `polite` | Most updates — waits for user to finish current task |
| `assertive` | Errors, urgent alerts — interrupts immediately |
| `off` | Updates you don't want announced |

---

## 6. Screen Reader Quick Test (macOS VoiceOver — 3 commands)

Run this before delivering any UI:

1. `⌘ F5` — toggle VoiceOver on
2. `VO + U` — open the Rotor; check the Headings list (is the hierarchy correct?) and Landmarks list (is `<main>` present?)
3. `Tab` — navigate all interactive elements; every one must have a visible, meaningful focus ring and a label announced

If any element is unlabelled or unreachable by Tab, fix it before shipping.

---

## 7. sr-only Utility Class (required in every project)

```css
/* Add to globals.css — every project needs this */
.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0,0,0,0);
  white-space: nowrap;
  border: 0;
}
```

Use it for: icon button labels, skip-to-content links, live region containers.

---

## 8. Skip-to-Content Link

Required for keyboard users who navigate via Tab. Place as the very first element in `<body>`:

```html
<a href="#main-content" class="sr-only focus:not-sr-only focus:absolute focus:top-4 focus:left-4 focus:z-50 focus:px-4 focus:py-2 focus:bg-[var(--color-accent)] focus:text-[var(--color-bg)] focus:rounded">
  Skip to main content
</a>
…
<main id="main-content">…</main>
```

---

## Checklist (copy into design-brief.md Section 5)

- [ ] One `<h1>` per page; heading hierarchy not skipped
- [ ] `<main>`, `<nav>`, `<header>`, `<footer>` landmarks present
- [ ] All `<img>` have `alt` attribute (meaningful description or `alt=""` for decorative)
- [ ] All form inputs have associated `<label>` or `aria-label`
- [ ] Native elements used for interactive controls where possible
- [ ] Skip-to-content link as first focusable element
- [ ] Dynamic content regions use `aria-live`
- [ ] VoiceOver / screen reader quick test passed (Headings + Landmarks rotor)
