# Doc 2 — Billing Services: Ledger Integration

**Team:** Billing Services · **Author:** Kofi Mensah · **Date:** March 2025 · **Status:** Live

## 1. Summary

billing-svc records every billable event in the ledger service so that invoices and
revenue reports come from one set of numbers.

## 2. Write path

billing-svc collects fee events for the day and writes them in one run at 02:00 UTC.
ledger-api accepts asynchronous batch writes. The nightly job submits one batch per platform and
polls for completion. A failed batch is resubmitted whole the following night.

## 3. Inputs

- Charge events come from PCS over the shared event bus (`charge.captured`,
  `charge.refunded`). billing-svc cannot compute fees without them.
- Merchant fee plans are read from billing-svc's own database.

## 4. Failure handling

If the ledger service rejects a batch, finance reporting for that day is delayed until the
batch is accepted. If PCS events stop, billing-svc raises an alert after 30 minutes and no fees
are computed.

## 5. Not covered

Real-time fee reporting. Reconciliation is covered in doc 3.
