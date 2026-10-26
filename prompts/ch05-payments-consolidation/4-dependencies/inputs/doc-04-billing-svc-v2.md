# Doc 4 — billing-svc v2 Design

**Team:** Billing Services · **Author:** Kofi Mensah · **Date:** September 2025 · **Status:** Live

## 1. Summary

billing-svc v2 moves fee calculation from nightly-only to near-real-time for merchants on
usage-based plans.

## 2. Architecture

billing-svc v2 subscribes to charge events from the core payments service and computes fees as
events arrive. The nightly fee job from doc 2 is unchanged.

## 3. Dependencies

### 3.1 Identity

billing-svc batch jobs authenticate to other services with service tokens issued by
identity-svc. Tokens are valid for 24 hours, which covers the longest nightly run.

### 3.2 Entitlements

Hard dependency: the entitlement service. Before applying a usage-based fee plan, billing-svc
checks that the merchant is entitled to that plan. If the entitlement service is unavailable,
usage-based fees are not computed and the events are parked. The entitlement service has had no
commits since October 2024.

### 3.3 Charge events

Charge events from the core payments service over the event bus, as in doc 2.

## 4. Rollout

Behind a feature flag per merchant. Completed for Halden Pay merchants; Kestrel and Marketplace
merchants remain on nightly-only fees.
