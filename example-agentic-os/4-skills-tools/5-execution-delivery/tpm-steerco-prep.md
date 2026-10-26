---
name: tpm-steerco-prep
description: "Use when you need to prepare a steering committee presentation — status narrative, key decisions needed, risk summary, and path forward."
---
# /tpm-steerco-prep — SteerCo Prep

**Lifecycle Stage:** Execution & Delivery
**Job-to-be-Done:** Prepare a steering committee presentation — status narrative, key decisions needed, risk summary, and path forward

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

Use executive stakeholder preferences and program standards from `domain-context.md`.

---

## Interaction Flow

**Step 1 — Intake**

1. Program name and sponsor
2. Current program status (RAG: Red/Amber/Green) and brief reason
3. Progress since last SteerCo
4. Decisions needed from this SteerCo
5. Key risks and mitigations
6. Upcoming milestones
7. Any sensitive topics that need careful framing

**Step 2 — Generate**

---

## Output Format

```markdown
# SteerCo Prep: [Program Name]

**Date:** [Date]
**Attendees:** [Sponsor, key stakeholders]
**Facilitated by:** [TPM name]
**Overall Status:** 🔴 Red / 🟡 Amber / 🟢 Green

---

## Opening (2 min)

**Status headline:**
> "[Program Name] is [🔴🟡🟢] — [one sentence reason]. We need your input on [X] today."

---

## Progress Since Last SteerCo (5 min)

| Commitment | Status | Notes |
|-----------|--------|-------|
| [What we said we'd do] | ✅ Done / 🔄 In progress / ❌ Missed | |

**Wins to highlight:**
- [Accomplishment 1]

**What slipped and why:**
- [Item] — [Root cause] — [Recovery plan]

---

## Decisions Needed (10 min)

| # | Decision | Context | Options | Recommendation | Deadline |
|---|---------|--------|--------|---------------|---------|
| 1 | | | | | By end of meeting |

---

## Key Risks (5 min)

| Risk | Status | Impact | Mitigation | Owner |
|------|--------|--------|------------|-------|
| | 🔴🟡🟢 | | | |

**Risk requiring SteerCo attention:**
[If there's a risk that needs executive action, call it out explicitly with a specific ask]

---

## Upcoming Milestones (3 min)

| Milestone | Target Date | Confidence | Owner |
|-----------|------------|-----------|-------|
| | | 🔴🟡🟢 | |

---

## Ask / Close (5 min)

**Specific asks from this SteerCo:**
1. [Decision or approval needed]
2. [Escalation support needed]
3. [Resource / priority commitment needed]

**Next SteerCo:** [Date] — [What we'll report on]
```

---

## Design Principles Applied
- Delivery First: SteerCo focused on decisions and escalations, not status reporting
- Risk Visibility: Risks called out with explicit asks for executive action
- Context Aware: Stakeholder preferences from domain-context.md shape tone
