---
name: premium-ui
description: Use when the user wants to generate, design, or scaffold modern, ultra-premium, sophisticated UIs or web/app screens (landing pages, dashboards, app shells, marketing pages) with an agent. Encodes a brief→design-system→token-plan→anti-slop→build→critique workflow, a bundled library of premium design systems, and explicit anti-"AI-slop" rules so output reads as intentional rather than templated.
version: 1.2.0
author: Rajesh Praharaj
license: MIT
metadata:
  tags: [ui, design, frontend, premium, anti-slop, agent-skills, scaffolding]
  related_skills: [design-taste-frontend]
---

# Premium UI Generation

## Overview
Turns an agent into a design lead that produces *intentional, ultra-premium* interfaces instead of generic "AI-slop." This skill is the synthesis of the best publicly available UI-generation skills (Anthropic's `frontend-design` / `web-artifacts-builder` / `theme-factory`, VoltAgent's `awesome-claude-design`, and `awesome-cursorrules`) distilled into a structured, highly executable workspace environment.

The core rule of premium UI scaffolding is to (1) lock a stack, (2) force a strict *Brief → Design System → Token Plan → Self-Critique* flow, (3) leverage a verified library of named design systems, and (4) run programmatic scaffolding/audit gates.

## When to Use
- User asks to build, generate, scaffold, redesign, or "make premium / sophisticated / modern" any UI surface: landing pages, dashboards, app shells, marketing sites, component sets.
- User says "create a UI", "design a screen", "make it look premium", "redesign this".
- **Don't use for:** pure backend/API work, data-only tasks with no visual surface, or when the user explicitly wants a specific stock library's default look (then just install that library, e.g. shadcn/ui, MUI, Ant Design).

## Workflow (follow in order)

### 0. Mode Selection (Image-First vs. Heuristic Fallback)
Decide on the execution workflow based on environment tools:
* **Image-First Mode (Recommended if `generate_image` is active):** Generate a high-end visual reference image of the main UI view first, analyze it to extract exact placement, fonts, and colors, and implement the layout to match the design specification.
* **Heuristic Spec Fallback (If image generation is unavailable):** Mock using the ASCII wireframe in Step 3. Enforce mathematical proportions (e.g. concentric rounded borders: $R_{\text{inner}} = R_{\text{outer}} - \text{Padding}$) and use predefined Google Font/color configurations to guarantee visual quality.

### 1. Interactive Briefing & Intent Check (GATED)
Before drafting the worksheet or coding, you must verify the user's intent. Ask exactly three clarifying questions, providing a tailored premium recommendation with a design rationale for each:
1. **Domain & Audience:** Who is this page for, and what is its single goal?
2. **Visual Aesthetic Direction:** Which of the 10 systems fits (Minimal-Tech, Warm-Sophisticate, Editorial, Dark Private-Client, Dark-Luxe, Boutique E-Commerce, Neo-Brutalist, Conversational AI, Organics, or Terminal Hacker)?
3. **Signature Element:** What is the core interactive component or motion showcase (e.g. concentric glass dashboard layout, interactive slider deck, smooth prompt input)?

*Example response:* "For your boutique watch storefront, I recommend the **Boutique E-Commerce** design system. Rationale: High-aspect photography with slide-over drawers and Ogg-style elegant typography conveys high fashion and luxury better than a flat tech look. Do you agree, or do you prefer the Editorial layout?"

**Done when:** The user has reviewed and confirmed/modified your recommended design direction. DO NOT proceed to Step 2 without this confirmation.

### 2. Pick a design system (don't invent from nothing)
Choose ONE bundled system from `references/design-systems.md` (Linear/Vercel minimal-tech, Arc/Raycast warm-sophisticate, Stripe/Notion editorial, etc.) OR derive a new one — but **never mix two**. The system supplies palette + type + spacing rhythm so the result is cohesive by construction.
**For "premium / modern / sophisticated" briefs, default to the Dark Private-Client direction** in `references/premium-direction-playbook.md` (near-black canvas + warm bronze accent). It scored highest on the user's "premium" bar and dodges all three AI-slop defaults. The bundled Minimal-Tech system, rendered plainly, *is* the generic-SaaS look users reject — only pick it for explicitly dev/productivity briefs, and add a signature + motion.

**Done when:** exactly one system is selected and named.

### 3. Token plan — fill the worksheet
Copy `templates/design-brief.md` (the skill's canonical worksheet under `templates/`) and complete it. Use `references/token-cheatsheet.md` for palette/type/scale discipline (60/30/10 color, role-based type, one modular scale). Worksheet fields:
- **Color:** 4–6 *named* hex values (not "blue" — name them: "Ink #0B0B0F", "Mist #F5F6F8").
- **Type:** 2+ roles — a characterful display face used with restraint, a complementary body face, a utility/mono face for data if needed. Pair deliberately, not Inter-by-default.
- **Layout:** one-sentence concept + ASCII wireframe.
- **Signature:** the single unique element the page is remembered by (encodes something true about the subject).

**Done when:** every section of the worksheet is filled and the signature is non-generic.

### 4. Anti-slop check (before writing code)
Against `references/anti-slop-rules.md`: reject cream+serif+terracotta, black+acid-green, broadsheet hairlines, centered-only hero, uniform 1rem radius, Inter-by-default, `<h1>`+single-accent-CTA template. If any planned element matches a default, replace it with a choice specific to this brief and note why.

**Done when:** no planned element is a flagged default; deviations are justified in writing.

### 5. Build — to the plan, exactly
Scaffold with the project's existing stack (e.g., Next 16/15 + React 19/18 + Tailwind + shadcn/ui + Radix). To bootstrap a fresh project run `bash scripts/scaffold-ui.sh <name>` — it emits a Next 16 / React 19 / Tailwind / shadcn app with reduced-motion hooks and a token-CSS-variable stub. Implement only what the token plan specifies; derive every color/type decision from the worksheet. Watch CSS specificity collisions (`.section` vs `.cta` paddings/margins cancel).

**Done when:** UI renders matching the token plan, responsive to mobile, keyboard focus visible, `prefers-reduced-motion` respected.

### 6. Critique + verify
Screenshot and self-critique (a picture is worth 1000 tokens). Run `bash scripts/audit-ui.sh <project-dir>` — it checks the premium-UI floor (reduced-motion guard, visible focus, no placeholder copy) and flags slop patterns. For automated testing, also run your project's axe-core test suite (`npm run test:a11y:responsive` or similar). Cut one accessory — "before leaving the house, remove one thing." Fix until green.

**Done when:** audit-ui.sh reports PASS (or only advisory warnings), a11y checks pass, reduced-motion handled, one decorative element removed.

### 7. Deliver
Present the cohesive, on-brand, accessible UI. **If the brief said "interactive" / "fully interactive", it must be a working app, not a static mockup:** render from JS data, give every nav item its own real view, and wire modals/drawers to handlers that mutate state and re-render (see `references/premium-direction-playbook.md` → "Build it as a real app"). Summarize the design system + signature used.

## Anti-slop principles (condensed — full list in references/anti-slop-rules.md)
- Spend boldness in ONE place (the signature); keep everything else quiet.
- Typography carries personality — pair display + body deliberately.
- Structure encodes meaning (numbering only if content is truly a sequence).
- Motion serves the subject; less is often more.
- Copy is design material: active voice, sentence case, names things by what users control.

## Common Pitfalls
1. **Mixing two design systems.** Cohesion dies. Pick one in step 2 and stay.
2. **Defaulting to Inter + purple gradient + uniform radius.** That's the template answer — explicitly banned.
3. **Skipping the token plan and coding immediately.** Output reads templated. Always worksheet first.
4. **CSS specificity collisions** between type-based and element-based selectors (paddings/margins cancel). Scope deliberately.
5. **Ignoring accessibility** because "it's just a demo." Premium = accessible by default (focus, reduced-motion, mobile).
6. **Premature completion** — shipping before the screenshot/critique loop.
7. **"Compliant but generic."** Passing every anti-slop + a11y check does NOT make it premium — flat white cards, all-Inter type, numbers in boxes, no motion = the exact "lame SaaS template" the user rejected. Ship a *direction* (default Dark Private-Client) + craft signals (dark/glass, serif display on numbers only, real charts/sparklines/donuts, one sparing accent, hover/motion). See `references/premium-direction-playbook.md`.
7. **Treating a single-file `*.html` mockup as unauditable.** `scripts/audit-ui.sh` includes `.html`/`.jsx` globs, so a standalone HTML file IS a valid audit target — run it; don't skip because there's no `src/` directory. (This was a real bug: the script originally only grepped `*.tsx`/`*.css` and falsely FAILED valid HTML with reduced-motion + focus-visible already present.)
8. **Misreading the audit's slop warnings.** The heuristic flags this skill's own bundled accent `#5E6AD2`, Linear/Stripe purples (`#635bff`), and the intentional soft neutral listing-photo gradients (`linear-gradient(135deg, #D9DEED…)`). These are **advisory false positives**, not violations — `references/design-systems.md` uses them deliberately. Only the `[FAIL]` lines are blocking; `[warn]` slop lines can be dismissed when justified by the chosen system.
9. **Claiming the UI works without test-driving it.** Build a real artifact (even a single-file `*.html`) and run `bash scripts/audit-ui.sh <dir>` against it before reporting success. A syntax check (`bash -n`) only proves the script parses; it will not catch coverage bugs. Prove the logic with two fixtures: a known-good (expect PASS, exit 0) and a known-bad (expect FAIL, exit 1). This caught pitfall #7 above.

## Verification Checklist
- [ ] Subject, audience, single job stated
- [ ] Exactly one design system selected
- [ ] design-brief worksheet fully completed
- [ ] No anti-slop defaults present (or justified)
- [ ] UI matches token plan
- [ ] Responsive to mobile
- [ ] Keyboard focus visible
- [ ] `prefers-reduced-motion` respected
- [ ] a11y (axe-core) passes
- [ ] One decorative element removed in critique

## One-Shot Recipes
- **Greenfield premium landing page:** `bash scripts/scaffold-ui.sh my-app` → pick system → fill `templates/design-brief.md` → map tokens into globals.css → build → `bash scripts/audit-ui.sh my-app` → screenshot → axe (e.g. `npm run test:a11y:responsive`).
- **Redesign existing screen:** load current tokens → pick contrasting system → worksheet diff → rebuild signature only.

## Support Files (this skill)
- `templates/design-brief.md` — copy-and-complete worksheet for step 3.
- `references/design-systems.md` — 5 bundled premium design systems (incl. **Dark Private-Client**, the default for "premium" briefs). Pick exactly one.
- `references/token-cheatsheet.md` — 60/30/10 color, role-based type, modular scale, radius/elevation, motion, contrast floor.
- `references/anti-slop-rules.md` — banned patterns + required a11y floor for step 4.
- `references/premium-direction-playbook.md` — **which direction to ship** for "premium" briefs + Dark Private-Client tokens + verified craft signals + how to build a real interactive app. Read before building anything the user calls "premium / modern / sophisticated."
- `scripts/scaffold-ui.sh` — bootstrap a Next 16 / React 19 / Tailwind / shadcn project matching a standard modern stack.
- `scripts/audit-ui.sh` — quality gate: reduced-motion, focus-visible, no placeholder copy, slop-pattern flags.
- `assets/design-showcase.html` — visual gallery of all 5 systems (Dark Private-Client first); open to compare palettes/type before picking.
