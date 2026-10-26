# DR-003 — ATLAS: VP Eng Forces Core Infrastructure Priority for SLA Monitoring (M6)

| Field | Value |
|-------|-------|
| **Decision ID** | DR-003 |
| **Date** | May 13, 2026 |
| **Decision maker** | Karl Bergstrom (VP Engineering) |
| **Stakeholders** | Marcus Chen (ATLAS TPM), Leo Nakamura (Dir. NovaAI), Ingrid Solvang (Dir. Platform), Rachel Lim (CPO) |
| **Programs affected** | ATLAS |
| **Status** | ✅ Decided |

---

## Decision

**Karl Bergstrom directs Core Infrastructure team to reprioritize ATLAS SLA monitoring (M6) from "deprioritized" to primary Q2 focus, effective immediately.**

Core Infra allocation for ATLAS M6 increases from <10% to 40% through May 31. M6 target May 31 is now 🟡 At risk (previously 🔴 Behind).

---

## Background

ATLAS M6 (SLA monitoring infrastructure) has been behind since February 2026. The Core Infrastructure team was carrying a platform hardening backlog from Q1 and self-triaged ATLAS M6 as lower priority than internal reliability work. This decision was never formally surfaced — the deprioritization happened without visibility to Marcus Chen or Karl.

Marcus flagged the risk in ATLAS R-002: "NovaAI uptime at 94.2% — cannot credibly commit to 99.5% SLA." An enterprise GA launch with a documented 94.2% uptime against a 99.5% commitment is a deal-killer. Marcus had been escalating informally since March.

The forcing function deadline in the master doc was May 15. Karl intervened May 13 — 2 days early.

---

## Trigger

Rachel Lim (CPO) raised M6 directly with Karl on May 12 after reviewing the ATLAS board update draft. Her message: "We're about to commit to enterprise SLA guarantees in contracts. I need to know our actual uptime number is within striking distance of what we're promising. What's the plan for M6?"

Karl convened an emergency sync with Ingrid Solvang and the Core Infra lead (Wei Zhang) on May 13 morning. Wei Zhang confirmed the team had capacity: two current-sprint projects were lower priority than M6 and could be deferred two weeks.

---

## Scope of the intervention

| Component | Before | After |
|-----------|--------|-------|
| Core Infra allocation to ATLAS M6 | ~5% (deprioritized) | 40% through May 31 |
| SLA monitoring infra (M6) status | 🔴 Behind (22%) | 🟡 At risk — May 31 target now funded |
| Deferred work | — | Platform hardening items P-007 and P-009 shifted to Jun sprint |

---

## Rationale

- A 99.5% enterprise SLA commitment requires documented evidence that the monitoring infrastructure exists — without M6, Marcus cannot credibly close enterprise contracts
- NovaAI v1 uptime was running at 94.2% as of April 24. The monitoring build includes automated alerting, incident response tooling, and SLA dashboard for customer visibility — the infrastructure to both enforce and demonstrate SLA compliance
- The Jun 30 enterprise GA target depends on M6 being complete. A May 31 completion gives Marcus a 4-week window to validate SLA credibility before closing the first 5 enterprise customers.

---

## What this does NOT fix

- Current NovaAI uptime (94.2%) is an architectural issue — M6 monitoring infrastructure does not improve uptime, it measures and surfaces it
- Marcus must address the uptime gap separately with Leo Nakamura; monitoring M6 alone does not make GA SLA commitments defensible if actual uptime stays below 99%
- Karl flagged this to Leo directly: "SLA monitoring by May 31 gives us visibility. Getting uptime to 99%+ before June is the engineering problem. Marcus can't close contracts if we're still at 94%."

---

## Related risks

- ATLAS R-002: NovaAI uptime 94.2% — still ACTIVE. M6 completion is necessary but not sufficient.
- ATLAS M7/M8 (Jun 30) feasibility depends on M6 May 31 AND uptime improvement by Jun 15.
