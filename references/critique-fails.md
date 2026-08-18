# Critique fails (named defects)

Use with `references/critique-loop.md`. The rubric lives there. This file is the
**fail catalog** — what a fail looks like, and how to write the score.

Open the screenshot first. Do not score from memory of the code.

## How to write a score

For each rubric row, the result is one of:

```
F1 competing-kpis — five equal pulse cards steal the first look; collapse to one pulse + the action list
PASS (checked F1, F2 — first look is the selected next-action row)
```

Rules:

- A defect uses an ID from the list below, or a new ID in the same `F# kebab-name` form plus a one-line fix.
- `PASS` must name the fail IDs you checked and why they are absent. Bare `PASS` is not a critique.
- An 8/8 first pass of bare `PASS` / "looks clean and modern" **does not count**. Re-score from the screenshot.
- Score every width you rendered. A desktop PASS with a 375px `F6` is still a fail.

## Teaching pair — same product, two jobs

Job on both screens: *show who needs attention and do the next action.*

| | KPI dashboard (weaker for this job) | Workbench (stronger for this job) |
|---|---|---|
| File | `output/design-variants/church-crm/variant-a-care-command-center.png` | `output/design-variants/church-crm/variant-d-care-workbench.png` |
| First look | Five equal pulse cards | One selected action row |
| Defects | `F1`, `F13` | Not a gold file. Closer: the action list is the product. |

Open both. If your screen looks like A and the brief is a queue, it fails even if it is tidy.

## Defects

IDs are stable. Rubric `#` is the row in `critique-loop.md` §2.

| ID | Rubric | Fail when you see | Fix |
|---|---|---|---|
| **F1 competing-kpis** | 1 | Three or more equal metric cards as the first look | One primary number or none; the job object leads |
| **F2 no-focus** | 1 | Everything the same weight; squint test finds no first look | Starve everything except the job object |
| **F3 spatial-poster** | 1, 5 | Node graph / constellation / "map" of a queue, table, inbox, or form | Pick a workbench, table, or command slot. Example: `output/design-variants/church-crm/round-2/variant-e-living-ministry-map.png` |
| **F4 arbitrary-gaps** | 2 | 13px / 18px / 22px or any value off the worksheet scale | Snap to the scale. Related items closer than unrelated ones |
| **F5 flat-proximity** | 2 | Label-to-value gap equals card-to-card or section gap | Tighten groups; open space between groups |
| **F6 ragged-edges** | 3 | Columns, rules, or card edges miss a shared grid line | Align to one column set; check at 1280 and 375 |
| **F7 optical-ignore** | 3 | Icons or numerals sit low / off-center in their box | Nudge optically, not only by bounding box |
| **F8 size-soup** | 4 | More than ~4 type sizes on one screen | Two text sizes + one display; weights do the rest |
| **F9 display-everywhere** | 4 | Display / serif face on nav, labels, or body | Display only where the worksheet allowed it |
| **F10 orphan-headline** | 4 | One word alone on the last headline line | `text-balance` or rewrite |
| **F11 gallery-ops** | 5 | Operational tool wasting half the viewport | Raise density; show more of the job object |
| **F12 packed-marketing** | 5 | Landing / portfolio packed like a spreadsheet | Cut blocks; enlarge type and air |
| **F13 kpi-for-a-queue** | 5 | Job is "next action" / "who needs me" but the screen is a stat board | Lead with the queue or inspector. Teaching pair above |
| **F14 accent-spam** | 6 | Accent on more than a few elements | One accent, used on the signature and the primary action |
| **F15 second-accent** | 6 | A second decorative hue that is not a semantic token | Remove it or make it the only accent |
| **F16 semantic-as-decor** | 6 | Five status colors used as decoration, not state | One accent + one good/warn/danger, or none |
| **F17 glass-on-editorial** | 7 | Glass, glow, bezel, or hover-lift the locked system forbids | Strip the forbidden effect. Editorial = rules, not glass |
| **F18 glow-on-organics** | 7 | Ambient glow, metallic, or dark-luxe canvas on a calm/light system | Follow that system's forbidden list |
| **F19 mixed-radius** | 7 | 4px buttons, 16px cards, pills, and sharp rules with no stated rule | One radius story, or a written exception |
| **F20 missing-signature** | 8 | The worksheet signature is not on the screen | Build it. It must be the boldest thing |
| **F21 signature-everywhere** | 8 | The "one" memorable move repeats on every card | Once. Everywhere else stays quiet |
| **F22 rival-signature** | 8 | A second flourish competes (hero graph *and* gold glow *and* serif lockup) | Keep one |
| **F23 unbuildable-image** | fidelity | Image-mode mock with 3D nodes, fake OS chrome, or effects that will not survive HTML | Rebuild as HTML; that file is the spec. Example: `mock-ups/real-estate-crm/design-variants/variant-e-deal-atlas.png` |
| **F24 card-in-card** | 7, 2 | Cards nested in cards, or a card around a table that is already a surface | Flatten. Table *is* the surface unless the system uses bezels |
| **F25 silent-drift** | fidelity | Build is a different skeleton than Gate 2 selected | Restore the slot, or say the drift and why out loud |

## What a score looks like

```
1280: F1 competing-kpis, F13 kpi-for-a-queue — pulse row is five equal cards; move 128 into the rail, lead with Next actions
768:  PASS (checked F6, F11 — split becomes stack, action list still leads)
375:  F6 ragged-edges — filter chips overflow; wrap to two rows, no horizontal scroll
```

Then fix, re-render, score again. Pass 2 is for what the fixes broke.
