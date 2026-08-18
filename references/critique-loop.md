# Critique Loop (render → look → fix → repeat)

The single highest-leverage quality step available. `audit-ui.sh` proves the floor;
**looking at the rendered screen** is the only thing that catches bad design.

**Non-negotiable:** never report a UI as done without having rendered it and looked at it.
If you could not render it, say so explicitly and list what you checked instead — do not
describe a screenshot you did not take.

**Score from the screenshot, not the code.** Open `references/critique-fails.md` before you
mark a row. Each result is `F# kebab-name — fix` or `PASS (checked F# … — why absent)`.
Bare `PASS` and "looks clean and modern" do not count. The defect names live only in that
file; do not invent a second catalog here.

---

## 1. Render at three widths

| Width | Why |
|---|---|
| **375 × 812** | Smallest real phone. Where nav overflow, cramped padding and truncation appear. |
| **768 × 1024** | The awkward middle. Where a desktop design falls apart and a mobile one looks empty. |
| **1280 × 800** | Primary desktop. Where whitespace and hierarchy are judged. |

Use whatever is available, in this order:

1. **Your browser tool** — navigate to the file/dev server, set the viewport, screenshot.
   Local files usually need an HTTP server: `python3 -m http.server 8899` then open
   `http://localhost:8899/<file>.html`.
2. **`bash scripts/shoot.sh <file-or-url>`** — writes all three widths to `output/shots/`.
3. **Nothing available** — say so, and fall back to the static checks in
   `premium-direction-playbook.md` → "Verify without a live browser."

Also render **dark and light** if the brief said "both", and re-check contrast in each.

---

## 2. The rubric — score each render

Open every screenshot. For each row: a named defect from `critique-fails.md`, or `PASS`
with the fail IDs you checked. Vague self-praise is not a critique and does not count.

| # | Check | Fails when |
|---|---|---|
| 1 | **Focal point** | Squint at it. If two or more elements compete for first look, or nothing does, hierarchy has failed. |
| 2 | **Spacing rhythm** | Gaps are arbitrary (13px here, 18px there) instead of steps on one scale. Related items sit further apart than unrelated ones. |
| 3 | **Alignment** | Edges don't share a grid line. Optical centering ignored on icons and numerals. |
| 4 | **Type hierarchy** | More than ~4 sizes on screen; display face used where body belongs; line length over ~75ch; orphaned words in headings. |
| 5 | **Density fit** | An operational tool that wastes half the viewport, or a marketing page packed like a spreadsheet. Density must match the job named in the brief. |
| 6 | **Color discipline** | Accent used more than a few times; 60/30/10 broken; a second accent smuggled in; semantic colors used decoratively. |
| 7 | **System purity** | Any effect present that the locked system's contract forbids (glass, glow, bezel, lift, radius). One violation = failed lock. |
| 8 | **The signature is present and singular** | The one memorable element from the worksheet is actually built, is the boldest thing on screen, and has no rival. |

### Mobile-specific pass (at 375px)
- Nothing overflows horizontally — the page must not scroll sideways.
- Tap targets ≥ 44 × 44px.
- Nav is usable, not a squeezed desktop bar.
- Text is ≥ 16px where it's read (prevents iOS zoom-on-focus).

---

## 3. Fidelity check against the selected direction

Put the selected **HTML** variant (or the post-Gate-2 HTML rebuild if you used image mode)
next to the build and compare. The image is mood, not the spec — `F23` if you are still
implementing from the picture.

- **Structure** — same skeleton? A variant that promised a spatial canvas must not ship as a card grid.
- **Density** — same rhythm?
- **Palette and type** — the worksheet's named values, actually applied?
- **Signature** — built, in the same role and prominence?

Any drift is either a **bug to fix** or a **decision to state out loud** ("the canvas layout
didn't survive contact with real data volume, so I moved to a split pane — here's why").
Silent drift is the failure mode: the user approved a direction and received a different one.

---

## 4. Iterate — at least two passes

One critique pass is a spell-check, not a design review.

```
Pass 1 → render → rubric → fix everything found
Pass 2 → re-render → rubric → fix what the fixes broke
Stop when a pass produces no new defects, or the remaining ones are stated as accepted.
```

The second pass matters most: fixes create new problems (tightened spacing breaks the
mobile grid; a bigger signature starves the hero). Never ship straight off pass 1.

**Then** cut one accessory — *"before leaving the house, remove one thing."* Do this last,
after the design is correct, not as a substitute for critiquing it.

---

## 5. Reporting

State plainly:
- Which widths you rendered, screenshot paths, and that you looked at each.
- Rubric results in the `critique-fails.md` form (`F# …` or `PASS (checked …)`).
- Fidelity: matches the selected HTML direction, or the drift and why (`F25` if silent).
- How many passes you ran.
- What you removed in the final cut.
- Anything you could **not** verify.

Never claim a check you did not perform. An honest "not verified: contrast in light mode"
is worth more than a ticked box that turns out to be false.
