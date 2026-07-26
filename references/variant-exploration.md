# Multi-Variant Visual Exploration

Use this reference when the task establishes or materially changes a visual direction. The purpose is to compare **complete, structurally distinct, context-appropriate product experiences** before the final system and implementation decisions become expensive.

## Two modes — pick one before you start

| | **HTML mode** (default when a browser is available) | **Image mode** |
|---|---|---|
| Output | Real single-file HTML per variant, screenshotted | AI-generated mockup images |
| Fidelity | Exact — what you show *is* what gets built | Approximate — the image may contain layouts, type and effects that don't translate |
| After selection | The chosen file **is** the starting build | You rebuild from scratch, hoping it matches |
| Auditable | Yes — `audit-ui.sh` runs on each | No |
| Cost | ~1 scaffold + edits per variant | 1 image call per variant |
| Needs | `scripts/scaffold-html.sh` + any browser/screenshot tool | An image-generation tool |

> **Prefer HTML mode.** The single biggest quality leak in an image-led workflow is the gap
> between a beautiful generated mockup and what can actually be built from it. HTML mode has
> no gap: the artifact is the code. Use image mode when no browser is available, or when the
> user explicitly wants a looser, more exploratory visual pass before committing to structure.

**Three is enough.** Five is the default when variants are cheap (image mode), but three
genuinely distinct directions beat five where two are padding. In HTML mode, produce **3–5**
and say how many and why. Every rule below — slots, contrast matrix, difference test, stop
gate — applies identically to whichever mode and count you choose. Adjust the adjacent-pair
list to the count you produced (for three: A-B, B-C, A-C).

### HTML mode procedure

1. Complete the Structural Slot Assignment and Pre-Prompt Contrast Matrix exactly as below —
   these are mode-independent and come first.
2. For each variant: `bash scripts/scaffold-html.sh variant-a-<slug> <system>`, then edit it
   to express that variant's slot, density, type treatment and signature. The scaffold gives
   you the system's effects contract, breakpoints and a11y floor for free — spend your effort
   on structure and the signature, not boilerplate.
3. Screenshot each at 1280×800: `bash scripts/shoot.sh variant-a-<slug>.html output/design-variants/<brief-slug>/a`
   (or use your browser tool directly).
4. Run the Pre-Presentation Stop Gate on the **screenshots**, not on your intentions.
5. Present the images side by side, and mention that the selected one is immediately buildable.
6. On selection, that file becomes the Step 6 starting point — carry it forward, don't restart.

## Contents

- [When to run](#when-to-run)
- [Fixed invariants and exploration variables](#fixed-invariants-and-exploration-variables)
- [Theme diversity rule](#theme-diversity-rule)
- [Structural slot system](#structural-slot-system)
- [Pre-prompt contrast matrix](#pre-prompt-contrast-matrix)
- [Variant set composition](#variant-set-composition)
- [Visual archetype pool](#visual-archetype-pool)
- [Canonical variant specification](#canonical-variant-specification-and-image-prompt-template)
- [Difference requirements](#difference-requirements)
- [Two modes](#two-modes--pick-one-before-you-start)
- [Generation procedure](#generation-procedure)
- [Pre-presentation stop gate](#pre-presentation-stop-gate)
- [Presentation and selection](#presentation-and-selection)
- [Failure conditions](#failure-conditions)

---

## When to run

Run variant exploration for greenfield interfaces, new screens with meaningful visual freedom, and substantial redesigns.

Skip it for minor styling changes, isolated components, bug fixes, exact implementation of an approved reference, and work locked to an established product system. State why it was skipped. (Those are Route B or C in `SKILL.md` — they never reach this file.)

---

## Fixed invariants and exploration variables

Hold these constant across every variant so the user compares design direction rather than different products:

- Same product, audience, single job, capabilities, content inventory, data, copy, target devices, and viewport.
- Same hard brand, legal, locale, accessibility, and approved-reference constraints.
- Same viewport, dimensions and fidelity for every variant.
- WCAG contrast floor: body text at least 4.5:1; large text at least 3:1. Preserve usable target sizes even when visual density changes.
- No logos, watermarks, stock photos, or invented product capabilities unless the brief requires them.

Treat theme, palette, density, compactness, navigation, screen architecture, typography, container model, geometry, elevation, emotional tone, and signature interaction as exploration variables unless the brief explicitly fixes them.

Before producing anything, write two lists: **fixed invariants** and **available exploration variables**. Do not vary a hard constraint, and do not freeze an open visual choice without a brief-based reason.

---

## Theme diversity rule

Unless the brief hard-fixes the theme, ensure the set includes at minimum (drop the fourth line if you produce three):

- **2 dark-canvas variants** (near-black or deep-toned background)
- **1 light-canvas variant** (Editorial, Boutique, or Organics register)
- **1 neutral/mid-tone variant** (Warm-Sophisticate or similar mid-dark)
- **1 agent's choice** based on subject-specific rationale, including mixed-mode if it serves the brief

> **Reason:** Agents default toward dark mode because it reads as "premium." This erases the entire light-mode design space and prevents the user from evaluating which treatment actually serves the product. A monochrome direction, mixed-mode, or any other treatment is permitted in the remaining slot — but the set must always expose the light/dark contrast so the user can make an informed choice.

---

## Structural slot system

**Assign each variant to a structural slot before you produce anything.** Structural slots are mutually exclusive at the layout skeleton level — no two variants may occupy the same slot.

| Slot | Primary structural commitment |
|---|---|
| **A** | Horizontal top nav — primary navigation is a top bar; content region fills below |
| **B** | Left rail / sidebar — persistent vertical nav anchors the left; content dominates right |
| **C** | No persistent nav — command-first, content-led, or input-first entry; nav is modal or contextual |
| **D** | Single continuous surface — one scrolling canvas with no modals, panels, or split panes |
| **E** | Spatial / canvas-first — one dominant visualization (chart, map, timeline, diagram) anchors everything; controls orbit it |

> **Why this matters:** Structural convergence is the most common failure mode. Variants that all use sidebar + card-grid differ only in decoration, not in product experience. Locking distinct structural commitments first forces genuinely different ideas, and then the design system and visual treatment follow from the structure.

Assign slots *before* picking design systems. Then choose the most compatible system for each slot's structural needs. Record slot assignments in the design-brief worksheet (Section 2) before generating.

---

## Pre-prompt contrast matrix

**Complete this table before you produce any variant.** This prevents convergence that happens in the agent's head when prompts are drafted sequentially.

```
| Axis                    | A | B | C | D | E |
|-------------------------|---|---|---|---|---|
| Structural slot         |   |   |   |   |   |
| Navigation model        |   |   |   |   |   |
| Theme (dark/light/mid)  |   |   |   |   |   |
| Density                 |   |   |   |   |   |
| Typography character    |   |   |   |   |   |
| Container model         |   |   |   |   |   |
| Emotional tone (1 word) |   |   |   |   |   |
| Primary interaction verb|   |   |   |   |   |
```

**Gate:** Examine every adjacent pair (A-B, B-C, C-D, D-E, A-E). No pair may share the same value on more than **2 axes**. If any pair scores 3 or more shared values → revise that candidate before writing a single prompt. Record the completed matrix in the design-brief worksheet under Section 2.

---

## Variant set composition

Choose 3–5 approaches that maximize useful visual distance for the brief. The set must reveal meaningful product tradeoffs, not demonstrate a predetermined style sampler. Do not mechanically use the same set for every product.

Each candidate must:

1. Occupy a distinct structural slot (see above).
2. Have one named product and spatial thesis with a brief-based rationale.
3. Use one coherent design system or one explicitly derived system; never mix systems inside a candidate.
4. Preserve the fixed invariants.
5. Differ from every other candidate on at least four visual axes, including at least one structural axis.
6. Express the subject-specific signature differently through placement, scale, or interaction without changing the underlying product job.
7. Have a human direction name and a one-line hook (see Presentation section).

Variant exploration happens before final system lock. The selected candidate locks its system and effects contract for the token plan and build.

---

## Visual archetype pool

Each archetype is described with its **primary interaction verb** and **emotional register** so the experience — not just the layout — is distinct. These are optional starting grammars, not fixed templates or required categories. Rename, combine compatible ideas within one coherent system, or ignore them when the product intent suggests better directions.

- **Precision Grid** — *You scan.* Strict grid, dense data rows with a frozen-column feeling; the table IS the UI. Controls are compact and inline. *(Emotional: trusted, clinical, efficient)*
- **Editorial Ledger** — *You read.* Typography IS the hierarchy — ruled bands replace cards; continuous reading flow with minimal decorative containers. *(Emotional: credible, thoughtful, journalistic)*
- **Soft Modular** — *You explore.* Borderless tonal fields, asymmetric soft geometry, clustered modules invite browsing. *(Emotional: warm, personal, inviting)*
- **Split-Pane Workbench** — *You work.* List left, detail right — always in context; compact navigation; persistent inspector surface. *(Emotional: professional, focused, no-nonsense)*
- **Layered Control Surface** — *You configure.* Stacked sheets, inset regions, compact command bar; a physical sense of depth and system. *(Emotional: expert, layered, hands-on)*
- **Command-Bar First** — *You command.* A universal ⌘K field organizes navigation and primary actions; no persistent menu competes. *(Emotional: power-user, fast, minimal-friction)*
- **Table-First Console** — *You monitor.* Dense rows, frozen-column feel, inline controls; data is the surface, not a card inside a surface. *(Emotional: operational, authoritative, real-time)*
- **Spatial Canvas** — *You see.* One dominant subject-specific visualization — chart, map, network, timeline — anchors all controls around it. *(Emotional: insight-first, data-rich, analytical)*
- **Stacked Sheets** — *You layer.* Detail unfolds progressively without route changes; panels slide in over a stable backdrop. *(Emotional: focused, non-disruptive, contextual)*
- **Minimal Index** — *You jump.* Categorized index structure with terse navigation and strong typographic scanning; the page is a table of contents for deep work. *(Emotional: scholarly, catalogued, library-like)*
- **Timeline Rail** — *You trace.* A compact activity spine organizes everything chronologically; time IS the navigation. *(Emotional: narrative, flowing, activity-driven)*
- **Inspector-First** — *You drill.* A persistent detail surface leads; lists and summaries are compact selectors, not destinations. *(Emotional: discovery-first, deep, expert)*
- **Modular Dock** — *You compose.* Compact modules orbit a stable central workspace with clear docking zones; the layout feels assembled, not imposed. *(Emotional: customizable, productive, tool-like)*
- **Continuous Surface** — *You scroll.* Hierarchy comes from indentation, typography, and spacing rather than cards or panels. *(Emotional: document-like, legible, no-chrome)*
- **Inset Console** — *You inhabit.* Controls appear recessed into one continuous shell; nothing floats above the surface. *(Emotional: immersive, integrated, cockpit-like)*

---

## Canonical variant specification (and image prompt template)

Use this structure for every image generation call. All six sections are required. Do not write a prompt that omits any section.

```
[STRUCTURAL COMMITMENT] — one sentence: primary nav model + screen architecture + slot letter
[DENSITY + RHYTHM] — compact/medium/spacious; grid unit; whitespace intention
[PALETTE + THEME] — 3–4 named hex values; background treatment; surface treatment; theme (dark/light/mid)
[TYPOGRAPHY] — display font (used where, at what scale) + body font (used where)
[SIGNATURE ELEMENT] — the ONE memorable element: what it is, where it appears, how it behaves
[EMOTIONAL REGISTER] — 2–3 adjectives; what this screen feels like at first glance
```

**Assembled prompt format:**
> "UI mockup, [app type], [STRUCTURAL COMMITMENT]. [DENSITY+RHYTHM]. [PALETTE+THEME]. [TYPOGRAPHY]. Signature: [SIGNATURE ELEMENT]. Tone: [EMOTIONAL REGISTER]. Desktop viewport 1280×800, clean high-fidelity interface design, no lorem ipsum, real data labels, no device frame."

**Example (Variant B — Split-Pane Workbench, Dark Private-Client system):**
> "UI mockup, wealth management CRM dashboard. Slot B: persistent left sidebar (64px icon rail) with a two-column split pane — client list on the left third, portfolio detail on the right two thirds. Compact density, 4px grid, tight row spacing with generous section padding. Dark canvas #0A0B0E, glass surface rgba(255,255,255,0.035), warm bronze accent #C9A24B; dark theme. Display: Fraunces serif on hero KPI numbers only; body: Inter for all labels and nav. Signature: a real-time animated SVG area sparkline on the selected client card that responds to hover with an expanding tooltip. Tone: authoritative, discreet, data-rich. Desktop viewport 1280×800, clean high-fidelity interface design, no lorem ipsum, real portfolio numbers, no device frame."

Write a spec of this quality for every structural slot before you generate anything. In image mode it becomes the prompt verbatim; in HTML mode it is the build instruction for that variant — same six sections either way.

---

## Difference requirements

Evaluate the axes that are open in the brief:

1. Navigation model
2. Screen architecture and information flow
3. Density and spatial rhythm
4. Theme and color strategy
5. Typography character and hierarchy
6. Container model, geometry, and radius
7. Surface, elevation, and depth
8. Signature placement, scale, and interaction
9. Emotional tone

Every pair of variants must differ on at least four relevant axes, including at least one structural axis: navigation, screen architecture, density, container model, or signature interaction. Color and theme may count when they materially shape the experience, but a palette swap alone is never a new direction. Data changes, card reordering, alternate copy, or different icons do not count.

---

## Generation procedure

1. Write the fixed-invariant block and the list of available exploration variables from the confirmed brief.
2. Complete the **Structural Slot Assignment** — assign A–E slots before anything else.
3. Complete the **Pre-Prompt Contrast Matrix** and verify no adjacent pair shares more than 2 axis values. Revise if needed.
4. Apply the **Theme Diversity Rule** — confirm the set covers the required light/dark distribution.
5. Write one complete spec per variant using the **Canonical Variant Specification**. Repeat the invariant block in every one.
6. Produce the variants. HTML mode: one scaffold + edit pass each, then screenshot. Image mode: one generation call each — never a five-up image, and never multiple samples of one prompt treated as separate approaches.
7. Save results as `variant-a-<slug>.png` through `variant-e-<slug>.png` under `output/design-variants/<brief-slug>/` or the project location requested by the user.
8. Run the **Pre-Presentation Stop Gate** on the rendered results — the screenshots, not your intentions. Rebuild or regenerate any that fail before showing the set.
9. Never write UI code during this stage.

---

## Pre-presentation stop gate

Run all four checks before presenting variants to the user. Any FAIL = regenerate that variant; do not present a failing set.

### Check 1 — Structural silhouette test
Mentally shrink all 5 to 200px-wide thumbnails. Are the silhouettes (nav position, dominant region, whitespace distribution) visibly distinct? If any two retain substantially the same silhouette → **regenerate the weaker one**.

### Check 2 — System purity check
Name the design system used for each candidate. Confirm each candidate uses exactly one system and does not borrow effects from another. If any candidate mixes glass from system A with typography from system B → **regenerate**.

### Check 3 — Axis difference count
For every adjacent pair (A-B, B-C, C-D, D-E, A-E), count how many axes differ across the nine axes listed in Difference Requirements. Minimum required: **4 per pair**. If any pair scores fewer than 4 → **regenerate the less differentiated candidate**.

### Check 4 — Emotional tone word test
Assign one emotional tone word to each variant (e.g., Clinical / Warm / Authoritative / Playful / Decisive). All words must be different. If two variants share the same emotional word → they are too close → **regenerate the weaker one**.

Only present variants that PASS all four checks.

---

## Presentation and selection

Present A–E at equal visual size. For each include:

- **Direction name** — a human-readable name for the approach (e.g., "The Command Center", "The Reading Room", "The Operator's Console")
- **One-line hook** — what the user will feel using this screen every day (e.g., *"Scan everything at a glance — no hunting, no clicking through menus"*)
- Why it fits the product intent
- One-sentence spatial thesis
- System used or derived
- Key visual decisions (structural slot, theme, density, signature)
- Primary strength
- Primary tradeoff

Briefly explain why the set forms a useful comparison, then ask the user to choose one. The user may request a regenerated candidate or transfer one clearly named element into the chosen direction. Do not blend multiple candidates indiscriminately.

**Example presentation block:**

```
**B: The Operator's Console**
*"The data is always visible — you never lose context when drilling into a client."*

- Intent fit: Relationship managers live in this app 8h/day; the split-pane keeps the list and detail simultaneously visible.
- Spatial thesis: A narrow client-selector left, a persistent portfolio-detail right — like a two-monitor setup in one surface.
- System: Dark Private-Client
- Decisions: Slot B / dark canvas / compact density / Fraunces on KPI numbers / animated sparkline signature
- Strength: Zero context loss — client list never disappears
- Tradeoff: Requires ≥1024px width to feel uncluttered
```

After selection:

1. Record the selected variant, its direction name, and the user's rationale in `templates/design-brief.md`.
2. Record the completed Contrast Matrix in the worksheet.
3. Lock exactly one design system and its complete effects contract.
4. Derive the final token plan from the selected candidate and confirmed brand constraints.
5. Treat the selected image as the visual source of truth for layout and hierarchy.

---

## Failure conditions

Reject or regenerate the set when:

- Fewer than three valid variants are available.
- Any structural slot is duplicated across candidates.
- The Contrast Matrix has any adjacent pair sharing more than 2 axis values.
- The Theme Diversity Rule is violated (all dark, or no light-canvas option shown).
- Two variants differ mainly by content, data, card order, icons, or a superficial color swap.
- A visual treatment is included only to satisfy an arbitrary quota rather than the product intent.
- An open visual choice is forced across all candidates without a brief-based reason.
- Content inventory, capabilities, target devices, or other fixed invariants drift between candidates.
- A candidate mixes visual systems.
- A candidate violates a hard brand, accessibility, theme, or device constraint.
- Any Stop Gate check fails (silhouette, system purity, axis count, emotional tone word).
- The comparison is presented without human direction names, one-line hooks, product-fit rationale, and tradeoffs.
- Coding starts before the user selects a candidate.
