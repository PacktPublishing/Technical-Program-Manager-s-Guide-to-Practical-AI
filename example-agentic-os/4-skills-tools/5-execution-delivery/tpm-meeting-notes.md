---
name: tpm-meeting-notes
description: "Use when you need to turn raw meeting notes or transcripts into structured decisions, action items, owners, and dates."
---
# /tpm-meeting-notes — Meeting Notes Synthesis

**Lifecycle Stage:** Execution & Delivery
**Job-to-be-Done:** Turn raw meeting notes or transcripts into structured decisions, action items, owners, and dates

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

---

## Interaction Flow

**Step 1 — Intake**

Paste:
1. Raw meeting notes or transcript
2. Meeting type (standup / cross-team sync / steerco / architecture review / other)
3. Date and attendees (if not in the notes)
4. Any context about open issues or prior action items

**Step 2 — Generate**

---

## Output Format

```markdown
# Meeting Notes: [Meeting Title]

**Date:** [Date]
**Type:** [Meeting type]
**Attendees:** [Names / teams]
**Facilitator:** [Name]
**Note-taker:** [Name]

---

## Decisions Made

| # | Decision | Made By | Date | Notes |
|---|---------|--------|------|-------|
| 1 | | | | |

---

## Action Items

| # | Action | Owner | Due Date | Priority | Status |
|---|--------|-------|---------|---------|--------|
| 1 | | | | 🔴🟡🟢 | Open |

---

## Key Discussion Points

1. **[Topic]:** [Summary of discussion + outcome]
2. **[Topic]:** [...]

---

## Blockers Surfaced

| Blocker | Impact | Owner | Escalation Needed? |
|---------|--------|-------|-------------------|
| | | | Yes / No |

---

## Open Questions / Parking Lot

| Question | Owner | Follow-up By |
|---------|-------|-------------|
| | | |

---

## Next Meeting

**Date:** [Date]
**Agenda items:**
- [Item 1]
- [Item 2]
```

---

## TPM Context

TPMs sit in many concurrent syncs across teams they don't manage. Meeting synthesis at scale is where a TPM's time disappears if done manually — and where alignment breaks down if done inconsistently. Unstructured notes leave every attendee with a slightly different interpretation of what was decided.

Consistent structure gives a single source of truth that feeds status-brief, blocker-extract, and risk identification. The goal isn't a transcript — it's the three things that matter: what was decided, who does what by when, and what's still unresolved.

---

## Key Concepts

- **Decisions:** Explicit outcomes, not topics discussed. "We talked about the API" is not a decision. "We agreed to use API v2 by March 10" is.
- **Action items:** Every action needs: an owner (a person, not a team), a deliverable (what specifically), and a due date. "Follow up with Backend" is not an action item.
- **Open questions:** Unresolved items are not failures — they're the next meeting's agenda and today's risk register inputs. Don't drop them.
- **Blockers:** If something came up that blocks delivery, it needs its own row with an owner and an escalation flag — not burial in discussion notes.

---

## Anti-Patterns

- **Decisions without owners** — "We decided to migrate the API" without a named owner means no one is accountable to communicate or implement it
- **Vague actions** — "Follow up on the dependency" — how, with whom, by when? If you can't answer those, it's not an action item.
- **Dropping open questions** — they become recurring agenda clutter or silent blockers; tag each one with "needs decision from X" or "blocked on Y"
- **Pure narrative output** — a paragraph summary of the meeting is not meeting notes; different readers extract different decisions from prose
- **No next meeting agenda** — open questions and deferred actions should seed the next meeting's agenda immediately

---

## Composes With

- `/tpm-extract-blockers` — blockers surfaced in notes feed directly into blocker extraction
- `/tpm-stakeholder-update` — decisions and actions from notes roll up into status updates
- `/tpm-decision-record` — significant decisions in notes should be promoted to formal decision records
- `/tpm-crossteam-prep` — open questions from this meeting become agenda items for the next

---

## Design Principles Applied
- Delivery First: Output is action items and decisions, not prose summaries
- Risk Visibility: Blockers surfaced as a distinct section
