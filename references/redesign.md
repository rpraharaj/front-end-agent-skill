# Redesign path

Use this instead of "pick a contrasting system and restyle." Silent costume changes (especially into Dark Private-Client) are how working products get worse.

## 1. Detect the mode

| Mode | Meaning |
|---|---|
| **Preserve** | Same brand, IA, and voice. Modernise execution. |
| **Overhaul** | New visual language, same content and routes. |
| **Greenfield** | Brand itself is changing, or there is no existing UI. That is Route A, not this file. |

If ambiguous, ask once: preserve the brand, or start visually from scratch?

## 2. Audit before touching (write this down)

- Tokens in use: colors, type, radii, density
- Information architecture: routes, nav labels, primary conversion
- Content that is doing work vs filler
- Patterns to keep (signature interaction, voice, a11y wins)
- Patterns to retire (slop tells, broken mobile, dead CSS)
- Current dials: infer variance, motion, density from the live UI
- Analytics and form field names that downstream tracking depends on

## 3. What never changes silently

Do not change without an explicit ask:

- URL slugs and in-page anchors
- Primary nav labels
- Form field names or order
- Logo / wordmark
- Legal, consent, and cookie copy

## 4. Levers (stop when the brief is satisfied)

1. Type — biggest lift per unit of risk
2. Spacing and proximity — one scale, related things closer
3. Color — unify neutrals, keep the real brand accent
4. Motion — only what the locked system allows
5. Recompose the hero or primary workspace
6. Replace a block only when it cannot be saved

Preserve mode should rarely reach lever 6. Overhaul may, but content and IA stay.

## 5. Then lock

After the audit, lock **one** system (existing, bundled, or derived) that fits the audience — not the opposite of the current look for its own sake. Fill Worksheet §3–§5, post the lock summary, and build. Critique against both the live product and the selected direction (`F25` if you drifted).
