# Data visualization (this skill's chart contract)

There is no separate `dataviz` skill in this repo. Use this file whenever the screen has numbers, series, or mix. Dashboards are the most common output; a bad chart undoes a good layout.

Restyle every mark to the **locked** tokens. Do not invent a rainbow categorical palette.

## Pick the chart from the question

| The user needs to… | Use | Do not use |
|---|---|---|
| Read one number | Big tabular numeral. Optional 7–14 day sparkline (`playbook` recipe 5) | Donut, gauge, 3D |
| Compare 2–8 categories | Horizontal bar | Pie, stacked-everything |
| See change over time | Line or area. One series, or 2–3 max | Five overlapping neon lines |
| See part-of-whole once | One donut **or** a stacked bar, with a table of the same values | Five KPI donuts (`F1`) |
| Scan many rows | Table with `tabular-nums`. Frozen first column if >6 cols | Card grid of the same rows |
| See a network/map/timeline that **is** the job | Spatial slot + one chart | A constellation of a to-do list (`F3`) |

If you cannot name the question, do not draw a chart.

## Rules

- **One accent.** Series color is `var(--color-accent)` plus tints of ink/muted. Semantic good/warn/danger only for real state.
- **Axes.** Start bar/area baselines at zero unless you state why not. Label the unit. No chartjunk (shadows, gradients on bars, fake 3D).
- **Legend.** Prefer direct labels on ≤3 series. A legend is required at 4+.
- **Empty / loading / error.** A chart is a data region — `references/ui-states.md`. Skeleton matches the chart's shape.
- **Numbers.** `tabular-nums`. Zero and negatives must still fit. Do not invent `92%` / `4.1×` the brief does not claim.
- **Small multiples** beat one overloaded combo chart.

## Tables (most "charts" should be this)

- The table *is* the surface in Minimal-Tech and Editorial. Do not wrap it in a card unless the locked system uses bezels.
- Header row stays put when the body scrolls if the list is long.
- Empty-filtered copy is not the same as first-run empty.

## Forbidden by default

- Rainbow category colors
- One donut per KPI
- Animated counting numbers as the only "insight"
- A chart that repeats a number already in a huge label next to it with no extra information
