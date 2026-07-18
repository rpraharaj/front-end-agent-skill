# Performance Floor (Core Web Vitals / Lighthouse)

Target: **Lighthouse Performance ≥ 90, Accessibility ≥ 95** on production builds.

This file covers the **5 decisions agents get wrong by default** that directly tank Lighthouse scores. Not a general optimization guide — strictly what matters at UI generation time.

---

## 1. LCP — Largest Contentful Paint (target: < 2.5s)

LCP measures how fast the biggest visible element (usually the hero image or headline) renders.

### Hero image (above the fold)
```html
<!-- ✅ Hero image: eager + high priority -->
<img
  src="/hero.webp"
  alt="Dashboard overview"
  width="1280" height="720"
  loading="eager"
  fetchpriority="high"
/>

<!-- Next.js equivalent -->
<Image
  src="/hero.webp"
  alt="Dashboard overview"
  width={1280} height={720}
  priority           {/* sets fetchpriority="high" + preload link */}
/>
```

### All other images (below the fold)
```html
<!-- ✅ Below-fold: always lazy -->
<img src="/card-photo.webp" alt="…" width="400" height="300" loading="lazy" />
```

**Rule:** The first visible `<img>` or `<Image>` on every page gets `fetchpriority="high"` and `loading="eager"`. Everything else gets `loading="lazy"`.

---

## 2. CLS — Cumulative Layout Shift (target: < 0.1)

CLS measures how much the page jumps around while loading. The #1 cause is images without explicit dimensions.

### Always declare width + height on images
```html
<!-- ✅ dimensions reserve layout space before image loads -->
<img src="/avatar.webp" alt="…" width="64" height="64" />

<!-- ❌ no dimensions = layout shift when image arrives -->
<img src="/avatar.webp" alt="…" />
```

### Use aspect-ratio for dynamic/unknown sizes
```css
/* Reserve space for dynamic content containers */
.hero-image-wrapper {
  aspect-ratio: 16 / 9;
  width: 100%;
  overflow: hidden;
}
```

### Font CLS prevention
```html
<!-- Preconnect tells browser to start DNS + TLS early -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

<!-- display=swap prevents invisible text during font load -->
<link href="https://fonts.googleapis.com/css2?family=Fraunces:wght@400;700&display=swap" rel="stylesheet" />
```

---

## 3. Image Formats (WebP / AVIF first)

Modern formats are 30–50% smaller than JPEG/PNG at equivalent quality.

```html
<!-- ✅ Progressive enhancement: AVIF → WebP → JPEG fallback -->
<picture>
  <source srcset="/hero.avif" type="image/avif" />
  <source srcset="/hero.webp" type="image/webp" />
  <img src="/hero.jpg" alt="Dashboard overview" width="1280" height="720" loading="eager" fetchpriority="high" />
</picture>
```

**Next.js:** `<Image>` component handles WebP automatically — just use it instead of `<img>`.

**Rule:** Never generate `<img src="photo.jpg">` in production HTML. Always wrap in `<picture>` with WebP source, or use Next.js `<Image>`.

---

## 4. Critical Font Preloading

Preloading the hero font weight prevents FOUT (Flash of Unstyled Text) without blocking render.

```html
<head>
  <!-- Preload only the ONE weight used in the hero/display role -->
  <link
    rel="preload"
    href="/fonts/fraunces-variable.woff2"
    as="font"
    type="font/woff2"
    crossorigin
  />

  <!-- All other fonts: preconnect + display=swap (not preload — too many blocks render) -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet" />
</head>
```

**Rules:**
- Preload at most **1 font file** — more than that creates a render-blocking queue
- `display=swap` on all Google Fonts imports (already in design-systems.md templates)
- Self-hosted variable fonts are better than Google Fonts for LCP — one request covers all weights

---

## 5. INP — Interaction to Next Paint (target: < 200ms)

INP measures how fast the page responds to user interactions (click, key, tap).

### Common INP killers — avoid these:
```js
// ❌ Heavy synchronous work on click
button.addEventListener('click', () => {
  const result = heavyComputation(); // blocks for 300ms
  updateUI(result);
});

// ✅ Yield to the browser between chunks
button.addEventListener('click', async () => {
  await scheduler.yield(); // or setTimeout(fn, 0) if scheduler unavailable
  const result = heavyComputation();
  updateUI(result);
});
```

```js
// ❌ Unthrottled search input
input.addEventListener('input', () => fetchResults(input.value));

// ✅ Debounced — waits 300ms after user stops typing
input.addEventListener('input', debounce(() => fetchResults(input.value), 300));
```

```js
// ❌ Layout thrash in animation frame
function animate() {
  const h = element.offsetHeight; // read — forces layout
  element.style.height = h + 1 + 'px'; // write — invalidates layout
  requestAnimationFrame(animate);
}

// ✅ Batch reads then writes
function animate() {
  requestAnimationFrame(() => {
    const h = element.offsetHeight; // read
    requestAnimationFrame(() => {
      element.style.height = h + 1 + 'px'; // write in next frame
    });
  });
}
```

---

## 6. Lighthouse Targets

| Metric | Target | What it measures |
|---|---|---|
| Performance | ≥ 90 | LCP, CLS, INP, FCP, TTFB combined |
| Accessibility | ≥ 95 | axe-core checks (contrast, labels, ARIA) |
| Best Practices | ≥ 90 | HTTPS, no deprecated APIs, correct image sizes |
| SEO | ≥ 90 | Meta tags, descriptive links, mobile-friendly |

### How to run locally
```bash
# CLI (no browser needed)
npx lighthouse http://localhost:3000 --output=html --view

# Or in Chrome DevTools: F12 → Lighthouse tab → Analyze page load
```

### Quick wins if score is low
| Score drops from | Fix |
|---|---|
| Images without `width`/`height` | Add explicit dimensions (CLS) |
| No `loading="lazy"` on off-screen images | Add lazy loading |
| Render-blocking resources | Move `<script>` to bottom or add `defer` |
| Missing `alt` attributes | Add alt text (Accessibility) |
| No `<meta name="description">` | Add page description |
| No `<title>` | Add meaningful page title |

---

## Checklist (copy into design-brief.md Section 5)

- [ ] Hero `<img>` / `<Image>` has `fetchpriority="high"` and `loading="eager"`
- [ ] All non-hero images have `loading="lazy"`
- [ ] All images have explicit `width` and `height` attributes
- [ ] Hero images use `<picture>` with WebP/AVIF source (or Next.js `<Image>`)
- [ ] Critical display font preloaded with `<link rel="preload" as="font">`
- [ ] All Google Fonts use `display=swap`
- [ ] No heavy synchronous work in click/keydown handlers
- [ ] Search/filter inputs are debounced (≥ 300ms)
- [ ] Lighthouse Performance ≥ 90 verified (or noted as known gap)
- [ ] Lighthouse Accessibility ≥ 95 verified
