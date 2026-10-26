> **Recorded output.** Produced by `run.sh` from `4-dependencies/prompt-stage1-extract.md` with model `sonnet` on 2026-09-28.
> One real run: yours will differ in wording. Validate it the way the prompt file describes.

## Dependency Extraction — Doc 3: Month-End Reconciliation

| Source | Target | Type | Method | Failure Impact | Status |
|---|---|---|---|---|---|
| Month-end reconciliation job (Billing Services) | settlement-api | Hard (blocking) | REST API, v1 | Month-end close halts entirely; document states no fallback source exists for settled totals | Existing |
| Month-end reconciliation job | Ledger service — v2 reporting views | Data dependency (shared state) | Direct read of reporting views (implies shared DB/view access, not an API call) | Not stated | Existing (being replaced) |
| Month-end reconciliation job | ledger-api v3 | Hard (blocking) — *inferred, see Q2 below* | REST API, v3 | Not stated | **Planned** (replaces the v2 views row above) |
| Month-end reconciliation job | Processor portals (per processor) | Hard (blocking) — *inferred* | Manual file download (no system integration — human process, not automated) | Not stated | Existing |

**Circular dependencies:** None detected in this document.

**Cross-team / cross-boundary coordination flagged:**
- **Ledger v2→v3 migration** — reconciliation job's read path changes from views to an API contract. Requires coordination between Billing Services and whichever team owns the ledger service to confirm the v3 API is a compatible replacement for the v2 views (schema, latency, data freshness may all differ).
- **Processor portals** — these are external vendor systems, not internal teams. The manual download step is a single point of human failure/delay that sits outside any monitored dependency chain.

### Questions before I finalize categorization

1. **Ledger dependency, current state:** The doc says recorded totals come from "v2 reporting views" — is this a direct database/view read (shared database dependency) or is it actually fronted by an API/reporting layer? This changes whether I classify it as **Data dependency** vs. **Hard dependency** with a DB-backed method.
2. **Failure impact — ledger and processor statements:** The doc only states explicit failure handling for settlement-api ("close waits, no fallback"). It's silent on what happens if the ledger source or processor statements are unavailable/late. Should I mark these as **Hard by inference** (since the job needs all three sources to reconcile), or leave Failure Impact as "Not stated — assumption requiring validation" and flag for Finance Ops/Kofi to confirm?
3. **ledger-api v3 status:** Confirming this is not yet live ("the planned upgrade") — should the v2 row be marked "existing, to be deprecated" rather than just "existing"?
4. **Processor statement dependency:** Since it's a manual process rather than a system integration, do you want it included in this table at all, or tracked separately as an operational (non-technical) dependency?
