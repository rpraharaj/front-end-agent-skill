---
name: premium-ui
description: Generate or redesign ultra-premium, non-generic web UIs and screens with a structured Brief→Context-Led Variant Exploration→System→Token→Build→Critique workflow.
license: MIT
metadata:
  tags: [ui, design, frontend, premium, anti-slop, agent-skills, scaffolding]
---

# Premium UI Generation

## Overview
Turns an agent into a design lead that produces *intentional, ultra-premium* interfaces instead of generic "AI-slop." Built as a structured, highly executable workspace environment with a bundled library of named design systems and programmatic quality gates.

The core rule of premium UI scaffolding is to (1) lock a stack, (2) force a strict *Brief → Visual Variants → Design System → Token Plan → Self-Critique* flow, (3) leverage a verified library of named design systems, and (4) run programmatic scaffolding/audit gates.

### Direction-neutrality rule
> **Premium is a quality bar, not a visual style.** Never infer dark mode, glassmorphism, metallic accents, ambient glows, luxury styling, card-heavy layouts, or motion from words such as "premium," "modern," or "sophisticated." Derive the visual direction from the product domain, audience, emotional qualities, content density, and interaction model. Effects belong to a selected design system; there are no global visual effects.

## When to Use
- User asks to build, generate, scaffold, redesign, or "make premium / sophisticated / modern" any UI surface: landing pages, dashboards, app shells, marketing sites, component sets.
- User says "create a UI", "design a screen", "make it look premium", "redesign this".
- **Don't use for:** pure backend/API work, data-only tasks with no visual surface, or when the user explicitly wants a specific stock library's default look (then just install that library, e.g. shadcn/ui, MUI, Ant Design).

## Route first (do this before anything else)

Pick the path that matches the request. Announce the chosen route in one line, then follow only that route. **Route A is the default whenever a visual direction is being established or materially changed.**

| Route | Use when | Process |
|---|---|---|
| **A — Full pipeline** | New product surface, greenfield screen, substantial redesign, "make it premium", any work that sets the visual direction | Steps 1–8, all five checkpoints |
| **B — Light path** | Adding a section/component to an existing screen, or a contained change inside an already-locked system | Skip Steps 0–2. Name the existing system and its effects contract, fill Worksheet §4 (tokens) + §5 (anti-slop) only, build, audit. One checkpoint: the worksheet. |
| **C — Direct** | Bug fix, copy edit, spacing/a11y fix, refactor, wiring an existing component to data | No worksheet, no checkpoints. Build to the system already in the codebase, then run `scripts/audit-ui.sh`. |

If a Route C task turns out to need a new visual direction, stop and escalate to Route A — say so, don't silently redesign. If you cannot tell B from C, ask; do not default to A for small work.

## Rule #0 (applies to Route A and B)
> **On Routes A and B, never write UI code until that route's required worksheet sections are complete and confirmed in this thread.** The selected variant and token plan are prerequisites, not formalities. Agents that skip to code produce template output — the exact failure this skill exists to prevent.
>
> Rule #0 does not apply to Route C. Gating a spacing fix behind five checkpoints is its own failure mode: the skill gets bypassed entirely and every rule in it stops applying.

## Workflow (Route A — follow in order)

### 0. Mode Selection (how variants get produced)
Pick the exploration mode from the tools you actually have. Read `references/variant-exploration.md` → "Two modes."

* **HTML Mode (preferred whenever a browser/screenshot tool is available):** Build 3–5 real single-file HTML variants with `scripts/scaffold-html.sh`, screenshot each, and present the screenshots. **The selected variant is then the starting build** — no rebuild, no fidelity gap. This is the default because the biggest quality leak in an image-led flow is the distance between a beautiful generated mockup and what can actually be built from it.
* **Image Mode (when no browser is available, or the user wants a looser pre-structural pass):** Generate five separate context-led images. Never a five-up image; never multiple samples of one prompt as separate directions.
* **Heuristic Spec Fallback (no browser and no image generation):** Recommend one subject-led system, then mock with the worksheet wireframe. Enforce its geometry and effects contract; use concentric radii only when that system calls for nested bezels.

Whichever mode: before producing anything, (1) assign each variant a distinct structural slot (top-nav / sidebar / no-nav / single-scroll / spatial-canvas) so no two share a layout skeleton, and (2) complete the Pre-Prompt Contrast Matrix so every adjacent pair differs on ≥4 axes. Hold product intent, capabilities, content, data, target devices and hard constraints constant. Unless the brief hard-fixes theme, include at least one light-canvas and two dark-canvas directions. Do not lock the system or write production code until the user selects one.
* **Skip variant exploration** for exact implementation of an approved reference or brand-locked work where the direction is already decided. State the reason and continue through the system checkpoint. (Minor edits and isolated components are not Route A at all — they are Route B or C above; do not run Step 0 for them.)

### 1. Interactive Briefing & Intent Check (GATED)
Before drafting the worksheet or coding, verify the user's intent. Ask up to four clarifying questions — **skip any the user has already answered** rather than asking mechanically; a detailed brief deserves acknowledgement, not an interrogation:
1. **Domain, audience, and job:** Who is this page for, what context do they use it in, and what is its single goal?
2. **Content inventory:** What actually goes on this screen, in priority order, with real example values? What explicitly does *not* belong here? — *Do not skip this one.* You cannot design hierarchy without knowing what competes for it; omitting it is why generated screens end up with "Metric one / Metric two / Metric three." Record it in Worksheet §1.
3. **Theme and constraints:** Identify hard brand, theme, accessibility, and approved-reference constraints; distinguish them from visual choices the variants may explore without locking a final design system.
4. **Signature, density, and devices:** Propose one subject-specific signature interaction; determine whether density is fixed or explorable; confirm desktop-first, mobile-first, or fully responsive targets.

*Example response:* "For your inventory workspace, I’ll keep the same tasks, data, capabilities, and responsive targets in all five directions. Unless your brand fixes them, I recommend exploring different navigation, density, palette, typography, and surface models so you can compare complete product experiences. Which visual constraints must remain fixed?"

**Done when:** The user has confirmed/modified the subject, audience, job, hard constraints, signature hypothesis, device targets, and which visual properties are fixed versus explorable. DO NOT proceed to Step 2 without this confirmation.

### 2. Explore five visual directions (GATED when image generation is available)
For qualifying work, read `references/variant-exploration.md` and generate exactly five separate image variants. Each candidate must use one coherent bundled or derived system, but the five candidates may use different compatible systems because the final system is not locked yet.

Before writing any image prompt, complete two required pre-flight steps recorded in `templates/design-brief.md` Section 2:
1. **Structural Slot Assignment** — assign each of A–E to one of five mutually exclusive layout skeletons (horizontal top nav / left rail sidebar / no persistent nav / single scroll surface / spatial canvas-first). No two candidates may share a slot.
2. **Pre-Prompt Contrast Matrix** — fill the 8-axis table for A–E and verify no adjacent pair (A-B, B-C, C-D, D-E, A-E) shares more than 2 axis values. Revise before prompting if any pair fails.

Hold product intent, audience, job, capabilities, content, data, copy, target devices, and hard constraints constant. Unless the brief hard-fixes theme, the set must include at minimum one light-canvas and two dark-canvas directions. Select the most relevant exploration axes for the brief: navigation, screen architecture, density, theme, palette, typography, containers, geometry, elevation, emotional tone, and signature interaction. Issue five image-generation calls; do not ask one prompt for a five-up image. Reject any pair that differs mainly by data, copy, card order, icons, or a superficial color swap.

After generating, run the **Pre-Presentation Stop Gate** (four binary checks: structural silhouette, system purity, axis difference count ≥4, distinct emotional tone words). Regenerate any failing candidate before showing the set.

Present variants A–E at equal size. For each include a **human direction name**, a **one-line hook** (what the user will feel using this screen every day), product-fit rationale, spatial thesis, system used, key visual decisions, strength, and tradeoff. Explain why these five form a useful comparison for this specific intent. Wait for the user to select one or request a regeneration. A hybrid may transfer one clearly named element only; never blend candidates indiscriminately.

**Done when:** five valid, visually distinct variants are shown and the user selects one. If exploration is skipped, state why and present one recommended direction for confirmation.

> ⛔ **CHECKPOINT 2** — Record the selected variant and the user's rationale. If exploration was skipped, record the confirmed direction and skip reason instead. Wait for the user to reply "proceed" before locking the design system.

### 3. Lock one design system
Lock the selected variant's ONE bundled system from `references/design-systems.md` OR its one explicitly derived system — **never mix two**. Use the subject-led selection matrix in `references/premium-direction-playbook.md`; do not select from adjectives such as "premium" alone. Open `assets/design-showcase.html` to compare all ten side by side before deciding.

**If none of the ten fit, derive one** — follow `references/design-systems.md` → "Deriving a new system." The bundled ten skew professional/corporate/luxury and do not cover children's education, games, music, social, sports, food, travel or consumer health. Forcing such a brief into Dark Private-Client or Minimal-Tech ships a serious-looking product to an audience that needed a joyful one, which is a worse failure than any slop pattern. A derived system is first-class — it just has to be written out in full and locked just as hard.

Copy the complete effects contract: background, surfaces, navigation, container model, elevation, motion, and forbidden effects. Changing only colors and fonts while retaining another system's glass, glow, cards, or composition is a failed system lock. Finalize the selected candidate's palette in Step 4.

**Done when:** exactly one system and its effects contract are selected and named.

> ⛔ **CHECKPOINT 3** — State the chosen system and one-sentence rationale. Wait for the user to reply "proceed" before the token plan.

### 4. Token plan — fill the worksheet
Copy `templates/design-brief.md` (the skill's canonical worksheet under `templates/`) and complete it. Use `references/token-cheatsheet.md` for the discipline behind each field. Worksheet fields:
- **Color:** 4–6 *named* hex values (not "blue" — name them: "Ink #0B0B0F", "Mist #F5F6F8").
- **Type:** 2+ roles — a characterful display face used with restraint, a complementary body face, a utility/mono face for data if needed. Pair deliberately, not Inter-by-default.
- **Spacing:** one base unit (4px compact / 8px standard) and the steps used. **Arbitrary spacing is the single loudest amateur tell** — and the proximity law (related things closer than unrelated things) is what actually creates hierarchy.
- **Elevation:** at most three levels, or "none — this system is flat."
- **Motion:** real durations and easing curves. "Subtle motion" in an effects contract is not a spec.
- **Interaction states:** hover / focus-visible / active / disabled / selected, defined once as tokens (`references/ui-states.md` §2).
- **Icons:** one set, one size and stroke weight.
- **Layout:** one-sentence concept + ASCII wireframe.
- **Signature:** the single unique element the page is remembered by (encodes something true about the subject).

**Done when:** every section of the worksheet is filled and the signature is non-generic.

> ⛔ **CHECKPOINT 4** — Paste your completed `templates/design-brief.md` worksheet inline (all fields filled, ASCII wireframe included). Wait for the user to reply "proceed" before writing any code.

### 5. Anti-slop check (before writing code)
Against `references/anti-slop-rules.md`: reject cream+serif+terracotta, black+acid-green, broadsheet hairlines, centered-only hero, uniform 1rem radius, Inter-by-default, `<h1>`+single-accent-CTA template. If any planned element matches a default, replace it with a choice specific to this brief and note why.

**Done when:** no planned element is a flagged default; deviations are justified in writing.

> ⛔ **CHECKPOINT 5** — List each anti-slop check result (PASS or deviation + justification). Only proceed to building after the user confirms the plan is good.

### Pre-Build Verification Checklist
Before writing any code, confirm all of these are true:
- [ ] Subject, audience, single job stated
- [ ] Five variants generated and one selected, or skip reason documented
- [ ] Exactly one design system selected
- [ ] `templates/design-brief.md` worksheet fully completed (every field filled)
- [ ] No anti-slop defaults present (or each deviation justified in writing)
- [ ] Theme mode confirmed (dark-only / light-only / both with toggle)
- [ ] Device targets confirmed (mobile 375px / tablet 768px / desktop 1280px)

If any box is unchecked, go back and complete that step first.

### 6. Build — to the plan, exactly
Scaffold with the project's existing stack (e.g., Next 16/15 + React 19/18 + Tailwind + shadcn/ui + Radix). To bootstrap a fresh project run `bash scripts/scaffold-ui.sh <name>` — it emits a Next 16 / React 19 / Tailwind / shadcn app with reduced-motion hooks and a token-CSS-variable stub. For rapid single-file prototyping, run `bash scripts/scaffold-html.sh <name> <system>` to get a system-specific HTML mockup. Implement only what the selected variant and token plan specify; derive every color/type decision from the worksheet. Watch CSS specificity collisions (`.section` vs `.cta` paddings/margins cancel).

**Build the states, not just the happy path.** Read `references/ui-states.md`. Every data region needs its empty (first-run *and* filtered), loading, error and populated states; every interactive element needs hover / focus / active / disabled / selected; every component needs to survive long text, zero and negative numbers, one item and many. Record what you built in Worksheet §6a. *"Only the populated state"* is a legitimate answer for a static visual mockup — but it must be **stated**, never silently omitted. That distinction is the difference between a picture and an interface.

**If the screen has charts,** invoke the `dataviz` skill for chart type, categorical palette and axis/legend treatment instead of improvising. Dashboards are this skill's most common output and bad charts undo good layout.

**For public/marketing pages,** set `<title>`, `<meta name="description">`, an `og:image` and a favicon. A page that previews as a blank grey card in Slack is not finished.

**Done when:** UI renders matching the token plan, responsive to mobile, keyboard focus visible, `prefers-reduced-motion` respected, semantic HTML landmarks and `alt` text present on all images (see `references/a11y-floor.md`). Hero image has `fetchpriority="high"`, all others `loading="lazy"` (see `references/performance-floor.md`). States built or explicitly skipped.

### 7. Critique + verify — render it and look at it
**Follow `references/critique-loop.md`. This is the highest-leverage quality step in the skill; do not compress it into a sentence.**

1. **Render at 375 × 812, 768 × 1024 and 1280 × 800** — `bash scripts/shoot.sh <file-or-url>`, or your own browser tool (local files need an HTTP server; `file://` breaks fonts and scripts). Render both themes if "both" was agreed.
2. **Look at every screenshot** and score the 8-point rubric — focal point, spacing rhythm, alignment, type hierarchy, density fit, color discipline, system purity, signature. Each is PASS or a named defect with a named fix. "Looks clean and modern" is not a critique.
3. **Fidelity check** against the selected variant: same structure, density, palette, type, signature? Drift is either a bug to fix or a decision to say out loud — never silent.
4. **Iterate at least twice.** Fixes create new problems; the second pass is where the design actually lands. Never ship off pass 1.
5. Run `bash scripts/audit-ui.sh <project-dir>` and your axe-core suite if present.
6. **Then** cut one accessory — "before leaving the house, remove one thing." Last, after the design is correct, not instead of critiquing it.

**Never report a UI as done without having rendered it and looked at it.** If you could not render, say so explicitly and list what you checked instead — do not describe a screenshot you did not take.

**Done when:** all three widths rendered and reviewed, rubric scored with defects fixed, fidelity confirmed or drift explained, ≥2 passes run, audit-ui.sh exits 0, the manual 👁 items verified, one decorative element removed. A PASS from the script covers six checks — it is a floor, not proof the screen is good.

### 8. Deliver
Present the cohesive, on-brand, accessible UI. **If the brief said "interactive" / "fully interactive", it must be a working app, not a static mockup:** render from JS data, give every nav item its own real view, and wire modals/drawers to handlers that mutate state and re-render (see `references/premium-direction-playbook.md` → "Build it as a real app"). Summarize the selected variant, design system, effects contract, and signature used.

## Anti-slop principles (condensed — full list in references/anti-slop-rules.md)
- Spend boldness in ONE place (the signature); keep everything else quiet.
- Typography carries personality — pair display + body deliberately.
- Structure encodes meaning (numbering only if content is truly a sequence).
- Motion serves the subject; less is often more.
- Copy is design material: active voice, sentence case, names things by what users control.

## Common Pitfalls
1. **Mixing systems inside a candidate or final build.** Variants may explore different systems, but each candidate uses one and the selected build locks one.
2. **Defaulting to Inter + purple gradient + uniform radius.** That's the template answer — explicitly banned.
3. **Skipping the token plan and coding immediately.** Output reads templated. Always worksheet first.
4. **CSS specificity collisions** between type-based and element-based selectors (paddings/margins cancel). Scope deliberately.
5. **Ignoring accessibility** because "it's just a demo." Premium = accessible by default (focus, reduced-motion, mobile).
6. **Premature completion** — shipping before the screenshot/critique loop.
7. **"Compliant but generic."** Passing every anti-slop + a11y check does NOT make it premium. Ship a subject-led direction with craft signals native to that system: typography may carry an Editorial screen; color fields may carry Organics; depth may carry Warm-Sophisticate; data visualization and restrained glass may carry Dark Private-Client. Do not transplant one system's craft signals into every project. See `references/premium-direction-playbook.md`.
8. **Five copies of one idea.** Data, copy, card order, icon, or superficial color changes are not new directions. Enforce four changed visual axes, including at least one structural axis, and run the thumbnail test.
9. **Treating a single-file `*.html` mockup as unauditable.** `scripts/audit-ui.sh` includes `.html`/`.jsx` globs, so a standalone HTML file IS a valid audit target — run it; don't skip because there's no `src/` directory.
10. **Misreading the audit's slop warnings.** Only `[FAIL]` lines block delivery; `[warn]` lines may be justified by the chosen system.
11. **Claiming the UI works without test-driving it.** Build a real artifact, render it, look at it, and run `bash scripts/audit-ui.sh <dir>` before reporting success. Never describe a screenshot you did not take.
12. **Shipping the happy path only.** Empty, loading, error and overflow states are most of real frontend work. Build them, or say plainly that you didn't — see `references/ui-states.md`.
13. **Arbitrary spacing.** 13px here, 18px there. One base unit, multiples only, and related items closer than unrelated ones. This is the loudest amateur tell there is.
14. **One critique pass.** Fixes create new problems. Two passes minimum, per `references/critique-loop.md` §4.
15. **Forcing a bad system fit.** If none of the ten suit the brief, derive one — a joyful product rendered in Dark Private-Client is a worse failure than any slop pattern.

## Post-Build Verification Checklist

`audit-ui.sh` covers the ⚙️ items only. The 👁 items are **not** machine-checked — passing the
script is not evidence for them. Check each 👁 item yourself and say how you verified it;
if you could not verify one, write "not verified" rather than ticking it.

**Machine-checked — `bash scripts/audit-ui.sh <dir>` must exit 0:**
- [ ] ⚙️ `prefers-reduced-motion` respected
- [ ] ⚙️ Keyboard focus visible (`focus-visible` present)
- [ ] ⚙️ Responsive breakpoints present in source
- [ ] ⚙️ Semantic `<main>` landmark present
- [ ] ⚙️ All `<img>` / `<Image>` elements have `alt`
- [ ] ⚙️ No placeholder copy (lorem ipsum / scaffold stubs)

**Manual — verify and state your evidence:**
- [ ] 👁 UI matches the token plan exactly
- [ ] 👁 Rendered and inspected at 375px, 768px, 1280px (not just "breakpoints exist")
- [ ] 👁 8-point critique rubric scored, defects fixed (`references/critique-loop.md` §2)
- [ ] 👁 Fidelity to the selected variant confirmed, or drift stated and justified
- [ ] 👁 At least two critique passes run
- [ ] 👁 UI states built or explicitly skipped (`references/ui-states.md`, Worksheet §6a)
- [ ] 👁 Spacing is on one scale; proximity law honoured
- [ ] 👁 Interaction states present: hover, focus, active, disabled, selected
- [ ] 👁 No horizontal scroll at 375px; tap targets ≥ 44px; body text ≥ 16px
- [ ] 👁 Theme mode implemented as agreed (dark-only / light-only / toggle both)
- [ ] 👁 If "both": `:root[data-theme="light"]` override tested, toggle wired, contrast re-checked in light
- [ ] 👁 WCAG contrast: body ≥ 4.5:1, large ≥ 3:1 — computed, not eyeballed
- [ ] 👁 `<nav>`, `<header>`, `<footer>` landmarks present
- [ ] 👁 One `<h1>` per page; heading hierarchy not skipped
- [ ] 👁 Every form input has a `<label>` or `aria-label`
- [ ] 👁 Hero image has `fetchpriority="high"` + `loading="eager"`; all others `loading="lazy"`
- [ ] 👁 All images have explicit `width` and `height` (prevents CLS)
- [ ] 👁 Every named font family is actually loaded (a missing face falls back silently)
- [ ] 👁 Lighthouse Performance ≥ 90, Accessibility ≥ 95 (or documented gap)
- [ ] 👁 One decorative element removed in critique ("remove one thing")

**Do not run** the VoiceOver rotor test in `a11y-floor.md` §6 and report it as passed — that
step requires a human at the machine. Either the user runs it, or it stays unchecked.

## One-Shot Recipes
- **Greenfield premium UI:** brief → five context-led visual directions → user selects → lock one system → fill `templates/design-brief.md` → scaffold → build → audit → screenshot critique.
- **Redesign existing screen:** load current tokens → pick contrasting system → worksheet diff → rebuild signature only.

## Support Files (this skill)
- `templates/design-brief.md` — copy-and-complete worksheet for variant selection, system lock, and token planning.
- `references/variant-exploration.md` — HTML vs image variant modes, context-led comparison contract, structural slots, approach pool, difference test, and selection gate.
- `references/ui-states.md` — empty / loading / error / populated, interaction states, content stress cases, form states. Read before Step 6; a happy-path-only build is a poster, not an interface.
- `references/critique-loop.md` — render at three widths, the 8-point rubric, fidelity check, iteration. Read at Step 7; this is where quality actually comes from.
- `references/design-systems.md` — 10 bundled premium design systems with complete effects contracts. Pick exactly one.
- `references/token-cheatsheet.md` — 60/30/10 color, role-based type, modular scale, radius/elevation, motion, contrast floor, responsive breakpoints, theme mode patterns.
- `references/anti-slop-rules.md` — banned patterns + required a11y floor for Step 5.
- `references/a11y-floor.md` — structural accessibility: semantic HTML, alt text, form labels, ARIA, live regions, skip links. Check before every delivery.
- `references/performance-floor.md` — Core Web Vitals: LCP image treatment, CLS prevention, WebP/AVIF, font preloading, INP basics. Target Lighthouse ≥ 90/95.
- `references/premium-direction-playbook.md` — subject-led direction selection, system-specific craft guidance, a Dark Private-Client recipe for qualifying briefs, and how to build a real interactive app. Read before building anything the user calls "premium / modern / sophisticated."
- `scripts/scaffold-ui.sh` — bootstrap a Next 16 / React 19 / Tailwind / shadcn project matching a standard modern stack.
- `scripts/scaffold-html.sh` — single-file HTML mockup starter that requires an explicit system and applies only that system's effects contract. Use for quick prototypes.
- `scripts/shoot.sh` — render a file or URL at 375 / 768 / 1280 and save PNGs to `output/shots/`. Serves local files over HTTP automatically. Needs Playwright; exits 3 with guidance if absent, in which case use your own browser tool.
- `scripts/audit-ui.sh` — quality gate. FAILs on: missing reduced-motion guard, missing focus-visible, no responsive breakpoints, missing `<img alt>`, no `<main>` landmark, placeholder copy. Warns on: slop patterns, raw `100vh`, missing text-balance, missing image dimensions, TODO markers, `<h1>` count. Scans first-party source only — dependency and build directories are excluded, so a guard living in `node_modules` never counts as a pass. Does **not** check contrast, form labels, or Lighthouse; those stay manual.
- `assets/design-showcase.html` — visual gallery of all 10 systems with hover animations; open to compare palettes/type before picking.
