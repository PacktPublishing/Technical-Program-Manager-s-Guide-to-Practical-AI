> **Recorded output.** Produced by `run.sh` from `4-dependencies/prompt-stage1-extract.md` with model `sonnet` on 2026-09-28.
> One real run: yours will differ in wording. Validate it the way the prompt file describes.

## Dependency Extraction — Doc 2: Billing Services: Ledger Integration

| Source | Target | Type | Method | Failure Impact | Status |
|---|---|---|---|---|---|
| billing-svc | ledger-api | Data (shared state) | Async batch write, one batch/platform, submitted nightly at 02:00 UTC, polled for completion | Rejected batch delays finance reporting for that day; failed batch resubmitted in full the following night | Existing (Live) |
| billing-svc | PCS | Hard | Shared event bus — `charge.captured`, `charge.refunded` events | No fees computed while events are stopped; alert raised after 30 min of silence | Existing (Live) |

**Excluded:** Merchant fee plan reads from billing-svc's own database — not a cross-service dependency; the doc doesn't indicate any other system shares or writes to this store.

**Circular dependencies:** None detected — both edges point outward from billing-svc; no back-reference to billing-svc from ledger-api or PCS in this doc.

**Cross-team coordination points:**
- billing-svc ↔ ledger team — batch rejection/resubmission protocol (what triggers rejection, retry semantics)
- billing-svc ↔ PCS team — event bus reliability and the 30-min alert threshold

**Follow-up questions:**
1. Batch rejection only delays finance reporting per the doc — should this be Hard rather than Data, or is "delayed until accepted" the full extent of the impact (no cap/SLA breach implied)?
2. When PCS events resume after an outage, is fee computation backfilled retroactively, or are missed events simply lost? Doc doesn't say.
3. The event bus technology isn't named — do you want that identified for the cross-team coordination note, or is "shared event bus" sufficient?
