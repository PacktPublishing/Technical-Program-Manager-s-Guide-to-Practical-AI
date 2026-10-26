# Doc 5 — fraud-scoring Service

**Team:** Risk & Identity · **Author:** Ravi Iyer · **Date:** June 2025 · **Status:** Live

## 1. Summary

fraud-scoring returns a risk score for every card authorisation request, synchronously, within
150 ms at p99. Authorisations above the merchant's threshold are declined or sent to review.

## 2. Inputs

- The authorisation request (amount, card fingerprint, merchant, device signals).
- The merchant's risk tier, read from identity-svc and cached for 10 minutes.
- Rule sets per platform. Kestrel and Marketplace rules are maintained separately from Halden
  Pay rules.

## 3. Failure mode

If fraud-scoring does not answer within 150 ms, the caller applies the merchant's fallback rule:
approve below a floor amount, decline above it.

## 4. Operations

Rules are deployed through the Risk & Identity rules console. Model retraining is monthly.
