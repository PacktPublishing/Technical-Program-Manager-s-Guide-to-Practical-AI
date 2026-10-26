# Template: SteerCo Prep

Referenced by: `/tpm-steerco-prep`

> SteerCo exists to make decisions, unblock blockers, and provide executive cover for hard choices. It is NOT a status readout.
> Every SteerCo must have: at least one decision item, a pre-read distributed 24 hours before, and a clear "what we need from you" statement for each agenda item.

---

```markdown
# SteerCo — [Program Name / Portfolio]

**Date:** YYYY-MM-DD HH:MM [timezone]
**Presenter:** [TPM name]
**Attendees:** [Names + roles]
**Facilitator:** [Name]
**Note-taker:** [Name]

**Pre-read distributed:** Yes / No — [Date sent]
**Meeting duration:** [X] minutes

---

## Meeting Objective

> In one sentence: what must be true at the end of this meeting for it to have been worth holding?

---

## Agenda

| # | Item | Type | Time | Owner | Pre-read? |
|---|------|------|------|-------|-----------|
| 1 | [Agenda item] | 🔴 Decision / 🟡 Awareness / ⬜ FYI | [X] min | [Name] | Yes / No |

*Decision items first. No FYI items unless they change what a decision-maker needs to know.*

---

## 🔴 Decision Items

### Decision [N]: [What needs to be decided]

**Context:** [1–2 sentences: why this decision is at SteerCo now, what's at stake]

**Options:**

| Option | Pros | Cons | TPM Recommendation |
|--------|------|------|--------------------|
| A: [Option] | | | ← Recommended / Not recommended |
| B: [Option] | | | |

**Recommendation:** Option [A/B] — [one sentence rationale]

**Consequence if not decided today:** [What slips, what gets more expensive, what becomes irreversible]

**Decision owner:** [Name — who has authority to decide]
**Needed from SteerCo:** A decision on Option A or B, with any conditions or constraints

---

## 🟡 Awareness Items

### [Item]: [Topic]

**Status:** [One line]
**Why SteerCo needs to know:** [Not just informational — what changes if they don't know this?]
**No action needed unless:** [Edge case that might require intervention]

---

## Program Health Snapshot

| Program | RAG | Last week | Trend | Escalations |
|---------|-----|-----------|-------|-------------|
| [Name] | 🔴/🟡/🟢 | 🔴/🟡/🟢 | ↑↓→ | [N] open |

*Full health report: [Link to program health doc if available]*

---

## Open Decisions (Parking Lot)

Decisions not on today's agenda but approaching their escalation window:

| Decision | Needed by | Owner | Consequence if late |
|---------|-----------|-------|---------------------|
| | YYYY-MM-DD | | |

---

## Actions from Last SteerCo

| Action | Owner | Due | Status |
|--------|-------|-----|--------|
| [From previous meeting] | [Name] | [Date] | Done / In progress / Slipped |

---

## Appendix (Pre-Read Material)

*Attach or link: program master doc, RAID log, relevant milestone data. Pre-read should be 1 page max — put detail here.*
```

---

## Filled Example (NovaGrid — Weekly SteerCo Mar 11, 2026)

```markdown
# SteerCo — NovaGrid TPM Portfolio

**Date:** 2026-03-11 10:00 PST
**Presenter:** Karl Bergstrom (Head TPM)
**Attendees:** Priya Anand (CEO), Yuki Tanaka (VP Eng), Marcus Webb (CFO), James Whitfield (CISO), Division Directors
**Pre-read distributed:** 2026-03-10 17:00

## Meeting Objective

> Decide on Auth0 contract renewal and SHIELD exec mandate so Karl can unblock two critical program paths before end of week.

## Agenda

| # | Item | Type | Time | Owner |
|---|------|------|------|-------|
| 1 | Auth0 contract: renew vs. migrate | 🔴 Decision | 15 min | Sara Lindqvist |
| 2 | SHIELD exec mandate for 8 teams | 🔴 Decision | 10 min | Fatima Al-Hassan |
| 3 | Model Serving bandwidth — ATLAS vs SHIELD | 🔴 Decision | 10 min | Karl Bergstrom |
| 4 | Portfolio health snapshot | 🟡 Awareness | 5 min | Karl Bergstrom |

## 🔴 Decision Item 1: Auth0 Contract

**Context:** Auth0 contract expires Jun 30. 90-day renewal window opens Mar 18 — 7 days away. If CISO doesn't initiate, renewal window closes and we face a service interruption or emergency contract at 40% premium.

**Options:**

| Option | Pros | Cons | Recommendation |
|--------|------|------|-|
| A: Renew 2-year Auth0 | Fast, no migration risk, known cost | Locked in, misses IAM consolidation | ← Recommended |
| B: Accelerate NEXUS IAM and skip renewal | Eliminates Auth0 cost long-term | NEXUS IAM is 18 months out — bridge gap is untenable | Not recommended |

**Recommendation:** Option A — renew now, revisit migration at NEXUS IAM M4 (Dec 2026).
**Consequence if not decided today:** Renewal window opens Mar 18. James Whitfield must initiate by that date or we lose standard pricing.

## 🔴 Decision Item 2: SHIELD Exec Mandate

**Context:** 33 of 100 SOC 2 controls are not started. 8 teams have deprioritized. Deloitte audit is Aug 15 — $180K contract already signed. Without an exec mandate, Fatima cannot compel team ownership.

**Needed from SteerCo:** Yuki Tanaka issues a written directive to all 8 Engineering Division heads: SHIELD controls are P0 alongside existing roadmap, no exceptions.

**Consequence if not decided today:** 33 controls remain unowned. M2 (Apr 30) will be missed. Aug 15 audit fails.

## Program Health Snapshot

| Program | RAG | Trend | Escalations |
|---------|-----|-------|-------------|
| NEXUS | 🟡 | → | 1 (Auth0) |
| ATLAS | 🟡 | ↓ | 1 (Model Serving) |
| SHIELD | 🔴 | ↓ | 3 (controls, NEXUS dep, mandate) |
| MERIDIAN | 🔴 | → | 1 (mobile endpoint gap) |
| PULSE | 🔴 | → | 1 (FlowEngine bandwidth) |
| HORIZON | 🟡 | → | 0 |
| SPARK | 🟡 | ↓ | 1 (architecture review stalled) |
```
