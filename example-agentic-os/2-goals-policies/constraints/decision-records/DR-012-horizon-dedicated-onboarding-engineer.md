# DR-012 — HORIZON Dedicated Onboarding Engineer for the Beta Cohort

| Field | Value |
|-------|-------|
| **DR ID** | DR-012 |
| **Date** | July 8, 2026 |
| **Decision maker** | Ingrid Solvang (Dir. Platform & Infra) |
| **Proposed by** | Priya Kaur (TPM HORIZON) |
| **Informed** | Rachel Lim (CPO), Karl Bergstrom (CTO), Raj Patel (Mobile Eng Lead) |
| **Programs affected** | HORIZON |
| **Status** | Complete — M6 closed July 22, 2026 |

---

## Context

HORIZON's beta cohort opened July 2, 48 hours behind plan (absorbed) after NEXUS IAM went live June 30. M6 required **10 enterprise customers onboarded by July 15**.

At July 5, the cohort stood at **4/10**. Onboarding was being handled by the Mobile team alongside their build work, and each customer was taking roughly 2.5 engineer-days of hands-on setup — SSO configuration, device enrolment, alert routing. At the observed pace the cohort would reach approximately **7 by July 15**, not 10.

Kestrel Media Group's $800K July 15 tranche and Solaris Logistics' $2.4M opportunity both sit behind this cohort.

---

## Decision

Effective **July 13, 2026**: one engineer from the Mobile team is assigned **full-time to beta cohort onboarding**, removed from feature work for the duration of the beta.

Duration: through M6 close. Reviewed at soft GA.

---

## Outcome

| Date | Cohort | Note |
|------|--------|------|
| Jul 5 | 4/10 | Pace landing ~7 by Jul 15 |
| Jul 8 | 4/10 | DR-012 approved |
| Jul 13 | 5/10 | Dedicated engineer ramped |
| Jul 15 | 6/10 | **M6 target date missed** — revised to Jul 22 |
| **Jul 22** | **10/10** | **M6 closed — 7 days late** |

The dedicated engineer took the cohort from 4 to 10 in nine working days once ramped.

---

## Assessment — the decision was right and it was late

This decision worked. It should also be recorded that **the signal it responded to was visible before the escalation was made.**

Onboarding cost per customer was measurable from the first week of beta. At 2.5 engineer-days each, 10 customers was never going to fit alongside feature work in a 13-day window — that arithmetic was available on July 2, and arguably in late June during cohort planning. The decision was taken on July 8 and took effect July 13, which left nine days to do fourteen days of work.

Had the same decision been made in late June, July 15 would have held.

**The useful lesson is not "escalate sooner" in the abstract.** It is that HORIZON was tracking cohort *count* (4/10) and not cohort *cost* (2.5 days each). The count only becomes alarming when it is already too late; the cost was alarming immediately. Priya has added per-customer onboarding effort to the weekly beta report.

---

## Second-order consequence

The engineer was scoped for **onboarding**, not for **run**. Soft GA (Jul 31) and the coming public GA (Aug 31) generate ongoing support load rather than one-time setup load — mobile L1 ticket volume rose sharply from Jul 31.

No owner has been assigned for post-GA mobile support. This is tracked as **HORIZON R-008** and needs resolving before public GA, not after.

---

## Related

- DR-004 — HORIZON Solaris commitment
- DR-008 — HORIZON GA definition (soft GA Jul 31, App Store GA Aug 31)
- HORIZON M6 — Beta with 10 enterprise customers, closed Jul 22 (7 days late)
- HORIZON R-008 — post-GA support load has no owner
- OPP-2026-203 (Kestrel) — tranche 1 $800K released Jul 15
