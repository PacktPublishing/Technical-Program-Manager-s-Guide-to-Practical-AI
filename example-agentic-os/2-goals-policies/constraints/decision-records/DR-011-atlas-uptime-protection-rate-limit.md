# DR-011 — ATLAS Uptime Protection: Emergency Capacity + Tenant Onboarding Rate Limit

> *Fictional example: NovaGrid, Inc. is an invented company. All people, customers, numbers and events in this file are made up for the book.*

| Field | Value |
|-------|-------|
| **DR ID** | DR-011 |
| **Date** | July 6, 2026 |
| **Decision maker** | Leo Nakamura (Dir. NovaAI) |
| **Informed** | Marcus Chen (TPM ATLAS), Rachel Lim (CPO), Karl Bergstrom (CTO), Kai Muller (AE, Corinthia Bank) |
| **Programs affected** | ATLAS · SPARK (second-order) |
| **Status** | Complete — rate limit lifted August 3, 2026 |

---

## Context

ATLAS GA soft-launched June 30 with Apex Health and Finex Capital live; Corinthia Bank signed July 2 as the third production customer.

Six days after launch, sustained inference traffic reached roughly **3x the pre-GA baseline** as all three customers moved production workloads onto the platform. At **13:04 on July 6**, the Datadog SLO burn alert fired: rolling 7-day NovaAI uptime had fallen to **96.8%**, below the **97.0% internal floor** and far below the 99.0% commitment made for July.

Root cause (INC-2026-0121): model serving pods were saturating under queue pressure and returning 5xx. The async inference refactor delivered under DR-006 had been sized against pre-GA traffic assumptions, and there was no circuit breaker to shed load gracefully — so saturation surfaced to customers as errors rather than as queuing.

The decision had a hard deadline of 17:00 the same day. Corinthia Bank's tenant provisioning was scheduled for that week.

---

## Decision

Effective **July 6, 2026 at 17:00**, two actions taken together:

1. **Emergency inference capacity added** — +40% model serving pods, applied manually at T+90min. Buys headroom; does not fix the failure mode.
2. **New tenant onboarding rate-limited to zero** until rolling uptime holds above 98.5% for seven consecutive days. No new enterprise tenants provisioned while the platform is below its internal floor.

**The second action is the substance of this decision.** The first was operational triage that would have happened regardless.

### Accepted consequence

ATLAS **M7 (first 5 enterprise GA customers) is frozen at 3/5** for the duration. The 4th and 5th customers cannot be onboarded. M7's target moves from June 30 to **September 15, 2026**.

This was made explicit at the time of the decision, not discovered afterwards. The program is spending a milestone to protect the SLA of the customers it already has.

---

## Rationale

Three enterprise customers were in production, one of them (Apex Health) a healthcare organisation running patient risk-stratification workloads. Onboarding a fourth tenant onto a platform already below its uptime floor would have degraded service for all four to reach a milestone number.

Rachel Lim's position: "The GA announcement said three customers. It did not say five. Adding a fourth to a platform we know is struggling is how you turn a good quarter into a reference-customer problem."

---

## Structural fix

The rate limit is a holding action. The actual fix is **ATLAS F6 — circuit breaker on model serving endpoints** (stage 3 of the DR-006 uptime plan), accelerated from a Jul 31 stretch target to a firm commitment.

| Date | Event | Rolling uptime |
|------|-------|----------------|
| Jul 6 | SLO burn alert; DR-011 taken | 96.8% |
| Jul 6–31 | Emergency capacity holding, onboarding frozen | 97.9% |
| **Jul 31** | **F6 circuit breaker live in production** | **98.9%** |
| Aug 3 | Rate limit lifted, 4th customer onboarding resumed | 98.9% |

**July month average: 97.1% against a 99.0% commitment.** The commitment was missed and was reported as missed.

A follow-on item, **F7 (inference capacity autoscaling)**, replaces the manual capacity add with an automatic one. At 65% as of Aug 10, target Sep 15.

---

## Customer communication

- **Apex Health** — Marcus Chen contacted Derek Huang proactively on the afternoon of Jul 6, before Apex raised a ticket. Derek's response was explicitly positive about the disclosure. Notified again Aug 3 on recovery.
- **Finex Capital** — Alicia Monroe briefed Jul 7, accepted the Jul 31 circuit breaker date.
- **Corinthia Bank** — Kai Muller told Henrik Svensson directly that provisioning was being held and why. Henrik read it as disciplined operations. Provisioning resumed Aug 3.

The proactive disclosure is why none of the three became an account escalation. That credit is now spent — see ATLAS R-008.

---

## Conditions and monitoring

- Rate limit lifts only after 7 consecutive days above 98.5% rolling uptime. **Met Aug 3.**
- 99.5% SLA target remains unmet and is not claimed in any customer-facing material.
- M9 (15 enterprise customers by Dec 31) is now unreachable at demonstrated pace — the freeze cost roughly one customer of conversion. Renegotiate at the Q3 QBR with the freeze as the stated cause (ATLAS R-009).

---

## Related

- DR-003 — ATLAS SLA (Karl Bergstrom forcing function, May 13)
- DR-006 — ATLAS uptime improvement plan (Jun 2); F6 circuit breaker is stage 3 of that plan
- DR-007 — Model Serving allocation split; the July uptime response drew shared engineers onto F6, which is the mechanism behind SPARK R-010
- INC-2026-0121 — SEV2, Jul 6, inference API 5xx under GA load
- SUPP-017 — L3 ticket, held open 25 days by choice until the structural fix shipped
- ATLAS M7 — revised Jun 30 → Sep 15, 2026
