#!/usr/bin/env bash
# audit-ui.sh — Premium UI quality gate: accessibility + anti-slop heuristics.
# Usage: bash scripts/audit-ui.sh <project-dir>
#
# Scans ONLY first-party source. Dependency and build directories are excluded —
# a guard that lives in node_modules is not a guard in your UI.
#
# Exit 0 = PASS (warnings advisory). Exit 1 = FAIL (fix the [FAIL] lines).
set -uo pipefail

PROJECT_DIR="${1:-.}"
if [ ! -d "$PROJECT_DIR" ]; then
  echo "audit-ui.sh: no such directory: $PROJECT_DIR" >&2
  exit 2
fi
cd "$PROJECT_DIR" || exit 2
FAIL=0
report() { printf '%s %s\n' "$1" "$2"; }

# --- Scan scope -------------------------------------------------------------
# Everything below greps '.' exactly once with these excludes. Never add a bare
# 'src app .' style path list: it rescans src/ twice and inflates every count.
EXCLUDE=(
  --exclude-dir=node_modules --exclude-dir=.git --exclude-dir=.next
  --exclude-dir=dist --exclude-dir=build --exclude-dir=out
  --exclude-dir=coverage --exclude-dir=.turbo --exclude-dir=.vercel
  --exclude-dir=.svelte-kit --exclude-dir=vendor --exclude-dir=.cache
)
# Files that can carry styling (reduced-motion, focus, colors, viewport units).
STYLE=(
  --include=*.css --include=*.scss --include=*.html --include=*.tsx
  --include=*.jsx --include=*.vue --include=*.svelte --include=*.astro
)
# Files that can carry markup (landmarks, images, headings).
MARKUP=(
  --include=*.html --include=*.tsx --include=*.jsx --include=*.vue
  --include=*.svelte --include=*.astro
)

echo "==> Premium UI audit: $PROJECT_DIR"

SCANNED=$(grep -rl "" "${EXCLUDE[@]}" "${STYLE[@]}" . 2>/dev/null | wc -l | tr -d ' ')
if [ "$SCANNED" -eq 0 ]; then
  report "[FAIL]" "No source files found to audit (looked for css/html/tsx/jsx/vue/svelte/astro)."
  echo "Result: FAIL — is '$PROJECT_DIR' the right directory?"
  exit 1
fi
report "[info]" "$SCANNED first-party source file(s) in scope (dependencies excluded)."

# --- 1. Accessibility: axe-core (if installed) -------------------------------
if [ -d "node_modules/@axe-core" ] || npm ls @axe-core/playwright >/dev/null 2>&1; then
  report "[a11y]" "axe-core present — run 'npx playwright test' for full coverage."
else
  report "[warn]" "axe-core not detected. Install @axe-core/playwright for automated a11y audits."
fi

# --- 2. Reduced-motion handling ---------------------------------------------
if grep -rq "prefers-reduced-motion" "${EXCLUDE[@]}" "${STYLE[@]}" . 2>/dev/null; then
  report "[PASS]" "prefers-reduced-motion handled."
else
  report "[FAIL]" "No prefers-reduced-motion guard found (required floor)."
  FAIL=1
fi

# --- 3. Visible keyboard focus ----------------------------------------------
if grep -rq "focus-visible" "${EXCLUDE[@]}" "${STYLE[@]}" . 2>/dev/null; then
  report "[PASS]" "focus-visible styling present."
else
  report "[FAIL]" "No focus-visible styling (keyboard focus must be visible)."
  FAIL=1
fi

# --- 4. Anti-slop heuristics -------------------------------------------------
# Flags the template-answer patterns from references/anti-slop-rules.md.
# NOTE: #5e6ad2 (Linear indigo) and #635bff (Stripe purple) are first-party tokens
# in design-systems.md, so they are NOT flagged here. That means the audit cannot
# tell "deliberately chose Minimal-Tech" from "left the scaffold defaults in place" —
# the design-brief worksheet is what enforces that, not this grep.
SLOP_RE="bg-gradient-to-|linear-gradient|#F4F1EA|bg-purple-[3-6]00|text-purple-[3-6]00|#7c3aed|#a855f7|#8b5cf6"
SLOP_HITS=$(grep -rEio "$SLOP_RE" "${EXCLUDE[@]}" "${STYLE[@]}" . 2>/dev/null | wc -l | tr -d ' ')
if [ "$SLOP_HITS" -gt 0 ]; then
  report "[warn]" "$SLOP_HITS potential slop-pattern match(es) — confirm these are deliberate, not defaults."
  grep -rEni "$SLOP_RE" "${EXCLUDE[@]}" "${STYLE[@]}" . 2>/dev/null | head -5
else
  report "[PASS]" "No obvious slop patterns."
fi

# --- 5. Micro-layout and viewports -------------------------------------------
VH_HITS=$(grep -rEio "[^d]100vh" "${EXCLUDE[@]}" "${STYLE[@]}" . 2>/dev/null | wc -l | tr -d ' ')
if [ "$VH_HITS" -gt 0 ]; then
  report "[warn]" "Found $VH_HITS reference(s) to '100vh'. Use '100dvh' / 'min-h-[100dvh]' to prevent mobile layout jumps."
  grep -rEni "[^d]100vh" "${EXCLUDE[@]}" "${STYLE[@]}" . 2>/dev/null | head -3
else
  report "[PASS]" "No raw 100vh height triggers detected."
fi

# --- 6. Typography orphan control --------------------------------------------
WRAP_HITS=$(grep -rEio "text-balance|text-pretty|text-wrap:[[:space:]]*(balance|pretty)" "${EXCLUDE[@]}" "${STYLE[@]}" . 2>/dev/null | wc -l | tr -d ' ')
if [ "$WRAP_HITS" -gt 0 ]; then
  report "[PASS]" "Orphan wrap controls found ($WRAP_HITS match(es))."
else
  report "[warn]" "No text-balance / text-pretty found. Add balance on headlines, pretty on paragraphs."
fi

# --- 7. Responsive breakpoints ------------------------------------------------
# The reduced-motion guard is itself a media query, so count only width queries.
BP_HITS=$(grep -rEio "@media[^{]*(min|max)-width|@container[^{]*(min|max)-width|sm:|md:|lg:|xl:" "${EXCLUDE[@]}" "${STYLE[@]}" . 2>/dev/null | wc -l | tr -d ' ')
if [ "$BP_HITS" -gt 0 ]; then
  report "[PASS]" "Responsive breakpoints present ($BP_HITS width-query/prefix match(es))."
else
  report "[FAIL]" "No width breakpoints found — layout cannot be responsive at 375/768/1280 (required floor)."
  FAIL=1
fi

# --- 8. Placeholder copy ------------------------------------------------------
# FAIL only on copy that would ship as visible filler. TODO/FIXME in code comments
# are a separate, advisory signal — they are not "placeholder copy" in the UI.
FILLER_RE="lorem ipsum|placeholder text|Your headline here|Metric one|Metric two|Metric three|Lorem, ipsum"
if grep -rqEi "$FILLER_RE" "${EXCLUDE[@]}" "${MARKUP[@]}" . 2>/dev/null; then
  report "[FAIL]" "Placeholder copy found — real copy is required (scaffold stubs must be replaced)."
  grep -rEni "$FILLER_RE" "${EXCLUDE[@]}" "${MARKUP[@]}" . 2>/dev/null | head -5
  FAIL=1
else
  report "[PASS]" "No placeholder copy."
fi
TODO_HITS=$(grep -rEio "TODO|FIXME" "${EXCLUDE[@]}" "${MARKUP[@]}" . 2>/dev/null | wc -l | tr -d ' ')
if [ "$TODO_HITS" -gt 0 ]; then
  report "[warn]" "$TODO_HITS TODO/FIXME marker(s) in markup — confirm none render as visible text."
fi

# --- 9. WCAG contrast reminder (manual) ---------------------------------------
report "[info]" "MANUAL: body text ≥ 4.5:1, large text ≥ 3:1 on its background. This script does not compute contrast."
report "[info]" "  Use https://webaim.org/resources/contrastchecker/ or axe-core."

# --- 10. Images: alt attribute required ---------------------------------------
# Tag-level parsing. Counting with `grep -c` counts LINES, which both misses two
# tags on one line and false-fails multi-line JSX — hence perl.
IMG_FILES=$(grep -rlE "<(img|Image)\b" "${EXCLUDE[@]}" "${MARKUP[@]}" . 2>/dev/null)
if [ -z "$IMG_FILES" ]; then
  report "[PASS]" "No <img> elements present."
elif ! command -v perl >/dev/null 2>&1; then
  report "[warn]" "perl not found — skipped the alt-text check. Verify <img alt> manually."
else
  # NB: copy $1 to a lexical before testing it — a nested match clobbers $1.
  IMG_STATS=$(printf '%s\n' "$IMG_FILES" | tr '\n' '\0' | xargs -0 perl -0777 -ne '
    while (/<(?:img|Image)\b([^>]*)>/g) { my $a = $1; $t++; $n++ unless $a =~ /\balt\s*=/ }
    END { printf "%d %d\n", $t // 0, $n // 0 }' 2>/dev/null)
  IMG_TOTAL=$(printf '%s' "$IMG_STATS" | awk '{print $1+0}')
  IMG_NOALT=$(printf '%s' "$IMG_STATS" | awk '{print $2+0}')
  if [ "${IMG_NOALT:-0}" -gt 0 ]; then
    report "[FAIL]" "$IMG_NOALT of $IMG_TOTAL <img> element(s) missing alt attribute (WCAG 1.1.1)."
    printf '%s\n' "$IMG_FILES" | tr '\n' '\0' | xargs -0 perl -0777 -ne '
      while (/<(?:img|Image)\b([^>]*)>/g) { my $a = $1; next if $a =~ /\balt\s*=/; print "    $ARGV\n"; last }' 2>/dev/null | head -5
    FAIL=1
  else
    report "[PASS]" "All $IMG_TOTAL <img> element(s) have alt attributes."
  fi
  # Advisory: explicit dimensions prevent CLS (performance-floor.md §2).
  DIM_MISSING=$(printf '%s\n' "$IMG_FILES" | tr '\n' '\0' | xargs -0 perl -0777 -ne '
    while (/<(?:img|Image)\b([^>]*)>/g) { my $a = $1; $n++ unless ($a =~ /\bwidth\s*=/ && $a =~ /\bheight\s*=/) }
    END { printf "%d\n", $n // 0 }' 2>/dev/null)
  if [ "${DIM_MISSING:-0}" -gt 0 ]; then
    report "[warn]" "$DIM_MISSING <img> element(s) without explicit width+height (CLS risk)."
  fi
fi

# --- 11. Landmark: <main> element present -------------------------------------
if grep -rqEi "<main\b|role=[\"']main[\"']" "${EXCLUDE[@]}" "${MARKUP[@]}" . 2>/dev/null; then
  report "[PASS]" "<main> landmark found."
else
  report "[FAIL]" "No <main> landmark detected. Every page needs a <main> element (WCAG 1.3.1)."
  FAIL=1
fi

# --- 12. Heading hierarchy (standalone HTML pages only) -----------------------
# Component files legitimately have zero or many h1s; a full page must have one.
for f in $(grep -rlEi "<body\b" "${EXCLUDE[@]}" --include=*.html . 2>/dev/null); do
  H1=$(grep -oEi "<h1\b" "$f" 2>/dev/null | wc -l | tr -d ' ')
  if [ "$H1" -ne 1 ]; then
    report "[warn]" "$f has $H1 <h1> element(s) — a page needs exactly one."
  fi
done

echo "==> Audit complete."
if [ "$FAIL" -ne 0 ]; then
  echo "Result: FAIL — fix the [FAIL] items above."
  echo "Note: this gate covers a subset of the Post-Build checklist. Contrast, heading"
  echo "      order, form labels, and Lighthouse still require the manual checks in SKILL.md."
  exit 1
else
  echo "Result: PASS (warnings are advisory)."
  echo "Note: PASS covers this script's checks only — not contrast, form labels, or Lighthouse."
  exit 0
fi
