# Doc 9 — merchant-portal: Payments Settings

**Team:** Merchant Experience · **Author:** Hana Sato · **Date:** July 2025 · **Status:** Live

## 1. Summary

The Payments Settings area of merchant-portal lets merchants turn payment methods on and off,
and shows their recent charges.

## 2. Dependencies

- Hard dependency: entitlements. The portal shows only the payment methods a merchant is
  entitled to, and writes changes back to entitlements. If entitlements is unavailable, the
  Payments Settings page is read-only.
- entitlements resolves the merchant account via identity-svc before returning any entitlement.
- Recent charges are read from PCS over REST, last 90 days.

## 3. How a payment method is enabled

1. The merchant turns a method on in the portal.
2. The portal writes the change to entitlements.
3. When a charge arrives with that method, PCS checks entitlements before authorising it.

## 4. Known issues

The portal and billing-svc show different plan names for the same entitlement.
