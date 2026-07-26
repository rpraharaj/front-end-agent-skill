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
1. **Five Context-Led Directions Before Code:** When image generation is available, compare five meaningfully different approaches before locking a system or palette. No style, density, theme, or color treatment is forced without a brief-based reason.
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
Produce 3–5 context-led variants following [references/variant-exploration.md](references/variant-exploration.md). **Prefer HTML mode** — build each variant as real single-file HTML and screenshot it, so the selected variant *is* the starting build and there is no gap between the mockup and what can actually be shipped. Image mode is the fallback when no browser is available. Hold product intent, capabilities, content, data, target devices and hard constraints constant; vary structure and the visual dimensions the brief leaves open. Wait for the user to select one.

#### Step C: Lock and Build One System
Lock exactly one design system from the selected variant — or derive one if none of the ten fit — complete [templates/design-brief.md](templates/design-brief.md), then build to that system's full effects contract, including the non-happy-path states in [references/ui-states.md](references/ui-states.md).

#### Step D: Render, Critique, Audit
Rendering is mandatory. Screenshot at all three breakpoints, then score the 8-point rubric in [references/critique-loop.md](references/critique-loop.md) and iterate at least twice:
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
* **[references/variant-exploration.md](references/variant-exploration.md):** Context-led five-variant comparison contract, optional approach pool, structural difference test, and user-selection gate.
* **[references/anti-slop-rules.md](references/anti-slop-rules.md):** The list of visual patterns to avoid and non-negotiable floor indicators.
* **[references/ui-states.md](references/ui-states.md):** Empty, loading, error and overflow states, interaction states, and form states — the work that isn't the happy path.
* **[references/critique-loop.md](references/critique-loop.md):** Render at three widths, score the 8-point rubric, check fidelity to the selected direction, iterate.
* **[references/premium-direction-playbook.md](references/premium-direction-playbook.md):** Subject-led selection matrix, system-specific craft guidance, and recipes for qualifying directions.
* **[references/token-cheatsheet.md](references/token-cheatsheet.md):** Foundations on the 60/30/10 color rule, modular scaling, and typographic weights.
* **[templates/design-brief.md](templates/design-brief.md):** The canonical planning brief worksheet to fill out before writing code.
* **[scripts/scaffold-ui.sh](scripts/scaffold-ui.sh):** The Next.js + React 19 + Tailwind v4 project initializer.
* **[scripts/scaffold-html.sh](scripts/scaffold-html.sh):** Single-file, responsive, system-specific HTML mockup starter — also the engine for HTML-mode variants.
* **[scripts/shoot.sh](scripts/shoot.sh):** Render a file or URL at 375 / 768 / 1280 and save the PNGs.
* **[scripts/audit-ui.sh](scripts/audit-ui.sh):** Programmatic verification quality gate script.
