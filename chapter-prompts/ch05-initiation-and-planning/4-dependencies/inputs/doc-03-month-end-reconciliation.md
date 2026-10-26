# Doc 3 — Month-End Reconciliation

**Team:** Billing Services · **Author:** Kofi Mensah, with Finance Operations · **Date:** August 2025 · **Status:** Live

## 1. Summary

At each month-end, Finance Operations reconciles what the processors settled against what
Halden recorded. There is one reconciliation job per platform today.

## 2. Data sources

- Settled totals per merchant come from settlement-api (REST, v1). settlement-api produces one
  settlement record per merchant per day.
- Recorded totals come from the ledger service. After the planned upgrade, the job reads from
  ledger-api v3 instead of the v2 reporting views.
- Processor statements are downloaded manually from each processor portal.

## 3. Process

The job compares the three sources per merchant and per day and produces an exceptions list.
Finance Operations works the exceptions by hand. This takes three to four days per month-end.

## 4. Failure handling

If settlement-api is unavailable, the month-end close waits. There is no fallback source for
settled totals.

## 5. Future state

One reconciliation job for one platform, once payments are consolidated.
