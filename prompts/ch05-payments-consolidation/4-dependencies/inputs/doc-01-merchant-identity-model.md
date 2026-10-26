# Doc 1 — Merchant Identity Model

**Team:** Risk & Identity · **Author:** Ravi Iyer · **Date:** January 2025 · **Status:** Live

## 1. Purpose

Defines how a merchant's legal entity, beneficial owners and payout accounts are represented,
and which service is the source of truth for each.

## 2. Source of truth

identity-svc is the source of truth for merchant legal entities and verified payout accounts.
Every other system reads merchant identity from identity-svc and never stores its own copy of
KYC data.

## 3. Consumers

- billing-svc reads the merchant's legal entity from identity-svc when generating invoices,
  over REST. If identity-svc is unavailable, invoice generation is queued and retried.
- identity-svc publishes a `merchant.verified` event to the shared event bus when KYC completes.
  Downstream subscribers are not listed in this document.

## 4. Identifiers

Each merchant has one Halden merchant ID. Merchants that exist on more than one platform carry a
separate platform-local ID per platform; the mapping table lives in identity-svc.

## 5. Open questions

- Kestrel merchants created before the 2023 acquisition have no Halden merchant ID yet.
