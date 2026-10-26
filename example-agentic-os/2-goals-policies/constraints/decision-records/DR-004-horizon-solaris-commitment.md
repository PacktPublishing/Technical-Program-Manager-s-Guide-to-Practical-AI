# DR-004 — HORIZON: Solaris Logistics Jul 31 GA Commitment Issued

> *Fictional example: NovaGrid, Inc. is an invented company. All people, customers, numbers and events in this file are made up for the book.*

| Field | Value |
|-------|-------|
| **Decision ID** | DR-004 |
| **Date** | May 9, 2026 |
| **Decision maker** | Jennifer Wu (AE, Solaris account) + Ingrid Solvang (Dir. Platform) approval |
| **Stakeholders** | Priya Kaur (HORIZON TPM), Jennifer Wu (AE), Tom Okafor (Solaris Logistics CTO), Sara Lindqvist (NEXUS TPM) |
| **Programs affected** | HORIZON |
| **Status** | ✅ Decided — commitment letter sent |

---

## Decision

**NovaGrid issued a formal written commitment to Solaris Logistics (Tom Okafor) that HORIZON mobile GA will be available July 31, 2026**, contingent on IAM completion (NEXUS Auth0-only path, now authorized — see DR-001).

Solaris has paused the Palantir mobile evaluation. Deal probability: elevated from 30% to 65%.

---

## Background

Solaris Logistics ($2.4M ACV deal) had entered a competing evaluation with Palantir after HORIZON's GA slipped from July 31 to August 31 (Auth0 cascade confirmation, week of April 13). Tom Okafor had communicated a 30-day evaluation window (expiring approximately May 10) before a vendor selection decision.

The NEXUS Auth0-only authorization (DR-001, May 1) reopened the July 31 GA recovery window. Within the same day (May 1), Priya Kaur alerted Jennifer Wu. Jennifer Wu briefed Tom Okafor informally May 2.

Tom's response: "If you can put July 31 in writing by end of next week with a clear dependency chain, we pause the Palantir eval."

---

## Commitment letter contents (summary)

- HORIZON GA: **July 31, 2026** (conditional on NEXUS IAM Auth0-only delivery Jun 30)
- Beta access for 5 Solaris users: **July 15, 2026** (alongside Kestrel beta cohort)
- Enterprise mobile SSO: included in GA scope
- Contingency clause: if NEXUS IAM slips past Jun 30 for reasons outside NovaGrid control, GA target adjusts proportionally with 30-day notice to Solaris

Ingrid Solvang signed off on the commitment letter May 8. Jennifer Wu delivered it to Tom Okafor May 9.

---

## Risk accepted

This commitment creates a hard external dependency chain: **NEXUS IAM (Jun 30) → HORIZON beta (Jul 15) → HORIZON GA (Jul 31)**. Any NEXUS IAM slip directly triggers a breach of the Solaris commitment.

| Risk | Likelihood | Owner | Mitigation |
|------|-----------|-------|-----------|
| NEXUS IAM slips past Jun 30 | Low-Medium | Sara Lindqvist | Auth0-only path fully resourced. Sara tracking weekly. Escalation protocol to Yuki if any slip detected before Jun 15. |
| Solaris scope creep in beta | Low | Priya Kaur | Beta scope fixed in commitment letter. Any additions require commercial amendment. |

---

## What was NOT committed

- Data entry or modification features in mobile v1 (out of scope per HORIZON scope definition)
- React Native version (native iOS/Android only)
- Full web app feature parity

---

## Context: Kestrel deal status at time of this decision

Kestrel Media Group (DR: confirmed Apr 24) was already in legal contract drafting as of April 27. Kestrel partial delivery ($800K) by Jul 15, full GA ($800K) Oct 2026. The Solaris commitment aligns with the same July 15 beta cohort.

---

## Related decisions

- DR-001: Auth0-only IAM authorization (May 1) — prerequisite for this commitment
- Kestrel scope confirmed: SteerCo Apr 24 — separate deal, same beta timeline
