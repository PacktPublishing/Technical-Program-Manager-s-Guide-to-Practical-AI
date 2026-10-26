# Doc 7 — Payments Platform: payments-core and ledger-api v3

**Team:** Payments Platform · **Author:** Oskar Lindgren · **Date:** November 2025 · **Status:** Live

## 1. Summary

Upgrades ledger-api to v3 and moves payments-core onto it. v3 makes every ledger write
idempotent so that retries can no longer double-post.

## 2. ledger-api v3

ledger-api v3 removed the batch endpoint. All writes are synchronous and idempotent. Each write
carries an idempotency key; a repeated key returns the original result. The v2 endpoints are
switched off on 30 June 2026.

## 3. payments-core

- payments-core writes every captured and refunded charge to ledger-api v3 synchronously.
  If ledger-api is unavailable, captures are held in payments-core's outbox and retried.
- payments-core calls fraud-scoring for every authorisation.
- payments-core emits `charge.captured` and `charge.refunded` to the event bus.

## 4. Migration

payments-core moved to v3 in November 2025. Other ledger writers must move before 30 June 2026.
The list of other writers is not in scope for this document.
