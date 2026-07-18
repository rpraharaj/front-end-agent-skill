#!/usr/bin/env bash
# scaffold-ui.sh — Premium UI scaffolding for Next.js 16 + React 19 + Tailwind + shadcn/ui
# Usage: bash scripts/scaffold-ui.sh <project-name> [target-dir]
# Mirrors the workspace-ai stack (Next 16 / React 19 / Tailwind / Radix-based shadcn,
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

# 3. Install the icon set already used by workspace-ai.
echo "==> Installing lucide-react..."
npm install lucide-react

# 4. Pre-install the most common premium components so the agent doesn't
#    round-trip shadcn for every element.
echo "==> Adding base component set..."
npx --yes shadcn@latest add button card dialog input textarea \
  badge avatar tabs sheet dropdown-menu separator skeleton --yes 2>/dev/null || \
  echo "   (some components may already exist or require a TTY; safe to continue)"

# 5. Drop a starter globals.css scaffold that respects reduced-motion and
#    sets up CSS variables for a token-driven theme (fill from the design worksheet).
if [ -f "src/app/globals.css" ]; then
  cat >> "src/app/globals.css" <<'CSS'

/* --- Premium UI: token hooks (populate from templates/design-brief.md) --- */
:root {
  --color-ink: #0b0b0f;
  --color-surface: #16161a;
  --color-mist: #f7f8fa;
  --color-accent: #5e6ad2;
  --color-muted: #8a8f98;
  --radius-base: 0.75rem;
}
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after { animation-duration: 0.001ms !important; transition-duration: 0.001ms !important; }
}
CSS
fi

echo "==> Done. Next steps:"
echo "   1. Fill templates/design-brief.md (this skill) for your brief."
echo "   2. Map worksheet tokens into globals.css CSS variables above."
echo "   3. Build the screen, then run: bash scripts/audit-ui.sh ."
