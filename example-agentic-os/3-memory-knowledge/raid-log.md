# Portfolio RAID Log — NovaGrid FY2026

**TPM:** Karl Bergstrom (Portfolio)
**Last updated:** 2026-09-04
**Review cadence:** Weekly (SteerCo cadence for portfolio-level items; program TPMs own program-level RAID logs)
**Programs in scope:** NEXUS · ATLAS · SHIELD · MERIDIAN · PULSE · HORIZON · SPARK

> **Agent loading rule:** This file is the cross-reference target for Risk IDs in `cross-program-dependencies.md`. When an agent runs a risk sweep, open this file alongside `cross-program-dependencies.md` and match DEP-xxx IDs in the Dependencies section to their current status.

> ⚠️ **Reconstructed 2026-09-04 from Gmail + Calendar exports.** This log went **25 days without a review** (Aug 10 → Sep 4) across the Head of TPM's absence. The six system exports were never refreshed in that window, so nothing below is corroborated by Jira, Aha!, Vanta, Salesforce or DataDog. Every entry traces to a thread or event ID. See `layer4-weekly/2026-absence-reconstruction-aug11-sep02.md`.

---

## RAG Summary

| Category | Open items | Critical | Owner attention needed |
|----------|-----------|----------|----------------------|
| 🔴 Risks | 6 | 4 | R-012 (MERIDIAN shim vs Sep 30 EoL), R-009 (now specific: CC6.4/CC6.6), R-014 (two Sep 30 shutdowns), R-013 (Apple second review) |
| 🟡 Assumptions | 3 | 2 | A-006 (falsified — 14 pipelines), A-007 (Sep 30 double shutdown never assessed jointly) |
| 🟠 Issues | 3 | 2 | I-005 (mobile run owner — tripled load), I-006 (cover-TPM escalation path) |
| 🔵 Dependencies | 9 | 1 | DEP-009 (open **inside** the observation window) |

**Overall RAID health:** 🔴 **Deteriorating — six programs red.** Three weeks ago this log read 🟢 Good for the first time this year. That assessment was not wrong; it was the last one taken before a 25-day gap in which every external gate resolved and every deferred decision acquired a deadline.

**The distinguishing feature of this sweep: delivery held and judgment queued.** MERIDIAN closed a day early, SHIELD closed on the board date, ATLAS posted its first month above its uptime commitment, HORIZON shipped Android on time, SPARK closed M2 honestly. Not one red below is an execution failure. Every one is a decision not taken, work not owned, or a commitment not renegotiated.

---

## Risks

| ID | Risk | Likelihood | Impact | Priority | Owner | Mitigation | Status |
|----|------|-----------|--------|----------|-------|-----------|--------|
| **R-012** | **MERIDIAN's compatibility shim. Brightline Logistics and Corvid Systems run on v2 through a shim that translates legacy webhook signatures — and the shim is hosted on v1 infrastructure. It must be replaced with native integrations before the Sep 30 v1 shutdown or both customers break at EoL. ~4 weeks of work, 3.7 weeks remain, owned by nobody, and not visible in the 210/210 M6 number.** | **H** | **C** | 🔴 | **Ingrid Solvang / James Okonkwo** | **Name an owner at SteerCo Sep 4 — not by email afterwards. Candidate: the two DR-015 engineers, free since Aug 20. Fallback: a documented carve-out exempting 2 customers from the Sep 30 shutdown.** | 🔴 **New — decision today** |
| **R-009** | **SHIELD control drift during the Sep 1 – Nov 30 the auditor observation window — now specific. CC6.4 and CC6.6 entered the window on July compensating documentation rather than the completed Temporal audit trail. The auditor samples from the week of Sep 21, monthly thereafter.** | **H** | **C** | 🔴 | **Fatima Al-Hassan / James Whitfield** | **DR-019: re-evidence inside the window and disclose proactively. Complete by Sep 18. CC6.4 to evidence a full quarterly cycle by Oct 31.** | 🔴 **Active — $12.2M, sampling in 17 days** |
| **R-014** | **Two independent hard shutdowns land on Sep 30 — MERIDIAN v1 API EoL and PULSE Airflow decommission — both at zero margin, both with known unresolved defects, owned by different TPMs in different divisions. Neither program's plan mentions the other.** | **M** | **H** | 🔴 | **Karl Bergstrom** | **Joint sequencing review this week. Establish which shutdown moves if both cannot hold, and decide it now rather than in the last week of September.** | 🔴 **New — never assessed jointly** |
| **R-013** | **HORIZON iOS public GA is gated on a second Apple review (submitted Aug 24, day 10 of an unreliable 14–21 day window) with no date NovaGrid can give Solaris. Solaris legal opens Sep 4 and wants mobile availability language settled; $2.4M signature scheduled Sep 15.** | **M** | **H** | 🔴 | **Priya Kaur / Sofia Reyes** | **Give a conservative date with a stated dependency today, or accept the iOS clause is struck. Do not communicate a third date without a decision in hand.** | 🔴 **Active — decision today** |
| **R-015** | **SPARK's Dec 31 GA chain has absorbed three slips (M2 +16 days, M3 +16 days, M6 missed entirely) and still reports Dec 31. Zero buffer at every link: M3 Oct 16 → M5 Nov 30 → GA Dec 31. R-009's predecessor risk — "chain never reviewed end-to-end" — has been open since May 20 and was due before Jun 30.** | **H** | **H** | 🔴 | **Leo Nakamura / Rachel Lim** | **DR-017 ratified with a hard condition: end-to-end chain review before the Sep 8 QBR. It is a named CFO pre-read requirement.** | 🔴 **Overdue 66 days** |
| R-004 | NovaAI uptime. **Materially improved:** 98.9%–99.2% every day since the rate limit lifted Aug 3, and the August month average landed at **99.1% — the first month above the 99.0% commitment since GA.** The 99.5% SLA target remains unmet. | L | H | 🟡 | Leo Nakamura | F7 inference autoscaling at 80%, tracking Sep 15, replaces the manual capacity add. Datadog SLO burn-rate alert armed. | 🟡 **Improving — downgraded from Watch** |

**Closed since Aug 10:** **R-008** (SPARK M2 — CLOSED Aug 27; NO-GO called honestly on Aug 11, milestone closed 16 days late, DEP-008 closed with it). **R-010** (MERIDIAN long tail — CLOSED Aug 20; M6 at 210/210, one day early against the DR-015 revised date. *Closed on the milestone; see R-012 for what the milestone number did not contain.*). **R-011** (Apple review gate — CLOSED Aug 19 by the rejection itself; superseded by R-013). **NEXUS R-006** (Auth0 vendor dependency — CLOSED Aug 18, 24-month renewal signed, pricing flat).

---

## Assumptions

| ID | Assumption | Basis | Validated? | Owner | Due | Risk if wrong |
|----|-----------|-------|-----------|-------|-----|--------------|
| **A-006** | **Sep 30 Airflow decommission is achievable in seven weeks.** | PULSE M4 closed Aug 7; sequence is traffic verification → read-only → shutdown. | **FALSIFIED Aug 28.** Traffic verification found **14 pipelines running on Temporal but still writing state into Airflow-managed metadata tables.** They pass every functional check and *would have failed silently at shutdown.* Read-only mode moved Sep 1 → Sep 14. | Yuna Park | **Re-baseline by Sep 14** | Read-only Sep 14 + a minimum two-week soak puts shutdown at **Sep 28 with zero margin**, assuming nothing further is found. Every week past Sep 30 is **$380K**. Dual-run accrued **$2.13M** as of Sep 1. |
| **A-007** | **MERIDIAN v1 EoL and PULSE Airflow shutdown can both complete on Sep 30.** | Two separate program plans, each internally credible, each with its own margin. | **Never assessed.** Neither plan references the other. Both are at zero margin, in the same fortnight, with unresolved defects. | Karl Bergstrom | **Sep 8 (QBR)** | Two simultaneous shutdown failures in one week, across two divisions, with customer-visible breakage on both. |
| **A-002** | *(rewritten)* **App Store review takes 2–3 weeks — and says nothing about the outcome.** | Apple/Google standard review cycle. | **FALSIFIED on outcome Aug 19.** Duration held (18 days). **First-pass approval was never a stated assumption and never validated.** Apple rejected on 5.1.1(v), a published requirement that no pre-submission check existed to catch. Second review is day 10. | Priya Kaur | **Sep 14** | Already materialised. Solaris ($2.4M, Sep 15) and Kestrel tranche 2 ($800K, Oct) both exposed. **Split into duration + outcome; add a pre-submission guideline check to the mobile release gate.** |

**Confirmed and closed since Aug 10:** **A-005** (the DR-007 Model Serving split as a protection mechanism) — **CONFIRMED FALSE a second time.** The 60% actual against 65% nominal is the direct cause of SPARK M2's 16-day slip, which is the direct cause of DR-017 moving M3. **A percentage allocation is not a protection mechanism.** Carried forward as a standing constraint on all future allocation decisions rather than as an open assumption.

---

## Issues

| ID | Issue | Impact | Owner | Resolution path | Due | Status |
|----|-------|--------|-------|----------------|-----|--------|
| **I-005** | **HORIZON post-GA mobile support still has no run owner — and public GA has now roughly tripled L1 mobile volume.** | The DR-012 engineer, scoped for onboarding, is absorbing unscoped run work. Mobile backend p95 up 34% since Aug 31 (within SLO). Open since Jul 31. | **Priya Kaur / Ingrid Solvang** | **Assign a named run owner. This was due before public GA and public GA has happened.** | **Overdue — was Aug 24** | 🟠 **Active, escalating** |
| **I-006** | **A cover TPM has no decision escalation path.** During the Aug 11 – Sep 2 absence, four commitments acquired hard deadlines while waiting for one person: NEXUS M7 target (open since Jul 13), ATLAS M9 (Aug 3), SHIELD DEP-009 (Aug 7), MERIDIAN shim (Aug 31). | Sara Lindqvist could chair SteerCo and keep programs moving, and correctly identified what was not hers to decide — but had no authority to renegotiate a board commitment and no mechanism to route one past herself. The auto-reply named Yuki Tanaka for board-facing items; nothing routed anything there. | **Karl Bergstrom** | **Define a named decision escalation path for cover arrangements, with a standing trigger: any item open >5 days that a cover TPM cannot decide goes to the Division Director automatically.** | **Sep 11** | 🟠 **New — the structural finding of this absence** |
| **I-007** | **Six system exports went 24 days without a refresh and nothing alarmed.** `scripts/check_novagrid_consistency.py` returned OK throughout, because it validated internal consistency against a self-declared as-of date rather than against the clock. Two further gaps in the same check: its "current week" was derived from the export anchor (so a frozen export set froze the definition of *current*), and its date parser only matched 3-letter months, so the heading-vs-anchor comparison silently parsed `None` and had **never fired**. `gmail/` and `calendar/` are properly registered in `source-registry.md` but appear in neither CLAUDE.md's data-source list nor the checker's export set. | The portfolio's entire sensing layer failed silently for 25 days. This run has a state only because those two exports were built for a different skill. | **Karl Bergstrom** | **Checker fixed Sep 4** — wall-clock staleness check added (WARN 3d / FAIL 7d, `NOVAGRID_TODAY` override for staged demos), current-week derived from the clock, date parser widened. It now correctly reports FAIL. **Remaining: add gmail + calendar to CLAUDE.md and to the checker's export set; re-pull all six exports before the Sep 8 QBR.** | **Sep 8** | 🟠 **Partially resolved** |

**Closed since Aug 10:** **I-004** (SHIELD readiness sign-off criteria — **RESOLVED Aug 13.** Fatima Al-Hassan tabled five acceptance items with James Whitfield named as signer; M6 closed against them on Aug 31. *The one deferred decision in this portfolio that got resolved during the absence, because it was resolvable at program level.*)

---

## Dependencies

> DEP-xxx IDs match `cross-program-dependencies.md`. Agents: cross-reference this table when reading the integration contract.

| ID | Dependency | Direction | Required by | Current status | Owner |
|----|-----------|-----------|-------------|----------------|-------|
| DEP-001 | NEXUS IAM for HORIZON mobile SSO | NEXUS → HORIZON | Jun 30 | 🟢 Closed Jul 2. | Sara Lindqvist / Priya Kaur |
| DEP-002 | NEXUS full IAM integration for ATLAS; Auth0 workaround retirement | NEXUS → ATLAS | Sep 2026 | 🟡 **Open — on track.** Refactor sprint started **Aug 17**; Sec Eng holding 15%; workaround retirement tracking to late September. | Marcus Chen / Sara Lindqvist |
| DEP-003 | MERIDIAN v2 API mobile endpoints for HORIZON | MERIDIAN → HORIZON | Apr 22 | 🟢 Closed Apr 22. | James Okonkwo |
| DEP-004 | Auth0 contract renewal | Internal to NEXUS | Mar 18 | 🟢 **Fully closed Aug 18** — 24-month renewal signed, pricing flat. NEXUS R-006 closed with it. | James Whitfield |
| DEP-005 | NEXUS IAM gates 14 SHIELD controls | NEXUS → SHIELD | Jun 30 | 🟢 Closed Jul 14. | Sara Lindqvist / Fatima Al-Hassan |
| DEP-006 | PULSE Temporal for SPARK training pipelines | PULSE → SPARK | Jul 25 | 🟢 Closed. Full estate 677/677 Aug 7. | Yuna Park / Daniel Rios |
| DEP-007 | Model Serving allocation across ATLAS + SPARK | Shared resource | Resolved Jun 4 | 🟢 **Closed Aug 27** with DEP-008 — but see A-005. The split was never a protection; it is retained as a constraint, not a control. | Leo Nakamura / Karl Bergstrom |
| DEP-008 | ATLAS multi-tenant model serving integration path for SPARK M2 | ATLAS → SPARK | Aug 11 | 🟢 **Closed Aug 27.** M2 integration tested against ATLAS multi-tenant serving. 16 days late; the delay is A-005's cost. | Leo Nakamura / Daniel Rios |
| **DEP-009** | **PULSE Temporal audit trail — re-evidence SHIELD's CC6.4 and CC6.6** | **PULSE → SHIELD** | **Was Sep 1 — MISSED** | 🔴 **Open, and now inside the observation window.** Both controls entered Sep 1 on July compensating documentation. **DR-019: re-evidence by Sep 18 and disclose to the auditor before sampling in the week of Sep 21. Stays open until evidence is accepted, not until work is done.** | **Yuna Park / Fatima Al-Hassan / James Whitfield** |

---

## Data integrity flags (new this sweep)

| Flag | Detail | Action |
|------|--------|--------|
| **Incident ID collision** | **`INC-2026-0131` is used twice for different incidents.** DR-015 cites it as a MERIDIAN v1 gateway latency incident on **Aug 6**; THR-1007 and EVT-2105 cite it as a PULSE SEV2 ingestion outage on **Aug 26** (4h11m, MTTD 9 min). Both cannot be right. | Reconcile against the DataDog export when it is re-pulled. Until then, treat the PULSE Aug 26 incident as the live one and the DR-015 reference as suspect. |
| **NEXUS pace does not reconcile** | THR-1009 reports ~6/week and concludes that hits <200 but not <175. But 247 (Aug 10) → 223 (Sep 3) is **~7/week**, and 17 weeks remain to Dec 31; even at 4/week that lands near 155. | **Verify before the board trajectory chart is built.** Either the retirement tail hardens materially — and the chart should say so — or **<175 is reachable and NovaGrid is about to under-commit on the metric Redmount's letter named.** |
| **Export blackout** | Six system exports stale 25 days; consistency checker returned OK throughout. | I-007. |

---

## Weekly Review Log

| Date | Reviewer | Changes | RAID health |
|------|----------|---------|-------------|
| **2026-09-04** | **Karl Bergstrom** (portfolio-monitor, degraded mode) | **First review in 25 days, reconstructed from Gmail + Calendar only.** Closed R-008, R-010, R-011, NEXUS R-006, I-004, DEP-004, DEP-007, DEP-008. Opened R-012 (MERIDIAN shim), R-013 (Apple second review), R-014 (double Sep 30 shutdown), R-015 (SPARK Dec 31 chain), A-007 (double shutdown never assessed), I-006 (cover-TPM escalation path), I-007 (silent export failure). A-006 and A-002 both **falsified**; A-005 confirmed false a second time and retired into a standing constraint. DEP-009 missed its Sep 1 deadline and is now inside the observation window. DR-016 through DR-019 written, two of them ratifying decisions taken 8 and 15 days earlier with no record. **Three data-integrity flags raised.** | 🔴 **Deteriorating** |
| 2026-08-10 | Karl Bergstrom | Full review after a five-week gap (Jul 5 → Aug 10). Closed R-005, R-006, R-007, A-004, I-003. Opened R-008 through R-011, A-005, A-006, I-004, I-005, DEP-008, DEP-009. RAID health upgraded to 🟢 Good — first time this year. **Process note: this log went five weeks without a review while its own cadence says weekly, and A-005 was falsified in that window without anyone recording it.** | 🟢 Good |
| 2026-07-05 | Karl Bergstrom | Weekly review post-IAM-deploy and post-GA. Closed R-001, R-002, R-003, A-001, A-003, I-001, I-002. DEP-001 and DEP-005 marked Delivered. Opened R-006, R-007, A-004, I-003. R-004 reframed to post-GA load watch. | 🟡 Improving |
| 2026-05-26 | Karl Bergstrom | Post-simulation update (May 20→26). SHIELD M3 closed May 26 — DEP-005 updated. R-001 at 28%/4 weeks remaining. I-001 at 17 days in limbo. | 🔴 Deteriorating |
| 2026-05-26 | Karl Bergstrom | Initial portfolio RAID log created. All DEP-xxx IDs populated. DEP-003 and DEP-004 closed. | 🔴 Deteriorating |
| 2026-05-22 | Karl Bergstrom | SteerCo completed. ATLAS M4 closed. HORIZON Android alpha delivered May 21. | — |
| 2026-05-21 | Karl Bergstrom | Fruit bowl diagnostic (portfolio mode). ATLAS Watermelon HIGH, PULSE Banana HIGH, HORIZON Avocado HIGH. Artifact at `layer4-weekly/fruit-bowl-scan-2026-05-20.md`. | — |

---

## The finding this sweep exists to record

**DR-015 predicted R-012 by name, in writing, on August 1, and rejected it as an option.**

DR-015 §Rationale: *"The alternative considered and rejected was forcing the 8 onto v2 with
compatibility shims to hit an earlier date. Rejected because these same 8 integrations are
the ones most likely to break loudly at the September 30 v1 shutdown, and a shim would move
the breakage from a controlled migration window into the EoL event itself."*

Ingrid Solvang, in the same record: *"I would rather be three weeks late on M6 and confident
on September 30 than on time in August and surprised at EoL."*

**Two of the eight shipped on a compatibility shim anyway**, and M6 was reported closed at
210/210, one day early. James Okonkwo disclosed it himself on Aug 31 — *"one caveat I want
on the record rather than buried"* — so this is not concealment. But the milestone number
did not contain it, no risk was opened, and nobody acted for four days.

**A decision record is not a control.** DR-015 identified the exact failure mode, rejected
it explicitly, named the consequence, and the organisation walked into it anyway because
nothing checked the milestone against the decision that governed it.
