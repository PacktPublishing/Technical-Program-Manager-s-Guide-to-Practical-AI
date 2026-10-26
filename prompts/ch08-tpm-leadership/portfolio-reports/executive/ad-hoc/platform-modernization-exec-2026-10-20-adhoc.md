# Platform Modernization — Executive Portfolio Report (Ad hoc)

**Portfolio:** Platform Modernization · **Health:** 🔴 Red (→ vs 2026-10-15) · **Date:** 2026-10-20 · **Programs reported:** 4/4 (ad hoc)

**Summary:** Portfolio health is still Red because Kubernetes Platform Consolidation (P0; BB-2, BB-3) is Red pending its re-baseline decision (P2 3P 2026-10-20). Two of the three 2026-10-15 asks are now met: Program 1's Security review is scheduled for 2026-10-23 (in line with D-04), and Cloud Finance approved Program 2's capacity (P1, P2 3P 2026-10-20). **Main ask:** decide PRG2-170 by 2026-10-22.

## Executive attention

| # | Ask | Why now | Impact on big bet / OKR | By when |
|---|---|---|---|---|
| 1 | Platform leadership: approve or reject the Program 2 re-baseline (M3 → 2026-11-14, M4 → 2026-12-12; PRG2-170). Adding headcount is not an option under D-03. | M3 (2026-10-31) will be missed without a decision; 2 engineers leave 2026-11-01 (P2 3P) | BB-2, BB-3; O1-KR2 (2027-01-31). A 2026-12-12 M4 still leaves M5 on 2027-01-16 inside the KR (P2 3P) | 2026-10-22 |
| 2 | CISO: give a review date for Program 4's default-deny design (SEC-91). D-04 prioritizes P0 programs only; Program 4 is P1 and has been queued since 2026-10-02. | Yellow twice in a row; M3 sign-off is needed before 2026-11-25 (P4 3P) | BB-1; O3-KR1 (2026-12-15) | 2026-10-22 |

**Closed since 2026-10-15:**
- Security slot for Program 1: SEC-88 scheduled for 2026-10-23 (P1 3P).
- Cloud Finance capacity for Program 2: CF-512 approved 2026-10-19 (P2 3P).

## Programs

| Program | Priority | Owner | Health | Trend | Next milestone | Top issue |
|---|---|---|---|---|---|---|
| Kubernetes Platform Consolidation | P0 | Marcus Webb, Staff TPM | 🔴 Red | → | M3 Stateful workloads 2026-10-31 (Low) | Re-baseline decision pending (PRG2-170) |
| Program 1 | P0 | Daniella, Senior TPM | 🟡 Yellow | ↑ | M3 Dry run 2026-10-24 (Med) | 3 billing-table mismatches; Finance Data dependency (Unverified) |
| Zero-Trust Network Segmentation | P1 | Rahul Mehta, Senior TPM | 🟡 Yellow | → | M2a Namespace policies 2026-10-28 (Med) | Security review unscheduled for 18 days |
| Observability Consolidation (DataDog) | P2 | Aisha Okafor, TPM | 🟢 Green | → | M3 SLO dashboards 2026-10-30 (High) | Spend +6% vs +5% guardrail; Splunk go/no-go 2026-11-10 |

## Cross-program risks and bottlenecks

- **Bottleneck: Security Eng** (Programs 1 and 4). The P0 slot is resolved; the P1 slot isn't (P1, P4 3P).
- **Chain: Program 4 M2b (2026-11-11) → Program 2 M4.** This leaves 10 days on the current M4 date, or 31 days if re-baselined (P2, P4 3P).
- **Chain: Program 2 decision → Program 3 Splunk go/no-go (2026-11-10).** O2-KR1 depends on the Program 2 waves (P3 3P).
- **Chain: Program 1 M5 → Program 2 M5.** Unchanged; about 5 weeks of float (P2 3P 2026-10-15).

## Gaps

- **Unverified:**
  - P1: Finance Data team dependency (Slack only)
  - P2: backfill denial (Slack only)
- **Missing:** P1: #program-1-eng.
- **Conflict:** P2 migrated count, 44 in Jira vs 46 in the tracker (Jira used).
- **Program reports:** all four are ad hoc drafts awaiting owner confirmation (P1, P2).

Saved as portfolio-reports/executive/ad-hoc/platform-modernization-exec-2026-10-20-adhoc.md.
