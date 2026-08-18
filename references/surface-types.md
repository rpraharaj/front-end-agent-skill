# Surface type (name this at Gate 1)

Route A is one pipeline. The **surface** changes which slots, density, and signatures are legal. Name it before producing variants. Record it in Worksheet §1.

| Surface | What it is | Explore | Do not force |
|---|---|---|---|
| **Product** | App, dashboard, CRM, settings, queue, inbox, console | Nav model, density, inspector vs table, empty/loading/error | Cinematic hero, spatial graph of a list, marketing bento |
| **Marketing** | Landing, portfolio, launch, about, pricing | Hero, scroll rhythm, type, imagery | Sidebar + KPI row, command palette, cockpit density |

If both exist (a SaaS with a marketing site), they are two briefs. Do not run one variant set for both.

## Product

- Job is a repeated task. The job object (row, person, thread, document) is the first look.
- Density is usually compact or standard. `F11` if half the viewport is empty; `F13` if the job is a queue and you shipped five KPI cards.
- Signature is an interaction or a selected-object treatment, not a decorative hero.
- Build the states in `references/ui-states.md`. Charts: `references/dataviz.md`.
- Starting slots: see `variant-exploration.md` → job → slot. Default trio for a queue: sidebar · no-nav · top-nav.

## Marketing

- Job is a first impression and one conversion. The hero must state the offer and show the primary CTA without scroll on desktop.
- Density is usually spacious. `F12` if it reads like a spreadsheet.
- Signature is one compositional move (type, imagery, or a single scroll beat).
- Starting slots: continuous scroll · top-nav · no-nav (content-led). Not sidebar+KPI.
- Required: `<title>`, meta description, `og:image`, favicon.

## Mixed or unclear

Ask once: "Is this the tool people work in, or the page that sells it?" Do not guess a spatial canvas to cover both.
