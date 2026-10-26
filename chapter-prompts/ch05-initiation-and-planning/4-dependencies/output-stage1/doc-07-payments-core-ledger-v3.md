> **Recorded output.** Produced by `run.sh` from `4-dependencies/prompt-stage1-extract.md` with model `sonnet` on 2026-09-28.
> One real run: yours will differ in wording. Validate it the way the prompt file describes.

## Dependency Extraction — doc-07-payments-core-ledger-api-v3

| Source | Target | Type | Method | Failure Impact | Status |
|---|---|---|---|---|---|
| payments-core | ledger-api v3 | Hard (with async fallback — see Q1) | Synchronous, idempotent API write (idempotency key) | Ledger write not confirmed in real time; charge held in payments-core outbox and retried | Existing |
| payments-core | fraud-scoring | Hard (assumed — not stated) | Not specified in doc | Not specified in doc | Existing — **assumption requiring validation** |
| payments-core | event bus | Soft (assumed — not stated) | Message queue (publish: `charge.captured`, `charge.refunded`) | Not specified — downstream consumers not named in this doc | Existing — **assumption requiring validation** |
| (unnamed) other ledger writers | ledger-api v2 | Hard, deadline-bound | Not specified | v2 endpoints switch off 30 Jun 2026 — any writer not migrated will fail outright | **Assumption requiring validation** — writer list explicitly out of scope of this doc |
| payments-core + other ledger writers | ledger-api (ledger store) | Data dependency (shared state) | Shared ledger, reconciled via idempotency keys | Data integrity of ledger depends on all writers using v3 correctly | Existing / partial (migration in progress) |

**Circular dependencies:** None detected in this document. (Note: cannot fully rule out — the identity of "other ledger writers" is undisclosed, so a cycle involving them can't be assessed from this doc alone.)

**Cross-team coordination flag:** The 30 Jun 2026 v2 shutoff requires coordination with an unnamed set of "other ledger writers" teams — this is the single highest-risk item in the doc since neither their identity nor migration status is stated.

### Follow-up questions
1. When the synchronous ledger-api write fails, does the **capture itself** fail/roll back, or does it succeed and get reconciled later via the outbox? This determines whether payments-core→ledger-api is Hard or Soft.
2. What's the integration method for the fraud-scoring call, and does authorization block/fail if fraud-scoring is unavailable, or is there a default-allow/deny fallback?
3. Who are the "other ledger writers" referenced in §4, and what's each one's current migration status against the 30 Jun 2026 cutoff?
4. What consumes `charge.captured`/`charge.refunded` off the event bus, and what breaks downstream if delivery fails or is delayed?
