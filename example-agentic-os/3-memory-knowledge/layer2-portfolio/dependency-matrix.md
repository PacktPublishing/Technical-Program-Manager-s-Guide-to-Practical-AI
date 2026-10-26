# NovaGrid — Cross-Program Dependency Matrix
*Layer 2 context · Load for dependency and portfolio health work · Update cadence: weekly*
*Last updated: **August 10, 2026***

> **This file had not been updated since March 2026.** Its "Active dependency risks (March 2026)" table listed DEP-004 (Auth0 contract, resolved May 2) and DEP-007 (Model Serving overcommit, resolved Jun 4 by DR-007) as unresolved, five months after both were closed. Any skill that loaded this file for dependency state was reading a March portfolio. Rebuilt in full Aug 10.

---

## Dependency grid

Row = program that **needs** something · Column = program that **provides** it · Cell = what + status

| Needs ↓ \ Provides → | NEXUS | ATLAS | SHIELD | MERIDIAN | PULSE | HORIZON | SPARK |
|----------------------|-------|-------|--------|----------|-------|---------|-------|
| **NEXUS** | — | | | | | | |
| **ATLAS** | IAM ✅ Jun 30 · full refactor 🟡 Aug–Sep · OTel ✅ | — | SOC 2 evidence ✅ Aug 7 · Type II report 🟡 Dec 15 | v2 SDK ✅ | | | Vector Store v2 ✅ May 29 |
| **SHIELD** | IAM ✅ Jul 1 · CI/CD ✅ Jul 3 · OTel ✅ | SSO + audit logging ✅ | — | API audit logging ✅ Apr 3 | Temporal audit trail 🟡 **re-evidence before Sep 1** | | |
| **MERIDIAN** | CI/CD unified ✅ Jul 3 | | | — | | Mobile endpoints ✅ | |
| **PULSE** | OTel migration ✅ May 2 | | | | — | | |
| **HORIZON** | IAM ✅ Jun 30 | | | API endpoints ✅ Apr 3 | | — | |
| **SPARK** | OTel ✅ · Compute scaling 🟢 | **Multi-tenant serving path 🔴 DEP-008** | | v2 API only ✅ | Training pipelines ✅ Jun 10 | | — |

**One red cell.** Every other internal dependency in this grid is delivered.

---

## Critical path for board OKRs

| Board OKR | Critical path | Risk |
|-----------|--------------|------|
| SOC 2 Type II report **Dec 15** (restated, DR-014) | NEXUS IAM ✅ Jul 1 → SHIELD 100 controls ✅ Jul 15 → Deloitte evidence ✅ Aug 7 → readiness Aug 31 → **observation Sep 1–Nov 30** → report Dec 15 | 🟡 Medium — risk is control drift during observation, not delivery |
| NovaAI SLA 99.5% | NEXUS OTel ✅ → PULSE Temporal ✅ Aug 7 → ATLAS F6 circuit breaker ✅ Jul 31 → **F7 autoscaling Sep 15** | 🟡 Medium — 98.9% rolling, target still unmet |
| v1 API EoL **Sep 30** | MERIDIAN parity ✅ → migration 95% → **8 bespoke mid-market integrations Aug 21** → shutdown Sep 30 | 🟡 Medium — five weeks of margin, all of it behind 8 hand-built migrations |
| Mobile public GA **Aug 31** (DR-008) | MERIDIAN endpoints ✅ → NEXUS IAM ✅ → HORIZON beta ✅ Jul 22 → soft GA ✅ Jul 31 → submission ✅ Aug 1 → **Apple review Aug 15–22** | 🟡 Medium — **gated externally, not internally** |
| NovaAI v2 GA Dec 31 | SPARK M2 **Aug 11** → M3 Sep 30 → M5 Nov 30 → M7 Dec 31 | 🔴 High — zero buffer at every link, chain never reviewed end-to-end (SPARK R-009) |

---

## Active dependency risks (August 10, 2026)

| ID | Risk | Programs | Impact | Owner | Status |
|----|------|---------|--------|-------|--------|
| DEP-001 | NEXUS IAM delivery vs HORIZON beta need | NEXUS → HORIZON | — | Sara L. / Priya K. | 🟢 **Resolved Jul 2.** IAM live Jun 30; beta opened Jul 2 with a 48h absorbed slip. |
| DEP-002 | ATLAS Auth0 workaround tech debt pending full IAM refactor | NEXUS → ATLAS | Debt continues accruing until the refactor lands | Marcus C. / Sara L. | 🟡 **Open.** Planning started Jul 13, refactor sprint Aug–Sep. Sec Eng seeded at 15%. |
| DEP-003 | MERIDIAN mobile API endpoints | MERIDIAN → HORIZON | — | James O. / Priya K. | 🟢 **Resolved Apr 3.** |
| DEP-004 | Auth0 contract renewal | NEXUS | — | James Whitfield | 🟢 **Resolved May 2.** 12-month contract signed with migration-out clause. Now a live vendor dependency rather than a build-time blocker (NEXUS R-006). |
| DEP-005 | NEXUS IAM blocking 14 SHIELD controls | NEXUS → SHIELD | — | Sara L. / Fatima A. | 🟢 **Resolved Jul 14.** Controls closed Jul 11–14; blocker was open 137 days. |
| DEP-006 | PULSE Temporal needed before SPARK training pipelines go to prod | PULSE → SPARK | — | Yuna P. / Daniel R. | 🟢 **Resolved Jun 10.** Full estate complete Aug 7. |
| DEP-007 | Model Serving team overcommitted across ATLAS + SPARK | — | One program descopes or slips | Leo N. / Karl B. | 🟡 **Nominally resolved Jun 4 (DR-007), practically re-opened.** The 65/35 split held on paper; the July ATLAS uptime response pulled shared engineers onto F6 regardless. See DEP-008. |
| **DEP-008** | **SPARK M2 integration testing contends with ATLAS multi-tenant serving work** | **ATLAS → SPARK** | **M2 due Aug 11 at 88%; the last 12% is this integration** | **Leo N. / Daniel R.** | 🔴 **Open — the portfolio's only live blocking dependency. Opened Aug 10.** |
| **DEP-009** | **SHIELD's 2 remediation-flagged controls need re-evidencing against the now-complete Temporal audit trail** | **PULSE → SHIELD** | **Must close before the Sep 1 observation window opens** | **Yuna P. / Fatima A.** | 🟡 **Open — low effort, hard deadline. Opened Aug 10.** |

---

## Shared resource conflicts

| Resource | Programs competing | Commitment | Status |
|----------|-------------------|-----------|--------|
| Model Serving (13 people) | SPARK 60% actual / 65% nominal · ATLAS 35% · BAU 5% | ~100% | 🟡 Split holds on paper; a sibling production incident overrides it in practice (DEP-008) |
| Security & Compliance Eng (8) | SHIELD 80% · ATLAS IAM refactor 15% · BAU 5% | 100% | 🟢 Resolved — NEXUS IAM allocation ended Jul 10 |
| Core Infrastructure | NEXUS M7 retirement · ATLAS F7 autoscaling · EU data residency spike | ~105% | 🟡 Active — residency now has commercial pressure from Corinthia Bank |
| Stream Processing (7) | PULSE decommission 30% · FlowEngine SDK launch 60% · BAU 10% | 100% | 🟡 Active — DR-009 engineers held through Sep 30; SDK launch absorbs the delay |
| Developer Experience (11) | MERIDIAN 55% · NEXUS service retirement 30% · BAU 15% | 100% | 🟢 Resolved — CI/CD completion Jul 3 freed the allocation |

---

## Dependency health trend

| Week | On track | At risk | Blocked | Change |
|------|---------|---------|---------|--------|
| **Aug 10, 2026** | **14** | **3** | **1** | **DEP-008 opened (SPARK↔ATLAS). DEP-009 opened (PULSE→SHIELD).** |
| Aug 3, 2026 | 13 | 3 | 0 | PULSE M4 close resolved the last PULSE-provider risk |
| Jul 15, 2026 | 12 | 4 | 0 | DEP-005 closed — 14 SHIELD controls complete |
| Jul 1, 2026 | 9 | 5 | 2 | **NEXUS IAM go-live — DEP-001 and DEP-005 unblocked in one night** |
| Jun 28, 2026 | 7 | 6 | 3 | Pre-IAM baseline |
| Mar 11, 2026 | 8 | 5 | 4 | DEP-003 newly identified |
