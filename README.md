# Premium UI Agent Skill 🎨

> **A curated framework for AI coding agents to create top-class, unique, professional-grade, and premium web interfaces.**

Designed to eliminate standard "AI-slop" default layouts and enforce elite design aesthetics (Apple-esque, Linear-tier, Vercel-style, luxury banking), this repository equips agents with clear visual guidelines, layout archetypes, spacing rules, and quality check scripts.

---

## 👤 Author & License
* **Author:** Rajesh Praharaj
* **License:** [MIT License](LICENSE)

---

## ⚡ Core Philosophy: Anti-Slop Web Design
Standard AI-generated frontends look repetitive and generic (cream-and-serif, acid-green grids, raw linear gradients, Inter font-by-default, flat grey cards). This skill guides agents to design with:
1. **Concentric Card Nesting:** Double-bezel hardware structures using calculated border radii ($R_{\text{inner}} = R_{\text{outer}} - \text{Padding}$).
2. **Layout Variance:** Bento grids, Z-axis cascades, and staggered editorial splits to break symmetry.
3. **Typographic & Micro-Layout Rules:** Balancing text lines via `text-balance` / `text-pretty`, using `tabular-nums` for columns of data, and using dynamic `100dvh` viewport measurements for mobile.
4. **Restrained Color Palettes:** A strict 60/30/10 distribution with high-quality radial ambient glow layers rather than basic grey backgrounds.

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

#### Step B: Code to the Design System
Consult [references/design-systems.md](references/design-systems.md) to pick exactly one design language (Minimal-Tech, Warm-Sophisticate, Editorial, Dark Private-Client, or Dark-Luxe). Copy and use the predefined Google Fonts loader scripts.

#### Step C: Audit the Visual Quality
After coding, verify that your code satisfies accessibility and premium visual constraints:
```bash
bash scripts/audit-ui.sh <project-directory>
```
The audit script scans your repository for quality floor rules (keyboard focus outlines, reduced motion options, typography balance classes, mobile layout heights, and AI gradient slop).

---

### Method 2: Manual Conversation Inject
If you are pair programming inside a text interface, simply reference or copy the contents of the main instruction skill:
* 📄 **[SKILL.md](SKILL.md)** — The master agent workflow.

---

## 📂 Repository Reference Index

To explore detailed guidelines and implementation boilerplates, refer to these references:

* **[SKILL.md](SKILL.md):** The primary workflow defining the step-by-step UI generation pipeline.
* **[references/design-systems.md](references/design-systems.md):** 5 premium visual design palettes, font pairings, and Google Fonts loader code snippets.
* **[references/anti-slop-rules.md](references/anti-slop-rules.md):** The list of visual patterns to avoid and non-negotiable floor indicators.
* **[references/premium-direction-playbook.md](references/premium-direction-playbook.md):** Verified copy-paste code blocks for concentric Double-Bezels, Glassmorphism, and Radial Background Glows.
* **[references/token-cheatsheet.md](references/token-cheatsheet.md):** Foundations on the 60/30/10 color rule, modular scaling, and typographic weights.
* **[templates/design-brief.md](templates/design-brief.md):** The canonical planning brief worksheet to fill out before writing code.
* **[scripts/scaffold-ui.sh](scripts/scaffold-ui.sh):** The Next.js + React 19 + Tailwind v4 project initializer.
* **[scripts/audit-ui.sh](scripts/audit-ui.sh):** Programmatic verification quality gate script.
