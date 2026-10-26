---
name: tpm-qbr-prep
description: "Use when you need to prepare a structured Quarterly or Monthly Business Review — program performance, OKR progress, key decisions made, and the ask going into the next period."
---
# /tpm-qbr-prep — QBR / MBR Preparation

**Lifecycle Stage:** Execution & Delivery
**Job-to-be-Done:** Prepare a structured Quarterly or Monthly Business Review — program performance, OKR progress, key decisions made, and the ask going into the next period

---

## TPM Context

QBRs and MBRs are the cadence at which programs are held accountable to commitments made at planning time. The TPM's job is not to write a summary of what happened — it's to answer the question executives are actually asking: "Are we on track to hit what we said we'd hit, and if not, what are we doing about it?"

The failure mode in most QBRs: status theater. Slides full of green metrics that don't connect to whether the company will achieve its OKRs. A good QBR shows the honest delta between plan and actuals, explains why, and makes a clear case for what changes next quarter.

At NovaGrid, QBRs happen quarterly; MBRs happen monthly with Division Directors. Both follow the same structure — MBRs compress the timeframe.

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

Load `3-memory-knowledge/layer2-portfolio/fy2026-okrs.md` to ensure OKR alignment is accurate.

---

## Interaction Flow

**Step 1 — Intake**

1. Program name and review period (Q1/Q2/Q3/Q4 + year, or specific month)
2. Program phase at start and end of period
3. Key milestones planned vs. delivered this period
4. Key decisions made
5. What changed vs. the original plan
6. OKRs this program contributes to
7. Ask for next period (resources, decisions, scope changes)

**Step 2 — Generate QBR / MBR**

---

## Output Format

```markdown
# [Program Name] — [Q1 2026 / March 2026] Business Review

**Date:** [Date]
**Presenter:** [TPM name]
**Program phase:** [Phase]
**Review type:** QBR / MBR

---

## Program health: [period]

**Overall:** 🔴 Behind / 🟡 At risk / 🟢 On track

| Dimension | Start of period | End of period | Change |
|-----------|----------------|--------------|--------|
| Schedule | 🟢/🟡/🔴 | 🟢/🟡/🔴 | ↑↓→ |
| Scope | | | |
| Resources | | | |
| Risk exposure | | | |

---

## OKR contribution

| OKR | Key Result | Target | Actual | Status |
|-----|-----------|--------|--------|--------|
| [O1: Enterprise readiness] | [KR1.1: SOC 2 Type II] | [70 controls by May] | [34 complete] | 🔴 Behind |

---

## What we planned vs. what we delivered

| Milestone | Planned date | Delivered | Notes |
|-----------|-------------|-----------|-------|
| ✅ [Milestone] | [Date] | [Date] | On time |
| 🟡 [Milestone] | [Date] | [Slipped to Date] | [Why it slipped] |
| 🔴 [Milestone] | [Date] | Not delivered | [Why, and what's blocking] |

**Completion rate:** [N of N] milestones delivered as planned ([%])

---

## What changed from the original plan

1. **[Change 1]** — [What changed, why, and impact on the program]
2. **[Change 2]** — [...]

*If nothing changed: state that explicitly. "No scope changes" is meaningful signal.*

---

## Key decisions made this period

| Decision | Made by | Date | Outcome |
|---------|---------|------|---------|
| [What was decided] | [Name + role] | [Date] | [Downstream commitment] |

---

## Top risks going into next period

| Risk | Likelihood | Impact | Mitigation | Owner |
|------|-----------|--------|-----------|-------|
| [Risk] | High/Med/Low | Critical/High/Med | [Mitigation] | [Name] |

---

## Ask for next period

> **[One clear ask — resource, decision, or scope change needed to stay on track]**

Context: [1–2 sentences explaining why this ask is needed and what happens if not addressed]

Options:
- **Option A:** [...]
- **Option B:** [...]

Recommendation: Option [A/B] — [one sentence rationale]

---

## Next period outlook

| Milestone | Target date | Confidence | Dependency |
|-----------|-----------|-----------|-----------|
| [Milestone] | [Date] | High / Med / Low | [Any blocking dep] |
```

---

## Key Concepts

- **Plan vs. actuals is the core:** The point of a QBR is to compare what you committed to with what happened. Every QBR must show both.
- **OKR connection is mandatory:** Programs exist to advance OKRs. If the QBR doesn't show OKR progress, it's a status update, not a business review.
- **The ask is the output:** Every QBR must end with a clear ask for the next period — resource, decision, or scope change. "No ask" means the exec doesn't need to be in the room.
- **Honest about slippage:** If milestones slipped, say so with the reason. Executives can handle bad news; they can't tolerate surprises.
- **MBR vs QBR:** MBRs compress to 4 weeks instead of 13 weeks. Same structure, shorter retrospective window.

---

## Anti-Patterns

- **Green theater** — every metric green even when the program is behind; executives stop trusting QBRs
- **No ask** — "just keeping you informed" is not a business review; if there's no ask, send an email
- **Comparing to last month, not to plan** — showing improvement from last month doesn't answer whether you'll hit the year-end target
- **Skipping the OKR mapping** — programs divorced from OKRs can't be prioritized against competing programs
- **Burying the ask in slide 12** — the ask is the most important output; it goes last in narrative but must be clearly surfaced

---

## Composes With

- `/tpm-program-health` — health scorecard is the foundation of the QBR health section
- `/tpm-stakeholder-update` — exec brief variant is a compressed QBR for non-QBR cadences
- `/tpm-steerco-prep` — SteerCo prep and QBR prep overlap; QBR is a deeper version
- `/tpm-decision-record` — decisions made during the period feed the QBR decisions section
- `/tpm-risk-identifier` — risk register feeds the QBR risks section

---

## Design Principles Applied
- Delivery First: QBR is structured around milestones delivered vs. planned
- Risk Visibility: Risks section includes only items that affect next period — not a full risk register
- Context Aware: OKR mapping pulled from domain-context.md FY2026 OKRs
