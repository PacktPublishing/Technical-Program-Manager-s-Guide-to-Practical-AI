> **Recorded output.** Produced by `run.sh` from `5-premortem/prompt-1-sre.md` with model `sonnet` on 2026-09-29.
> One real run: yours will differ in wording. Validate it the way the prompt file describes.

# Incident Narratives — Payments Platform Consolidation
*(SRE lens only. Six months out. Corpus: charter, conflict register, assumption log, dependency map, architecture review notes.)*

---

**1. The nightly batch that couldn't write to v3**

What happened, in sequence: billing-svc kept submitting ledger entries the way it always had — one async batch per platform, nightly at 02:00 UTC, polled for completion (Doc 2). Payments-core had already moved to ledger-api v3, which only accepts synchronous, idempotent, per-transaction writes (Doc 7). The architecture review confirmed this was a real conflict and required billing-svc to move to synchronous writes before ledger-api v2 was switched off on 30 June 2026. The item was carried into sequencing "marked 'to be confirmed'" and no confirmation exists anywhere in the corpus after that. When v2 went dark, billing-svc's nightly batches had nowhere compatible to land: batches rejected wholesale, finance reporting for that day never posted, and the "resubmit in full the following night" behavior (Doc 2) compounded the backlog instead of clearing it.

Earliest observable signal: the first rejected nightly batch job against ledger-api on or after 30 June 2026, with a rejection reason indicating write-mode mismatch rather than data error.

Which document should have caught this and did not: the architecture review notes, "Carried into sequencing" section — it named the exact conflict, named the exact deadline, and explicitly deferred resolution to "to be confirmed" with no owner or verification step attached.

---

**2. The cutover with no rollback**

What happened, in sequence: a merchant cohort ran its mandated two-week dual-processor parallel window (assumption log, row 8) and then cut over to Northwind-only. Jonas Brandt had already stated, before this program started, that "nobody has rehearsed a rollback on any of these platforms. Including 2024." Payout errors surfaced after cutover — the identical failure mode Appendix A records from the 2024 attempt, which stopped that consolidation. This time the parallel window had already closed and the fallback path did not exist in practice, only on paper. The response team improvised for hours because there was nothing rehearsed to execute.

Earliest observable signal: a payout error-rate increase beginning in the hours immediately after a cohort's old processor path was switched off — the same signal class Appendix A attributes to the 2024 failure.

Which document should have caught this and did not: the assumption log, row 8 — it logged the two-week parallel run as an assumption but never validated that the window was sufficient or that a rollback was executable; nothing in the corpus shows the rehearsal gap was closed before the first cohort cut over.

---

**3. The reconciliation job nobody knew existed**

What happened, in sequence: `recon-batch`, a cron script on the Tessera integration host, had been reading ledger-api v2's reporting views directly for Marketplace month-end reconciliation since the 2024 attempt. It appeared in no design document and no ownership map. The 16 April architecture review surfaced it and assigned an action — "Kofi Mensah to confirm the script's owner and whether reconciliation still needs it" — with no confirmation recorded afterward. When ledger-api v2 was switched off on 30 June 2026, the script began failing with no alerting configured, because it was never registered as a consumer of anything. Finance Operations only found the gap at month-end close, when the numbers didn't tie out, and lost the investigation time to figuring out whether the discrepancy was data or a missing job.

Earliest observable signal: absence of `recon-batch`'s expected access pattern against ledger-api v2's reporting views immediately after 30 June 2026 — a silent stop, not an error.

Which document should have caught this and did not: the merged dependency graph (dependency map deliverable) — `recon-batch` does not appear anywhere in the merged edge list or the ownership map, despite being confirmed to exist by the time of the review that read that exact map.

---

**4. One vendor, one outage, all of it down**

What happened, in sequence: before consolidation, an outage at any single processor (Northwind, Veloxa, or Tessera) affected roughly a third of Halden's processed volume. The assumption log (row 24) treated "Northwind's contracted availability" as equivalent to actual uptime protection and never addressed the structural change consolidation made: all volume now depended on one vendor. The charter's Known Risks section (Artifact 1, section 10) never mentions processor concentration at all. When Northwind had an outage, 100% of Halden's payment volume went down — a category of incident that could not occur under the three-processor architecture.

Earliest observable signal: a Northwind-side error-rate spike correlating with a full, not partial, drop in Halden transaction success rate — the first time a single vendor incident maps to total platform outage.

Which document should have caught this and did not: the charter's Known Risks section (Artifact 1, §10) — it lists licensing risk, the 2024 precedent, incident concentration on Kestrel/Marketplace, and the Tessera renewal sequencing risk, but contains no entry for the blast-radius change created by processor consolidation itself, even though the assumption log had already flagged the underlying belief as unverified.

---

**5. The payout loop with no one on call**

What happened, in sequence: entitlements-svc had no assigned owner. The 16 April review confirmed this directly — "Nobody present claimed it" — and assigned an action for Marcus Webb to assign an owner before sequencing. No confirmation of that assignment exists anywhere after the review. The circular dependency payments-core → entitlements-svc → identity-svc → payments-core was also confirmed real, scoped by Ravi Iyer to payout-token issuance specifically. When entitlements-svc degraded during a migration cohort, payout token issuance backed up through the loop. Because the service had no on-call rotation, no page fired on its own signals — the incident was only noticed once merchants started reporting they hadn't been paid.

Earliest observable signal: rising payout-token issuance latency correlating with entitlements-svc health, with no corresponding page acknowledged — the absence of a page is itself the signal.

Which document should have caught this and did not: the architecture review notes, "Confirmed" section — it states plainly that entitlements-svc has no owner and names an action to fix that before sequencing begins; nothing in the corpus shows that action was ever closed.

---

## Ranking by likelihood

1. **#1 — ledger-api write-semantics conflict.** Not contingent on an external event or a degradation — it's a hard interface mismatch with a fixed calendar deadline (30 June 2026) that the review itself left as "to be confirmed." Under these constraints that's never resolved, so this fires deterministically.
2. **#2 — cutover with no rollback.** This is a repeat of a documented prior failure under materially unchanged conditions (same rehearsal gap, same parallel-run design). Precedent plus no compensating action is about as strong a signal as this corpus offers.
3. **#3 — recon-batch orphan.** Confirmed to exist, tied to the same fixed 30 June cutoff, and explicitly left as an open action with no recorded closure — high confidence, slightly below #1/#2 because it depends on the script actually still being load-bearing for reconciliation, which the review flagged as unconfirmed either way.
4. **#4 — processor concentration.** The structural risk is certain; the timing isn't — it requires Northwind to actually have an outage during the observation window, which the corpus can't confirm one way or the other.
5. **#5 — payout loop with no on-call.** Real and confirmed unowned, but the blast radius is narrower (payout tokens only, per Ravi Iyer's own scoping) and it additionally requires entitlements-svc to degrade in the first place — two contingencies stacked, versus one or zero for the narratives above it.
