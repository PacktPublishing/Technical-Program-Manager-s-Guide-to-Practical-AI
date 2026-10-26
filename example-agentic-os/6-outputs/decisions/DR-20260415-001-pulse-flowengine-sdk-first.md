# Decision Record: PULSE FlowEngine — SDK Launch Takes Priority Over Migration Through Q2

**ID:** DR-20260415-001
**Date:** April 15, 2026
**Status:** Accepted
**Decision Maker(s):** Amara Osei (Dir. FlowEngine, VP Product)
**Program:** PULSE
**Facilitated by:** Yuna Park (TPM), Karl Bergstrom (Head TPM)

---

## Context

The Stream Processing team (7 engineers) has been split since March 7 between the FlowEngine Airflow-to-Temporal migration (PULSE M4, July 1 target) and the FlowEngine streaming SDK launch — a competing VP Product priority. At 50/50 allocation, FlowEngine migration velocity was insufficient to hit M4: only 30 pipelines migrated in 5 weeks against an 8-10% weekly target. Yuna Park escalated in writing on March 7. Amara Osei's decision had been in limbo for 38 days. Without a decision by April 15, PULSE M4 would slip regardless — the team could not hold July at minimal velocity.

---

## Decision Drivers

- Stream Processing team cannot execute two parallel tracks at target velocity simultaneously
- SDK launch has a fixed external commitment (customer-facing launch date)
- FlowEngine migration dual-run cost at $380K/month — every week of delay adds cost
- SHIELD depends on 6 Temporal-dependent controls completing before August audit — PULSE M6 (Airflow decommission) is a prerequisite
- Karl Bergstrom required Amara to make the call before April 17 SteerCo

---

## Options Considered

### Option A: Prioritize FlowEngine migration (migration first)
**Description:** Stream Processing team moves to 80% migration / 20% SDK. FlowEngine migration accelerates to target velocity. M4 holds July 1.
**Pros:** Dual-run cost terminates sooner. SHIELD 6 Temporal controls at lower risk. M4 timeline commitments held.
**Cons:** SDK launch delayed — external customer commitment at risk. Amara's product priority deprioritized.

### Option B: Prioritize SDK launch (SDK first)
**Description:** Stream Processing team moves to 80% SDK / 20% migration through Q2. SDK launches on schedule. FlowEngine migration at minimal velocity.
**Pros:** SDK external commitment honored. Customer-facing product launch on schedule.
**Cons:** PULSE M4 slips July 1 → August 12. Dual-run cost accrues 6 additional weeks (~$570K additional). PULSE M6 (Airflow decommission) slips August 1 → September 30. SHIELD 6 Temporal-dependent controls at risk for August audit window.

### Option C: Hire or contract additional engineers
**Description:** Add 2-3 contract engineers to cover FlowEngine migration while SDK retains Stream Processing team.
**Pros:** Both tracks proceed without sacrifice.
**Cons:** 6-8 week ramp time — no impact on M4 July timing. Cost: $180-270K for contract engineers. Not actionable in the window.

---

## Decision

**We will:** Prioritize the SDK launch (Option B). Stream Processing team reallocated to 80% SDK / 20% FlowEngine migration through Q2.

**Rationale:**
The SDK launch has a customer-facing commitment that cannot be slipped without direct revenue impact. The FlowEngine migration, while important, has cost and schedule consequences that are quantifiable and manageable. Amara accepted the M4 slip and the associated dual-run cost as the trade-off for delivering the SDK on time.

---

## Consequences

**Positive:**
- SDK launch proceeds on schedule — external customer commitments honored
- Decision ambiguity resolved — PULSE team can plan against Aug 12 with confidence rather than an undefined slip

**Negative / Trade-offs:**
- PULSE M4 slips July 1 → August 12 (6 weeks)
- PULSE M6 (Airflow decommission) slips August 1 → September 30
- Dual-run cost extends: $380K/month × 6 additional weeks = ~$570K additional exposure. Total dual-run cost by August 12: approximately $1.04M since baseline.
- SHIELD 6 Temporal-dependent controls at risk — Airflow decommission now September 30, after August Deloitte audit window

**Risks:**
- SHIELD Temporal controls gap — Mitigation: Fatima Al-Hassan to confirm with Deloitte whether compensating controls exist for the 6 PULSE-dependent controls
- Dual-run cost must be flagged to Marcus Bauer (CFO) in next QBR — total exposure ~$1.04M exceeds original program budget assumption

---

## Communication Plan

| Stakeholder | How to Communicate | By When |
|------------|-------------------|---------|
| Karl Bergstrom | SteerCo escalation brief — Yuna Park presents Apr 17 | Apr 17 (done) |
| Marcus Bauer (CFO) | QBR agenda item — dual-run cost overrun ~$1.04M | Next QBR |
| Fatima Al-Hassan | Direct flag — 6 SHIELD Temporal controls at risk, confirm compensating controls | Apr 22 |
| Leo Nakamura | Inform — SPARK training pipeline Temporal prereq may slip | Apr 22 |
| PULSE program team | Sprint 12 planning — stream processing allocation updated | Apr 20 (sprint kickoff) |

---

## Review Date

**Review this decision on:** June 1, 2026 — if SDK launch is complete before Q2 end and FlowEngine migration velocity remains below target, reconsider Stream Processing reallocation before M4 August 12 becomes infeasible.

**Reversibility:** Partially reversible — SDK launch is a customer-facing commitment and cannot be undone. Migration reallocation can be revised after SDK launch completes.
