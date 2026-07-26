#!/usr/bin/env bash
# shoot.sh — Render a UI at the three required breakpoints and save PNGs.
# Usage: bash scripts/shoot.sh <file.html | url> [output-dir]
#
#   bash scripts/shoot.sh dashboard.html
#   bash scripts/shoot.sh http://localhost:3000 output/shots/home
#
# Produces <out>/mobile-375.png, tablet-768.png, desktop-1280.png.
# Needs Playwright. If it is unavailable this script tells you and exits 3 —
# use your agent's own browser tooling instead (see references/critique-loop.md).
#
# Rendering is not optional. Looking at the screenshots is the point of the step;
# generating them and not opening them is the same as skipping it.
set -uo pipefail

TARGET="${1:?Usage: shoot.sh <file.html | url> [output-dir]}"
OUTDIR="${2:-output/shots}"

# Local file -> serve over HTTP. file:// breaks fonts, fetch, and module scripts.
SERVER_PID=""
cleanup() { [ -n "$SERVER_PID" ] && kill "$SERVER_PID" 2>/dev/null; }
trap cleanup EXIT

case "$TARGET" in
  http://*|https://*)
    URL="$TARGET" ;;
  *)
    if [ ! -f "$TARGET" ]; then
      echo "shoot.sh: no such file: $TARGET" >&2
      exit 2
    fi
    DIR=$(cd "$(dirname "$TARGET")" && pwd)
    FILE=$(basename "$TARGET")
    PORT=8899
    while lsof -i ":$PORT" >/dev/null 2>&1; do PORT=$((PORT + 1)); done
    (cd "$DIR" && python3 -m http.server "$PORT" >/dev/null 2>&1) &
    SERVER_PID=$!
    sleep 1
    URL="http://localhost:${PORT}/${FILE}"
    echo "==> Serving $DIR on port $PORT"
    ;;
esac

# Resolve Playwright: project-local, then a global install. Monorepos hoist it to a
# parent node_modules, and some setups only have it globally.
PW=""
if npx --no-install playwright --version >/dev/null 2>&1; then
  PW="npx --no-install playwright"
elif command -v playwright >/dev/null 2>&1 && playwright --version >/dev/null 2>&1; then
  PW="playwright"
fi

if [ -z "$PW" ]; then
  cat >&2 <<'MSG'
shoot.sh: Playwright not installed in this project.

  Install:  npm i -D playwright && npx playwright install chromium

Or skip this script and use your agent's browser tooling directly — open the URL,
set the viewport to 375/768/1280, and screenshot each. See references/critique-loop.md.
MSG
  exit 3
fi

mkdir -p "$OUTDIR"
echo "==> Shooting $URL"

shot() {
  local name="$1" w="$2" h="$3"
  if $PW screenshot \
       --viewport-size="${w},${h}" \
       --wait-for-timeout=1200 \
       "$URL" "${OUTDIR}/${name}.png" >/dev/null 2>&1; then
    echo "    ${OUTDIR}/${name}.png  (${w}x${h})"
  else
    echo "    FAILED at ${w}x${h}" >&2
    return 1
  fi
}

FAIL=0
shot "mobile-375"  375  812  || FAIL=1
shot "tablet-768"  768  1024 || FAIL=1
shot "desktop-1280" 1280 800 || FAIL=1

if [ "$FAIL" -ne 0 ]; then
  echo "==> Some renders failed — do not report the UI as verified." >&2
  exit 1
fi

echo "==> Done. Now OPEN all three and run the rubric in references/critique-loop.md §2."
echo "    Screenshots you did not look at prove nothing."
