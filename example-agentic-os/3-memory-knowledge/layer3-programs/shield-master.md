# SHIELD — Program Master Document
*SOC 2 Type II Certification*
*Layer 3 context · Load for SHIELD work · Update cadence: weekly*

---

## Header

| Field | Value |
|-------|-------|
| **Program code** | SHIELD |
| **TPM** | Fatima Al-Hassan |
| **Executive Sponsor** | James Whitfield (CISO) |
| **Phase** | Execution → Observation |
| **Priority** | P0 — board mandate |
| **Overall status** | 🟡 At risk |
| **Last updated** | August 10, 2026 |

*All 100 controls complete and evidenced. Amber, not green, because the program has changed shape: the risk is no longer building controls, it is operating them cleanly for three months.*

---

## Objective

Reach SOC 2 Type II **audit readiness** by August 31, 2026, and hold control operating effectiveness through the auditor's observation period (Sep 1 – Nov 30) so the Type II report issues **December 15, 2026**.

> **Restated July 22, 2026 (DR-014).** This objective previously read "achieve SOC 2 Type II certification by August 2026." That was never achievable and the program carried the contradiction for eleven months: a Type II report attests to controls operating over an observation period, and this engagement's period does not open until Sep 1. The auditor flagged it directly on Jul 16. The board accepted the restatement on Jul 22 — Aug 31 is readiness, Dec 15 is the report.

## Why now

Board mandate post-IPO. Enterprise customers in $50M+ pipeline contractually requiring SOC 2 Type II before signing. The date restatement moved roughly $6.3M of pipeline from Q3 to Q4 — a timing loss, not a lost-deal loss, but a real one (see Nuvera, below).

---

## Control distribution by team (as of August 10, 2026)

| Team | Controls owned | Complete | In progress | Not started |
|------|---------------|----------|-------------|-------------|
| Security & Compliance Eng | 28 | 28 | 0 | 0 |
| Core Infrastructure | 22 | 22 | 0 | 0 |
| Model Serving (NovaAI) | 12 | 12 | 0 | 0 |
| Governance & Catalog | 10 | 10 | 0 | 0 |
| Pipeline Orchestration | 8 | 8 | 0 | 0 |
| Query Engine | 8 | 8 | 0 | 0 |
| Developer Experience | 6 | 6 | 0 | 0 |
| Storage & Indexing | 6 | 6 | 0 | 0 |
| IAM-dependent (any team) | **14** | **14** | 0 | 0 |
| **Total** | **100** | **100** | **0** | **0** |

*Control status: **100/100 complete** as of Jul 15 (M4, on time). The 14 IAM-dependent controls were assigned Jul 1 morning from pre-staged assignments and closed Jul 11–14 — 13 days from unblock to complete. All 100 carry the auditor-accepted evidence as of Aug 7.*

**Two controls carry compensating documentation rather than full operating history:** CC6.4 (quarterly access review certification) and CC6.6 (privileged access management). Both went live Jul 1. That gap only closes with elapsed time inside the observation period.

---

## Milestone plan

| Milestone | Description | Target | Status | Owner |
|-----------|-------------|--------|--------|-------|
| M1 | Control gap analysis complete | Jan 2026 | ✅ Done | Fatima A. |
| M2 | All controls assigned to owners | Feb 2026 | ✅ Done | Fatima A. |
| M3 | 70 controls complete | Jun 1 2026 | ✅ Done (May 26 — **5 days early**) | James W. |
| M4 | 100 controls complete | Jul 15 2026 | ✅ Done (Jul 15 — **on time**) | James W. |
| M5 | Audit evidence package accepted by the auditor | Jul 15 2026 | ✅ Done (Aug 7 — submitted on time Jul 15, **reopened Jul 16**, re-closed Aug 7) | Fatima A. |
| M6 | SOC 2 Type II **audit readiness** (board mandate) | Aug 31 2026 | 🟢 On track (85%) | James W. |
| M7 | SOC 2 Type II **report issued** | Dec 15 2026 | ⬜ Not started — observation period opens Sep 1 | James W. |

**M6 was renamed by DR-014.** It previously read "SOC 2 Type II certification received, Aug 31." M7 is a new milestone created to hold what M6 used to imply.

**M5 is the one to read carefully.** It closed on time Jul 15, reopened the next day, and re-closed Aug 7. The auditor accepted 97 of 100 controls and failed 3 on evidence sufficiency — not implementation. A1.7 (log retention, closed Jun 30), CC6.4 and CC6.6 (both live since Jul 1) had days of operating history where Type II expects months. Remediated Jul 20 – Aug 5; accepted Aug 7.

---

## Risk register

| ID | Risk | Likelihood | Impact | Owner | Mitigation | Status |
|----|------|-----------|--------|-------|-----------|--------|
| R-001 | 14 controls blocked on NEXUS IAM | — | — | Sara L. / Yuki T. | NEXUS IAM live Jun 30 22:05, M6 closed Jul 1. All 14 controls closed Jul 11–14. Blocker was open 137 days. | 🟢 Resolved Jul 14 |
| R-002 | Yuki mandate holding | — | — | Fatima A. | Held through completion. No regression. | 🟢 Resolved |
| R-003 | May 15 SOC2 in-progress evidence for Meridian Financial | — | — | Fatima A. | ✅ Closed May 12. | 🟢 Resolved |
| R-004 | August audit date immovable | — | — | James W. | **Dissolved by DR-014.** The August date was misunderstood, not immovable — Aug 31 is readiness, and readiness is confirmed. The real fixed date is Dec 15. | 🟢 Resolved Jul 22 |
| R-006 | SHIELD controls dependent on PULSE Temporal audit trail (6 controls) | Low | Medium | Fatima A. / Yuna P. | 4 had compensating controls; 2 were documented as "in remediation". PULSE M4 closed Aug 7, so the Temporal audit trail is now real for the FlowEngine estate. Re-evidence both before Sep 1. | 🟡 Closing |
| R-007 | 19 remaining non-IAM controls in a compressed Jul 1–15 window | — | — | Fatima A. | Delivered. Pre-staged assignments meant work started the morning IAM went live. | 🟢 Resolved Jul 15 |
| **R-008** | **Control drift during the Sep 1 – Nov 30 observation period** | **Medium** | **Critical** | **Fatima A.** | **The program's dominant risk now. A control that stops operating cleanly during observation is reported as an exception; material exceptions move Dec 15 into FY2027, taking Meridian Financial ($4.2M) and Nuvera ($2.1M) with it. SHIELD-5 epic (opened Jul 23) covers monitoring, evidence automation and drift detection across all 100 controls.** | 🔴 **Active** |
| **R-009** | **CC6.4 and CC6.6 carry compensating documentation, not operating history** | **Medium** | **High** | **Fatima A.** | **The auditor accepted both for readiness but flagged that CC6.4 must evidence a complete quarterly cycle before Nov 30, and CC6.6 needs uninterrupted privileged-grant review cadence. Neither can be accelerated — they need elapsed time. Schedule the CC6.4 quarterly cycle to complete by Oct 31 so there is one cycle of margin.** | 🟡 **Watch** |
| **R-010** | **Readiness sign-off Aug 31 has no defined acceptance criteria** | **Medium** | **Medium** | **James W.** | **DR-014 named the date but not what "ready" means or who signs. Twenty-one days out and undefined. Fatima to propose criteria to James Whitfield this week — a repeat of the ambiguity that caused the original problem.** | 🟡 **Watch** |

---

## Inbound dependencies

| Needs from | What | When | Risk if late |
|-----------|------|------|-------------|
| NEXUS | IAM unification (14 controls require it) | Jul 1 2026 | ✅ Delivered Jun 30 22:05. All 14 controls closed Jul 11–14. |
| MERIDIAN | v2 API audit logging capability | Apr 2026 | ✅ Delivered Apr 3. 8 controls unblocked. |
| PULSE | Pipeline audit trail (Temporal migration) | Aug 2026 | ✅ FlowEngine complete Aug 7. Re-evidence the 2 remediation-flagged controls before Sep 1. |

---

## Outbound dependencies (what SHIELD provides)

| Program | What SHIELD provides | When needed |
|---------|---------------------|-------------|
| ATLAS | SOC 2 evidence for enterprise deals and expansions | Ongoing — readiness evidence available now; Type II report Dec 15 |
| Sales / RevOps | Accurate certification dates for customer commitments | Continuous — DR-014 re-brief issued Jul 27 |

---

## Stakeholders

| Name | Role | Engagement |
|------|------|-----------|
| James Whitfield | CISO — Executive Sponsor | Weekly |
| Priya Anand | CEO — board accountability | Monthly |
| Yuki Tanaka | VP Eng — team prioritization mandate | Weekly |
| The auditor | External auditor | Milestone-based; observation period opens Sep 1 |

---

## Latest update (August 10, 2026)

All 100 controls are complete and all 100 carry the auditor-accepted evidence. M4 closed on time Jul 15 and M5 re-closed Aug 7. On the numbers this is the best quarter SHIELD has had.

The July 16 finding is the part worth carrying forward. The auditor failed three controls — A1.7, CC6.4, CC6.6 — not because they were wrong but because they were new. A quarterly access review with fifteen days of history cannot evidence a quarterly cycle. The team had been measuring completion and the auditor was measuring duration, and nobody noticed the difference until the evidence was in front of someone who cared about it.

That finding is also what surfaced the date problem. The auditor's engagement partner pointed out that the Aug 31 date in NovaGrid's board materials did not correspond to anything in their engagement letter. The observation period opens Sep 1; the report follows Dec 15. The board accepted the restatement on Jul 22 (DR-014). The cost was one uncomfortable conversation and roughly $6.3M of pipeline moving from Q3 to Q4 — Nuvera Insurance in particular, whose CDO asked the direct question through a support ticket on Jul 28 and could not meet his Q3 board window with a readiness statement.

**What SHIELD is now is a different program.** Building 100 controls took eleven months and is finished. Operating them without drift for three months starts Sep 1 and nobody on the team has done it before. R-008 is the dominant risk and SHIELD-5 exists to address it.

**Open this week:** readiness sign-off criteria for Aug 31 are still undefined twenty-one days out (R-010). Fatima to propose to James Whitfield. Defining what "ready" means, and who signs it, is exactly the discipline whose absence created the original Aug 31 confusion.
