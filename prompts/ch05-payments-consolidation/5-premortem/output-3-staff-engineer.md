> **Recorded output.** Produced by `run.sh` from `5-premortem/prompt-3-staff-engineer.md` with model `sonnet` on 2026-09-29.
> One real run: yours will differ in wording. Validate it the way the prompt file describes.

# Incident narratives — six months out, program failed

*Lens: architecture, interfaces, technical sequencing only. No stake in this program.*

---

**1. The batch job that outlived its endpoint**

What happened, in sequence: billing-svc kept submitting its nightly batch write to ledger-api past the 30 June 2026 cutoff for ledger-api v2. v3 has no batch endpoint — it's synchronous, idempotency-key writes only. The architecture review flagged this exact conflict as real and gave it a deadline ("Billing must move to synchronous writes before 30 June 2026"), then closed the item with "Status: to be confirmed with Billing's Q2 plan." It was never confirmed. On 30 June, the nightly batch fires against an interface that no longer accepts it. Finance reporting drops for the day the assumption log already priced in ("failed batch resubmitted in full the following night" — except there's no following-night batch endpoint to resubmit to). The one-day buffer the plan was already running on thin margin against (Tessera renewal, 1 Oct) starts absorbing this slip immediately.

Earliest observable signal: the dependency-map synthesis itself, in the Possible Aliases table — it flagged that billing-svc's edge to ledger-api never states a version, and that resolving this "determines whether C2 is one conflict or two unrelated integrations." That ambiguity was visible before the architecture review even convened.

Which document should have caught this and did not: the Assumption Log's own conflict entry (C2, ledger-api write-mode mismatch) named the exact failure mode and was carried forward with a status of "to be confirmed" rather than a closed decision. A "to be confirmed" status on a hard-dated interface break is not a mitigated risk. It's an unmitigated one wearing a status field.

---

**2. The orphan cron on the decommissioned host**

What happened, in sequence: `recon-batch`, a script left behind by the 2024 consolidation attempt, reads ledger-api v2's reporting views directly from the Tessera integration host. No design document named it. It surfaced only because Anika Roth happened to mention it in the architecture review, at which point the only action recorded was "Kofi Mensah to confirm the script's owner and whether reconciliation still needs it." No confirmation followed. When ledger-api v2 is switched off on 30 June, `recon-batch` breaks — silently, since nothing in the design corpus has it as a dependency to monitor. It breaks in Phase 2, months before Phase 3 decommissioning was ever scheduled to touch that host.

Earliest observable signal: the script's continued existence on the Tessera host after the 2024 attempt was stopped. It predates this program entirely; it was discoverable at charter time by anyone who inventoried what actually runs on the hosts being consolidated, not just what the design docs described.

Which document should have caught this and did not: none of them — and that is the finding. The dependency-map synthesis states its own method plainly: "No dependency was inferred beyond what a document states." A process that only synthesizes documented dependencies cannot find an undocumented one. The review surfaced it once, by accident, and then let the follow-up lapse without an owner or a date.

---

**3. Payout tokens through the unowned service**

What happened, in sequence: entitlements-svc has no owner — no commits since October 2024, confirmed again at the architecture review, where the only action was "Marcus Webb to assign an owner before sequencing." No owner was assigned before sequencing proceeded. entitlements-svc sits in the confirmed circular dependency payments-core → entitlements-svc → identity-svc → payments-core, narrowed at review to the payout-token path specifically (Ravi Iyer). Separately, billing-svc's nightly jobs assume 24-hour token lifetimes; the enforced lifetime has been 15 minutes since 1 December 2025. Kofi Mensah's belief that the jobs already re-authenticate was recorded as "not verified." Put an unowned service in a token-issuing loop and leave a token-lifetime assumption unverified on the same loop, and the failure mode is a payout token that expires mid-issuance with nobody positioned to triage the unowned hop when it does.

Earliest observable signal: 1 December 2025 — the date the 15-minute enforcement went live, four months before the architecture review even happened. The conflict with billing-svc's 24-hour assumption was live before this program's Phase 1 started.

Which document should have caught this and did not: the architecture review's own "Confirmed" section named the token-lifetime conflict as real and left it "not verified" — an unverified item sitting on top of an unowned service in a live circular dependency, carried forward with no closing date, in the same meeting that raised it.

---

**4. Two truths about settlement-api's fallback**

What happened, in sequence: the dependency-map synthesis flagged a direct contradiction (C1) — Doc 3 states month-end reconciliation's call to settlement-api is hard/blocking with no fallback; Doc 10 states merchant-portal's call to the same v1 API degrades gracefully to a cached report. The architecture review corrected settlement-api's ownership (Billing Services, since the January 2026 reorg) but never adjudicated the behavioral contradiction the dependency map explicitly asked the owning team to resolve. Consolidation simultaneously concentrates processor risk from roughly a third of volume to all of it (assumption #24: "Northwind's contracted availability" mitigates nothing about that concentration). If Doc 3 is right and there is genuinely no fallback, a single-processor outage at month-end halts reconciliation completely, with no document on record saying whether that's actually true.

Earliest observable signal: the dependency map's own CONFLICT section (C1), which named both documents, both callers, and the exact ask — "needs reconciliation with the settlement-api owning team" — before the architecture review even took place.

Which document should have caught this and did not: the architecture review notes. Correction item 1 fixed *who* owns settlement-api and stopped there. The behavioral conflict the dependency map raised in the same breath as the ownership question is absent from the review entirely — not disputed, not confirmed, just not mentioned.

---

## Ranking by likelihood

1. **The batch job that outlived its endpoint** — hardest evidence: a named conflict, confirmed twice (assumption log and architecture review), a fixed calendar date, and a status of "to be confirmed" that was never closed. This is a scheduled collision, not a contingent one.
2. **The orphan cron on the decommissioned host** — equally hard-dated (same 30 June cliff) and equally unowned at close, but narrower blast radius (reconciliation only, not the core migration path), so it ranks just below Narrative 1.
3. **Payout tokens through the unowned service** — two separately-flagged "not verified" conditions have to compound (unowned service *and* unverified re-auth) for this to fire; more moving parts than 1 or 2, but both parts were independently confirmed as open at review.
4. **Two truths about settlement-api's fallback** — requires an actual processor outage at month-end to manifest; every other narrative is a structural certainty given known dates, this one is a structural risk waiting on an external trigger.
