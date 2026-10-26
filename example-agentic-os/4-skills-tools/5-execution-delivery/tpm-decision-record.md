---
name: tpm-decision-record
description: "Use when you need to document a key program or architecture decision in ADR format — capturing context, options, rationale, and consequences."
---
# /tpm-decision-record — Decision Record (Program / Architect)

**Lifecycle Stage:** Execution & Delivery
**Job-to-be-Done:** Document a key program or architecture decision in ADR format — capturing context, options, rationale, and consequences

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

Use the ADR template conventions from `domain-context.md` if available.

---

## Interaction Flow

**Step 1 — Intake**

1. Decision title (short, action-oriented)
2. Context: what situation led to this decision?
3. Options considered
4. Decision made and who made it
5. Rationale / key factors
6. Consequences (positive and negative)
7. Who needs to know about this decision

**Step 2 — Generate**

---

## Output Format

```markdown
# Decision Record: [Decision Title]

**ID:** DR-[YYYYMMDD]-[sequence]
**Date:** [Date]
**Status:** Proposed / Accepted / Deprecated / Superseded
**Decision Maker(s):** [Names / roles]
**Program:** [Program name]

---

## Context

[2–4 sentences: What situation, constraint, or problem led to this decision? What happens if no decision is made?]

---

## Decision Drivers

- [Key requirement or constraint 1]
- [Key requirement or constraint 2]
- [Key requirement or constraint 3]

---

## Options Considered

### Option A: [Title]
**Description:** [...]
**Pros:** [...]
**Cons:** [...]

### Option B: [Title]
**Description:** [...]
**Pros:** [...]
**Cons:** [...]

### Option C: [Title] *(if applicable)*
[...]

---

## Decision

**We will:** [Option X — state the decision clearly]

**Rationale:**
[Why this option over the others. Be specific about which decision drivers were most important.]

---

## Consequences

**Positive:**
- [Expected benefit 1]
- [Expected benefit 2]

**Negative / Trade-offs:**
- [Known downside 1]
- [Known downside 2]

**Risks:**
- [Risk 1] — Mitigation: [...]

---

## Communication Plan

| Stakeholder | How to Communicate | By When |
|------------|-------------------|---------|
| | | |

---

## Review Date

**Review this decision on:** [Date] — [Trigger for reconsideration]
```

---

## TPM Context

TPMs facilitate decisions across teams that don't report to them. Without a written record, "we decided X" becomes "I thought we decided Y" three weeks later — and the TPM gets blamed for the confusion. The decision record makes decisions **stick** and protects the TPM when choices are later questioned.

It also reduces re-debate. Teams relitigate decisions when they can't find the original context. A decision record cuts that loop: context, options, choice, rationale, consequences. Everything needed to understand why we did this, months later.

---

## Key Concepts

- **Status lifecycle:** Proposed → Accepted → (if revisited) Deprecated / Superseded. Track status so stale decisions don't get followed blindly.
- **Reversibility:** Note explicitly if this decision is reversible, under what conditions, and at what cost. Makes later adaptation faster.
- **Decision Maker vs Facilitator:** The TPM often facilitates but doesn't make the decision. Record the actual decision maker accurately.
- **Consequences:** Decisions imply commitments. Spell them out — what does the team commit to by choosing this? What do we accept as known downsides?
- **Communication plan:** A decision without a communication plan isn't done. People who need to know but weren't in the room are a re-debate waiting to happen.

---

## Anti-Patterns

- **Logging outcome only** — "We decided to use the API" with no context or rationale is useless for anyone 6 months later
- **No consequences section** — decisions without commitments are just preferences; consequences create accountability
- **Too many decisions per entry** — one decision per record; compound decisions become impossible to supersede cleanly
- **No review date** — decisions should have a trigger for reconsideration; otherwise they calcify into orthodoxy even when circumstances change
- **Missing options** — if you only document the chosen option, future readers can't evaluate whether the right tradeoff was made

---

## Composes With

- `/tpm-meeting-notes` — decisions surfaced in meeting notes should be promoted to full decision records
- `/tpm-master-document` — key architectural and scope decisions link back to the charter
- `/tpm-architecture-review` — design decisions from RFCs or design reviews should have accompanying decision records
- `/tpm-programmemory` — decision records are primary inputs to program memory at closure

---

## Design Principles Applied
- Delivery First: Decisions documented with communication plan attached
- Risk Visibility: Trade-offs and risks explicit, not buried
- Cross-Team Alignment: Communication plan ensures everyone who needs to know, does
