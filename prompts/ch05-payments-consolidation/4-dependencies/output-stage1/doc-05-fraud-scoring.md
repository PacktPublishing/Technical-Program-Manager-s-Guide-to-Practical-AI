> **Recorded output.** Produced by `run.sh` from `4-dependencies/prompt-stage1-extract.md` with model `sonnet` on 2026-09-28.
> One real run: yours will differ in wording. Validate it the way the prompt file describes.

## Dependency Extraction — doc-05-fraud-scoring.md

| Source | Target | Type | Method | Failure Impact | Status |
|---|---|---|---|---|---|
| Caller (unnamed — issues card authorisation requests) | fraud-scoring | Soft (has defined fallback) | Synchronous call, p99 ≤150ms SLA implied; transport not stated | If fraud-scoring doesn't respond within 150ms, caller applies merchant's fallback rule (approve below floor amount, decline above) | Existing |
| fraud-scoring | identity-svc | Hard on cache miss / Soft within cache window | Read call (transport not stated); response cached 10 min | Not stated in doc — behavior on identity-svc outage + expired cache is unspecified | Existing — failure behavior is an **assumption requiring validation** |
| fraud-scoring | Risk & Identity rules console | Soft (operational, not request-path) | Console-based rule deployment; mechanism not stated | Rules can't be updated; existing deployed rules keep running | Existing |
| Kestrel / Marketplace / Halden Pay | fraud-scoring rule sets | Data dependency (shared state — rule config maintained per platform) | Not stated | Wrong/stale rule set could misscore that platform's traffic | Existing |

**Circular dependencies:** None detected within this document. Cannot rule out circularity across the wider system — no other docs were provided to check whether identity-svc or the rules console call back into fraud-scoring.

**Cross-team coordination flag:** identity-svc ownership is not stated in this doc. If it's owned outside Risk & Identity, the risk-tier read is a cross-team integration point worth confirming.

### Questions before you validate
1. Is "the caller" a single authorisation/gateway service, or do Kestrel, Marketplace, and Halden Pay each call fraud-scoring independently?
2. What's the transport for caller→fraud-scoring and fraud-scoring→identity-svc (REST, gRPC, queue)?
3. On identity-svc outage *after* the 10-min cache expires, does fraud-scoring fail the request, serve stale data anyway, or apply its own fallback?
4. Who owns identity-svc?
5. Are there other docs (doc-01 through doc-04, etc.) I should review to check for dependencies pointing back into fraud-scoring?
