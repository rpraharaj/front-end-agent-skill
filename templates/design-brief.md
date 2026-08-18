**⛔ REQUIRED: Fill every field below on disk before writing production-app code (Route A Step 6).** HTML-mode variant files in Step 2 are exploration, not a skipped worksheet. After Gate 2 (the user selects a direction), do not wait for more "proceed" messages — lock the system, complete this sheet, post the short lock summary from `SKILL.md` Rule #0, and build. Do **not** paste this entire worksheet into the thread.

_Copy this worksheet, replace every `____` placeholder with a real value specific to this brief. The example values (in italics) show the format — overwrite them entirely._

---

# Design Brief Worksheet

## 0. Intent Alignment (Gate 1 — confirm before producing variants)
- **Clarifying Questions Asked to User:**
  - _e.g. "Who is this for and what is its single goal?"_
  - _e.g. "Which brand, theme, accessibility, or reference constraints must every direction respect, and which choices may vary?"_
  - _e.g. "What actually goes on this screen, in priority order, with real example values? What does NOT belong here?"_
  - _e.g. "Is density fixed by the workflow, or should the variants explore compact and more spacious approaches? Which devices matter?"_
- **Personalized Recommendations & Design Rationale Offered:**
  - _e.g. "I recommend preserving the same tasks and data while exploring distinct screen architectures and visual treatments that fit the product intent."_
- **User's Confirmed / Selected Options:**
  - _e.g. "Responsive targets and accessibility constraints are fixed; navigation, density, palette, typography, and surfaces may vary."_

---

## 1. Subject
- **Product / subject:** ____
  - _e.g. "Ministry CRM for church administrators and care-team leads"_
- **Audience:** ____
  - _e.g. "Staff who open this every morning to see who needs a call"_
- **The page's single job:** ____
  - _e.g. "Show who needs attention and move the next care action without losing context"_
- **Surface:** ____
  - _Product (app / queue / dashboard) or Marketing (landing / portfolio) — see `references/surface-types.md`. Not both in one brief._
- **Theme constraint / exploration status:** ____
  - _Fixed light / Fixed dark / Must support both / Open for variant exploration_
  - _e.g. "Open for exploration — no established brand theme; each candidate must justify its choice from the usage context"_
- **Device targets:** ____
  - _e.g. "Fully responsive: 375px mobile, 768px tablet, 1280px desktop" (default) or "Desktop-first, mobile is read-only"_

### Content inventory (fill before any visual work)

**You cannot design hierarchy without knowing what competes for it.** Skipping this is why
generated screens end up with "Metric one / Metric two / Metric three." List what is actually
on this screen, in priority order, with real example values.

| Priority | Element / region | Real example content | Notes (volume, volatility) |
|---|---|---|---|
| 1 (the thing they came for) | ____ | ____ | ____ |
| 2 | ____ | ____ | ____ |
| 3 | ____ | ____ | ____ |
| … | ____ | ____ | ____ |

- _e.g. "1 | Portfolio value + 30-day trend | $1.24B, ▲ 4.2% | updates live, can be negative"_
- _e.g. "2 | Client list | 142 rows, names up to 40 chars | paginates past 50"_

- **Content that does NOT belong on this screen:** ____
  - _Naming exclusions prevents the everything-dashboard._
- **Density register implied by this inventory:** ____ _(compact 4px base / standard 8px / spacious 8px with double section gaps)_

---

## 2. Visual Variant Exploration

- **Exploration mode:** ____
  - _HTML mode (default, required when a browser exists) / Image mode (mood only — rebuild winner as HTML) / Skipped with reason_
- **Variant count and why:** ____
  - _Default 3. 4–5 only when more than three structural axes are genuinely open — name them. Do not fill unused slots._
- **Fixed product invariants:**
  - _Product intent, audience, job, capabilities, content, data, copy, and target devices:_ ____
- **Hard visual constraints shared by all variants:** ____
- **Visual properties available to explore:**
  - _Possible axes: navigation, architecture, density, theme, palette, typography, containers, geometry, elevation, emotional tone, signature interaction:_ ____
- **Saved variant location:** ____

### Structural Slot Assignment (fill before producing any variant)

Pick 3 job-fit slots. Write `unused — <reason>` in the others. Spatial canvas only if the product's primary object is a map, graph, timeline, or chart.

| Slot | Structural commitment | Variant assigned (or unused — reason) |
|---|---|---|
| Top nav | Horizontal top bar | ____  |
| Sidebar | Left rail | ____ |
| No persistent nav | Command / content / input-first | ____ |
| Continuous scroll | Single scrolling surface | ____ |
| Spatial canvas | Dominant visualization | ____ |

### Pre-Prompt Contrast Matrix (fill before producing any variant)

| Axis | A | B | C | (D) | (E) |
|---|---|---|---|---|---|
| Structural slot | | | | | |
| Navigation model | | | | | |
| Theme (dark/light/mid) | | | | | |
| Density | | | | | |
| Typography character | | | | | |
| Container model | | | | | |
| Emotional tone (1 word) | | | | | |
| Primary interaction verb | | | | | |

**Adjacent-pair gate** (default three: A-B, B-C, A-C): no pair shares the same value on more than 2 axes. ☐ PASS / ☐ REVISE

### Theme Diversity Check
- At least 1 light-canvas variant: ☐
- At least 1 dark-canvas variant: ☐
- _(or: theme hard-fixed by brief — document reason):_ ____

### Variant Comparison Table

| Variant | Direction name | One-line hook | Why it fits the intent | System | Key decisions (slot/theme/density/signature) | Strength | Tradeoff |
|---|---|---|---|---|---|---|---|
| A | ____ | ____ | ____ | ____ | ____ | ____ | ____ |
| B | ____ | ____ | ____ | ____ | ____ | ____ | ____ |
| C | ____ | ____ | ____ | ____ | ____ | ____ | ____ |
| D | ____ | ____ | ____ | ____ | ____ | ____ | ____ |
| E | ____ | ____ | ____ | ____ | ____ | ____ | ____ |

_Leave D and E blank. Default is three. Only fill D/E if Variant count above names extra open structural axes._

### Pre-Presentation Stop Gate
- **Check 1 — Structural silhouette test:** All thumbnails visually distinct at 200px ☐ PASS / ☐ REGENERATED: ____
- **Check 2 — System purity:** Each candidate uses exactly one named system ☐ PASS / ☐ REGENERATED: ____
- **Check 3 — Axis difference count:** Every adjacent pair differs on ≥4 axes ☐ PASS / ☐ REGENERATED: ____
- **Check 4 — Emotional tone word:** All tone words are different ☐ PASS / ☐ REGENERATED: ____

- **Why this set is useful for this particular brief:** ____
- **User-selected variant:** ____ (Direction name: ____)
- **Why the user selected it:** ____
- **Any one-element transfer requested:** ____
  - _None, or name exactly one element and its source candidate_

---

## 3. Design System Lock (pick exactly ONE after variant selection)
- **Chosen system:** ____
  _(Minimal-Tech / Warm-Sophisticate / Editorial / Dark Private-Client / Dark-Luxe / Boutique E-Commerce / Neo-Brutalist / Conversational AI / Organics / Terminal Hacker)_
- **Why this system fits the brief:** ____
  - _e.g. "Organics: borderless color fields and calm motion support a people-centered workflow without making it feel clinical or financial"_

### Effects Contract (copy from the selected system; do not inherit global effects)
- **Background treatment:** ____
- **Surface/container model:** ____
- **Navigation pattern:** ____
- **Elevation/shadow model:** ____
- **Motion character:** ____
- **Forbidden effects:** ____

---

## 4. Token Plan

### Color (4–6 named hex values — DO NOT use vague names like "blue")
| Role | Name | Hex |
|---|---|---|
| Background | _e.g. Paper_ | _e.g. #FFFFFF_ |
| Surface/card | _e.g. Mist_ | _e.g. #F7F8FA_ |
| Accent (one only, restrained) | _e.g. Forest_ | _e.g. #2F5233_ |
| Ink/primary text | _e.g. Ink_ | _e.g. #1A1F36_ |
| Muted/secondary text | _e.g. Slate_ | _e.g. #425466_ |
| _(optional) Semantic: good/warn/danger_ | _e.g. Jade / Amber / Rose_ | _e.g. #2F6F4E / #B45309 / #9B2C2C_ |

### Typography (2 roles minimum — be deliberate, not Inter-by-default)
| Role | Font | Usage |
|---|---|---|
| Display | _e.g. Instrument Sans_ | _e.g. Page title only_ |
| Body | _e.g. Inter_ | _e.g. Rows, labels, nav_ |
| Mono/utility _(if data-heavy)_ | _e.g. Geist Mono_ | _e.g. IDs, timestamps_ |

### Spacing scale (pick a base unit and commit — see token-cheatsheet.md §3a)
- **Base unit:** ____ _(4px compact / 8px standard)_
- **Steps used on this screen:** ____ _(e.g. 4, 8, 12, 16, 24, 32, 48, 96)_
- **Inside a group:** ____ _(e.g. 8px)_ · **Between groups:** ____ _(e.g. 32px)_ · **Between sections:** ____ _(e.g. 96px)_
  - _Proximity law: related items must be closer together than unrelated ones. If one gap value is used everywhere, there is no hierarchy._

### Elevation (max 3 levels — or state "none, this system is flat")
| Level | Used for | Value |
|---|---|---|
| 1 | _e.g. resting cards_ | ____ |
| 2 | _e.g. hover, dropdowns_ | ____ |
| 3 | _e.g. modals, drawers_ | ____ |

### Motion (commit to numbers — "subtle" is not a spec)
- **Durations:** instant ____ · fast ____ · base ____ · slow ____
- **Easing:** entrances ____ · state changes ____
- **The one orchestrated moment:** ____ _(page-load reveal OR scroll-triggered signature — not both)_
- **Reduced-motion behaviour:** ____

### Interaction states (define once, apply everywhere — see references/ui-states.md §2)
| State | Treatment |
|---|---|
| Hover | ____ |
| Focus-visible | ____ _(check it against every background it can land on)_ |
| Active / pressed | ____ |
| Disabled | ____ |
| Selected / current | ____ _(never color alone)_ |

### Icons
- **Set:** ____ _(e.g. Lucide, Phosphor, custom — one set only)_
- **Size + stroke:** ____ _(e.g. 16/20px, 1.5px stroke, matched to type weight)_

### Layout (one-sentence concept + ASCII wireframe)
- **Concept (one sentence):** ____
  - _e.g. "A light workbench: next-actions list leads, person context stays in a rail, no KPI card row"_
- **Responsive behaviour (how layout changes at each breakpoint):**
  - Mobile 375px: _e.g. "Single column, sidebar collapses to bottom tab bar, bento grid stacks vertically"_
  - Tablet 768px: _e.g. "Sidebar visible but icon-only, 2-column bento"_
  - Desktop 1280px: _e.g. "Full sidebar + relationship overview and prioritized follow-up rail"_

```
[ ASCII wireframe — fill this in, don't leave it blank ]

Example:
┌─ Sidebar ────┬─ Next actions (lead) ──────────┬─ Context ────┐
│ Overview     │ [x] Follow up Maria Thompson   │ Maria        │
│ People       │     Prayer request · May 18    │ Care · High  │
│ Groups       │     Welcome James Davis        │ Last visit   │
│ Events       │     Confirm Baptism guests     │ May 4        │
│ Care         │     …                          │              │
└──────────────┴────────────────────────────────┴──────────────┘
```

### Signature (the ONE element that makes this page memorable)
- **What it is:** ____
  - _e.g. "The selected next-action row — 3px start-edge rule, no other highlight on the page"_
- **Why it encodes something true about the subject:** ____
  - _e.g. "Staff came to do the next call, not to admire five pulse cards"_

---

## 5. Anti-Slop Pre-Flight Check
Go through every item. Mark PASS, or DEVIATION if the locked system or brief specifies that treatment (write which). Unchosen defaults are fails.

| Rule | Status | Notes (if deviation) |
|---|---|---|
| No cream `#F4F1EA` + serif + terracotta combo | ☐ PASS / ☐ DEVIATION | |
| No black + acid-green / vermilion accent | ☐ PASS / ☐ DEVIATION | |
| No broadsheet hairline-only layout | ☐ PASS / ☐ DEVIATION | |
| No centered-only hero + `<h1>` + single CTA | ☐ PASS / ☐ DEVIATION | |
| Not Inter as default body+display without deliberation | ☐ PASS / ☐ DEVIATION | |
| Not uniform single border-radius everywhere | ☐ PASS / ☐ DEVIATION | |
| No purple gradient blobs as the only visual interest | ☐ PASS / ☐ DEVIATION | |
| No numbered markers (01/02/03) when not a true sequence | ☐ PASS / ☐ DEVIATION | |
| Using `100dvh` not `100vh` for full-screen components | ☐ PASS / ☐ DEVIATION | |
| `tabular-nums` on all numeric data columns | ☐ PASS / ☐ DEVIATION | |
| `text-balance` on headlines, `text-pretty` on paragraphs | ☐ PASS / ☐ DEVIATION | |

---

## 6. Build Notes
- **Data-viz handoff:** ____ _(If this screen has charts or numeric tables: follow `references/dataviz.md`. Note chart types chosen, or "no charts".)_
- **Imagery source:** ____ _(Where do photos/illustrations come from — real assets, generated, or none? A hero with a grey box is an unfinished hero.)_
- **Page meta (marketing/public pages):** `<title>` ____ · `<meta name="description">` ____ · `og:image` ____ · favicon ____
- **Stack used:** ____
  - _e.g. "Next.js 15 + React 19 + Tailwind v4 + shadcn/ui, scaffolded via `bash scripts/scaffold-ui.sh <name>`"_
  - _or: "Single-file HTML mockup via `bash scripts/scaffold-html.sh <name> <system> <slot>`"_
- **Responsive breakpoints confirmed (mobile / tablet / desktop):** ☐
- **Keyboard focus visible on all interactive elements:** ☐
- **`prefers-reduced-motion` guard in place:** ☐
- **WCAG contrast verified (body ≥ 4.5:1, large text ≥ 3:1):** ☐
- **Semantic landmarks present (`<main>`, `<nav>`, `<header>`, `<footer>`):** ☐
- **All `<img>` have `alt` attribute:** ☐
- **One `<h1>` per page; heading hierarchy not skipped:** ☐
- **Hero image has `fetchpriority="high"` + `loading="eager"`:** ☐
- **All other images have `loading="lazy"` + explicit `width`/`height`:** ☐
- **Lighthouse Performance ≥ 90, Accessibility ≥ 95:** ☐
- **`bash scripts/audit-ui.sh <dir>` exits 0:** ☐

---

## 6a. UI States Built (see references/ui-states.md)

A screen with only the populated state is a poster, not an interface. Mark each **Built**,
or **Skipped** with a reason. Silent omission is not an option.

| State | Built / Skipped | Notes |
|---|---|---|
| Empty — first run (no data yet) | ☐ | _copy + the action that creates the first item_ |
| Empty — filtered (no matches) | ☐ | _different copy from first-run_ |
| Loading | ☐ | _skeleton matching real layout, not a full-page spinner_ |
| Error + retry | ☐ | _plain language, not a status code_ |
| Populated | ☐ | |
| Long text / overflow handling | ☐ | _wrap, clamp or ellipsis — decided, not accidental_ |
| Zero / negative / very large numbers | ☐ | _`tabular-nums`, no column jitter_ |
| One item and many items | ☐ | |
| Form validation (if any inputs) | ☐ | _inline, `aria-invalid`, `aria-describedby`, not color-only_ |

---

## 7. Post-Build Critique (see `references/critique-loop.md` + `references/critique-fails.md`)
_Before marking work as done, complete this section. Rendering is mandatory. Score from the screenshots. Each rubric cell is `F# kebab-name — fix` or `PASS (checked F# … — why absent)`. Bare PASS does not count._

### Rendered and looked at
- [ ] 375 × 812 — screenshot path: ____
- [ ] 768 × 1024 — screenshot path: ____
- [ ] 1280 × 800 — screenshot path: ____
- [ ] Both themes rendered (if "both" was agreed)
- _If you could not render: say so here and list what you checked instead:_ ____

### Rubric (PASS, or name the defect and its fix)
| # | Check | Result |
|---|---|---|
| 1 | Focal point — one clear first look | ____ |
| 2 | Spacing rhythm — on the scale, proximity law honoured | ____ |
| 3 | Alignment — shared grid lines | ____ |
| 4 | Type hierarchy — ≤4 sizes, line length ≤75ch, no orphans | ____ |
| 5 | Density fits the job named in the brief | ____ |
| 6 | Color discipline — 60/30/10, one accent, restrained | ____ |
| 7 | System purity — no forbidden effect present | ____ |
| 8 | Signature built, singular, and the boldest thing on screen | ____ |
| M | Mobile: no h-scroll, taps ≥44px, body text ≥16px | ____ |

### Fidelity to the selected direction
- **Structure matches / drifted:** ____
- **Density matches / drifted:** ____
- **Palette + type as specified:** ____
- **Signature built as specified:** ____
- _Any drift is a bug to fix or a decision to state out loud. Silent drift is a failure._

### Iteration
- **Pass 1 defects found and fixed:** ____
- **Pass 2 defects found and fixed:** ____ _(fixes create new problems — never ship off pass 1)_
- **Passes run:** ____ _(minimum 2)_

### Final cut
- **One accessory removed** ("before leaving the house, remove one thing"):
  - _What was removed:_ ____
  - _Why removing it strengthens the design:_ ____

- **Self-critique summary (2–3 sentences):**
  > ____

- **Audit script result:** `bash scripts/audit-ui.sh <dir>` → ____
- **Could NOT verify (be honest — an unchecked box beats a false tick):** ____
