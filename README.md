# Premium UI Agent Skill 🎨

> **A curated framework for AI coding agents to create top-class, unique, professional-grade, and premium web interfaces.**

Designed to eliminate standard "AI-slop" default layouts without replacing them with a single house style, this repository equips agents with subject-led visual guidance, distinct design-system contracts, spacing rules, and quality checks.

---

## 👤 Author & License
* **Author:** Rajesh Praharaj
* **License:** [MIT License](LICENSE)

---

## ⚡ Core Philosophy: Anti-Slop Web Design
Standard AI-generated frontends look repetitive and generic (cream-and-serif, acid-green grids, raw linear gradients, Inter font-by-default, flat grey cards). This skill guides agents to design with:
1. **Three Context-Led Directions Before Code:** Compare three structurally distinct, job-fit approaches (HTML when a browser exists) before locking a system or palette. No style, density, theme, or color treatment is forced without a brief-based reason. Do not invent a fifth slot the product cannot use.
2. **Layout Variance:** Bento grids, Z-axis cascades, and staggered editorial splits to break symmetry.
3. **Typographic & Micro-Layout Rules:** Balancing text lines via `text-balance` / `text-pretty`, using `tabular-nums` for columns of data, and using dynamic `100dvh` viewport measurements for mobile.
4. **Restrained Color Palettes:** A strict 60/30/10 distribution with background treatments that belong to the selected system; ambient glows are never a global default.

---

## 📦 Installing as a Claude Code skill

The skill's directory name must match the `name:` in `SKILL.md` frontmatter (`premium-ui`),
or the skill will not load:

```bash
git clone https://github.com/<your-account>/<this-repo>.git ~/.claude/skills/premium-ui
```

If you cloned under a different folder name, rename it to `premium-ui`. Then invoke it with
`/premium-ui`, or just describe UI work and let it trigger from the description.

---

## 🛠️ Getting Started

### Method 1: Automated Scaffolding & Auditing (Recommended)
This repository includes executable shell scripts to bootstrap and test your layout inside a Next.js 16 + React 19 + Tailwind v4 + shadcn/ui stack:

#### Step A: Scaffold a New UI Project
To bootstrap a project workspace, execute the scaffolding script:
```bash
bash scripts/scaffold-ui.sh <project-name> [target-dir]
```
This automatically initiates the Next.js setup, installs Shadcn components, and appends Tailwind v4 `@theme` mappings directly into your `globals.css` so you can use custom design tokens immediately (`text-ink`, `bg-surface`, `font-display`, etc.).

#### Step B: Compare Visual Directions
Name the surface ([product vs marketing](references/surface-types.md)), then produce **3** context-led variants following [references/variant-exploration.md](references/variant-exploration.md). **HTML mode is required when a browser exists** — `bash scripts/scaffold-html.sh <name> <system> <slot>` so each variant has a real skeleton. Image mode is mood-only; rebuild the winner as HTML after selection. Wait for the user to select one (Gate 2) — that selection authorizes the lock and the build.

#### Step C: Lock and Build One System
Lock exactly one design system from the selected variant — or derive one if none of the ten fit — complete [templates/design-brief.md](templates/design-brief.md), then build to that system's full effects contract, including the non-happy-path states in [references/ui-states.md](references/ui-states.md).

#### Step D: Render, Critique, Audit
Rendering is mandatory. Screenshot at all three breakpoints, then score the 8-point rubric in [references/critique-loop.md](references/critique-loop.md) using the named defects in [references/critique-fails.md](references/critique-fails.md), and iterate at least twice:
```bash
bash scripts/shoot.sh dashboard.html
```
Then run the static quality gate:
```bash
bash scripts/audit-ui.sh <project-directory>
```
The audit scans first-party source only (dependencies excluded) for the quality floor: reduced-motion guard, visible keyboard focus, responsive breakpoints, `<main>` landmark, image alt text and placeholder copy. It does **not** check contrast, form labels or Lighthouse — those stay manual.

---

### Method 2: Manual Conversation Inject
If you are pair programming inside a text interface, simply reference or copy the contents of the main instruction skill:
* 📄 **[SKILL.md](SKILL.md)** — The master agent workflow.

---

## 📂 Repository Reference Index

To explore detailed guidelines and implementation boilerplates, refer to these references:

* **[SKILL.md](SKILL.md):** The primary workflow defining the step-by-step UI generation pipeline.
* **[references/design-systems.md](references/design-systems.md):** 10 visual-system contracts covering palette, typography, structure, surfaces, elevation, motion, and forbidden effects.
* **[references/surface-types.md](references/surface-types.md):** Product vs marketing. Name this before variants.
* **[references/redesign.md](references/redesign.md):** Audit-first preserve/overhaul path.
* **[references/dataviz.md](references/dataviz.md):** Chart and table contract for product screens.
* **[references/eval-briefs.md](references/eval-briefs.md):** Five briefs to score whether the skill is working.
* **[references/variant-exploration.md](references/variant-exploration.md):** Context-led three-variant comparison contract, slot menu (not a quota), optional approach pool, structural difference test, and user-selection gate.
* **[references/anti-slop-rules.md](references/anti-slop-rules.md):** The list of visual patterns to avoid and non-negotiable floor indicators.
* **[references/ui-states.md](references/ui-states.md):** Empty, loading, error and overflow states, interaction states, and form states — the work that isn't the happy path.
* **[references/critique-loop.md](references/critique-loop.md):** Render at three widths, score the 8-point rubric, check fidelity to the selected direction, iterate.
* **[references/critique-fails.md](references/critique-fails.md):** Named defects and the only score format that counts (`F#` or `PASS (checked …)`).
* **[references/premium-direction-playbook.md](references/premium-direction-playbook.md):** Subject-led selection matrix, equal-weight craft cards, and system-scoped recipes. Dark glass-and-bronze is one system, not the default.
* **[references/token-cheatsheet.md](references/token-cheatsheet.md):** Foundations on the 60/30/10 color rule, modular scaling, and typographic weights.
* **[templates/design-brief.md](templates/design-brief.md):** The canonical planning brief worksheet to fill out before writing code.
* **[scripts/scaffold-ui.sh](scripts/scaffold-ui.sh):** The Next.js + React 19 + Tailwind v4 project initializer.
* **[scripts/scaffold-html.sh](scripts/scaffold-html.sh):** Single-file HTML mockup — pass `<system>` and `<slot>` so variants do not share one skeleton.
* **[scripts/shoot.sh](scripts/shoot.sh):** Render a file or URL at 375 / 768 / 1280 and save the PNGs.
* **[scripts/audit-ui.sh](scripts/audit-ui.sh):** Programmatic verification quality gate script.
