# DR-013 — PULSE FlowEngine: Continue Without Descope After the Sprint 17 Velocity Checkpoint

| Field | Value |
|-------|-------|
| **DR ID** | DR-013 |
| **Date** | July 10, 2026 |
| **Decision maker** | Amara Osei (SVP Data & Analytics) |
| **Proposed by** | Yuna Park (TPM PULSE) |
| **Informed** | Karl Bergstrom (CTO), Marcus Bauer (CFO), Sven Olsson (Pipeline Orchestration Lead) |
| **Programs affected** | PULSE |
| **Status** | Complete — M4 closed August 7, 2026 |

---

## Context

DR-009 (June 15) reallocated two Stream Processing engineers to FlowEngine and pulled the M4 target from August 12 to **July 25**. It set an explicit condition: **if Sprint 17 velocity does not reach ≥20 pipelines/sprint, the July 25 target is at risk and Amara must be escalated within 48 hours.**

Sprint 17 ran June 29 – July 10. The week-1 signal was alarming — **9 items completed in the first week** against a run rate that needed roughly 10 per week. That number went onto the July 6 escalation list as the quarter's most consequential open datapoint.

The contingency options prepared ahead of the checkpoint were: descope the FlowEngine estate (defer ~40 low-usage pipelines to a Q4 batch), or extend M4 to mid-August and accept the additional dual-run cost.

---

## Decision

**Sprint 17 closed July 10 at 22 items** — above the ≥20 threshold DR-009 specified.

Decision: **continue without descoping.** July 25 held as the working target. Neither contingency triggered.

FlowEngine progressed 200 → 252 pipelines (59% → 74%) across the sprint.

---

## Rationale

The week-1 figure of 9 items was a **ramp artifact, not a trend**. The two reallocated engineers had been on FlowEngine for two weeks at that point, and the first week of a sprint carries setup and context-loading that the second does not. Yuna's read — that week-2 velocity would roughly double — proved correct.

Descoping 40 pipelines would have hit the July 25 date but left an unmigrated tail that blocks M6 (Airflow decommission) and therefore continues the $380K/month dual-run cost indefinitely. **Descoping the migration would not have descoped the cost.**

Amara's position: "We are not optimising for a milestone date. We are optimising for the month Airflow goes off. Deferring pipelines moves the first and not the second."

---

## Outcome

| Checkpoint | Date | FlowEngine | Note |
|-----------|------|-----------|------|
| Sprint 17 close | Jul 10 | 252/340 (74%) | 22 items — DR-013 taken |
| Sprint 18 close | Jul 24 | 289/340 (85%) | On trajectory |
| M4 target | Jul 25 | 313/340 (92%) | **Missed** |
| **M4 close** | **Aug 7** | **340/340 (100%)** | **13 days late** |

The decision to continue was correct. The July 25 date still slipped — but for an unrelated reason.

**The slip cause was not velocity.** The final 27 pipelines shared execution state through Airflow XCom side-channels that the migration runbook never captured (INC-2026-0126). Cutting over a subset left the remainder waiting on state that would only ever be written on the Temporal side. The team rolled back, traced dependencies by hand over a week, and migrated all 27 atomically on August 7.

No velocity decision available on July 10 would have prevented that. The runbook (M2) had been validated against DataCore, whose pipelines are far less entangled than FlowEngine's — the blind spot was designed in months earlier.

---

## Cost

- Projected at M4 close (DR-009): **$1.2M**
- Actual at M4 close (Aug 7): **$1.38M** — $180K over, entirely attributable to the 13-day slip
- Still accruing at $380K/month until M6 (Airflow decommission, Sep 30)

DR-009 set $1.2M as an agreed cost ceiling requiring separate CFO authorization for overrun. **That ceiling was breached by $180K.** Marcus Bauer notified Aug 7; reconciliation goes to the Q3 CFO QBR.

---

## Related

- DR-009 — PULSE FlowEngine reallocation (Jun 15); this decision is the checkpoint DR-009 mandated
- PULSE M4 — closed Aug 7, 2026 (13 days late vs revised, 5 days early vs original Aug 12)
- PULSE M6 — Airflow decommission, Sep 30, now the critical path (PULSE R-009)
- INC-2026-0126 — SEV2, Jul 25, cross-pipeline state dependencies; the actual slip cause
- CHG-005 / Redmount Capital investor letter — dual-run cost is investor-visible
