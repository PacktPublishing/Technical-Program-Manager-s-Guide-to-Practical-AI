# NovaGrid — Program Index
*Layer 2 context · Load for cross-program work · Update cadence: weekly*

> One row per program. For full detail on any program, load `layer3-programs/[program]-master.md`.
> For cross-program dependencies, load `dependency-matrix.md`.

---

## Active program portfolio (August 2026)

*Last updated: August 10, 2026*

| Code | Program | TPM | Phase | Priority | Overall | Next milestone | Next milestone date |
|------|---------|-----|-------|----------|---------|----------------|-------------------|
| **NEXUS** | Platform Re-architecture & Service Consolidation | Sara Lindqvist | Execution | P0 | 🟢 On track | Total service count <200 (M7) | Dec 31 2026 |
| **ATLAS** | Enterprise NovaAI Launch | Marcus Chen | Execution — post-GA | P0 | 🟢 On track | First 5 enterprise GA customers (M7) | Sep 15 2026 (revised, DR-011) |
| **SHIELD** | SOC 2 Type II Certification | Fatima Al-Hassan | Execution → Observation | P0 | 🟡 At risk | Audit readiness — board mandate (M6) | Aug 31 2026 (restated, DR-014) |
| **MERIDIAN** | API Consolidation & v1 Deprecation | James Okonkwo | Execution | P1 | 🟡 At risk | Mid-market 100% on v2 (M6) | Aug 21 2026 (revised, DR-015) |
| **PULSE** | Data Pipeline Overhaul (Airflow → Temporal) | Yuna Park | Execution | P1 | 🟡 At risk | Airflow decommission (M6) | Sep 30 2026 |
| **HORIZON** | Mobile Platform — iOS & Android | Priya Kaur | Execution — post soft-GA | P1 | 🟡 At risk | GA launch, public App Store (M8) | Aug 31 2026 |
| **SPARK** | NovaAI v2 Core Platform | Daniel Rios | Execution | P1 | 🟡 At risk | New model serving alpha (M2) | **Aug 11 2026 — tomorrow** |

**RAG key:** 🟢 On track · 🟡 At risk (recoverable) · 🔴 Behind (requires escalation)

---

## OKR alignment

| Company OKR | Programs on the hook |
|-------------|---------------------|
| O1: Enterprise readiness (SOC 2) | SHIELD · NEXUS · ATLAS |
| O2: NovaAI at 20% ARR | ATLAS · SPARK |
| O3: Platform consolidation (<200 services) | NEXUS · MERIDIAN · PULSE |
| O4: Developer experience + Mobile | MERIDIAN · HORIZON |
| O5: Gross margin ≥72% | NEXUS (cost) · PULSE (infra cost) |

---

## Portfolio health summary (August 10, 2026)

**Portfolio-level shift since June 28: zero reds for the first time this year, and every remaining amber is a single named thing.**

- **0 of 7 programs red.** PULSE came off red on Aug 7 when M4 closed — its first time off red since Q1. NEXUS went green Jul 10 at clean hypercare exit; ATLAS held green through GA.
- **8 milestones closed since Jun 28:** ATLAS M8 (Jun 30), NEXUS M6 (Jul 1), NEXUS M5 (Jul 3), SHIELD M4 (Jul 15), HORIZON M6 (Jul 22), HORIZON M7 (Aug 1), SHIELD M5 (Aug 7), PULSE M4 (Aug 7).
- **1 milestone missed:** MERIDIAN M6 mid-market, Aug 1 at 96% → revised Aug 21 (DR-015).
- **5 new decision records (DR-011 to DR-015).** DR-014 is the one to read — it restated the SOC 2 board mandate after the auditor pointed out that Aug 31 described a certification nobody could issue.
- **The dependency era ended Jul 1.** NEXUS IAM going live unblocked HORIZON beta, SHIELD's 14 IAM controls, and ATLAS DEP-002 within two weeks. What remains across the portfolio is execution and external gates, not internal blocking.
- **Two things NovaGrid does not control now gate two programs:** Apple's App Store review decision (HORIZON, expected Aug 15–22) and the auditor's Sep 1 – Nov 30 observation period (SHIELD).
- **Revenue at risk fell $4.2M** and is now $2.4M *below* baseline. Offsetting that, ~$6.3M of SOC 2-gated pipeline moved Q3 → Q4 as a timing consequence of DR-014.
- **$3.72M closed YTD** — $1.92M new ARR (Brightpath, Apex, Finex, Corinthia) plus the $1.8M VantagePoint renewal.

**The single sharpest open item:** SPARK M2 is due tomorrow at 88%. Go/no-go is today.

---

## Key decisions made (June 28 – August 10)

| DR | Decision | Date | Impact |
|----|---------|------|--------|
| DR-011 | ATLAS uptime protection — capacity add + tenant onboarding rate limit | Jul 6 | Protected 3 production customers' SLA. Froze M7 at 3/5 for four weeks; target Jun 30 → Sep 15. |
| DR-012 | HORIZON dedicated onboarding engineer | Jul 8 | Took beta cohort 4/10 → 10/10 in nine days. M6 closed Jul 22, 7 days late. |
| DR-013 | PULSE FlowEngine — continue without descope after Sprint 17 | Jul 10 | 22 items vs ~20 needed. Avoided a descope that would not have stopped the dual-run cost. |
| DR-014 | **SOC 2 board mandate restated — Aug 31 is readiness, report is Dec 15** | Jul 22 | Removed an 11-month structural falsehood. ~$6.3M pipeline Q3 → Q4. |
| DR-015 | MERIDIAN mid-market long tail — bespoke support, Aug 21 revised | Aug 1 | 2 engineers for 8 complex integrations. Thornbridge holding $1.7M pending EoL confirmation. |

### Prior decisions (April 24 – June 28)

| DR | Decision | Date |
|----|---------|------|
| DR-001 | Auth0-only IAM path authorized | May 1 |
| DR-002 | MERIDIAN SMB migration partner approved | May 8 |
| DR-003 | ATLAS SLA monitoring — VP Eng forcing function | May 13 |
| DR-004 | HORIZON Solaris Jul 31 GA commitment issued | May 9 |
| DR-005 | SPARK M3 schedule corrected | May 6 |
| DR-006 | ATLAS NovaAI uptime improvement plan authorized | Jun 2 |
| DR-007 | Model Serving allocation split — SPARK 65% / ATLAS 35% | Jun 4 |
| DR-008 | HORIZON GA definition — soft GA Jul 31, App Store Aug 31 | Jun 15 |
| DR-009 | PULSE FlowEngine reallocation — 2 engineers through Aug 31 | Jun 15 |
| DR-010 | VantagePoint renewal roadmap terms accepted | Jun 12 |

---

## Milestones closed since June 28

| Program | Milestone | Date closed |
|---------|---------|-------------|
| ATLAS | M8 — GA soft launch + analyst briefings | Jun 30, 2026 (on time) |
| NEXUS | M6 — IAM unified service live in prod | Jul 1, 2026 (1 day late) |
| NEXUS | M5 — Unified CI/CD, all 15 teams | Jul 3, 2026 (3 days late) |
| SHIELD | M4 — 100 controls complete | Jul 15, 2026 (on time) |
| HORIZON | M6 — Beta, 10 enterprise customers | Jul 22, 2026 (7 days late) |
| HORIZON | M7 — App Store / Play Store submission | Aug 1, 2026 (on time) |
| SHIELD | M5 — Audit evidence accepted by the auditor | Aug 7, 2026 (submitted Jul 15, reopened Jul 16, re-closed Aug 7) |
| PULSE | M4 — FlowEngine pipelines 100% migrated | Aug 7, 2026 (13 days late vs revised) |

*Earlier closes (Apr 24 – Jun 16) are archived in the weekly files. 23 milestones have closed since Apr 24.*

---

## Open escalations (as of August 10, 2026)

| # | Escalation | Decision needed from | Deadline | Consequence if missed |
|---|-----------|---------------------|----------|-----------------------|
| 1 | **SPARK M2 go/no-go** — model serving alpha at 88% against tomorrow's target | Daniel Rios / Leo Nakamura | **Today** | M3 (Sep 30) has zero buffer. A >2wk slip misses the VantagePoint Sep 15 contractual review. |
| 2 | **HORIZON iOS contingency** — ship Android alone if Apple rejects? | Priya Kaur / Ingrid Solvang | **Before Aug 15** | Decide before the review returns, not after. Solaris does not need a third slipped date. |
| 3 | **SHIELD readiness sign-off criteria** — what "ready" means on Aug 31, and who signs | James Whitfield / Fatima Al-Hassan | **This week** | Undefined 21 days out. A repeat of the ambiguity that caused DR-014. |
| 4 | **SPARK Dec 31 GA chain review** — never reviewed end-to-end, carried since May 20 | Leo Nakamura / Rachel Lim | **Overdue since Jun 30** | Zero-buffer chain, first domino tested tomorrow. |
| 5 | **ATLAS M9 renegotiation** — 3/15 by Dec 31 is unreachable | Marcus Chen / Rachel Lim | **Q3 QBR** | Defensible now with the DR-011 freeze as cause; indefensible in December. |

---

## Program master doc locations

```
layer3-programs/
├── nexus-master.md      (updated Aug 10)
├── atlas-master.md      (updated Aug 10)
├── shield-master.md     (updated Aug 10)
├── meridian-master.md   (updated Aug 10)
├── pulse-master.md      (updated Aug 10)
├── horizon-master.md    (updated Aug 10)
└── spark-master.md      (updated Aug 10)
```

## Decision records

```
decision-records/
├── DR-001-nexus-iam-auth0-only-authorized.md                    (May 1, 2026)
├── DR-002-meridian-smb-migration-partner.md                     (May 8, 2026)
├── DR-003-atlas-sla-vp-eng-forcing-function.md                  (May 13, 2026)
├── DR-004-horizon-solaris-commitment.md                         (May 9, 2026)
├── DR-005-spark-m3-schedule-correction.md                       (May 6, 2026)
├── DR-006-atlas-uptime-improvement-plan.md                      (Jun 2, 2026)
├── DR-007-model-serving-allocation-split.md                     (Jun 4, 2026)
├── DR-008-horizon-ga-definition-soft-ga.md                      (Jun 15, 2026)
├── DR-009-pulse-flowengine-reallocation.md                      (Jun 15, 2026)
├── DR-010-vantagepoint-renewal-terms-accepted.md                (Jun 12, 2026)
├── DR-011-atlas-uptime-protection-rate-limit.md                 (Jul 6, 2026)
├── DR-012-horizon-dedicated-onboarding-engineer.md              (Jul 8, 2026)
├── DR-013-pulse-continue-without-descope.md                     (Jul 10, 2026)
├── DR-014-soc2-mandate-restated-readiness-vs-certification.md   (Jul 22, 2026)
└── DR-015-meridian-midmarket-bespoke-support.md                 (Aug 1, 2026)
```
