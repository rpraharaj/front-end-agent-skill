#!/usr/bin/env bash
# audit-ui.sh — Premium UI quality gate: accessibility + anti-slop heuristics.
# Usage: bash scripts/audit-ui.sh <project-dir>
# Runs a quick static check for the non-negotiable premium-UI floor and prints
# a PASS/FAIL report. Intended to run in CI or after a local build.
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
  report "[warn]" "axe-core not detected. You can install @axe-core/playwright for automated a11y audits."
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
# NOTE: #5e6ad2 (Linear indigo) and #635bff (Stripe purple) are intentional first-party
# tokens from design-systems.md — they are excluded here to prevent false positives.
# The grep below targets genuinely generic AI-slop patterns only.
SLOP_HITS=$(grep -rEi "bg-gradient-to-|linear-gradient|#F4F1EA|bg-purple-[3-6]00|text-purple-[3-6]00|#7c3aed|#a855f7|#8b5cf6" \
  --include="*.tsx" --include="*.css" --include="*.html" --include="*.jsx" src app . 2>/dev/null | wc -l | tr -d ' ')
if [ "$SLOP_HITS" -gt 0 ]; then
  report "[warn]" "$SLOP_HITS potential slop-pattern match(es) — confirm these are deliberate, not defaults."
  grep -rEi "bg-gradient-to-|linear-gradient|#F4F1EA|bg-purple-[3-6]00|text-purple-[3-6]00|#7c3aed|#a855f7|#8b5cf6" --include="*.tsx" --include="*.css" --include="*.html" --include="*.jsx" src app . 2>/dev/null | head -5
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

# --- 8. WCAG Contrast reminder -----------------------------------------------
report "[info]" "Manual contrast check required: body text ≥ 4.5:1, large text ≥ 3:1 on its background."
report "[info]" "  Use: https://webaim.org/resources/contrastchecker/ or run axe-core for automated checks."

# --- 9. Images: alt attribute required ----------------------------------------
IMG_TOTAL=$(grep -rEci "<img" --include="*.html" --include="*.tsx" --include="*.jsx" src app . 2>/dev/null | awk -F: '{sum+=$2} END{print sum+0}')
IMG_WITH_ALT=$(grep -rEci "<img[^>]+alt=" --include="*.html" --include="*.tsx" --include="*.jsx" src app . 2>/dev/null | awk -F: '{sum+=$2} END{print sum+0}')
if [ "$IMG_TOTAL" -gt 0 ] && [ "$IMG_WITH_ALT" -lt "$IMG_TOTAL" ]; then
  MISSING=$((IMG_TOTAL - IMG_WITH_ALT))
  report "[FAIL]" "$MISSING <img> element(s) missing alt attribute (WCAG 1.1.1)."
  grep -rEni "<img(?![^>]*alt=)" --include="*.html" --include="*.tsx" --include="*.jsx" src app . 2>/dev/null | head -5
  FAIL=1
else
  report "[PASS]" "All <img> elements have alt attributes (or none present)."
fi

# --- 10. Landmark: <main> element present ------------------------------------
if grep -rqi "<main" --include="*.html" --include="*.tsx" --include="*.jsx" src app . 2>/dev/null; then
  report "[PASS]" "<main> landmark found."
else
  report "[FAIL]" "No <main> landmark detected. Every page needs a <main> element (WCAG 1.3.6)."
  FAIL=1
fi

echo "==> Audit complete."
if [ "$FAIL" -ne 0 ]; then
  echo "Result: FAIL — fix the [FAIL] items above."
  exit 1
else
  echo "Result: PASS (warnings are advisory)."
fi
