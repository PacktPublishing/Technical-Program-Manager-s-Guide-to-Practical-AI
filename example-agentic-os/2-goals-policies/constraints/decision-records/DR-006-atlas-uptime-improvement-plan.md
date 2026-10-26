# DR-006 — ATLAS NovaAI Uptime Improvement Plan Authorized

| Field | Value |
|-------|-------|
| **DR ID** | DR-006 |
| **Date** | June 2, 2026 |
| **Decision maker** | Leo Nakamura (Dir. NovaAI Engineering) |
| **Informed** | Karl Bergstrom (CTO), Marcus Chen (TPM ATLAS), Rachel Lim (CPO) |
| **Programs affected** | ATLAS |
| **Status** | Authorized and in progress |

---

## Context

Karl Bergstrom established June 1 as the hard deadline for Leo Nakamura to deliver a NovaAI uptime improvement plan (DR-003, May 13). The baseline uptime metric from April monitoring was 94.2% actual vs 99.5% SLA commitment — a 5.3-point gap that made enterprise GA commitments indefensible.

M6 (SLA monitoring infrastructure) was funded separately via Karl's May 13 intervention. M6 monitors uptime; it does not improve it. These are distinct workstreams. The fruit bowl diagnostic (May 20) flagged this gap as the primary 🍉 Watermelon signal: RAG read 🟡 Amber but the uptime improvement path had no owner, no ticket, and no timeline.

Leo delivered a written plan June 2 (one day after the Karl-imposed deadline). Karl accepted the plan without penalty given the quality of the submission.

---

## Decision

Leo Nakamura is authorized to execute a NovaAI uptime improvement program targeting **99.0% uptime by June 25, 2026**, via two primary interventions:

1. **Async inference refactor** — Replace synchronous blocking calls in the model serving path with async queue-backed processing. Reduces timeout cascades that account for ~60% of observed downtime events. Work assigned to 2 senior Model Serving engineers. Target completion: June 18.

2. **Connection pool tuning** — Auth0 token validation under load is consuming connection pool capacity and causing request queuing under traffic spikes. Tuning parameters and adding connection pool expansion headroom. Target completion: June 10.

Secondary (post-GA):
3. **Circuit breaker implementation** — Protect model serving endpoints from cascade failures when upstream services degrade. Target: July 31.

---

## Outcome tracker

| Date | Uptime (7-day rolling) | Note |
|------|----------------------|------|
| May 13 baseline | 94.2% | Karl's forcing function |
| Jun 10 (connection pool fix) | 96.1% | +1.9 points — connection pool tuning complete |
| Jun 20 (async inference) | 97.8% | +3.6 points from baseline — ahead of 99.0% target |
| Jun 28 (current) | 97.8% | Holding. Final ~1.2 points require circuit breaker (July) |

---

## Constraints and caveats

- The 99.5% SLA committed to enterprise customers is not yet achievable by GA (June 30). GA communications will note: "97.8% current uptime, targeting 99.5% by end of Q3 per improvement plan."
- The circuit breaker work (targeting 99.5%+) is on the July roadmap. Leo owns it. Marcus Chen to track in ATLAS risk register as R-006 (ongoing).
- If uptime regresses before circuit breaker ships, Karl reserves the right to escalate to CEO as originally threatened.

---

## Related

- DR-003 — ATLAS SLA monitoring (VP Eng forcing function, May 13)
- DR-007 — Model Serving allocation split (Jun 4) — freed up capacity for uptime work
- ATLAS Risk R-002, R-006
