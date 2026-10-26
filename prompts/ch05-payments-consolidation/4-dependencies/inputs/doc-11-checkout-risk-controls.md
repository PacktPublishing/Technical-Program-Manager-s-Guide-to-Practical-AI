# Doc 11 — Checkout Risk Controls

**Team:** Risk & Identity · **Author:** Ravi Iyer · **Date:** February 2026 · **Status:** Draft

## 1. Summary

Controls applied at checkout to limit fraud losses and protect payouts, for all three platforms.

## 2. Risk scoring

risk-engine scores every card authorisation synchronously and answers within 150 ms at p99.
Authorisations above the merchant's threshold are declined or held for review. The merchant's
risk tier is an input to the score.

## 3. Payout protection

Before issuing a merchant-scoped token for payout operations, identity-svc confirms the
merchant's payout account status with core payments. A merchant whose payout account is
suspended in core payments receives no payout token.

## 4. Out of scope

Chargeback handling, covered by the disputes team.
