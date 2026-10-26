> **Recorded output.** Produced by `run.sh` from `4-dependencies/prompt-stage2-synthesize.md` with model `sonnet` on 2026-09-29.
> One real run: yours will differ in wording. Validate it the way the prompt file describes.

# Merged Dependency Graph — Payments Domain (Docs 1–11)

## Alias Table

| Canonical | Aliases | Docs |
|---|---|---|
| **payments-core** | "PCS", "core payments service", "core payments" | 2, 4, 7, 9, 11 |
| **identity-svc** | — | 1, 4, 5, 6, 9, 11 |
| **billing-svc** | "billing-svc v2", "billing-svc v2 (batch jobs)" | 1, 2, 4, 9 |
| **ledger-api** | "ledger-api v2", "Ledger service — v2 reporting views" (Doc 3), "ledger-api v3", "ledger-api" (Doc 2, version unstated) | 2, 3, 7 |
| **merchant-portal** | — | 9, 10 |
| **fraud-scoring** | — *(risk-engine deliberately **not** merged — see Possible Aliases)* | 5, 7 |
| **entitlements** | "entitlement service" (Doc 4) | 4, 9 |
| **settlement-api** | — | 3, 10 |
| **event-bus** | "shared event bus" (Doc 1), "event bus" (Doc 7) | 1, 7 |

Merge basis: payments-core/PCS/core payments service per your instruction. billing-svc↔v2, entitlements↔entitlement service, and the ledger-api version family are merged on shared base name + the ownership map's single unversioned "ledger-api" row (ownership is per-service, not per-version). settlement-api merged on identical name+version (v1) in both docs. event-bus merged on identical publish pattern (message-queue publish, no named consumers) — distinct from the cases where "event bus" is just the *Method* for reaching payments-core (Docs 2, 4), where payments-core itself remains the target.

---

## 1. UNOWNED

Every target that appears in no row of the ownership map (payments-core, ledger-api, billing-svc, merchant-portal, identity-svc, fraud-scoring — all six are covered by the merges above).

| Unowned system | Depended on by | Doc / section |
|---|---|---|
| **settlement-api** | Month-end reconciliation job; merchant-portal | Doc 3 (main table); Doc 10 (main table) |
| **entitlements** | billing-svc; merchant-portal; payments-core | Doc 4 (main table, flags "no commits since Oct 2024"); Doc 9 (main table, ×2) |
| **event-bus** | identity-svc; payments-core | Doc 1 (main table); Doc 7 (main table) |
| **risk-engine** | Checkout/authorization flow (caller unnamed) | Doc 11 (main table) |
| **Merchant risk-tier data source** (unnamed) | risk-engine | Doc 11 (main table, assumption) |
| **Secrets manager** | identity-svc | Doc 6 (main table) |
| **Workload credential provider** | Batch clients | Doc 6 (main table) |
| **Risk & Identity rules console** | fraud-scoring | Doc 5 (main table) |
| **Adapter layer** | Authorisation path | Doc 8 (main table) |
| **northwind-adapter / veloxa-adapter / tessera-adapter** | Adapter layer | Doc 8 §1–4 area (rows 2–4) |
| **Routing table** | Adapter layer | Doc 8 row 9 |
| **Northwind Payments / Northwind's vault** | northwind-adapter | Doc 8 rows 5–6 (external vendor) |
| **Veloxa / Tessera Pay** | veloxa-adapter / tessera-adapter | Doc 8 rows 7–8 (external vendor) |
| **Veloxa/Tessera token vaults** | "Merchant switching to Northwind" | Doc 8 row 10, §5 (assumption) |
| **Processor portals (per processor)** | Month-end reconciliation job | Doc 3 (main table, manual process) |
| **Platform-specific settlement sources** (unnamed) | settlement-api | Doc 10 (main table, assumption) |

Note: several of these (adapter/processor cluster, Secrets manager) are external vendors or infra-layer components rather than gaps in engineering ownership — listed per the literal instruction, but flagged so a human doesn't chase ownership for e.g. Veloxa itself.

---

## 2. CONFLICTING

### C1 — settlement-api: blocking vs. degraded

**Doc 3** (Month-end reconciliation job → settlement-api): *"Hard (blocking) | REST API, v1 | Month-end close halts entirely; document states no fallback source exists for settled totals."*

**Doc 10** (merchant-portal → settlement-api): *"Soft (degraded, not blocking) | REST API (v1) | If no record by 06:00 UTC, portal falls back to showing previous day's report + a banner. No outage, but stale/missing current-day data."*

Same system, same stated version (v1). One caller's document asserts *no fallback exists at all*; the other describes a working graceful-degradation path on the identical interface. Either the fallback exists and Doc 3 is wrong about "no fallback source," or the two callers are hitting different endpoints of settlement-api that behave differently — but nothing in either doc supports that distinction. Needs reconciliation with the settlement-api owning team.

### C2 — ledger-api: write mode mismatch

**Doc 2** (billing-svc → ledger-api): *"Data (shared state) | Async batch write, one batch/platform, submitted nightly at 02:00 UTC, polled for completion | Rejected batch delays finance reporting for that day; failed batch resubmitted in full the following night."*

**Doc 7** (payments-core → ledger-api v3): *"Hard (with async fallback) | Synchronous, idempotent API write (idempotency key) | Ledger write not confirmed in real time; charge held in payments-core outbox and retried."*

Doc 2 never states a version, so it's unconfirmed whether it targets v2, v3, or an unversioned endpoint that predates the split — that ambiguity is itself listed under Possible Aliases. But *if* both are writing to the same ledger-api surface, one caller assumes nightly batch semantics and the other assumes per-transaction, idempotency-key-based synchronous semantics — a caller built against one write mode would misbehave against the other. Flagging regardless of the version question, since the version question is exactly what needs resolving to know if this is one conflict or two unrelated integrations.

---

## 3. CIRCULAR

Three simple cycles found, all pivoting through the identity-svc → payments-core edge stated in **Doc 11**.

**Cycle A:** `identity-svc → payments-core → entitlements → identity-svc`
- identity-svc → payments-core — Doc 11: *"confirms... status... No payout token issued if merchant's payout account is suspended in core payments"*
- payments-core → entitlements — Doc 9: *"PCS → entitlements | Hard | checks entitlements before authorising"*
- entitlements → identity-svc — Doc 9: *"entitlements → identity-svc | Hard | resolves the merchant account via [identity-svc]"*

**Cycle B:** `billing-svc → payments-core → entitlements → billing-svc`
- billing-svc → payments-core — Doc 2/4: *"Shared event bus — charge.captured, charge.refunded events"*
- payments-core → entitlements — Doc 9 (same edge as above)
- entitlements → billing-svc — Doc 9: *"entitlements / merchant-portal → billing-svc | Data (shared state) | Plan name inconsistency observed between portal and billing-svc"*

**Cycle C:** `payments-core → fraud-scoring → identity-svc → payments-core`
- payments-core → fraud-scoring — Doc 7: *"Hard (assumed — not stated)"* — **the document itself marks this edge unconfirmed**, so this cycle is weaker evidence than A/B.
- fraud-scoring → identity-svc — Doc 5: *"Hard on cache miss / Soft within cache window... response cached 10 min"*
- identity-svc → payments-core — Doc 11 (same edge as in Cycle A)

All three cycles share the single back-edge **identity-svc → payments-core (Doc 11)**, and A/B additionally share **payments-core → entitlements (Doc 9)**. That makes identity-svc, payments-core, and entitlements a tightly coupled triangle independent of billing-svc/fraud-scoring — worth raising as a standalone architecture concern, since Cycle C's weakest edge is explicitly unverified.

---

## POSSIBLE ALIASES (for human review — not merged above)

| Candidate | Reasoning for | Reasoning against | Where it matters |
|---|---|---|---|
| **fraud-scoring** (Doc 5) ↔ **risk-engine** (Doc 11) | Identical function (scores card authorisation requests), identical p99 150ms SLA in both docs | No textual name overlap at all; no doc cross-references the other | If merged, risk-engine becomes owned (Risk & Identity) instead of UNOWNED, and the Doc 5 (Soft, explicit fallback) vs Doc 11 (Hard, no fallback stated) descriptions become a direct CONFLICT rather than two unrelated systems |
| **Caller** (Doc 5) / **Authorisation path** (Doc 8) / **Checkout/authorization flow** (Doc 11) | All three are unnamed callers sitting in the same card-authorization critical path | None of the three docs name the caller at all — pure functional inference, weaker than the fraud-scoring/risk-engine case | If these are one service, it independently calls fraud-scoring, risk-engine, *and* the adapter layer — which cuts against merging fraud-scoring/risk-engine (odd to call two separately-documented, identically-configured risk services) |
| **ledger-api** (Doc 2, version unstated) → v2 or v3 specifically | Same base name as the versioned family already merged above | Doc 2 never states a version, and the write pattern (nightly batch) doesn't resemble either documented version's stated method | Resolving this determines whether C2 above is one conflict or two independent, non-conflicting integrations |
| **Month-end reconciliation job** (Doc 3) ↔ **billing-svc** | Doc 3 explicitly attributes the job to "Billing Services," the team that owns billing-svc | No doc names it as part of the billing-svc service itself; could be a separate cron/script | Low-stakes either way — doesn't change UNOWNED or CIRCULAR results since the job's only listed targets (settlement-api, ledger-api, Processor portals) aren't shared with billing-svc's own edges |

---

## Merged Edge List

| Source | Target | Type | Docs |
|---|---|---|---|
| billing-svc | identity-svc | Soft (data/invoicing) | 1 |
| billing-svc | identity-svc | Hard (auth/service tokens) | 4 |
| identity-svc | event-bus | Hard | 1 |
| Unnamed dependent systems | identity-svc | Data | 1 |
| billing-svc | ledger-api | Data (shared state) | 2 |
| billing-svc | payments-core | Hard | 2, 4 |
| Month-end reconciliation job | settlement-api | Hard | 3 |
| Month-end reconciliation job | ledger-api (v2 views) | Data | 3 |
| Month-end reconciliation job | ledger-api (v3) | Hard (inferred) | 3 |
| Month-end reconciliation job | Processor portals | Hard (inferred) | 3 |
| billing-svc | entitlements | Hard | 4 |
| Caller (unnamed) | fraud-scoring | Soft | 5 |
| fraud-scoring | identity-svc | Hard/Soft (cache-dependent) | 5 |
| fraud-scoring | Risk & Identity rules console | Soft | 5 |
| Kestrel / Marketplace / Halden Pay | fraud-scoring (rule sets) | Data | 5 |
| identity-svc | Secrets manager | Hard | 6 |
| Internal callers | identity-svc | Hard | 6 |
| Batch clients | Workload credential provider | Hard | 6 |
| payments-core | ledger-api (v3) | Hard (async fallback) | 7 |
| payments-core | fraud-scoring | Hard (assumption) | 7 |
| payments-core | event-bus | Soft (assumption) | 7 |
| Other ledger writers (unnamed) | ledger-api (v2) | Hard (assumption) | 7 |
| payments-core + other ledger writers | ledger-api | Data (shared state) | 7 |
| Authorisation path | Adapter layer | Hard | 8 |
| Adapter layer | northwind-adapter | Hard | 8 |
| Adapter layer | veloxa-adapter | Hard (Planned) | 8 |
| Adapter layer | tessera-adapter | Hard (Planned) | 8 |
| northwind-adapter | Northwind Payments | Hard | 8 |
| northwind-adapter | Northwind's vault | Data | 8 |
| veloxa-adapter | Veloxa | Hard (Planned) | 8 |
| tessera-adapter | Tessera Pay | Hard (Planned) | 8 |
| Adapter layer | Routing table | Data | 8 |
| Merchant switching to Northwind | Veloxa/Tessera token vaults | Data (assumption) | 8 |
| merchant-portal | entitlements | Hard | 9 |
| entitlements | identity-svc | Hard | 9 |
| merchant-portal | payments-core | Soft (unstated, inferred) | 9 |
| payments-core | entitlements | Hard | 9 |
| entitlements | billing-svc | Data | 9 |
| merchant-portal | billing-svc | Data | 9 |
| merchant-portal | settlement-api | Soft | 10 |
| settlement-api | Platform-specific settlement sources | Data (assumption) | 10 |
| Checkout/authorization flow (unnamed) | risk-engine | Hard | 11 |
| risk-engine | Merchant risk-tier data source | Data (assumption) | 11 |
| identity-svc | payments-core | Hard | 11 |

44 edges across 9 canonical + 15 unowned nodes. No dependency was inferred beyond what a document states — where a doc itself flagged an edge as an assumption, that's preserved in the Type column rather than upgraded to a confirmed dependency.
