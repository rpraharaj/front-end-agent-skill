#!/usr/bin/env bash
# scaffold-html.sh — Single-file premium HTML mockup starter.
# Usage: bash scripts/scaffold-html.sh <output-name> <system>
#
# system: dark-private-client | minimal-tech | editorial |
#         warm-sophisticate | dark-luxe | boutique | neo-brutalist |
#         conversational-ai | organics | terminal
#
# Outputs a self-contained <output-name>.html pre-loaded with:
#   - Explicitly selected design-system tokens and effects contract
#   - System-specific background, navigation, container, elevation, and motion
#   - focus-visible ring
#   - Google Fonts import
#   - prefers-reduced-motion global guard
set -euo pipefail

NAME="${1:?Usage: scaffold-html.sh <output-name> <system>}"
SYSTEM="${2:?Choose a system: dark-private-client | minimal-tech | editorial | warm-sophisticate | dark-luxe | boutique | neo-brutalist | conversational-ai | organics | terminal}"
OUTPUT="${NAME}.html"

echo "==> Scaffolding premium HTML mockup: $OUTPUT (system: $SYSTEM)"

# ── Pick tokens per system ──────────────────────────────────────────────────
case "$SYSTEM" in
  minimal-tech)
    BG="#0B0B0F"; SURFACE="#16161A"; SOLID="#1E1E24"; LINE="rgba(255,255,255,0.07)"
    INK="#F7F8FA"; MUTED="#8A8F98"; ACCENT="#5E6AD2"
    FONT_DISPLAY="'Inter Tight', 'Geist', sans-serif"
    FONT_BODY="'Inter', 'Geist', sans-serif"
    FONTS_URL="Inter+Tight:wght@400..700&family=Inter:wght@300;400;500;600;700"
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
    # General Sans / Söhne are not on Google Fonts. Instrument Sans is the
    # loadable substitute — see design-systems.md "Font availability".
    FONT_DISPLAY="'Instrument Sans', 'General Sans', sans-serif"
    FONT_BODY="'Inter', system-ui, sans-serif"
    FONTS_URL="Instrument+Sans:wght@400..700&family=Inter:wght@300;400;500;600;700"
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
    # Geist (not Inter) — Inter for both roles would be the banned default pairing.
    FONT_DISPLAY="'Geist', system-ui, sans-serif"
    FONT_BODY="'Geist', system-ui, sans-serif"
    FONTS_URL="Geist:wght@300..700&family=Geist+Mono:wght@400..600"
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
  dark-private-client)
    BG="#0A0B0E"; SURFACE="rgba(255,255,255,0.035)"; SOLID="#141519"; LINE="rgba(255,255,255,0.08)"
    INK="#F3F4F6"; MUTED="#7E828E"; ACCENT="#C9A24B"
    FONT_DISPLAY="'Fraunces', Georgia, serif"
    FONT_BODY="'Inter', system-ui, sans-serif"
    FONTS_URL="Fraunces:ital,opsz,wght@0,9..144,100..900;1,9..144,100..900&family=Inter:wght@300;400;500;600;700"
    RADIUS="1rem" ;;
  *)
    echo "Unknown design system: $SYSTEM" >&2
    echo "Choose: dark-private-client | minimal-tech | editorial | warm-sophisticate | dark-luxe | boutique | neo-brutalist | conversational-ai | organics | terminal" >&2
    exit 2 ;;
esac

# ── Apply the selected system's complete effects contract ───────────────────────────────
AMBIENT_HTML=""
AMBIENT_CSS=""
NAV_BLUR="none"
NAV_BG="var(--color-bg)"
PANEL_BG="var(--color-surface)"
PANEL_BORDER="1px solid var(--color-line)"
PANEL_SHADOW="none"
PANEL_HOVER_SHADOW="none"
PANEL_HOVER="none"
PANEL_INNER_BG="transparent"
PANEL_INNER_BORDER="0"
GRID_COLUMNS="repeat(auto-fit, minmax(280px, 1fr))"   # desktop ≥1280px
GRID_COLUMNS_TABLET="repeat(2, minmax(0, 1fr))"       # ≥768px; mobile base is always 1fr
PANEL_PADDING="0"
PANEL_RADIUS="var(--radius-base)"
BUTTON_INK="#fff"

case "$SYSTEM" in
  minimal-tech)
    PANEL_BORDER="1px solid var(--color-line)"
    PANEL_HOVER="translateY(-2px)" ;;
  warm-sophisticate)
    NAV_BG="color-mix(in srgb, var(--color-bg) 88%, transparent)"
    NAV_BLUR="blur(10px)"
    PANEL_BG="color-mix(in srgb, var(--color-surface) 92%, transparent)"
    PANEL_SHADOW="0 18px 48px rgba(10,5,2,0.22)"
    PANEL_HOVER_SHADOW="0 22px 56px rgba(10,5,2,0.26)"
    PANEL_HOVER="translateY(-3px)"
    PANEL_INNER_BG="var(--color-solid)"
    PANEL_PADDING="8px"
    PANEL_RADIUS="calc(var(--radius-base) + 8px)"
    BUTTON_INK="#1C1410" ;;
  editorial)
    PANEL_BG="transparent"
    PANEL_BORDER="1px solid var(--color-line)"
    PANEL_HOVER="none"
    PANEL_INNER_BG="transparent"
    GRID_COLUMNS="1fr"; GRID_COLUMNS_TABLET="1fr" ;;
  dark-private-client)
    NAV_BG="color-mix(in srgb, var(--color-bg) 60%, transparent)"
    NAV_BLUR="blur(12px)"
    PANEL_BG="var(--color-surface)"
    PANEL_SHADOW="0 16px 40px rgba(0,0,0,0.35), 0 0 0 1px rgba(255,255,255,0.04)"
    PANEL_HOVER_SHADOW="0 20px 48px rgba(0,0,0,0.4), 0 0 0 1px rgba(255,255,255,0.06)"
    PANEL_HOVER="translateY(-4px)"
    PANEL_INNER_BG="var(--color-solid)"
    PANEL_INNER_BORDER="1px solid var(--color-line)"
    PANEL_PADDING="8px"
    PANEL_RADIUS="calc(var(--radius-base) + 8px)"
    BUTTON_INK="#0A0B0E"
    AMBIENT_HTML='<div class="ambient-bg" aria-hidden="true"><div class="glow-warm"></div><div class="glow-cool"></div></div>'
    AMBIENT_CSS='.ambient-bg { position: fixed; inset: 0; pointer-events: none; z-index: 0; overflow: hidden; }
  .glow-warm { position: absolute; top: -10%; left: -10%; width: 55%; height: 55%; border-radius: 50%; background: radial-gradient(circle, rgba(201,162,75,0.07) 0%, transparent 70%); filter: blur(80px); }
  .glow-cool { position: absolute; bottom: -10%; right: -10%; width: 65%; height: 65%; border-radius: 50%; background: radial-gradient(circle, rgba(110,139,168,0.05) 0%, transparent 70%); filter: blur(100px); }' ;;
  dark-luxe)
    PANEL_BG="transparent"
    PANEL_BORDER="1px solid var(--color-line)"
    PANEL_HOVER="none"
    GRID_COLUMNS="1fr"; GRID_COLUMNS_TABLET="1fr"
    BUTTON_INK="#0A0A0B" ;;
  boutique)
    PANEL_BG="transparent"
    PANEL_BORDER="1px solid var(--color-line)"
    PANEL_HOVER="none"
    GRID_COLUMNS="1fr"; GRID_COLUMNS_TABLET="1fr"
    BUTTON_INK="#111111" ;;
  neo-brutalist)
    PANEL_BG="var(--color-surface)"
    PANEL_BORDER="2px solid #000"
    PANEL_SHADOW="4px 4px 0 #000"
    PANEL_HOVER="translate(4px, 4px)"
    BUTTON_INK="#000000" ;;
  conversational-ai)
    PANEL_BG="var(--color-surface)"
    PANEL_HOVER="translateY(-2px)"
    GRID_COLUMNS="minmax(0, 720px)"; GRID_COLUMNS_TABLET="minmax(0, 720px)"
    BUTTON_INK="#09090B" ;;
  organics)
    NAV_BG="color-mix(in srgb, var(--color-bg) 92%, transparent)"
    PANEL_BG="var(--color-surface)"
    PANEL_BORDER="0"
    PANEL_SHADOW="0 20px 60px rgba(45,49,46,0.08)"
    PANEL_HOVER_SHADOW="0 20px 60px rgba(45,49,46,0.08)"
    PANEL_HOVER="none" ;;
  terminal)
    PANEL_BG="var(--color-surface)"
    PANEL_BORDER="1px solid var(--color-accent)"
    PANEL_HOVER="none"
    BUTTON_INK="#0A0A0A" ;;
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

  .skip-link {
    position: fixed;
    top: 12px;
    left: 12px;
    z-index: 100;
    padding: 10px 14px;
    color: var(--color-bg);
    background: var(--color-accent);
    transform: translateY(-160%);
  }
  .skip-link:focus { transform: translateY(0); }

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

  /* ── Ambient treatment: emitted only for systems that define it ── */
  ${AMBIENT_CSS}

  /* ── Content layer ── */
  .content { position: relative; z-index: 1; }

  /* ── System-specific navigation ── */
  nav {
    position: sticky;
    top: 0;
    z-index: 50;
    width: 100%;
    border-bottom: 1px solid var(--color-line);
    background: ${NAV_BG};
    backdrop-filter: ${NAV_BLUR};
    -webkit-backdrop-filter: ${NAV_BLUR};
  }
  /* Mobile-first: nav wraps at 375px instead of overflowing. */
  .nav-inner {
    max-width: 1200px;
    margin: 0 auto;
    padding: 12px 16px;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: space-between;
    gap: 12px;
  }
  .nav-logo {
    font-family: var(--font-display);
    font-size: 1.1rem;
    color: var(--color-ink);
    text-decoration: none;
    letter-spacing: -0.02em;
  }
  .nav-links { display: flex; flex-wrap: wrap; gap: 16px; list-style: none; margin: 0; padding: 0; }
  .nav-links a {
    font-size: 0.85rem;
    color: var(--color-muted);
    text-decoration: none;
    transition: color 180ms ease;
  }
  .nav-links a:hover { color: var(--color-ink); }

  /* ── Main layout (mobile base) ── */
  main {
    max-width: 1200px;
    margin: 0 auto;
    padding: 32px 16px 64px;
  }

  /* ── System-specific container model ── */
  .panel {
    padding: ${PANEL_PADDING};
    background: ${PANEL_BG};
    border: ${PANEL_BORDER};
    border-radius: ${PANEL_RADIUS};
    transition: transform 220ms ease, box-shadow 220ms ease;
    will-change: transform;
    box-shadow: ${PANEL_SHADOW};
  }
  .panel:hover {
    transform: ${PANEL_HOVER};
    box-shadow: ${PANEL_HOVER_SHADOW};
  }
  .panel-inner {
    padding: 24px;
    background: ${PANEL_INNER_BG};
    border: ${PANEL_INNER_BORDER};
    border-radius: var(--radius-base);
  }

  /* ── Content layout (mobile base: single column) ── */
  .content-grid {
    display: grid;
    grid-template-columns: 1fr;
    gap: 12px;
    margin-top: 24px;
  }

  /* ── Breakpoints: 768px tablet, 1280px desktop ──
     Required floor per SKILL.md. Every section needs an explicit rule at each
     step — if nothing changes at 768px, the layout has not been designed. */
  @media (min-width: 768px) {
    .nav-inner { padding: 0 24px; height: 60px; flex-wrap: nowrap; }
    .nav-links { gap: 28px; flex-wrap: nowrap; }
    main { padding: 40px 24px 80px; }
    .content-grid { grid-template-columns: ${GRID_COLUMNS_TABLET}; gap: 16px; margin-top: 32px; }
  }
  @media (min-width: 1280px) {
    main { padding: 48px 48px 96px; }
    .content-grid { grid-template-columns: ${GRID_COLUMNS}; gap: 20px; }
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
  h2 {
    font-family: var(--font-display);
    font-size: clamp(1.125rem, 2.5vw, 1.375rem);
    letter-spacing: -0.01em;
    color: var(--color-ink);
    margin: 0 0 12px;
    text-wrap: balance;
  }
  main > section { margin-top: 40px; }
  section + section { margin-top: 48px; }
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
    color: ${BUTTON_INK};
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

<a class="skip-link" href="#main-content">Skip to main content</a>

<!-- This remains empty unless the selected system explicitly defines ambient treatment. -->
${AMBIENT_HTML}

<header>
  <nav aria-label="Main">
    <div class="nav-inner">
      <a href="#main-content" class="nav-logo">${NAME}</a>
      <ul class="nav-links">
        <li><a href="#overview">Overview</a></li>
        <li><a href="#activity">Activity</a></li>
        <li><a href="#settings">Settings</a></li>
      </ul>
      <button class="btn" type="button">Primary action</button>
    </div>
  </nav>
</header>

<!-- Main content -->
<div class="content">
  <main id="main-content">
    <!-- Hero -->
    <h1>Your headline here</h1>
    <p class="subtitle">A clear, one-sentence description of what this page does and who it serves. Sentence case, active voice.</p>

    <!-- Generic content groups; the selected system controls their visual treatment.
         Each nav target is a real <section> with its own <h2> — h1 → h2 hierarchy,
         no skipped levels, and every anchor resolves to a landmark, not a card. -->
    <section id="overview" aria-labelledby="overview-heading">
      <h2 id="overview-heading">Overview</h2>
      <div class="content-grid">
        <article class="panel">
          <div class="panel-inner">
            <p class="label">Metric one</p>
            <p class="metric">—</p>
          </div>
        </article>
        <article class="panel">
          <div class="panel-inner">
            <p class="label">Metric two</p>
            <p class="metric">—</p>
          </div>
        </article>
        <article class="panel">
          <div class="panel-inner">
            <p class="label">Metric three</p>
            <p class="metric">—</p>
          </div>
        </article>
      </div>
    </section>

    <section id="activity" aria-labelledby="activity-heading">
      <h2 id="activity-heading">Activity</h2>
      <article class="panel">
        <div class="panel-inner">
          <p class="subtitle">Replace with the real activity content for this brief.</p>
        </div>
      </article>
    </section>

    <section id="settings" aria-labelledby="settings-heading">
      <h2 id="settings-heading">Settings</h2>
      <article class="panel">
        <div class="panel-inner">
          <p class="subtitle">Replace with the real settings content for this brief.</p>
        </div>
      </article>
    </section>
  </main>
</div>

<footer class="content">
  <p class="subtitle" style="max-width:1200px;margin:0 auto;padding:24px;">${NAME}</p>
</footer>

</body>
</html>
HTMLEOF

echo "==> Done: $OUTPUT"
echo "   Design system: $SYSTEM"
echo "   Fonts loaded:  $FONTS_URL"
echo ""
echo "   This file FAILS audit-ui.sh on purpose until you replace the stub copy"
echo "   ('Your headline here', 'Metric one/two/three'). That is the gate working —"
echo "   a scaffold is a starting point, not a deliverable."
echo ""
echo "   Next: fill the content from your design-brief.md worksheet."
echo "   Then: bash scripts/audit-ui.sh ."
