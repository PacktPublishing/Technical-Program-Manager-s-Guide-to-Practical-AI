# DR-002 — MERIDIAN: SMB Migration Partner Engagement Approved

> *Fictional example: NovaGrid, Inc. is an invented company. All people, customers, numbers and events in this file are made up for the book.*

| Field | Value |
|-------|-------|
| **Decision ID** | DR-002 |
| **Date** | May 8, 2026 |
| **Decision maker** | Ingrid Solvang (Dir. Platform & Infrastructure) |
| **Stakeholders** | James Okonkwo (MERIDIAN TPM), Marcus Bauer (CFO), Legal |
| **Programs affected** | MERIDIAN |
| **Status** | ✅ Decided |

---

## Decision

**Ingrid Solvang approves a 90-day contract engagement with Compass Migration Partners to drive SMB customer migration from v1 to v2 API.**

3 contract migration specialists, starting May 20, 2026. Total engagement cost: $240K.

---

## Background

MERIDIAN has 434 SMB customers on v1 API with a hard legal EoL commitment of September 30, 2026 (contractually committed to 3 enterprise customers). Self-migration tooling launched April 18, 2026. Self-service migration rate among SMB is tracking at approximately 15% per month without active outreach — at that rate, ~260 customers would still be on v1 by September 30.

James Okonkwo re-escalated May 5 with a concrete proposal after his initial escalation (March 11) went 55 days without a response. The proposal:

| Option | Description | Cost | SMB migrated by Sep 30 | Risk |
|--------|-------------|------|------------------------|------|
| **A — 3 contract specialists (chosen)** | Active outreach, onboarding, 1:1 migration support for SMB customers | $240K | 95%+ | Low |
| B — 2 internal CS reassignments | Redirect 2 existing CSMs to migration support | $0 incremental | ~70% | Medium — disrupts existing accounts |
| C — Do nothing | Self-service only | $0 | ~40–50% | High — EoL breach |

**Ingrid's decision:** "Approve Option A. The $240K is well below the dual-infrastructure savings we capture if EoL holds September. More importantly, we can't breach the Legal commitment."

---

## Rationale

- Dual-infrastructure cost from a September EoL slip: $2.1M/year ongoing (full dual-infra) or $175K/month
- Even a 1-month slip costs ~$175K — the $240K partner engagement pays for itself if it prevents any slip
- Legal committed v1 EoL Sep 30 to 3 enterprise customers in their contracts — breach triggers breach-of-contract exposure
- James's 55-day escalation cycle reflects a structural gap in SMB migration ownership; this decision closes it

---

## What changes immediately

| Item | Change |
|------|--------|
| Compass Migration Partners engagement | Signed week of May 12. Onboarding May 20 start. |
| MERIDIAN R-002 risk status | Changes from 🔴 Unmitigated → 🟡 In progress |
| SMB migration trajectory | Expected to reach 95%+ by Sep 30 with active partner support |
| James Okonkwo responsibility | James coordinates partner weekly; Compass handles direct customer contact |

---

## Constraints

- Compass specializes in API migration support; they do NOT own engineering decisions or tooling changes
- If the v2 API has gaps that block specific SMB customers, James must triage and escalate to DevEx — Compass cannot unblock technical issues
- Compass engagement limited to 90 days (May 20 – Aug 18). If customers are still on v1 after Aug 18, a handoff plan must be ready by Aug 1.

---

## Related decisions

- MERIDIAN M4 (migration tooling) completed Apr 18 — tooling was the prerequisite for this engagement
- MERIDIAN R-004 (Legal EoL commitment) — this decision is the primary mitigation for that risk
