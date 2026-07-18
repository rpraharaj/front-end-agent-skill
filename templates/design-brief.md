**⛔ REQUIRED: Fill every field below before writing any UI code. Do NOT proceed to Step 5 (Build) until this document is complete and the user has confirmed "proceed."**

_Copy this worksheet, replace every `____` placeholder with a real value specific to this brief. The example values (in italics) show the format — overwrite them entirely._

---

# Design Brief Worksheet

## 0. Intent Alignment (Gated — complete before anything else)
- **Clarifying Questions Asked to User:**
  - _e.g. "Who is this for and what is its single goal?"_
  - _e.g. "Which of the 10 design systems fits your brief?"_
  - _e.g. "What is the one signature element the page is remembered by?"_
- **Personalized Recommendations & Design Rationale Offered:**
  - _e.g. "I recommend Dark Private-Client because [specific reason tied to this brief]."_
- **User's Confirmed / Selected Options:**
  - _e.g. "Dark Private-Client confirmed. Signature: animated portfolio equity donut."_

---

## 1. Subject
- **Product / subject:** ____
  - _e.g. "Wealth management CRM for private banking advisors"_
- **Audience:** ____
  - _e.g. "Relationship managers, 30–55, power users who live in the app 8h/day"_
- **The page's single job:** ____
  - _e.g. "Give advisors a real-time portfolio health snapshot with 1-click into client detail"_
- **Theme mode:** ____
  - _Dark only / Light only / Both with toggle_
  - _e.g. "Dark only — the audience is on screens all day, dark reduces eye strain"_
- **Device targets:** ____
  - _e.g. "Fully responsive: 375px mobile, 768px tablet, 1280px desktop" (default) or "Desktop-first, mobile is read-only"_

---

## 2. Design System (pick exactly ONE)
- **Chosen system:** ____
  _(Minimal-Tech / Warm-Sophisticate / Editorial / Dark Private-Client / Dark-Luxe / Boutique E-Commerce / Neo-Brutalist / Conversational AI / Organics / Terminal Hacker)_
- **Why this system fits the brief:** ____
  - _e.g. "Dark Private-Client: near-black canvas + warm bronze signals trust and exclusivity; dodges all three AI-slop defaults"_

---

## 3. Token Plan

### Color (4–6 named hex values — DO NOT use vague names like "blue")
| Role | Name | Hex |
|---|---|---|
| Background | _e.g. Void_ | _e.g. #0A0B0E_ |
| Surface/card | _e.g. Charcoal_ | _e.g. #141519_ |
| Accent (one only, restrained) | _e.g. Bronze_ | _e.g. #C9A24B_ |
| Ink/primary text | _e.g. Frost_ | _e.g. #F3F4F6_ |
| Muted/secondary text | _e.g. Slate_ | _e.g. #7E828E_ |
| _(optional) Semantic: good/warn/danger_ | _e.g. Jade / Amber / Rose_ | _e.g. #5BB98C / #D98B5F / #C76B7E_ |

### Typography (2 roles minimum — be deliberate, not Inter-by-default)
| Role | Font | Usage |
|---|---|---|
| Display | _e.g. Fraunces_ | _e.g. Hero numbers and KPI figures only_ |
| Body | _e.g. Inter_ | _e.g. All paragraph text, labels, nav_ |
| Mono/utility _(if data-heavy)_ | _e.g. Geist Mono_ | _e.g. Code snippets, table IDs_ |

### Layout (one-sentence concept + ASCII wireframe)
- **Concept (one sentence):** ____
  - _e.g. "Sidebar nav + bento grid main canvas with a full-width ambient glow header"_
- **Responsive behaviour (how layout changes at each breakpoint):**
  - Mobile 375px: _e.g. "Single column, sidebar collapses to bottom tab bar, bento grid stacks vertically"_
  - Tablet 768px: _e.g. "Sidebar visible but icon-only, 2-column bento"_
  - Desktop 1280px: _e.g. "Full sidebar + 3-column bento, ambient glow visible"_

```
[ ASCII wireframe — fill this in, don't leave it blank ]

Example:
┌─ Nav (64px) ──────────────────────────────────────┐
│  Logo     Dashboard  Clients  Reports    [Avatar]  │
├───────────────────────────────────────────────────┤
│  ┌─ KPI row (3 cards, 1/3 each) ───────────────┐  │
│  │  Revenue ▲    AUM ▲    Active Clients       │  │
│  │  $248k        $1.2B    142                  │  │
│  └─────────────────────────────────────────────┘  │
│  ┌─ Chart (2/3) ────────┐  ┌─ Activity (1/3) ─┐  │
│  │  Area chart          │  │  Feed list        │  │
│  └──────────────────────┘  └───────────────────┘  │
└───────────────────────────────────────────────────┘
```

### Signature (the ONE element that makes this page memorable)
- **What it is:** ____
  - _e.g. "Animated radial equity allocation donut with hover-expand sector labels"_
- **Why it encodes something true about the subject:** ____
  - _e.g. "Portfolio composition IS the advisor's primary mental model — making it tactile makes the tool feel purpose-built, not generic"_

---

## 4. Anti-Slop Pre-Flight Check
Go through every item. Mark PASS or note the deviation + justification.

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

## 5. Build Notes
- **Stack used:** ____
  - _e.g. "Next.js 15 + React 19 + Tailwind v4 + shadcn/ui, scaffolded via `bash scripts/scaffold-ui.sh <name>`"_
  - _or: "Single-file HTML mockup via `bash scripts/scaffold-html.sh <name>`"_
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

## 6. Post-Build Critique Checklist
_Before marking work as done, complete this section._

- **One accessory removed** ("before leaving the house, remove one thing"):
  - _What was removed:_ ____
  - _Why removing it strengthens the design:_ ____

- **Self-critique summary (2–3 sentences):**
  > ____

- **Audit script result:** `bash scripts/audit-ui.sh <dir>` → ____
