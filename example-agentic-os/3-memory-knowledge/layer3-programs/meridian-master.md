# MERIDIAN — Program Master Document
*API Consolidation & v1 Deprecation*
*Layer 3 context · Load for MERIDIAN work · Update cadence: weekly*

---

## Header

| Field | Value |
|-------|-------|
| **Program code** | MERIDIAN |
| **TPM** | James Okonkwo |
| **Executive Sponsor** | Ingrid Solvang (Dir. Platform & Infra) |
| **Phase** | Execution |
| **Priority** | P1 |
| **Overall status** | 🟡 At risk |
| **Last updated** | August 10, 2026 |

*M6 missed Aug 1 at 96%. The last 8 customers are the ones self-service was never going to reach, and Sep 30 v1 EoL sits directly behind them.*

---

## Objective

Migrate all external customers (890 total) to v2 API. Deprecate v1 by September 2026. Ship unified v2 SDK. Reduce API surface from 847 endpoints to under 300.

## Why now

v1 API is a security liability (no audit logging), reliability liability, and cost liability ($2.1M/year dual infrastructure). September deadline is hard — Legal committed it to 3 enterprise customers in their contracts.

---

## Migration status (external customers — as of August 10, 2026)

| Segment | Total | On v2 | On v1 | Migration rate | Change since Jun 28 |
|---------|-------|-------|-------|---------------|---------------------|
| Enterprise (>$500K) | 41 | **41** | 0 | **100% ✅** | — (M5 closed Jun 1) |
| Mid-market ($50–500K) | 210 | **202** | 8 | **96%** | +39 customers — Compass flexed Jul 17 |
| SMB (<$50K) | 639 | **601** | 38 | **94%** | +256 customers — passed 90% Jul 17 |
| **Total** | **890** | **844** | **46** | **95%** | **+295 customers migrated** |

*The Compass flex worked exactly as James planned it: SMB passed 90% on Jul 17, Compass pivoted to mid-market the same week, and mid-market moved 163 → 202 in three weeks. It started too late to hold Aug 1.*

---

## Milestone plan

| Milestone | Description | Target | Status | Owner |
|-----------|-------------|--------|--------|-------|
| M1 | v2 API feature parity with v1 | Apr 3 | ✅ Done | James O. |
| M2 | Python SDK v2 GA | Apr 30 | ✅ Done (Apr 30) | DevEx |
| M3 | JS + Java SDK v2 GA | May 31 2026 | ✅ Done (May 31) | DevEx |
| M4 | Migration tooling + guides live | Apr 18 | ✅ Done (Apr 18) | DevEx |
| M5 | Enterprise customers 100% on v2 | Jun 1 2026 | ✅ Done (Jun 1 — 41/41) | James O. |
| M6 | Mid-market customers 100% on v2 | ~~Aug 1~~ **Aug 21 2026** (DR-015) | 🟡 At risk (96% — 202/210, 8 remaining) | James O. |
| M7 | v1 EoL + infrastructure shutdown | Sep 30 2026 | 🟡 At risk (25%) | Ingrid S. |

**M6 MISSED Aug 1 at 202/210.** Revised to Aug 21 with two dedicated engineers assigned Aug 3 (DR-015).

**The remaining 8 are not a pace problem.** They are 4 custom webhook chains, 2 legacy auth flows, and 2 running deprecated batch endpoints. Self-service tooling and partner-assisted migration — the two mechanisms that moved the other 202 — cannot reach any of them. They need engineering.

**M7 has five weeks of margin behind M6** and is now real work: shutdown sequencing started Aug 3 under a new epic (MERIDIAN-7). The same 8 integrations are the ones most likely to break loudly at shutdown, so closing them properly matters more than closing them fast.

---

## Team commitments

| Team | Role | Commitment |
|------|------|-----------|
| Developer Experience | Lead — SDK, migration tooling, complex integrations | 55% |
| Query Engine | v1/v2 compatibility layer | 50% |
| Governance & Catalog | API cataloging | 25% |
| Core Infrastructure | Gateway migration + v1 teardown | 40% |
| All product teams | v2 endpoint implementation | 20–30% each |

---

## Risk register

| ID | Risk | Likelihood | Impact | Owner | Status |
|----|------|-----------|--------|-------|--------|
| R-001 | 12 endpoint reverse-engineering | — | — | — | 🟢 Resolved Apr 3. |
| R-002 | SMB customers not self-migrating | Low | Medium | James O. | 🟢 Largely resolved. Compass (DR-002) took SMB from 54% to 94%. Engagement runs through Sep 30; 38 remain. |
| R-003 | Product teams deprioritizing v2 endpoints | — | — | — | 🟢 Resolved Apr 3. |
| R-004 | Legal commitment to v1 EoL Sep 30 — no slip room | Medium | Critical | Marcus Bauer | 🟡 Active. 46 customers still on v1 (8 mid-market, 38 SMB). SMB is on trajectory. The mid-market 8 are the hard constraint, and they sit in front of a date Legal committed contractually. |
| R-006 | Mid-market velocity gap not surfaced to executive sponsor | — | — | James O. | 🟢 Resolved. Escalated and Compass flexed Jul 17. Worth recording the outcome: the escalation was made, the intervention was approved, it worked — and it still missed by 8, because the intervention started in mid-July for an Aug 1 date. |
| R-005 | Thornbridge Capital v1 EoL communication | Medium | High | James O. / Kai Muller | 🟡 **Escalated.** Sophie Andersson executed the base renewal Jul 1 but held the $1.7M expansion tranche pending written confirmation of the final v1 EoL date. The M6 miss on Aug 1 is exactly why she is asking. Kai Muller cannot answer credibly until M6 closes. |
| **R-007** | **The last 8 mid-market integrations need engineering, not tooling** | **Medium** | **High** | **James O.** | 🔴 **Active. 4 custom webhook chains, 2 legacy auth flows, 2 on deprecated batch endpoints. Two engineers assigned Aug 3 for an Aug 21 target — 18 days for 8 bespoke migrations, roughly 2 days each with no buffer. If any one turns out to need customer-side change, it will not land.** |
| **R-008** | **v1 infrastructure is being scaled down faster than customers are leaving it** | **Medium** | **Medium** | **Ingrid S.** | 🟡 **Active. INC-2026-0131 (Aug 6): v1 gateway capacity was reduced in July on a curve that assumed the mid-market tail would be gone by Aug 1. Two of the remaining 8 run high-volume batch jobs and now dominate a much smaller pool. Gateway scaled back up. Re-plan capacity reduction against actual remaining traffic, not customer count.** |

---

## Key events (June 28 – August 10)

| Date | Event |
|------|-------|
| Jul 17 | SMB passes 90% (575/639). Compass Migration Partners flexed onto mid-market as planned |
| Aug 1 | **M6 misses at 202/210.** 8 complex integrations remain |
| Aug 1 | DR-015: revised M6 target Aug 21, two dedicated engineers approved |
| Aug 3 | Engineers assigned. MERIDIAN-7 shutdown sequencing epic opened |
| Aug 6 | INC-2026-0131 — v1 gateway latency for remaining batch integrations; capacity restored |

---

## Inbound dependencies

| Needs from | What | When | Status |
|-----------|------|------|--------|
| NEXUS | CI/CD unified pipeline | Jun 2026 | ✅ Delivered Jul 3 |

## Outbound dependencies

| Program | What MERIDIAN provides | When needed | Status |
|---------|----------------------|-------------|--------|
| ATLAS | Enterprise SDK v2 features | May 2026 | ✅ Delivered |
| HORIZON | Mobile push notification endpoints | Apr 2026 | ✅ Delivered Apr 3 |
| SHIELD | API audit logging (v2 only — 8 controls) | Apr 2026 | ✅ Delivered Apr 3 |
| **Sales (Thornbridge)** | **Written confirmation of final v1 EoL date** | **Blocking $1.7M expansion** | 🔴 **Cannot be given until M6 closes** |

---

## Stakeholders

| Name | Role | Engagement |
|------|------|-----------|
| Ingrid Solvang | Dir. Platform — Executive Sponsor | Weekly |
| James Obi | PM DevEx — daily partner | Daily |
| Lara Costa | DevEx Eng Lead | Daily |
| CRO | Customer migration impact | Monthly |
| Legal | Sep 2026 contract commitment | As needed |

---

## Latest update (August 10, 2026)

MERIDIAN migrated 295 customers in six weeks and still missed its milestone. Both halves of that sentence are true and the program should hold them together.

The Compass flex was a good plan executed correctly. SMB passed 90% on Jul 17, Compass pivoted to mid-market that week, and mid-market went from 163 to 202 in three weeks. It missed Aug 1 by 8 customers because the intervention began in mid-July for an Aug 1 date — the plan was sound and the runway was not. R-006 is now closed, and the honest closing note is that the escalation happened, the intervention was approved, it worked, and it was still too late. That is a more useful lesson than "we should have escalated."

**The remaining 8 are a different problem entirely.** Four custom webhook chains, two legacy auth flows, two on deprecated batch endpoints. Nothing that moved the other 202 — self-service tooling, guides, partner-assisted migration — reaches any of them. DR-015 assigned two engineers on Aug 3 for an Aug 21 target: 18 days, 8 bespoke migrations, no buffer (R-007).

Two consequences are already visible. **Thornbridge held $1.7M.** Sophie Andersson executed the base renewal on Jul 1 but will not sign the expansion until she has the final v1 EoL date in writing, and the Aug 1 miss is precisely why she is asking. Kai Muller cannot answer her credibly until M6 closes — a delivery slip converted directly into a commercial one. **And v1 infrastructure is being torn down faster than customers are leaving it**: the Aug 6 gateway incident happened because July capacity reductions assumed this tail would be gone (R-008).

Sep 30 EoL is still credible — five weeks of margin behind Aug 21, enterprise complete, SMB at 94% and tracking. But the margin now belongs to eight customers who each need hand-built work, and the same eight are the most likely to break loudly when v1 actually goes dark.
