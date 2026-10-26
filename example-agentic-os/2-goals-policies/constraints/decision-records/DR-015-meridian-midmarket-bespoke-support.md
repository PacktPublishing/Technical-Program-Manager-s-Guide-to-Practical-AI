# DR-015 — MERIDIAN Mid-Market Long Tail: Bespoke Migration Support and Revised August 21 Target

| Field | Value |
|-------|-------|
| **DR ID** | DR-015 |
| **Date** | August 1, 2026 |
| **Decision maker** | Ingrid Solvang (Dir. Platform & Infra) |
| **Proposed by** | James Okonkwo (TPM MERIDIAN) |
| **Informed** | Karl Bergstrom (CTO), Legal, Kai Muller (AE, Thornbridge Capital), Lara Costa (DevEx Eng Lead) |
| **Programs affected** | MERIDIAN |
| **Status** | Active — target August 21, 2026 |

---

## Context

MERIDIAN M6 required **100% of mid-market customers (210) on v2 API by August 1, 2026**.

The plan worked. Compass Migration Partners flexed from SMB onto mid-market on July 17 once SMB passed 90%, exactly as James Okonkwo had scoped in June. Mid-market moved from 163 to 202 customers in three weeks.

**M6 still missed, at 202/210.**

The remaining 8 customers are not slow adopters. They are:

| Type | Count | Why self-service cannot reach them |
|------|-------|-----------------------------------|
| Custom webhook chains | 4 | Multi-hop webhook topologies with customer-side retry logic keyed to v1 response shapes |
| Legacy auth flows | 2 | Pre-2024 API key patterns with no v2 equivalent; needs a per-customer bridge |
| Deprecated batch endpoints | 2 | Running high-volume batch jobs against endpoints v2 deliberately did not reimplement |

None of these are reachable by migration tooling, guides, or partner-assisted outreach — the three mechanisms that moved the other 202.

---

## Decision

Effective **August 3, 2026**:

- **Two Developer Experience engineers assigned full-time** to the remaining 8 mid-market integrations, one customer at a time.
- **M6 target revised: August 1 → August 21, 2026.**
- Compass Migration Partners returns focus to SMB (38 remaining) through the end of their Sep 30 engagement.
- A new epic, **MERIDIAN-7**, opened for v1 shutdown sequencing so that teardown planning proceeds in parallel rather than waiting on M6.

---

## Rationale

Three weeks was chosen over a faster target deliberately. Eight bespoke migrations at roughly two days each is 16 engineer-days across two engineers — about 18 calendar days with no buffer.

The alternative considered and rejected was **forcing the 8 onto v2 with compatibility shims** to hit an earlier date. Rejected because these same 8 integrations are the ones most likely to break loudly at the September 30 v1 shutdown, and a shim would move the breakage from a controlled migration window into the EoL event itself.

Ingrid Solvang's position: "The Sep 30 date is contractual. I would rather be three weeks late on M6 and confident on September 30 than on time in August and surprised at EoL."

---

## Consequences already visible

**Thornbridge Capital held $1.7M.** Sophie Andersson executed the base renewal on July 1 but declined to sign the $1.7M expansion tranche until she has the final v1 EoL date in writing. The Aug 1 miss is precisely why she is asking — she is not requesting a faster EoL, she is asking whether September 30 is credible. Kai Muller cannot answer her until M6 closes. Opportunity probability moved 88% → 84%, close date Jul 1 → Sep 30.

**v1 infrastructure was scaled down ahead of the customers.** INC-2026-0131 (Aug 6): v1 gateway capacity was reduced through July on a curve that assumed the mid-market tail would be gone by August 1. Two of the remaining 8 run high-volume batch jobs and now dominate a much smaller capacity pool; p99 hit 1.4s. Gateway restored to its June footprint. **Capacity reduction must track actual remaining traffic, not remaining customer count** (MERIDIAN R-008).

---

## Assessment

Worth recording precisely, because the obvious lesson is the wrong one.

MERIDIAN escalated the mid-market velocity gap (R-006), the intervention was approved, Compass flexed on schedule, and it moved 39 customers in three weeks. **The escalation was made, the plan was right, and it still missed** — because the intervention began in mid-July for an August 1 date.

The gap was not in noticing or in escalating. It was that the flex was gated on SMB reaching 90%, which was forecast for ~July 15 and landed July 17. The mid-market plan was structurally dependent on an SMB milestone with no independent path, so the earliest possible start date was always two weeks before the deadline.

The second lesson is about segmentation: mid-market was tracked as one population of 210 with one migration mechanism. The 8 bespoke integrations were distinguishable months earlier by integration type, and could have been resourced separately from the 202 that self-service was always going to reach.

---

## Conditions and monitoring

- M6 target Aug 21. **No buffer** — if any one of the 8 requires customer-side engineering change, the date does not hold (MERIDIAN R-007).
- Weekly status to Ingrid Solvang, per-customer, not aggregate.
- Kai Muller to be given the confirmed v1 EoL date within 48 hours of M6 close, for Thornbridge.
- M7 (v1 EoL, Sep 30) retains five weeks of margin behind M6. That margin is not available for further M6 slip.

---

## Related

- DR-002 — MERIDIAN SMB migration partner (Compass engagement)
- MERIDIAN M6 — revised Aug 1 → Aug 21, 2026
- MERIDIAN M7 — v1 EoL + infrastructure shutdown, Sep 30, 2026
- MERIDIAN R-005 — Thornbridge v1 EoL communication, now blocking $1.7M
- MERIDIAN R-007 — the last 8 need engineering, not tooling
- MERIDIAN R-008 — v1 capacity reduced faster than customers are leaving
- INC-2026-0131 / SUPP-020 — v1 gateway latency, Aug 6
- OPP-2026-112 (Thornbridge) — expansion tranche moved to Sep 30
