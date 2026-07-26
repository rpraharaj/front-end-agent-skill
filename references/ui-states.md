# UI States (the work that isn't the happy path)

A screen showing populated, well-behaved data is a **poster**, not an interface. Most of
real frontend work is the other states. A mockup that skips them looks finished and is not.

**Rule:** every component that renders data or accepts input must have its non-happy-path
states designed and built. Not described — built and screenshotted.

---

## 1. The five data states

Every data-bearing region (list, table, card grid, chart, feed) has these. Design all five
in the same visual system; they are not afterthoughts bolted on in a different style.

| State | What it means | What it must do |
|---|---|---|
| **Empty (first run)** | No data yet, and that's normal | Explain what will appear here and give the action that creates the first item. Never a bare "No data." |
| **Empty (filtered)** | Data exists, this query matched nothing | Say what was searched, offer to clear the filter. Different copy from first-run — conflating them is a classic tell. |
| **Loading** | Data is in flight | Skeleton matching the real layout's shape, or an inline progress affordance. Never a full-page spinner that erases the chrome. |
| **Error** | The request failed | Say what failed in plain language and give a retry. Never a raw status code as the entire message. |
| **Populated** | The happy path | The one everyone builds. |

**Partial-failure state** also exists on dashboards: three widgets load, one fails. The page
must not collapse — the failed widget shows its own inline error while the rest render.

### Empty-state copy: the difference that matters

```
❌ "No results."                        ← says nothing, offers nothing
❌ "No data available at this time."    ← corporate filler
✅ First run:  "No clients yet. Add your first client to start tracking portfolios."  [Add client]
✅ Filtered:   "No clients match 'westbrook'. Try a different search or clear filters." [Clear filters]
```

---

## 2. Interaction states (per interactive element)

Define these as **tokens in the worksheet**, not ad-hoc per component. Every button, link,
row, card, input and tab needs them, and they must be consistent across the screen.

| State | Requirement |
|---|---|
| **Default** | The resting appearance |
| **Hover** | Pointer only. Never the sole indicator of anything — touch devices have no hover. |
| **Focus-visible** | Keyboard. Must be visible against *every* background it appears on — check the accent ring on both surface and canvas. |
| **Active / pressed** | Immediate feedback on press. Its absence is why UIs feel "dead". |
| **Disabled** | Reduced contrast **and** `disabled` / `aria-disabled`. Must still be distinguishable from an enabled control — a disabled button that reads as enabled is a trap. |
| **Selected / current** | For nav items, tabs, rows. Never color alone (WCAG 1.4.1) — pair with weight, a rule, an icon, or `aria-current`. |
| **Loading (on the control)** | A submit button mid-request: disabled, labelled ("Saving…"), and the same width so the layout does not jump. |

```css
/* Define once as tokens, apply everywhere — see token-cheatsheet.md §9 */
--state-hover-bg:    color-mix(in srgb, var(--color-ink) 6%, transparent);
--state-active-bg:   color-mix(in srgb, var(--color-ink) 10%, transparent);
--state-selected-bg: var(--color-accent-soft);
--state-disabled-opacity: 0.45;
```

---

## 3. Content stress states

Designs break on real content, not on the three tidy rows in the mockup. Build each of
these at least once before calling a component done:

- **Long text** — a 60-character name in a 200px column. Decide: wrap, `line-clamp`, or
  `text-overflow: ellipsis` with a `title`. Deciding nothing means it breaks the layout.
- **Zero and negative numbers** — a KPI showing `0` or `-12.4%`. Does the color logic still
  read correctly? Does `-` shift the column? (`tabular-nums`.)
- **Very large numbers** — `$1,240,000,000`. Does it fit, or do you abbreviate to `$1.24B`?
- **Missing optional fields** — no avatar, no description, no secondary line. Does the card
  collapse unevenly, or does it hold its shape?
- **One item and many items** — a list with 1 row and with 200. Does 1 look broken? Does 200
  need virtualization or pagination?
- **Long words / URLs** — `overflow-wrap: anywhere` on user-generated text, or it escapes
  the container.

---

## 4. Form states (any input at all)

- Label present (`<label for>` or `aria-label`) — placeholder is **not** a label.
- Inline validation on blur, not only on submit.
- Error message adjacent to the field, referenced by `aria-describedby`, and **not** color-only.
- `aria-invalid="true"` on the failing field.
- Required fields marked in text, not only with a red asterisk.
- Submit disabled *and* labelled during flight; the form must not double-submit.
- On submit failure, focus moves to the first invalid field.

```html
<label for="email">Work email</label>
<input id="email" type="email" aria-invalid="true" aria-describedby="email-err" />
<p id="email-err" role="alert">Enter an email address that includes an @.</p>
```

---

## 5. Delivery requirement

For every build, state which states you implemented and which you deliberately skipped.
"Only the populated state" is a valid answer for a static visual mockup — but it must be
**said**, not silently omitted, because it is the difference between a picture and an interface.

Record this in `templates/design-brief.md` §6a.
