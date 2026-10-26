# NEXUS — Program Master Document
*Platform Re-architecture & Service Consolidation*
*Layer 3 context · Load for NEXUS work · Update cadence: weekly*

---

## Header

| Field | Value |
|-------|-------|
| **Program code** | NEXUS |
| **TPM** | Sara Lindqvist |
| **Executive Sponsor** | Yuki Tanaka (VP Eng) |
| **Phase** | Execution |
| **Priority** | P0 |
| **Overall status** | 🟢 On track |
| **Last updated** | August 10, 2026 |

*Upgraded 🟡 → 🟢 on July 10 at clean hypercare exit. First solid green in the portfolio since Q1.*

---

## Objective

Reduce internal service count from 340 to under 200 by consolidating redundant microservices, migrating shared infrastructure to a common platform layer, and retiring legacy components. Target: 30% reduction in infrastructure COGS.

## Why now

Post-IPO board mandate for engineering cost efficiency. 340 services = reliability debt, high on-call burden, COGS creep. Every other major program was blocked on NEXUS delivering a stable common infrastructure layer — **as of July 1, none of them are.**

---

## Scope

**In scope:**
- Consolidate 6 overlapping auth microservices → 1 unified IAM service (Auth0-backed ✅ Jun 30; custom Go migration in H2 2026)
- Migrate all teams from Datadog → OpenTelemetry ✅
- Retire 47 deprecated services across DataCore and FlowEngine
- Unify CI/CD: Jenkins → GitHub Actions across all 15 eng teams ✅
- Migrate logging to centralized stack

**Out of scope:**
- Feature work for any product pillar
- Database migrations (separate DataCore program)
- Auth0 contract negotiation (CISO owns — contract signed May 2, 2026)

---

## Milestone plan

| Milestone | Description | Target | Status | Owner |
|-----------|-------------|--------|--------|-------|
| M1 | Service inventory + retirement plan | Jan 2026 | ✅ Done | Sara L. |
| M2 | IAM unification design approved | Feb 2026 | ✅ Done | Ingrid S. |
| M3 | OpenTelemetry migration — all teams | May 2 2026 | ✅ Done (May 2) | Ethan P. |
| M4 | First 60 services retired | May 31 2026 | ✅ Done (May 31 — on time) | Sara L. |
| M5 | CI/CD unified pipeline — all teams | Jun 30 2026 | ✅ Done (Jul 3 — **3 days late**) | DevEx team |
| M6 | IAM unified service live in prod (Auth0-backed) | Jun 30 2026 | ✅ Done (Jul 1 — **1 day late**) | Ingrid S. |
| M7 | Total service count <200 | Dec 2026 | 🟢 On track (22% — 247 services remaining) | Sara L. |

**M6 delivered.** Deployed Jun 30 at 22:05 following a 21:00 go/no-go. The auth-flow race condition found Jun 22 and fixed Jun 25 did not recur. A token-refresh latency spike surfaced Jul 2 (INC-2026-0117) and was fixed the same day. Hypercare ran Jul 1–10 and exited clean.

**M5 closed Jul 3**, three days late — the Mobile team was the last of 15. Jenkins is retired.

**M7 is now the whole program.** Started Jul 13 with the CI/CD allocation redirected into it. 247 services against a <200 target, retiring at roughly 6/week using the F3 dependency tooling. Note the tightened target from CHG-002: <175, not <200.

---

## Team commitments

| Team | Role | Commitment |
|------|------|-----------|
| Core Infrastructure | Lead — service retirement wave 2 | 100% |
| Security & Compliance Eng | IAM → now ATLAS IAM refactor seed | 15% (down from 25% at hypercare exit) |
| Ingestion & Connectors | Service retirement | 30% |
| Storage & Indexing | Service retirement | 30% |
| Pipeline Orchestration | Observability migration | 40% |
| Stream Processing | Observability migration | 40% |
| Model Serving | Observability | 20% (down from 50% — IAM work complete) |
| Developer Experience | Service retirement (was CI/CD) | 30% |

---

## Risk register

| ID | Risk | Likelihood | Impact | Owner | Mitigation | Status |
|----|------|-----------|--------|-------|-----------|--------|
| R-001 | Auth0-only IAM build — 10-week execution risk | — | — | Sara L. | Delivered Jun 30, one day late against a date set ten weeks earlier. The 2-day-per-sprint slip pattern flagged in May resolved into a 1-day total slip. | 🟢 Resolved Jul 1 |
| R-002 | OTel migration tail teams | — | — | — | ✅ Closed May 2. | 🟢 Resolved |
| R-003 | Service retirement uncovering undocumented dependencies | Medium | Medium | Sara L. | Live again for M7 wave 2. F3 tooling materially improved M4 decision quality and is now sequencing wave 2. Buffer intact. | 🟡 Ongoing |
| R-004 | NEXUS competing with SHIELD for Security Eng bandwidth | — | — | — | ✅ Resolved. | 🟢 Resolved |
| R-005 | Auth0 workaround in ATLAS accruing tech debt | Medium | Medium | Marcus C. / Sara L. | DEP-002 planning started Jul 13. Refactor sprint Aug–Sep. Sec Eng seeded 15% into it. Debt stops accruing when the refactor lands, not when IAM shipped. | 🟡 Planned |
| R-006 | Auth0-only IAM: vendor dependency if Auth0 changes terms | Low | Medium | James Whitfield | 12-month contract with migration-out clause. H2 2026 migration off Auth0 planned. Now a live platform dependency rather than a build-time one. | 🟡 Accepted |
| R-007 | IAM production deployment Jun 30 | — | — | Sara L. / Ingrid S. | Deployed successfully. Downstream unblocks all delivered: HORIZON beta Jul 2, SHIELD 14 controls Jul 11–14, ATLAS DEP-002 Jul 13. | 🟢 Resolved Jul 10 |
| R-008 | Investor visibility — service count narrative (CHG-005) | Confirmed | Medium | Sara L. / Karl B. | Redmount Capital named NEXUS service count reduction in their Jun 19 letter. M7 target tightened to <175 (CHG-002). 247 remaining means retiring 72+ in 20 weeks — above the current 6/week pace. Sara to prepare the trajectory chart for Q3 board materials, and to be explicit about which target (<200 or <175) is being tracked. | 🟡 Active |
| R-009 | Core Infrastructure bandwidth — data residency spike | Medium | Medium | Ingrid S. | CI/CD finished Jul 3, freeing capacity. But EU data residency (CHG-001, Q1 2027) is now competing directly with M7 retirement for the same Core Infra engineers, and Corinthia Bank has made residency a live commercial question. | 🟡 Active |
| **R-010** | **M7 pace insufficient for the tightened <175 target** | **Medium** | **Medium** | **Sara L.** | **247 services now, 6/week retirement pace, 20 weeks to Dec 31 = ~127 retired, landing at ~120. That clears <175 comfortably. The risk is not the pace — it is that wave 2 services are the ones with unclear ownership, and R-003 says pace degrades as dependencies get murkier. Re-baseline the pace assumption at the end of August with 6 weeks of wave-2 data.** | 🟢 **Watch** |

---

## Downstream dependencies (what others need from NEXUS)

| Needs NEXUS | What they need | When | Status |
|-------------|---------------|------|--------|
| SHIELD | IAM unified (14 controls blocked) | Jul 1 2026 | ✅ Delivered. All 14 controls closed Jul 11–14. |
| ATLAS | IAM (Auth0 workaround retirement) | Jun 30 → refactor Aug–Sep | ✅ IAM live. DEP-002 planning started Jul 13. |
| HORIZON | IAM for mobile SSO | Jun 30 2026 | ✅ Delivered. Beta opened Jul 2, 48h behind plan, absorbed. |
| SPARK | OpenTelemetry (M3) | ✅ Delivered May 2 | — |
| MERIDIAN | Unified CI/CD (M5) | Jun 2026 | ✅ Delivered Jul 3. |

---

## Stakeholders

| Name | Role | Engagement |
|------|------|-----------|
| Yuki Tanaka | VP Eng — Executive Sponsor | Monthly SteerCo |
| Ingrid Solvang | Dir. Platform & Infra — delivery owner | Weekly |
| Ethan Park, Amara Osei, Leo Nakamura | Division Directors — impacted | Bi-weekly sync |
| Marcus Bauer | CFO — cost OKR owner | Quarterly |

---

## Latest update (August 10, 2026)

NEXUS delivered the thing the whole portfolio was waiting for. IAM went to production on Jun 30 at 22:05 and M6 closed Jul 1, one day late against a date set ten weeks earlier. CI/CD (M5) closed Jul 3. Hypercare ran Jul 1–10 and exited clean, with one incident inside it — a token-refresh cache TTL unit mismatch on Jul 2, found and fixed the same day.

The hypercare window earned its keep. A cache TTL configured in seconds and deserialized as milliseconds is exactly the class of defect that staging does not surface, because staging never sustains enough concurrent refreshes for cache behaviour to matter. Two enterprise customers noticed slow dashboards; nobody failed to authenticate. Sara's team shipped the fix inside one business day.

Everything downstream unblocked on schedule. SHIELD's 14 IAM-dependent controls closed Jul 11–14. HORIZON's beta cohort opened Jul 2. ATLAS started DEP-002 full-IAM planning Jul 13. The dependency management that dominated this program for two quarters is finished.

**What is left is a different job.** M7 — service count under 200, tightened to under 175 by CHG-002 — is now the entire program. 247 services remain, retiring at roughly 6/week, which clears the target with margin on current pace. The risk is that wave 2 contains the services nobody has clear ownership of (R-003), and R-010 says re-baseline the pace assumption at the end of August once there is real wave-2 data.

**One thing to settle:** the program is carrying two different M7 targets. The milestone table says <200; CHG-002 tightened it to <175; Redmount Capital's letter cited service count specifically. Sara should confirm which number goes in the Q3 board materials before the chart gets built, not after.
