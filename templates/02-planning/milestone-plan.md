# Template: Milestone Plan

Referenced by: `/tpm-master-document`, `/tpm-timeline-stress-tester`

> A milestone is a meaningful checkpoint — a deliverable, decision, or gate — not a task completion. "API complete" is a milestone. "James reviews API" is not.
> Every milestone needs an owner (accountable), a date, a clear exit criterion, and the dependencies that must be true for the milestone to be met.

---

```markdown
# Milestone Plan — [Program Name]

**TPM:** [Name]
**Program phase:** [Planning / Execution / Launch]
**Last updated:** YYYY-MM-DD
**Target end date:** YYYY-MM-DD

---

## Milestone Summary

| Total | On track (🟢) | At risk (🟡) | Behind (🔴) | Complete (✅) |
|-------|--------------|-------------|------------|--------------|
| | | | | |

**Overall schedule confidence:** High / Medium / Low

---

## Milestones

| ID | Milestone | Owner | Target date | Exit criterion | Dependencies | Status |
|----|-----------|-------|------------|----------------|-------------|--------|
| M1 | | | YYYY-MM-DD | [What must be true for this to be "done"] | [M-IDs or external deps] | 🟢/🟡/🔴/✅ |

---

## Milestone Detail

### M1 — [Milestone Name]

**Owner:** [Name — accountable for hitting this milestone]
**Target date:** YYYY-MM-DD
**Buffer:** [X] days built in / None
**Status:** 🟢 On track / 🟡 At risk / 🔴 Behind / ✅ Complete

**Exit criterion:**
> [Specific, testable condition that marks this milestone done. Avoid vague criteria like "feature ready" — use "API contract signed off by consuming team" or "all 30 test cases passing in staging".]

**What this milestone unlocks:**
- [Next milestone or downstream dependency that depends on this]

**Dependencies required:**
| Dependency | Source | Required by | Status |
|-----------|--------|------------|--------|
| [What's needed] | [Team or system] | [Date] | 🟢/🟡/🔴 |

**Risks to this milestone:**
| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|-----------|
| | H/M/L | H/M/L | |

---

## Critical Path

> List milestones in sequence where delay in one directly delays the next.

M[N] → M[N+1] → M[N+2] → **Program end**

**Float available:** [X] days before end date is affected

---

## Milestone History

| ID | Milestone | Original date | Revised to | Reason | Delta |
|----|-----------|--------------|-----------|--------|-------|
| | | | | | +[N] days |
```

---

## Filled Example (NovaGrid — SHIELD)

```markdown
# Milestone Plan — SHIELD (SOC 2 Type II)

**TPM:** Fatima Al-Hassan
**Program phase:** Execution
**Last updated:** 2026-03-11
**Target end date:** 2026-08-15 (Deloitte audit — hard deadline, $180K contract signed)

## Milestone Summary

| Total | On track (🟢) | At risk (🟡) | Behind (🔴) | Complete (✅) |
|-------|--------------|-------------|------------|--------------|
| 6 | 1 | 2 | 2 | 1 |

**Overall schedule confidence:** Low — 33 controls not started, 2 inbound dependencies on NEXUS and MERIDIAN

## Milestones

| ID | Milestone | Owner | Target date | Status |
|----|-----------|-------|------------|--------|
| M1 | Controls framework baseline complete | Fatima Al-Hassan | 2026-01-31 | ✅ Complete |
| M2 | 50 controls implementation complete | Yuki Tanaka | 2026-04-30 | 🔴 Behind |
| M3 | NEXUS IAM unification (14 controls unblocked) | Sara Lindqvist | 2026-07-01 | 🟡 At risk |
| M4 | MERIDIAN audit logging (8 controls unblocked) | Fatima Al-Hassan | 2026-04-15 | 🟡 At risk |
| M5 | All 100 controls implementation complete | Fatima Al-Hassan | 2026-07-15 | 🔴 Behind |
| M6 | Pre-audit readiness review with Deloitte | James Whitfield | 2026-08-01 | — |
| M7 | Deloitte SOC 2 Type II audit | James Whitfield | 2026-08-15 | — |

## Critical Path

M2 (controls) → M3 (NEXUS IAM) → M5 (all complete) → M6 (pre-audit) → **M7 (Deloitte)**

**Float available:** 0 days — M7 is contractually fixed. Any slip to M5 cascades directly to audit failure.

## Milestone History

| ID | Milestone | Original date | Revised to | Reason | Delta |
|----|-----------|--------------|-----------|--------|-------|
| M2 | 50 controls complete | 2026-03-31 | 2026-04-30 | Model Serving team unresponsive — 6 controls with no owner | +30 days |
| M5 | All controls complete | 2026-06-30 | 2026-07-15 | M2 slip + NEXUS IAM delay | +15 days |
```
