> **Recorded output.** Produced by `run.sh` from `4-dependencies/prompt-stage1-extract.md` with model `sonnet` on 2026-09-28.
> One real run: yours will differ in wording. Validate it the way the prompt file describes.

| Source | Target | Type | Method | Failure Impact | Status |
|---|---|---|---|---|---|
| Checkout/authorization flow (caller not named in doc) | risk-engine | Hard | Synchronous call (protocol not specified); p99 150ms SLA stated | Not stated — doc gives no behavior for risk-engine timeout/unavailability | Existing (implied by SLA language) |
| risk-engine | Merchant risk-tier data source (system not named) | Data | Not specified | Not stated | Assumption requiring validation |
| identity-svc | core payments | Hard | Not specified — doc says "confirms... status," no protocol named | No payout token issued if merchant's payout account is suspended in core payments | Existing (implied) |

No circular dependencies detected in this document.

Flags and follow-up questions:

1. **Checkout caller identity** — the doc never names the service that invokes risk-engine (it says "risk-engine scores every card authorisation," not who calls it). I labeled it generically rather than assume a service name like "checkout-svc." Can you confirm the actual caller?
2. **Integration methods unstated** — neither the risk-engine call nor the identity-svc → core payments call specifies REST/gRPC/queue/shared DB. Do you have the transport details, or should these stay "not specified" pending validation?
3. **Merchant risk-tier source** — "the merchant's risk tier is an input to the score" implies risk-engine reads merchant data from somewhere, but no owning system is named. Is this a shared database, a call to a merchant-profile service, or something else? This is the one row I'd flag hardest as needing cross-team confirmation, since risk-engine (Risk & Identity) may be pulling from a system owned by a different team (merchant/onboarding).
4. **core payments availability failure mode** — doc only states behavior for a *suspended* account, not for core payments being unreachable/slow. Is there a documented fallback (e.g., fail-closed, no token) I'm missing, or is that a genuine gap to raise with the Payments team?
5. **Cross-team coordination** — identity-svc → core payments crosses from Risk & Identity into (presumably) a Payments-owned service. Worth confirming who owns core payments before treating this as a stable contract.

Let me know if there are additional docs (the "three platforms" reference suggests siblings to Doc 11) you want folded into this same extraction, or if you want me to hold at this one doc.
