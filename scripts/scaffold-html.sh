#!/usr/bin/env bash
# scaffold-html.sh — Single-file premium HTML mockup starter.
# Usage: bash scripts/scaffold-html.sh <output-name> [system]
#
# system: dark-private-client (default) | minimal-tech | editorial |
#         warm-sophisticate | dark-luxe | boutique | neo-brutalist |
#         conversational-ai | organics | terminal
#
# Outputs a self-contained <output-name>.html pre-loaded with:
#   - Dark Private-Client tokens (or chosen system)
#   - Ambient radial-glow background
#   - Glassmorphic sticky nav
#   - Double-bezel card skeleton
#   - Hover-lift animation with prefers-reduced-motion guard
#   - focus-visible ring
#   - Google Fonts import
#   - prefers-reduced-motion global guard
set -euo pipefail

NAME="${1:?Usage: scaffold-html.sh <output-name> [system]}"
SYSTEM="${2:-dark-private-client}"
OUTPUT="${NAME}.html"

echo "==> Scaffolding premium HTML mockup: $OUTPUT (system: $SYSTEM)"

# ── Pick tokens per system ──────────────────────────────────────────────────
case "$SYSTEM" in
  minimal-tech)
    BG="#0B0B0F"; SURFACE="#16161A"; SOLID="#1E1E24"; LINE="rgba(255,255,255,0.07)"
    INK="#F7F8FA"; MUTED="#8A8F98"; ACCENT="#5E6AD2"
    FONT_DISPLAY="'Inter Tight', 'Geist', sans-serif"
    FONT_BODY="'Inter', 'Geist', sans-serif"
    FONTS_URL="Inter:wght@300;400;500;600;700"
    RADIUS="0.5rem" ;;
  warm-sophisticate)
    BG="#1C1410"; SURFACE="#251C16"; SOLID="#2E231B"; LINE="rgba(255,255,255,0.06)"
    INK="#EDE6DD"; MUTED="#A09080"; ACCENT="#B8893B"
    FONT_DISPLAY="'Fraunces', 'Instrument Serif', Georgia, serif"
    FONT_BODY="'Inter', system-ui, sans-serif"
    FONTS_URL="Fraunces:ital,opsz,wght@0,9..144,100..900;1,9..144,100..900&family=Inter:wght@300;400;500;600;700"
    RADIUS="1.25rem" ;;
  editorial)
    BG="#FFFFFF"; SURFACE="#F7F8FA"; SOLID="#F0F2F5"; LINE="#E3E8EE"
    INK="#1A1F36"; MUTED="#425466"; ACCENT="#635BFF"
    FONT_DISPLAY="'General Sans', sans-serif"
    FONT_BODY="'Inter', system-ui, sans-serif"
    FONTS_URL="Inter:wght@300;400;500;600;700"
    RADIUS="0.5rem" ;;
  dark-luxe)
    BG="#0A0A0B"; SURFACE="#141415"; SOLID="#1A1A1D"; LINE="rgba(255,255,255,0.06)"
    INK="#EDEDED"; MUTED="#6B6B70"; ACCENT="#D4AF37"
    FONT_DISPLAY="'Playfair Display', Georgia, serif"
    FONT_BODY="'Inter', system-ui, sans-serif"
    FONTS_URL="Playfair+Display:ital,wght@0,400..900;1,400..900&family=Inter:wght@300;400;500;600;700"
    RADIUS="0.25rem" ;;
  boutique)
    BG="#FAF9F6"; SURFACE="#FFFFFF"; SOLID="#F5F4F1"; LINE="#E5E5E5"
    INK="#111111"; MUTED="#888888"; ACCENT="#D4AF37"
    FONT_DISPLAY="'Cormorant Garamond', Georgia, serif"
    FONT_BODY="'Plus Jakarta Sans', 'Inter', system-ui, sans-serif"
    FONTS_URL="Cormorant+Garamond:ital,wght@0,300..700;1,300..700&family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800"
    RADIUS="0rem" ;;
  neo-brutalist)
    BG="#FBFBFA"; SURFACE="#FFFFFF"; SOLID="#F5F5F4"; LINE="#000000"
    INK="#000000"; MUTED="#555555"; ACCENT="#E0D7FF"
    FONT_DISPLAY="'Syne', sans-serif"
    FONT_BODY="'Space Grotesk', system-ui, sans-serif"
    FONTS_URL="Syne:wght@400..800&family=Space+Grotesk:wght@300..700"
    RADIUS="0rem" ;;
  conversational-ai)
    BG="#09090B"; SURFACE="#18181B"; SOLID="#27272A"; LINE="rgba(255,255,255,0.06)"
    INK="#F4F4F5"; MUTED="#A1A1AA"; ACCENT="#06B6D4"
    FONT_DISPLAY="'Inter', system-ui, sans-serif"
    FONT_BODY="'Inter', system-ui, sans-serif"
    FONTS_URL="Inter:wght@300;400;500;600;700"
    RADIUS="0.75rem" ;;
  organics)
    BG="#E2ECE9"; SURFACE="#FAF9F6"; SOLID="#F0EDE8"; LINE="rgba(45,49,46,0.12)"
    INK="#2D312E"; MUTED="#6B7268"; ACCENT="#2F5233"
    FONT_DISPLAY="'Outfit', sans-serif"
    FONT_BODY="'Inter', system-ui, sans-serif"
    FONTS_URL="Outfit:wght@100..900&family=Inter:wght@300;400;500;600;700"
    RADIUS="1.5rem" ;;
  terminal)
    BG="#0A0A0A"; SURFACE="#111111"; SOLID="#1C1C1C"; LINE="#1C1C1C"
    INK="#33FF33"; MUTED="#555555"; ACCENT="#FFB000"
    FONT_DISPLAY="'JetBrains Mono', monospace"
    FONT_BODY="'JetBrains Mono', monospace"
    FONTS_URL="JetBrains+Mono:ital,wght@0,100..800;1,100..800"
    RADIUS="0rem" ;;
  *)  # dark-private-client (default)
    BG="#0A0B0E"; SURFACE="rgba(255,255,255,0.035)"; SOLID="#141519"; LINE="rgba(255,255,255,0.08)"
    INK="#F3F4F6"; MUTED="#7E828E"; ACCENT="#C9A24B"
    FONT_DISPLAY="'Fraunces', Georgia, serif"
    FONT_BODY="'Inter', system-ui, sans-serif"
    FONTS_URL="Fraunces:ital,opsz,wght@0,9..144,100..900;1,9..144,100..900&family=Inter:wght@300;400;500;600;700"
    RADIUS="1rem" ;;
esac

# ── Write the file ──────────────────────────────────────────────────────────
cat > "$OUTPUT" << HTMLEOF
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>${NAME} — Premium UI Mockup</title>
<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=${FONTS_URL}&display=swap" rel="stylesheet">
<style>
  /* ── Token system (${SYSTEM}) ── */
  :root {
    --color-bg:      ${BG};
    --color-surface: ${SURFACE};
    --color-solid:   ${SOLID};
    --color-line:    ${LINE};
    --color-ink:     ${INK};
    --color-muted:   ${MUTED};
    --color-accent:  ${ACCENT};
    --font-display:  ${FONT_DISPLAY};
    --font-body:     ${FONT_BODY};
    --radius-base:   ${RADIUS};
  }

  /* ── Global reset ── */
  *, *::before, *::after { box-sizing: border-box; }
  body {
    margin: 0;
    font-family: var(--font-body);
    background: var(--color-bg);
    color: var(--color-ink);
    min-height: 100dvh;
    overflow-x: hidden;
  }

  /* ── Reduced motion global guard (non-negotiable) ── */
  @media (prefers-reduced-motion: reduce) {
    *, *::before, *::after {
      animation-duration: 0.001ms !important;
      transition-duration: 0.001ms !important;
    }
  }

  /* ── Focus-visible ring ── */
  :focus-visible {
    outline: 2px solid var(--color-accent);
    outline-offset: 3px;
    border-radius: 4px;
  }

  /* ── Ambient radial-glow background ── */
  .ambient-bg {
    position: fixed;
    inset: 0;
    pointer-events: none;
    z-index: 0;
    overflow: hidden;
  }
  .glow-warm {
    position: absolute;
    top: -10%; left: -10%;
    width: 55%; height: 55%;
    border-radius: 50%;
    background: radial-gradient(circle, rgba(201,162,75,0.07) 0%, transparent 70%);
    filter: blur(80px);
  }
  .glow-cool {
    position: absolute;
    bottom: -10%; right: -10%;
    width: 65%; height: 65%;
    border-radius: 50%;
    background: radial-gradient(circle, rgba(110,139,168,0.05) 0%, transparent 70%);
    filter: blur(100px);
  }

  /* ── Content layer ── */
  .content { position: relative; z-index: 1; }

  /* ── Glassmorphic sticky nav ── */
  nav {
    position: sticky;
    top: 0;
    z-index: 50;
    width: 100%;
    border-bottom: 1px solid var(--color-line);
    background: color-mix(in srgb, var(--color-bg) 60%, transparent);
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);
  }
  .nav-inner {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 24px;
    height: 60px;
    display: flex;
    align-items: center;
    justify-content: space-between;
  }
  .nav-logo {
    font-family: var(--font-display);
    font-size: 1.1rem;
    color: var(--color-ink);
    text-decoration: none;
    letter-spacing: -0.02em;
  }
  .nav-links { display: flex; gap: 28px; list-style: none; margin: 0; padding: 0; }
  .nav-links a {
    font-size: 0.85rem;
    color: var(--color-muted);
    text-decoration: none;
    transition: color 180ms ease;
  }
  .nav-links a:hover { color: var(--color-ink); }

  /* ── Main layout ── */
  main {
    max-width: 1200px;
    margin: 0 auto;
    padding: 48px 24px 96px;
  }

  /* ── Double-bezel card ── */
  .card-outer {
    padding: 8px;
    background: var(--color-surface);
    border: 1px solid var(--color-line);
    border-radius: calc(var(--radius-base) + 8px);
    transition: transform 220ms ease, box-shadow 220ms ease;
    will-change: transform;
  }
  .card-outer:hover {
    transform: translateY(-4px);
    box-shadow: 0 16px 40px rgba(0,0,0,0.35), 0 0 0 1px rgba(255,255,255,0.06);
  }
  .card-inner {
    padding: 24px;
    background: var(--color-solid);
    border: 1px solid var(--color-line);
    border-radius: var(--radius-base);
    box-shadow: inset 0 1px 1.5px rgba(255,255,255,0.04);
  }

  /* ── Bento grid ── */
  .bento {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 16px;
    margin-top: 32px;
  }

  /* ── Typography ── */
  h1 {
    font-family: var(--font-display);
    font-size: clamp(1.75rem, 4vw, 2.5rem);
    letter-spacing: -0.03em;
    color: var(--color-ink);
    margin: 0 0 8px;
    text-wrap: balance;
  }
  .subtitle { color: var(--color-muted); font-size: 0.95rem; max-width: 55ch; text-wrap: pretty; }
  .label { font-size: 0.75rem; text-transform: uppercase; letter-spacing: 0.08em; color: var(--color-muted); margin-bottom: 4px; }
  .metric {
    font-family: var(--font-display);
    font-size: 2rem;
    font-variant-numeric: tabular-nums;
    color: var(--color-ink);
  }

  /* ── Accent button ── */
  .btn {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 10px 20px;
    background: var(--color-accent);
    color: #fff;
    border: none;
    border-radius: var(--radius-base);
    font-family: var(--font-body);
    font-size: 0.875rem;
    font-weight: 500;
    cursor: pointer;
    transition: opacity 180ms ease, transform 180ms ease;
  }
  .btn:hover { opacity: 0.88; transform: translateY(-1px); }
</style>
</head>
<body>

<!-- Ambient background glows -->
<div class="ambient-bg" aria-hidden="true">
  <div class="glow-warm"></div>
  <div class="glow-cool"></div>
</div>

<!-- Glassmorphic navigation -->
<nav>
  <div class="nav-inner">
    <a href="#" class="nav-logo">${NAME}</a>
    <ul class="nav-links">
      <li><a href="#" tabindex="0">Dashboard</a></li>
      <li><a href="#" tabindex="0">Explore</a></li>
      <li><a href="#" tabindex="0">Settings</a></li>
    </ul>
    <button class="btn" type="button">Get started</button>
  </div>
</nav>

<!-- Main content -->
<div class="content">
  <main>
    <!-- Hero -->
    <h1>Your headline here</h1>
    <p class="subtitle">A clear, one-sentence description of what this page does and who it serves. Sentence case, active voice.</p>

    <!-- Bento grid of double-bezel cards -->
    <div class="bento">
      <article class="card-outer" tabindex="0">
        <div class="card-inner">
          <p class="label">Metric one</p>
          <p class="metric">—</p>
        </div>
      </article>
      <article class="card-outer" tabindex="0">
        <div class="card-inner">
          <p class="label">Metric two</p>
          <p class="metric">—</p>
        </div>
      </article>
      <article class="card-outer" tabindex="0">
        <div class="card-inner">
          <p class="label">Metric three</p>
          <p class="metric">—</p>
        </div>
      </article>
    </div>
  </main>
</div>

</body>
</html>
HTMLEOF

echo "==> Done: $OUTPUT"
echo "   Design system: $SYSTEM"
echo "   Next: fill the card content from your design-brief.md worksheet."
echo "   Then: bash scripts/audit-ui.sh ."
