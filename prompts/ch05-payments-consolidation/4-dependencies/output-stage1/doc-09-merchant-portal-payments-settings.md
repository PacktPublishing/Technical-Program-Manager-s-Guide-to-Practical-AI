> **Recorded output.** Produced by `run.sh` from `4-dependencies/prompt-stage1-extract.md` with model `sonnet` on 2026-09-28.
> One real run: yours will differ in wording. Validate it the way the prompt file describes.

## Dependency Table — Doc 9: merchant-portal Payments Settings

| Source | Target | Type | Method | Failure Impact | Status |
|---|---|---|---|---|---|
| merchant-portal (Payments Settings) | entitlements | Hard* | Not specified (read + write-back) | Doc states page becomes **read-only** if entitlements is unavailable — see flag below | Existing |
| entitlements | identity-svc | Hard | Not specified ("resolves the merchant account via") | entitlements cannot resolve merchant account → cannot return any entitlement → cascades to merchant-portal | Existing |
| merchant-portal (Payments Settings) | PCS | Unstated (likely Soft) | REST API | Recent charges (last 90 days) would fail to load; not stated whether this breaks the rest of the page | Existing |
| PCS | entitlements | Hard | Not specified ("checks entitlements before authorising") | Charge cannot be authorized if entitlements check fails/unavailable | Existing |
| entitlements / merchant-portal | billing-svc | Data (shared state) | Not specified | Plan name inconsistency observed between portal and billing-svc for same entitlement — data is out of sync, not merely unavailable | Existing (known issue) |

\* Flagged — see questions below.

**Circular dependencies:** None detected. Chain is linear: merchant-portal → entitlements → identity-svc, and PCS → entitlements. No path leads back to merchant-portal or PCS.

**Cross-team coordination points:**
- merchant-portal ↔ entitlements (write-back path owned by different teams presumably — entitlements team not named)
- entitlements ↔ identity-svc (account resolution)
- PCS ↔ entitlements (authorization-time check)
- entitlements/portal ↔ billing-svc (plan-name data reconciliation — currently broken)

## Follow-up questions

1. **entitlements dependency mislabeled?** The doc explicitly calls entitlements a "Hard dependency" but then describes degraded (read-only) behavior on failure, not a full outage — that's the definition of a *soft* dependency per your categories. Should I keep the doc's literal label (Hard) or reclassify based on the described behavior (Soft)?
2. **PCS dependency type** isn't stated explicitly. Given it only feeds "recent charges" display, is it safe to infer Soft, or do you want unstated types left as "Unspecified" rather than inferred?
3. **billing-svc row** comes from the "Known issues" section, not the "Dependencies" section — do you want known-issue-derived dependencies included in this extraction, or should I restrict strictly to the Dependencies section and drop that row?
4. This looks like one doc in a series ("Doc 9"). Are Docs 1–8 and beyond coming separately, or is this the only source for this pass?
