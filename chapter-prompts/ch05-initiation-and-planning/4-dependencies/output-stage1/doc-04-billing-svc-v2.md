> **Recorded output.** Produced by `run.sh` from `4-dependencies/prompt-stage1-extract.md` with model `sonnet` on 2026-09-28.
> One real run: yours will differ in wording. Validate it the way the prompt file describes.

# Dependency Extraction — doc-04-billing-svc-v2.md

| Source | Target | Type | Method | Failure Impact | Status |
|---|---|---|---|---|---|
| billing-svc v2 (batch jobs) | identity-svc | Hard | Service tokens (auth), 24h validity | New tokens can't be issued; batch jobs lose ability to authenticate once existing tokens expire (≤24h grace window) | Existing |
| billing-svc v2 | entitlement service | Hard (explicitly stated) | Not specified in doc — flagged | Usage-based fees not computed; events parked (not lost) | Existing — target has had **no commits since Oct 2024**, ownership/support risk |
| billing-svc v2 | core payments service | Hard | Event bus (async subscription to charge events) | Not stated in this doc; near-real-time fee calc presumably stalls. Whether the nightly job (doc 2) covers the gap is unconfirmed | Existing — described "as in doc 2" (not provided) |

**Data dependencies:** none stated in this document — no shared database/state mentioned.

**Circular dependencies:** none detected among the three targets; nothing in this doc indicates identity-svc, entitlement service, or core payments service depend back on billing-svc.

**Cross-team coordination flags:** entitlement service (stale, owner unclear), core payments service (likely owned by a separate Payments team), identity-svc (likely owned by a separate Identity team) — all integration points, not owned by Billing Services.

## Follow-up questions

1. **Entitlement service integration method** — REST call, sync/async? Doc doesn't say.
2. **Doc 2** is referenced twice (nightly fee job, event bus details) but not included — can you provide it? I held back on inferring its content per the "only extract what's explicitly stated" constraint.
3. Does the entitlement check **fail closed or open**? Doc says fees "are not computed" — confirming this is fail-closed (safe) rather than a race condition.
4. Who owns identity-svc, entitlement service, and core payments service, for the cross-team coordination note?
