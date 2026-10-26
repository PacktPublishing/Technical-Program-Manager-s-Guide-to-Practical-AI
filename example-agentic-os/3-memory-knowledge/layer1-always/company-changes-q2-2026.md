# NovaGrid — Company-Level Changes Q2 2026

> *Fictional example: NovaGrid, Inc. is an invented company. All people, customers, numbers and events in this file are made up for the book.*

*Layer 1 context · Load for portfolio-level and prioritization work*
*Update cadence: on significant company-level events*

---

> **Purpose:** Captures company-level decisions, external events, and strategic shifts that affect program priorities, resource availability, or risk tolerance — but that don't appear in any single program master doc. These are the "above the programs" changes that every TPM needs to know.

---

## Change Log (March 1 – August 10, 2026)

*File name retains the `q2-2026` suffix for path stability; coverage now extends into Q3. Entries CHG-006 and CHG-007 fall outside Q2.*

---

### CHG-001 — EU Data Residency Escalated to Board Mandate
**Date:** March 17, 2026
**Decision maker:** Board of Directors (at Q1 board meeting)
**Informed:** Priya Anand (CEO), Yuki Tanaka (VP Eng), Karl Bergstrom (Head TPM)

**What changed:**
EU data residency was previously classified as a "September 2026 design phase" item in the FY2026 plan — meaning it was acknowledged but not resourced or scheduled. At the Q1 board meeting, two enterprise EMEA prospects explicitly raised data residency as a contract blocker (including Thornbridge Capital and a non-disclosed EMEA financial institution). The board voted to advance EU + APAC data residency to a *deliverable with a Q1 2027 target*, not just a design discussion.

**Immediate impact:**
- Yuki Tanaka now owns a quarterly board update on data residency progress
- Core Infrastructure team must dedicate 10% bandwidth to data residency architecture spike (competing directly with NEXUS M5 CI/CD and SHIELD M4 IAM work)
- No formal program created yet — likely becomes a new P1 program in Q3 planning
- GDPR data processing addendum (DPA) added to all new enterprise contracts starting April 1 — legal drafted, RevOps sending with all new deals

**Program ripple effects:**
| Program | Impact |
|---------|--------|
| NEXUS | CI/CD M5 ceiling is 94% at June 28 — Core Infra team split between CI/CD finish, SHIELD IAM prep, and data residency spike |
| SHIELD | IAM controls (Wave 4) will need to account for data residency requirements in evidence design |
| ATLAS | Corinthia Bank (new EMEA customer) has already raised data residency — AE must caveat Q1 2027 timeline |
| HORIZON | Future international mobile GA will require data residency design |

**TPM action:** When scoping new programs or cross-team dependencies after Q2, assume Core Infrastructure is at 90% capacity until data residency program is formally staffed.

---

### CHG-002 — CFO Cost Efficiency Directive
**Date:** April 14, 2026
**Decision maker:** Marcus Bauer (CFO) — approved by Priya Anand
**Informed:** All division directors, Karl Bergstrom, Yuki Tanaka

**What changed:**
Marcus Bauer issued a cost efficiency directive in response to two activist investors (Redmount Capital and Meridian Growth Partners) questioning engineering cost as a percentage of revenue (currently 31.2%, target was 28% by end of FY2026). The directive accelerates the timeline:

- **Target:** Engineering cost ratio to 28% by Q4 FY2026 (previously "end of year" — now hard deadline)
- **Lever 1: PULSE dual-run cost formally tracked monthly.** CFO now receives a monthly dual-run cost report from Yuna Park. $380K/month is no longer just a TPM escalation — it's on the CFO dashboard. Any slip in M4 FlowEngine close extends the cost exposure clock.
- **Lever 2: NEXUS service reduction target extended.** CFO wants NovaGrid below 175 services (not 200) by Dec 31, 2026 to realize additional infra cost savings. NEXUS M7 ("total service count <200") target effectively tightened to <175.
- **Lever 3: No new team headcount without CFO co-sign.** All headcount additions above the pre-approved list now require CFO co-sign alongside VP Eng. This is new. Previously only headcount above 5 FTE required CFO sign-off.

**Program ripple effects:**
| Program | Impact |
|---------|--------|
| PULSE | FlowEngine dual-run cost ($1.2M projected at Jul 25) is now a board-visible number. Amara Osei's Q3 QBR will include final reconciliation. Reallocation decision (DR-009) was directly accelerated by this directive. |
| NEXUS | M7 service count target tightened: <200 → <175 by Dec 31. Sara Lindqvist aware — will need updated M7 plan in Q3 planning. |
| SPARK | New engineer requests for SPARK M3 (visual workflow builder, Sep 30) require CFO co-sign. Hiring freeze (CHG-004) makes this moot until Aug 15 anyway. |
| ATLAS | New hire (Model Serving, Jun 16) was pre-approved before Apr 14 directive — grandfathered. |

**TPM action:** Any resource request for Q3 or beyond must include a cost impact statement for the CFO sign-off process. Use `/tpm-roi-checker` before escalating headcount requests to SteerCo.

---

### CHG-003 — Priya Anand's Public NovaAI ARR Commitment
**Date:** May 27, 2026 (Data Summit 2026, San Francisco)
**Decision maker:** Priya Anand (CEO) — not pre-planned; emerged from Q&A
**Informed:** Rachel Lim (CPO) the following morning. Marcus Chen (TPM ATLAS) briefed May 28.

**What changed:**
At Data Summit 2026, a Morgan Stanley analyst directly asked Priya: "Can you give investors a specific target for NovaAI's revenue contribution by end of fiscal year?" Priya responded: "We expect NovaAI to reach 20% of ARR by Q4 — that's our stated target and I'm confident we'll hit it."

This is not a new target — it was in the FY2026 OKRs. But it is now a **public statement** from the CEO at a high-profile industry conference. It changes the risk profile:

- The ATLAS GA launch (June 30) is no longer purely an internal milestone — it is the public-facing proof point for the CEO's commitment
- Rachel Lim held an emergency call with Marcus Chen and Leo Nakamura on May 28. Key message: "The June 30 date is externally committed. If we need to soft-launch with 2 customers instead of 5, we do that — but we do not delay the announcement."
- Analyst community will watch Q3 earnings for NovaAI ARR progress. Industry analyst briefings on June 30 will be covered.

**Program ripple effects:**
| Program | Impact |
|---------|--------|
| ATLAS | GA soft launch June 30 is externally anchored. Rachel Lim accepted 2-3 customers (not 5) to preserve the date. Marcus Chen confirmed June 30 was never seriously at risk — the risk is the uptime gap (DR-006) and whether "97.8% uptime" in the press release undermines the SLA narrative. |
| SPARK | NovaAI v2 GA (Dec 31) is downstream of this commitment. SPARK M2 (Aug 11) becomes more visible — any slip extends the 20% ARR timeline. |
| SHIELD | SOC 2 Aug 31 certification is the compliance credibility piece behind the NovaAI ARR narrative. Analyst briefings will ask about enterprise-grade compliance. |

**TPM action:** All ATLAS and SPARK communications should reference the 20% ARR target. Any milestone slip on ATLAS M7/M8 or SPARK M2 now has direct CEO public commitment exposure. Escalate immediately if at risk.

---

### CHG-004 — Engineering Hiring Freeze
**Date:** June 15, 2026
**Decision maker:** Yuki Tanaka (VP Engineering), co-signed Marcus Bauer (CFO)
**Informed:** All division directors, Karl Bergstrom, all TPMs

**What changed:**
Yuki Tanaka implemented a **60-day engineering hiring freeze** effective June 15, 2026. Rationale: Q2 engineering cost came in at 30.8% of revenue (above the 28% target). A freeze through August 15 is projected to save ~$1.8M in unbudgeted headcount costs.

**Exceptions:**
- Pre-approved hires with accepted offers before June 15 are grandfathered. The Model Serving hire for ATLAS (DR-007, accepting offer June 10, start date June 16) was grandfathered. **This is the only exception.**
- Backfills for involuntary departures require VP Eng + CFO approval on a case-by-case basis.

**What is blocked:**
- SPARK M3 (visual workflow builder, Sep 30) was counting on 1 additional frontend engineer for the UI layer. That request (submitted Jun 12) is now blocked until Aug 15.
- MERIDIAN had a draft headcount request for a mid-market migration specialist. Blocked.
- HORIZON had a request for 1 additional mobile QA engineer for the beta phase. Blocked.

**Program ripple effects:**
| Program | Impact |
|---------|--------|
| SPARK | M3 (Sep 30) must be scoped to current team only. Daniel Rios to replanning session with Leo Nakamura by Jul 15. Sep 30 may slip to Oct 15 without the additional engineer. |
| MERIDIAN | Mid-market migration (M6, Aug 1 target) has no dedicated specialist. James Okonkwo must assess whether Compass Migration Partners can flex to mid-market after SMB reaches ~90% (~Jul 15). |
| HORIZON | Beta phase QA will rely on existing team + Kestrel/Solaris customer feedback loop. Priya Kaur to adjust beta test plan. |

**TPM action:** Remove all headcount assumptions from Q3 plans unless they are grandfathered hires. Use `/tpm-epic-breakdown` with "existing team only" constraint when replanning SPARK M3 and MERIDIAN M6.

---

### CHG-005 — Activist Investor Escalation on Engineering Costs
**Date:** June 2026 (letter received June 19, board response drafted June 26)
**Source:** Redmount Capital (activist investor, ~4.2% stake)
**Informed:** Priya Anand, Marcus Bauer (CFO), Board Audit Committee. Karl Bergstrom informed June 23.

**What changed:**
Redmount Capital sent a formal letter to the NovaGrid board requesting details on:
1. **PULSE dual-run cost** — specifically asked why Airflow and Temporal are running concurrently for 18+ months and what the total cost exposure is
2. **NEXUS service count reduction** — asked for a timeline on reaching below 200 services and what cost savings are projected
3. **Engineering headcount growth vs. ARR growth** — noted that engineering headcount grew 18% in FY2025 while ARR grew 12%

This is the first time program-level execution details have been directly raised by an investor. **The programs are no longer just internal — they are part of the investor relations narrative.**

**Board response (drafted June 26, scheduled for delivery July 1):**
- PULSE: "FlowEngine migration on track for July 25 (revised from August 12 via reallocation). Total dual-run cost: $1.2M at completion. This cost is reflected in FY2026 guidance."
- NEXUS: "Service count reduction from 340 to <175 by December 31. Current: ~280 services. M4 (60 services retired) closed May 31. On track."
- Hiring freeze (CHG-004) cited as evidence of cost discipline response.

**Program ripple effects:**
| Program | Impact |
|---------|--------|
| PULSE | Yuna Park must prepare a clean cost narrative for Q3 QBR. The $1.2M figure is now investor-visible. Any slip in M4 from July 25 extends the cost exposure clock and creates an investor narrative problem. |
| NEXUS | Service count reduction is now in investor letters. The <175 target (CHG-002) has investor visibility. Sara Lindqvist to prepare a service count trajectory chart for Q3 board materials. |
| All programs | TPMs should expect questions at Q3 QBR that reference investor metrics. Cost efficiency, headcount productivity, and dual-run cost are now executive-facing metrics, not just operational ones. |

**TPM action:** PULSE and NEXUS TPMs should maintain a clean investor-ready cost summary in their program master docs going forward. Escalate any scope or date change that would change the public narrative within 24 hours to Karl Bergstrom.

---

## CHG-006 — Board restates the SOC 2 mandate: Aug 31 is readiness, certification is Dec 15

**Date:** July 22, 2026
**Source:** Board of Directors, presented by James Whitfield (CISO) and Karl Bergstrom (CTO)
**Type:** Board mandate correction

Since September 2025 the board mandate read "SOC 2 Type II certification by August 2026." It was never achievable — the auditor's observation period does not open until Sep 1, and a Type II report attests to controls operating *over* a period. The contradiction sat in NovaGrid's own Vanta export the entire time, with `boardMandateDeadline: 2026-08-31` in the same object as `observationPeriodStart: 2026-09-01` and `reportExpected: 2026-12-15`.

It surfaced on Jul 16, when the auditor's engagement partner — while returning evidence findings on three controls — volunteered that the Aug 31 date in NovaGrid's board materials did not correspond to any deliverable in their engagement letter.

The board accepted the restatement on Jul 22 (DR-014): **Aug 31 = audit-readiness · Sep 1–Nov 30 = observation · Dec 15 = Type II report.**

**Program ripple effects:**
| Program | Impact |
|---------|--------|
| SHIELD | M6 renamed to "audit readiness"; M7 created for the Dec 15 report; program end date Aug 31 → Dec 15. The dominant risk changed from control *completion* to control *drift* during observation. |
| ATLAS | $9.4M of expansion revenue across Apex Health, Finex Capital and Corinthia Bank re-baselined from Aug 31 to Dec 15. |
| All programs | Roughly $6.3M of pipeline moved Q3 → Q4. Nuvera Insurance ($2.1M) missed its CDO's board window and dropped to 72%. Meridian Financial ($4.2M) *rose* to 78% — Yvonne Tran's legal team had assumed a report, and preferred the clarity. |

**TPM action:** Any date carried in a board mandate must be reconciled against the vendor contract or plan that actually produces it. FY2026 OKR **KR1.4** (EU/APAC data residency, Sep 2026) currently carries the same defect — the programme plan says Q1 2027. Restate it deliberately rather than waiting for it to be discovered.

---

## CHG-007 — Engineering hiring freeze lifts August 15

**Date:** August 15, 2026 (scheduled)
**Source:** CHG-004 — the 60-day freeze from Jun 15 reaches its stated end
**Type:** Constraint expiry

The engineering hiring freeze announced Jun 15 (CHG-004) ends Aug 15 as originally scoped. No extension has been announced.

**Program ripple effects:**
| Program | Impact |
|---------|--------|
| SPARK | The M3 frontend engineer request filed Jun 12 can be refiled Aug 15. Note that a refiled req means a Q4 arrival at best, so M3 (Sep 30) must still be scoped to the current team. Daniel Rios owes Leo Nakamura a replanning session that was due Jul 15 and has not happened. |
| ATLAS | Model Serving landed its Jun 16 req before the freeze (12 → 13 heads) and is not overcommitted for the first time this year. |
| All programs | Requisitions deferred through the freeze will land simultaneously. Expect competition for the same recruiting capacity in late August. |

**TPM action:** Any program that deferred a hire in June should refile on Aug 15 rather than assuming the freeze will quietly extend, and should plan delivery on the assumption the hire arrives in Q4.

---

## Summary Table

| ID | Date | Change | Primary impact |
|----|------|--------|---------------|
| CHG-001 | Mar 17 | EU data residency → board mandate (Q1 2027 delivery) | Core Infra bandwidth split, NEXUS/SHIELD/ATLAS downstream |
| CHG-002 | Apr 14 | CFO cost efficiency directive — 28% ratio by Q4, PULSE cost monthly reporting | PULSE pressure, NEXUS service target tightened to <175, headcount scrutiny |
| CHG-003 | May 27 | Priya Anand public NovaAI 20% ARR commitment (Data Summit 2026) | ATLAS GA June 30 externally anchored, SPARK Dec 31 GA more visible |
| CHG-004 | Jun 15 | Engineering hiring freeze (60 days through Aug 15) | SPARK M3 replanning, MERIDIAN M6 Compass dependency, HORIZON beta QA |
| CHG-005 | Jun 19 | Activist investor (Redmount) letter on PULSE cost + NEXUS service count | PULSE/NEXUS investor narrative exposure, July 1 board response due |
| **CHG-006** | **Jul 22** | **Board restates SOC 2 mandate — Aug 31 is readiness, Dec 15 is the report (DR-014)** | **SHIELD milestones restructured, ~$6.3M pipeline Q3 → Q4, KR1.1 restated** |
| **CHG-007** | **Aug 15** | **Engineering hiring freeze lifts as scheduled** | **SPARK M3 req refilable; deferred reqs land simultaneously across programs** |

---

## How to use this file

Load alongside `company-snapshot.md` and `org-chart.md` for any portfolio-level work. These changes affect:
- Resource assumptions in any Q3+ planning
- Risk narratives in executive deliverables (`/tpm-execsummary`, `/tpm-steerco-prep`, `/tpm-qbr-prep`)
- Escalation urgency thresholds — PULSE and NEXUS are now investor-visible programs
- Program master doc risk registers — add investor/board exposure as a risk category where applicable
