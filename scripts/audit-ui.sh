#!/usr/bin/env bash
# audit-ui.sh — Premium UI quality gate: accessibility + anti-slop heuristics.
# Usage: bash scripts/audit-ui.sh <project-dir>
# Runs a quick static check for the non-negotiable premium-UI floor and prints
# a PASS/FAIL report. Intended to run in CI or after a build (see workspace-ai verify:local).
set -uo pipefail

PROJECT_DIR="${1:-.}"
cd "$PROJECT_DIR"
FAIL=0
report() { printf '%s %s\n' "$1" "$2"; }

echo "==> Premium UI audit: $PROJECT_DIR"

# --- 1. Accessibility: axe-core (if installed) -------------------------------
if [ -d "node_modules/@axe-core" ] || npm ls @axe-core/playwright >/dev/null 2>&1; then
  report "[a11y]" "axe-core present — run 'npx playwright test' for full coverage."
else
  report "[warn]" "axe-core not detected. workspace-ai uses @axe-core/playwright; add it for automated a11y."
fi

# --- 2. Reduced-motion handling ---------------------------------------------
if grep -rq "prefers-reduced-motion" --include="*.css" --include="*.tsx" --include="*.html" --include="*.jsx" src app . 2>/dev/null; then
  report "[PASS]" "prefers-reduced-motion handled."
else
  report "[FAIL]" "No prefers-reduced-motion guard found (required floor)."
  FAIL=1
fi

# --- 3. Visible keyboard focus ----------------------------------------------
if grep -rq "focus-visible" --include="*.css" --include="*.tsx" --include="*.html" --include="*.jsx" src app . 2>/dev/null; then
  report "[PASS]" "focus-visible styling present."
else
  report "[FAIL]" "No focus-visible styling (keyboard focus must be visible)."
  FAIL=1
fi

# --- 4. Anti-slop heuristics -------------------------------------------------
# Flags the template-answer patterns from references/anti-slop-rules.md.
SLOP_HITS=$(grep -rEi "bg-gradient-to-|linear-gradient|#F4F1EA|#5e6ad2|#635bff|#7c3aed|#a855f7|font-(sans|inter)" \
  --include="*.tsx" --include="*.css" --include="*.html" --include="*.jsx" src app . 2>/dev/null | wc -l | tr -d ' ')
if [ "$SLOP_HITS" -gt 0 ]; then
  report "[warn]" "$SLOP_HITS potential slop-pattern match(es) — confirm these are deliberate, not defaults. (Matches for #5e6ad2 / #635bff are accepted if using Minimal-Tech or Editorial systems)."
  grep -rEi "bg-gradient-to-|linear-gradient|#F4F1EA|#5e6ad2|#635bff|#7c3aed|#a855f7|font-(sans|inter)" --include="*.tsx" --include="*.css" --include="*.html" --include="*.jsx" src app . 2>/dev/null | head -5
else
  report "[PASS]" "No obvious slop patterns."
fi

# --- 5. Micro-Layout and Viewports --------------------------------------------
VH_HITS=$(grep -rEi "\W100vh\W" --include="*.tsx" --include="*.css" --include="*.html" --include="*.jsx" src app . 2>/dev/null | wc -l | tr -d ' ')
if [ "$VH_HITS" -gt 0 ]; then
  report "[warn]" "Found $VH_HITS reference(s) to '100vh'. Consider using '100dvh' or 'min-h-[100dvh]' to prevent mobile layout jumps."
  grep -rnEi "\W100vh\W" --include="*.tsx" --include="*.css" --include="*.html" --include="*.jsx" src app . 2>/dev/null | head -3
else
  report "[PASS]" "No raw 100vh height triggers detected."
fi

# --- 6. Typography Orphan Control ---------------------------------------------
WRAP_HITS=$(grep -rEi "text-balance|text-pretty|text-wrap:\s*(balance|pretty)" --include="*.tsx" --include="*.css" --include="*.html" --include="*.jsx" src app . 2>/dev/null | wc -l | tr -d ' ')
if [ "$WRAP_HITS" -gt 0 ]; then
  report "[PASS]" "Orphan wrap controls found ($WRAP_HITS match(es))."
else
  report "[warn]" "No text-balance or text-pretty wrapping wrappers found. Consider balance/pretty to prevent orphaned words."
fi

# --- 7. lorem ipsum / placeholder copy --------------------------------------
if grep -rqi "lorem ipsum\|TODO\|FIXME\|placeholder text" \
  --include="*.tsx" --include="*.md" --include="*.html" --include="*.jsx" src app . 2>/dev/null; then
  report "[FAIL]" "Placeholder copy (lorem ipsum / TODO) found — real copy is required."
  FAIL=1
else
  report "[PASS]" "No placeholder copy."
fi

echo "==> Audit complete."
if [ "$FAIL" -ne 0 ]; then
  echo "Result: FAIL — fix the [FAIL] items above."
  exit 1
else
  echo "Result: PASS (warnings are advisory)."
fi
