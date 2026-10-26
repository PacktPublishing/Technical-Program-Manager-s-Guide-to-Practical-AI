> **Recorded output.** Produced by `run.sh` from `4-dependencies/prompt-stage1-extract.md` with model `sonnet` on 2026-09-28.
> One real run: yours will differ in wording. Validate it the way the prompt file describes.

# Dependency Extraction — Doc 10: Merchant Settlement Reporting

| Source | Target | Type | Method | Failure Impact | Status |
|---|---|---|---|---|---|
| merchant-portal | settlement-api | Soft (degraded, not blocking) | REST API (v1) | If no record by 06:00 UTC, portal falls back to showing previous day's report + a banner. No outage, but stale/missing current-day data; merchants have raised this with support twice in 2025. | Existing |
| settlement-api | Platform-specific settlement sources (unnamed) | Data dependency (assumption) | Not specified | Not specified — doc only states settlement-api "hides the platform differences," implying it aggregates from 3 underlying platform sources, but doesn't name them or describe what happens if one platform's data is late/wrong. | Assumption requiring validation |

**Circular dependencies:** None detected — this is a single linear chain (portal → settlement-api → [implied platform sources]).

**Cross-team coordination flag:** The settlement report format is described as "contractual for enterprise merchants" and cannot change without notice. This isn't a service dependency, but any future change to settlement-api's output schema will require coordination with whichever team owns enterprise merchant contracts (Sales/Legal), not just Merchant Experience.

## Follow-up questions (please validate)

1. **The three platforms** — the doc says settlement-api "hides the platform differences" but never names the platforms or how settlement-api sources data from them (own DB? calls out to per-platform services?). Do you have the platform-side doc, or should I flag this row as a known gap rather than a dependency?
2. **Soft vs. Hard classification** — I classified portal→settlement-api as *Soft* because the doc explicitly describes a graceful fallback (previous day + banner). If that fallback is considered unacceptable for enterprise SLAs (contractual report), would you rather this be *Hard*? The category hinges on business tolerance, not just technical behavior.
3. Is there a settlement-api → database/data-store dependency I'm missing? The doc doesn't mention where settlement-api's own data comes from (e.g., a ledger or payments DB) — worth checking if that's covered in a different doc in this set.
