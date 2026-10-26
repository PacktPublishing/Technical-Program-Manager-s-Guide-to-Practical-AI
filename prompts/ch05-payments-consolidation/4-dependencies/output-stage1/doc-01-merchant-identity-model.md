> **Recorded output.** Produced by `run.sh` from `4-dependencies/prompt-stage1-extract.md` with model `sonnet` on 2026-09-28.
> One real run: yours will differ in wording. Validate it the way the prompt file describes.

| Source | Target | Type | Method | Failure Impact | Status |
|---|---|---|---|---|---|
| billing-svc | identity-svc | Soft | REST API | Invoice generation delayed — request queued and retried, not blocked outright | Existing |
| identity-svc | shared event bus | Hard | Message queue (event publish: `merchant.verified`) | KYC-completion signal not propagated; downstream effects unknown (subscribers unnamed) | Existing |
| (all other systems, unnamed) | identity-svc | Data | Shared source-of-truth reads (no local KYC copy) | Any consuming system loses access to merchant legal entity / payout account data | Existing |

**Data dependency note:** identity-svc holds the canonical Halden-merchant-ID → platform-local-ID mapping table. Any system needing to resolve a platform-local ID to a Halden merchant ID is implicitly data-dependent on identity-svc, but no consuming system is named in this doc.

**Circular dependencies:** None detected — all stated relationships are one-directional (consumers → identity-svc).

**Cross-team coordination points:**
- billing-svc ↔ identity-svc (REST) — two different services/teams; retry-on-unavailability behavior implies an SLA or contract that should be jointly owned.
- identity-svc's `merchant.verified` event — published without named subscribers, meaning event-bus coordination is happening blind from this document's perspective.

**Follow-up questions (uncertainty to validate):**
1. This reads as "Doc 1" of a series — are there other docs (e.g., billing, event bus, Kestrel migration) you want reviewed together so cross-doc dependencies can be traced, rather than assessed from this file alone?
2. Who are the actual subscribers to `merchant.verified`? Without that, I can't classify what breaks downstream if the event bus dependency fails — right now "Hard" is a conservative guess based on "identity-svc publishes" being a required step, not a confirmed blocking effect on subscribers.
3. Is "every other system reads merchant identity from identity-svc" (Section 2) meant to be taken as a literal blocking dependency for *all* platform systems, or just a data-governance rule (no local copies allowed) that only bites when a system actually needs identity data? I categorized it as a Data dependency, not Hard, since no specific failure mode is stated.
4. The Kestrel pre-acquisition merchants without a Halden ID (Section 5, "open question") — is this an assumption requiring validation, or a known gap you want tracked as a dependency risk (e.g., anything that keys off Halden merchant ID will silently fail/mis-map for these merchants)?
