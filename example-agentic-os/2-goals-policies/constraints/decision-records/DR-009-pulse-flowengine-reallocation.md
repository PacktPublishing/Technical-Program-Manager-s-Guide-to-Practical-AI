# DR-009 — PULSE FlowEngine Reallocation Authorized

| Field | Value |
|-------|-------|
| **DR ID** | DR-009 |
| **Date** | June 15, 2026 |
| **Decision maker** | Amara Osei (SVP Data & Analytics) |
| **Informed** | Karl Bergstrom (CTO), Yuna Park (TPM PULSE), CFO (Yuki Tanaka) |
| **Programs affected** | PULSE |
| **Status** | Active — engineers ramping, in effect through August 31, 2026 |

---

## Context

At CFO QBR May 27, Amara Osei presented PULSE dual-run cost status: $890K accrued, $1.04M projected by August 12 (original M4 FlowEngine close date). The CFO gave Amara until **June 15** to propose an acceleration path or formally accept the August 12 date.

FlowEngine had been stalled at 47-48% since the April 15 "SDK first" decision, with only 20% team allocation (Stream Processing team is the bottleneck — they own FlowEngine and were exclusively allocated to their SDK deliverable through June).

With MERIDIAN M3 (JS + Java SDK GA) closing May 31 and MERIDIAN M5 (enterprise 100%) closing June 1, the Stream Processing team's primary external commitment was complete. Two engineers became available for reallocation.

---

## Decision

Effective June 15, 2026 through **August 31, 2026**:

- **2 engineers from the Stream Processing team** are reallocated to FlowEngine migration support.
- FlowEngine team allocation increases from 20% to ~35% effective capacity.
- **M4 target revised: August 12, 2026 → July 25, 2026** (18-day pull-forward).
- Additional cost authorized: **$150K** for the reallocation period (engineer time + overtime buffer).
- Projected total dual-run cost at July 25 close: **$1.2M** (vs $1.04M at original Aug 12 — $150K higher due to earlier acceleration spend, $30K savings from shorter dual-run period).

---

## Velocity expectations

| Sprint | Period | FlowEngine migrated | Expected % |
|--------|--------|---------------------|------------|
| Sprint 15 (baseline) | Jun 1-12 | ~7/sprint | 50% |
| Sprint 16 (ramp) | Jun 15-26 | ~18/sprint (new team ramping) | 55% |
| Sprint 17 | Jun 29-Jul 10 | ~28/sprint (fully ramped) | 63% |
| Sprint 18 | Jul 13-24 | ~28/sprint | 71% |
| Sprint 19 (final) | Jul 25 | Close window | 100% |

*First real velocity signal from new composition: Sprint 17 velocity data (close ~July 10).*

---

## Conditions and monitoring

- Yuna Park to report FlowEngine velocity at each SteerCo beginning July 3.
- If Sprint 17 velocity does not reach ≥20/sprint, the July 25 target is at risk and Amara must be escalated within 48 hours.
- CFO QBR Q3 (August) will include M4 close confirmation and final dual-run cost reconciliation.
- $1.2M total cost ceiling is the agreed-upon cap. Any overrun requires separate CFO authorization.

---

## Related

- DR-002 (MERIDIAN SMB partner — Stream Processing freed after SDK delivery)
- PULSE M4 — FlowEngine pipelines 100% migrated (target: July 25, 2026)
- PULSE M6 — Airflow decommission (date now: September 30, 2026)
- PULSE dual-run cost tracking: $890K accrued as of May 26 → $1.2M projected at July 25
