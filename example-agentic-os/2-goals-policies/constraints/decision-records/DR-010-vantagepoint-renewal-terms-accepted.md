# DR-010 — VantagePoint Renewal Roadmap Terms Accepted

> *Fictional example: NovaGrid, Inc. is an invented company. All people, customers, numbers and events in this file are made up for the book.*

| Field | Value |
|-------|-------|
| **DR ID** | DR-010 |
| **Date** | June 12, 2026 |
| **Decision maker** | Daniel Rios (TPM SPARK) + VantagePoint partnership contact |
| **Informed** | Leo Nakamura (Dir. NovaAI), Rachel Lim (CPO), CRO |
| **Programs affected** | SPARK |
| **Status** | Terms accepted. Legal review in progress. Contract signature expected by July 15. |

---

## Context

VantagePoint ($1.8M annual contract) was at renewal risk due to NovaAI v2 product timeline uncertainty. As of May 20, renewal probability was **55%** — driven by VantagePoint's concern that the v2 roadmap was undefined and they couldn't commit to another year without seeing SPARK milestone commitments.

Daniel Rios was tasked (Jun 1 deadline, from this-week.md escalation #3) to deliver a committed SPARK roadmap document to VantagePoint. The document included:
- SPARK M4 (Vector Store v2) completed May 29 — now generally available
- SPARK M2 (model serving alpha) August 11, 2026
- SPARK M3 (visual workflow builder beta) September 30, 2026
- SPARK M7 (v2 GA) December 31, 2026
- Specific feature commitments tied to VantagePoint use cases: multi-modal input (Nov 30), evaluation framework (Aug 31)

Daniel delivered the document June 1. VantagePoint responded June 9 with acceptance of the roadmap as a basis for renewal terms and a request to begin legal review.

---

## Decision

VantagePoint has accepted the SPARK roadmap document as the commitment basis for renewal. Terms:

- **Renewal value:** $1.8M (same as prior year)
- **Contract period:** July 1, 2026 – June 30, 2027
- **SLA:** 99.5% API uptime (caveat: SPARK M7 GA target Dec 31; NovaAI v1 SLA governs until then)
- **Roadmap commitments:** SPARK M2 (Aug 11), M3 (Sep 30), M5 multi-modal (Nov 30), GA Dec 31. VantagePoint has right to reduce spend if GA slips past March 31, 2027.
- **Milestone review meeting:** Quarterly. First: September 15, 2026 (post-M2 close).

---

## Probability update

| Date | Renewal probability | Driver |
|------|---------------------|--------|
| May 20 | 55% | Roadmap uncertainty |
| Jun 1 | 65% | Roadmap document delivered |
| Jun 9 | 72% | VantagePoint positive response |
| Jun 12 | 85% | Terms accepted — legal review started |
| Target (Jul 15) | 95%+ | Contract signature expected |

---

## Risks

- **Summer legal cycle delay.** VantagePoint's legal team is smaller in July-August. Daniel to follow up July 1, July 8 to prevent stall.
- **SPARK M2 slip risk.** If M2 slips past August 11, VantagePoint's September 15 review may surface concern. Model Serving allocation (DR-007) is the primary mitigation.

---

## Related

- DR-005 — SPARK M3 schedule correction (May 6)
- DR-007 — Model Serving allocation split (Jun 4) — underpins M2 delivery confidence
- SPARK M4 ✅ May 29 — strongest signal to VantagePoint that SPARK executes
