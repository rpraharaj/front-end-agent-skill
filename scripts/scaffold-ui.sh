#!/usr/bin/env bash
# scaffold-ui.sh — Premium UI scaffolding for Next.js 16 + React 19 + Tailwind + shadcn/ui
# Usage: bash scripts/scaffold-ui.sh <project-name> [target-dir]
# Mirrors a default modern stack (Next 16 / React 19 / Tailwind / Radix-based shadcn,
# lucide-react icons) so generated UIs drop into an existing repo without stack friction.
set -euo pipefail

PROJECT_NAME="${1:?Usage: scaffold-ui.sh <project-name> [target-dir]}"
TARGET_DIR="${2:-.}"

echo "==> Premium UI scaffold: $PROJECT_NAME (target: $TARGET_DIR)"
mkdir -p "$TARGET_DIR"

# 1. Initialize a Next.js app with TypeScript + Tailwind + App Router + src dir.
#    Non-interactive flags keep this scriptable.
echo "==> Creating Next.js 16 app..."
npx --yes create-next-app@latest "$PROJECT_NAME" \
  --ts --tailwind --app --src-dir --eslint --import-alias "@/*" \
  --use-npm --no-turbopack --yes

cd "$PROJECT_NAME"

# 2. Initialize shadcn/ui (Radix-based, accessible primitives).
echo "==> Initializing shadcn/ui..."
npx --yes shadcn@latest init --yes --defaults

# 3. Install the standard icon set.
echo "==> Installing lucide-react..."
npm install lucide-react

# 4. Pre-install the most common premium components so the agent doesn't
#    round-trip shadcn for every element.
echo "==> Adding base component set..."
npx --yes shadcn@latest add button card dialog input textarea \
  badge avatar tabs sheet dropdown-menu separator skeleton --yes 2>/dev/null || \
  echo "   (some components may already exist or require a TTY; safe to continue)"

# 5. Drop a starter globals.css scaffold that respects reduced-motion and
#    sets up CSS variables for a token-driven theme.
#
#    Deliberately NEUTRAL: no system's palette or fonts are pre-filled. Shipping
#    Inter + Linear indigo here would hand every project the banned default look
#    (anti-slop-rules.md #5) before the design brief is even written. Replace the
#    monochrome placeholders below with the worksheet's named tokens.
if [ -f "src/app/globals.css" ]; then
  cat >> "src/app/globals.css" <<'CSS'

/* --- Premium UI: token hooks -------------------------------------------------
   Replace every value below from templates/design-brief.md Section 4.
   These greys are placeholders, NOT a palette — shipping them is a failed build.

   Fonts: load real faces with next/font in src/app/layout.tsx and point
   --font-display / --font-body at the generated variables. See
   references/design-systems.md "Typography Loaders". A font-family naming a face
   that was never loaded silently falls back to system serif/sans.
--------------------------------------------------------------------------- */
/* Declare tokens ONCE, here. In Tailwind v4 `@theme` is the token layer: it emits
   these into :root (so var(--color-ink) works) *and* generates the utilities
   (text-ink, bg-surface, font-display, rounded-base).

   Do NOT write `:root { --color-ink: … }` plus `@theme { --color-ink: var(--color-ink) }`.
   That is a self-reference; it survives today only because unlayered CSS outranks
   @layer theme, and it silently resolves to nothing the moment your :root moves
   into a cascade layer. Either declare literals here, or use two distinct names
   (`:root{--ink:…}` + `@theme inline{--color-ink:var(--ink)}`).

   To use a bundled system: copy its block from references/design-systems.md and
   paste the declarations INSIDE this @theme block (they use the same --color-*
   names, so it is a straight paste — just swap the `:root {` wrapper for `@theme {`). */
@theme {
  --color-bg: #ffffff;
  --color-surface: #f4f4f5;
  --color-solid: #e4e4e7;
  --color-line: #d4d4d8;
  --color-ink: #18181b;
  --color-muted: #71717a;
  --color-accent: #18181b;
  --font-display: var(--font-geist-sans), system-ui, sans-serif;
  --font-body: var(--font-geist-sans), system-ui, sans-serif;
  --radius-base: 0.5rem;
}

/* Required a11y floor — do not remove. */
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after { animation-duration: 0.001ms !important; transition-duration: 0.001ms !important; }
}
:focus-visible { outline: 2px solid var(--color-accent); outline-offset: 3px; }

/* Screen-reader-only utility (references/a11y-floor.md §7). */
.sr-only {
  position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px;
  overflow: hidden; clip: rect(0,0,0,0); white-space: nowrap; border: 0;
}
CSS
fi

echo "==> Done. Next steps:"
echo "   1. Fill templates/design-brief.md (this skill) for your brief."
echo "   2. Replace the placeholder tokens in src/app/globals.css with the worksheet's"
echo "      named values, and load the real display/body faces via next/font."
echo "   3. Build the screen, then run: bash scripts/audit-ui.sh ."
echo ""
echo "   The scaffold ships NO palette and NO display font on purpose — those come"
echo "   from the locked design system, not from this script."
