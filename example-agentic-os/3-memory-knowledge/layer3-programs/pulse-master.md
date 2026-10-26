# PULSE — Program Master Document

> *Fictional example: NovaGrid, Inc. is an invented company. All people, customers, numbers and events in this file are made up for the book.*

*Data Pipeline Overhaul — Airflow → Temporal Migration*
*Layer 3 context · Load for PULSE work · Update cadence: weekly*

---

## Header

| Field | Value |
|-------|-------|
| **Program code** | PULSE |
| **TPM** | Yuna Park |
| **Executive Sponsor** | Amara Osei (Dir. FlowEngine) |
| **Phase** | Execution |
| **Priority** | P1 |
| **Overall status** | 🟡 At risk |
| **Last updated** | August 10, 2026 |

*Upgraded 🔴 → 🟡 on August 7 when M4 closed. First time off red since Q1. Not green: M6 Airflow decommission is now the critical path, has never been rehearsed, and costs $380K/month until it lands.*

---

## Objective

Migrate all 677 production data pipelines from Apache Airflow to Temporal. Reduce pipeline failure rate from 4.1% to under 1%. Achieve 99.9% pipeline SLA for enterprise tier.

## Why now

FlowEngine pipeline failures were up 23% QoQ at program start. Enterprise customers were receiving SLA credits averaging $180K/quarter. Airflow had reached its operational ceiling at NovaGrid's scale.

---

## Migration status (as of August 10, 2026)

| Category | Total | Migrated | % done | Change since Jun 28 |
|----------|-------|---------|--------|---------------------|
| DataCore ingestion pipelines | 180 | **180** | **100%** ✅ | — (M3 closed May 1) |
| FlowEngine transformation jobs | 340 | **340** | **100%** ✅ | **+140 pipelines — M4 closed Aug 7** |
| NovaAI training pipelines | 95 | **95** | **100%** ✅ | — (M5 closed Jun 10) |
| Internal platform jobs | 62 | **62** | **100%** ✅ | — |
| **Total** | **677** | **677** | **100%** ✅ | **+140 pipelines (+21%)** |

**All 677 production pipelines are on Temporal.** Airflow is still running — that is M6, not M4.

---

## Milestone plan

| Milestone | Description | Target | Status | Owner |
|-----------|-------------|--------|--------|-------|
| M1 | Temporal cluster deployed to prod | Jan 2026 | ✅ Done | Yuna P. |
| M2 | Migration runbook + tooling complete | Feb 2026 | ✅ Done | Yuna P. |
| M3 | DataCore pipelines 100% migrated | May 1 2026 | ✅ Done (May 1) | Ethan P. |
| M4 | FlowEngine pipelines 100% migrated | ~~Aug 12~~ Jul 25 2026 (DR-009) | ✅ Done (Aug 7 — **13 days late** vs revised, 5 days early vs original) | Amara O. |
| M5 | NovaAI training pipelines migrated | ~~Jun 1~~ Jun 10 2026 | ✅ Done (Jun 10 — 95/95) | Leo N. |
| M6 | Airflow decommission | **Sep 30 2026** | 🟡 At risk (12%) | Yuna P. |
| M7 | Pipeline failure rate <1% | Sep 2026 | 🟡 At risk (40% — currently 1.4%) | Amara O. |

**M4 closed Aug 7.** Trajectory: 200 (Jun 28) → 224 (Jul 5) → 252 (Jul 10) → 289 (Jul 24) → 313 (Jul 25) → 340 (Aug 7). The DR-009 reallocation worked — Sprint 17 closed at 22 items against the ~20 needed, and DR-013 chose to continue without descoping on that evidence.

**The 13-day slip has one cause.** The final 27 pipelines shared execution state through Airflow XCom side-channels the migration runbook never captured (INC-2026-0126). Cutting over a subset left the rest waiting on state that would only ever be written on the Temporal side. Cutover was rolled back, dependencies traced by hand over a week, and all 27 migrated as one atomic batch on Aug 7.

**M6 is now the whole program and has never been rehearsed.** Started Aug 10 — nothing could begin until M4 closed. Seven weeks to Sep 30. Sequence: traffic verification (Aug), read-only mode (early Sep), shutdown (Sep 30).

---

## Risk register

| ID | Risk | Likelihood | Impact | Owner | Status |
|----|------|-----------|--------|-------|--------|
| R-001 | FlowEngine SDK-first decision blocking M4 | — | — | Amara O. | 🟢 Resolved. DR-009 (Jun 15) reallocated 2 Stream Processing engineers; DR-013 (Jul 10) confirmed the reallocation was working and declined to descope. M4 closed Aug 7. |
| R-002 | Schema drift | — | — | — | 🟢 Resolved Mar 21. |
| R-003 | NovaAI runbook blocker | — | — | — | 🟢 Resolved Apr 25. |
| R-004 | Dual-run infrastructure cost | Confirmed | High | Marcus Bauer | 🟡 **$1.38M accrued at M4 close** against a $1.2M projection — $180K over, driven entirely by the 13-day slip. Cost continues at $380K/month until Airflow is actually off. Every week M6 slips is another $95K. Q3 CFO QBR carries the final reconciliation. |
| R-005 | SHIELD 6 controls dependent on PULSE Temporal audit trail | Low | Medium | Fatima A. | 🟡 Closing. FlowEngine estate is now on Temporal, so the audit trail is real. The 2 controls documented as "in remediation" for the auditor should be re-evidenced before SHIELD's Sep 1 observation window opens. Yuna owes Fatima confirmation. |
| R-006 | M5 NovaAI pipelines | — | — | Leo N. | 🟢 Resolved Jun 10. |
| R-007 | Investor visibility — Redmount Capital letter (Jun 19) | Confirmed | High | Amara O. / Marcus Bauer | 🟡 Active but improving. Redmount (4.2% stake) cited PULSE dual-run cost and the 18-month Airflow/Temporal overlap. M4 closing Aug 7 ends the migration narrative; the overlap only ends at M6. The honest Q3 QBR line is that migration finished 5 days ahead of the original Aug 12 date and $180K over the revised budget. |
| R-008 | Sprint 17 velocity — test of DR-009 | — | — | Yuna P. | 🟢 Resolved Jul 10. 22 items vs ~20 needed. |
| **R-009** | **M6 Airflow decommission has never been rehearsed and is now the critical path** | **Medium** | **High** | **Yuna P.** | 🔴 **Active. Seven weeks for a shutdown sequence the team has not practised on this estate, on infrastructure that 677 pipelines depended on until three days ago. INC-2026-0126 is the warning: the runbook did not know what the pipelines actually depended on. A decommission plan built on the same assumptions carries the same blind spot. Traffic verification through August is the mitigation — do not compress it to buy schedule.** |
| **R-010** | **M7 failure rate target may be measuring the wrong period** | **Low** | **Medium** | **Amara O.** | 🟡 **Watch. Failure rate is 1.4%, down from 2.9% in June, against a <1% target for Sep. Most of the improvement came from leaving the mixed Airflow/Temporal environment. The clean read only exists after Airflow is off, which is M6 — so M7 cannot be honestly assessed before late September. Do not claim M7 on August data.** |

---

## Dual-run cost tracker

| Date | Accrued since baseline | Monthly rate | Note |
|------|------------------------|--------------|------|
| Apr 24 (baseline) | $475K | $380K/month | Original projection ~$1.04M to Aug 12 |
| May 26 | ~$890K | $380K/month | CFO QBR May 27 |
| Jun 28 | ~$1.2M projected | $380K/month | Jul 25 revised target (DR-009) |
| **Aug 7 (M4 close)** | **$1.38M actual** | **$380K/month** | **$180K over projection — the 13-day slip** |
| **Aug 10 (today)** | **$1.42M** | **$380K/month** | **Still accruing. Stops at M6, not M4.** |

*The distinction that matters for the CFO conversation: migrating the pipelines did not stop the cost. Turning Airflow off does. M6 is a cost milestone as much as a technical one.*

---

## Inbound dependencies

| Needs from | What | When | Risk |
|-----------|------|------|------|
| NEXUS | OpenTelemetry migration (Temporal monitoring needs OTel) | ✅ Delivered May 2 | Resolved |

## Outbound dependencies

| Program | What PULSE provides | When needed |
|---------|-------------------|-------------|
| ATLAS | NovaAI training pipeline reliability | ✅ Delivered Jun 10 (M5) |
| SPARK | NovaAI v2 training infra on Temporal before prod | ✅ Available — M5 complete |
| SHIELD | Pipeline audit trail (6 controls) | Before Sep 1 observation window — re-evidence the 2 remediation-flagged controls |

---

## Stakeholders

| Name | Role | Engagement |
|------|------|-----------|
| Amara Osei | Dir. FlowEngine — Executive Sponsor | Weekly |
| Ethan Park | Dir. DataCore | Weekly |
| Ben Nakashima | Group PM FlowEngine | Weekly |
| Marcus Bauer | CFO — infrastructure cost OKR | Quarterly |
| Sven Olsson | Pipeline Orchestration Lead | Daily |

---

## Latest update (August 10, 2026)

M4 closed August 7. All 340 FlowEngine pipelines — and all 677 across the estate — are on Temporal. PULSE came off red for the first time since Q1.

It closed 13 days late against the July 25 target and 5 days early against the original August 12 one, which is an awkward pair of facts that should both be said out loud. DR-009 pulled the date forward by 18 days in June; the team recovered 13 of those. The reallocation was the right call and it worked.

The slip has a specific cause worth carrying into the retro. The last 27 pipelines shared state through Airflow XCom side-channels that the migration runbook never captured. The runbook (M2) was validated against DataCore, whose pipelines are far less entangled than FlowEngine's — so the tool that was supposed to de-risk the migration had a blind spot precisely where the migration was hardest. The team rolled back rather than forcing it through, traced dependencies by hand for a week, and cut over atomically. That was the right decision and it is why MTTR for SEV2 looks worse this quarter.

Dual-run cost landed at $1.38M against a $1.2M projection. It is still accruing at $380K/month, because **migrating the pipelines did not stop the cost — turning Airflow off does.** That distinction needs to be explicit in the Q3 CFO QBR, and it is the reason M6 is now a cost milestone rather than a tidy-up.

**M6 is the program now, and R-009 is the risk.** Seven weeks to decommission infrastructure that 677 pipelines depended on until three days ago, using a plan the team has not rehearsed, on an estate that has already demonstrated it contains dependencies nobody documented. Traffic verification runs through August. Do not compress it to buy schedule — the Jul 25 lesson is available for free.
