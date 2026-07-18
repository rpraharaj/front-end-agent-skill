# Anatomy of the Best UI-Generation Skills (research bank)

Live GitHub stats captured 2026-07-17 via the GitHub API. Use this to justify the workflow in the parent SKILL.md.

## Verified star counts
| Repo | Stars | What it is |
|---|---|---|
| anthropics/skills | 162k | Anthropic's OFFICIAL Agent Skills repo — source of truth |
| ComposioHQ/awesome-claude-skills | 68k | Index of Claude skills (incl. HTML/React/Tailwind artifact skills) |
| PatrickJS/awesome-cursorrules | 40k | Cursor `.mdc` rule files for better AI output |
| VoltAgent/awesome-agent-skills | 28k | 1000+ agent skills across Claude/Codex/Gemini/Cursor |
| travisvn/awesome-claude-skills | 14k | Curated Claude-skills list |
| VoltAgent/awesome-claude-design | 3.1k | 68 ready-to-use `DESIGN.md` design-system specs |
| rohitg00/awesome-claude-design | 883 | DESIGN.md prompts by aesthetic family + remix recipes |

## What each top skill actually does (the reusable ingredients)
- **anthropics/skills → `frontend-design`** — Forces a design-lead mindset: brief → token plan (color/type/layout/signature) → self-critique. Explicitly names the 3 "AI-slop" default looks to avoid (cream+serif+terracotta; black+acid-green; broadsheet hairlines). Instructs two-pass build (plan, critique, then code).
- **anthropics/skills → `web-artifacts-builder`** — Concrete stack + scripts: React 18 + TS + Vite + Parcel + Tailwind + shadcn/ui. One-line anti-slop: avoid centered layouts, purple gradients, uniform rounded corners, Inter.
- **anthropics/skills → `theme-factory`** — `themes/<name>.md` spec format: named hex palette + font pairing + "best used for". 10 presets (Ocean Depths, Modern Minimalist, Midnight Galaxy, etc.).
- **VoltAgent/awesome-claude-design** — 68 `DESIGN.md` design systems (Linear/Stripe-style) = drop-in identity library. "Drop one in, scaffold a full UI in one shot."
- **PatrickJS/awesome-cursorrules** — `.mdc` rule files = portable agent instructions mapping to skill triggers.

## Design-system spec format (from theme-factory)
```md
# <Name>
<One-line positioning statement.>

## Color Palette
- **Token**: `#hex` - role/usage

## Typography
- **Headers**: <font>
- **Body Text**: <font>

## Best Used For
<contexts>
```

## Key takeaway
Premium UI skills succeed by (1) locking a stack, (2) forcing brief→system→tokens→critique, (3) shipping a NAMED design-system/theme library, (4) including runnable scaffold/audit scripts. This parent skill implements all four.
