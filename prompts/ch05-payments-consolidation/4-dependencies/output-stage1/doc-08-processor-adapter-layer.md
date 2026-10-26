> **Recorded output.** Produced by `run.sh` from `4-dependencies/prompt-stage1-extract.md` with model `sonnet` on 2026-09-28.
> One real run: yours will differ in wording. Validate it the way the prompt file describes.

## Dependency Extraction — Doc 8: Processor Adapter Layer

| Source | Target | Type | Method | Failure Impact | Status |
|---|---|---|---|---|---|
| Authorisation path | Adapter layer (common interface) | Hard | Not specified — doc only says "common interface" | Auth path cannot route to any processor; all authorisations blocked | Existing |
| Adapter layer | northwind-adapter | Hard | Not specified | Merchants assigned to Northwind cannot be authorised | Existing (Live) |
| Adapter layer | veloxa-adapter | Hard | Not specified | Merchants assigned to Veloxa cannot be authorised | Planned |
| Adapter layer | tessera-adapter | Hard | Not specified | Merchants assigned to Tessera cannot be authorised | Planned — necessity itself is an open question (§5) |
| northwind-adapter | Northwind Payments (processor) | Hard | Not specified | Cannot process authorisations for Northwind-assigned merchants | Existing |
| northwind-adapter | Northwind's vault (token store) | Data | Not specified — described only as "held in Northwind's vault" | Cannot retrieve/use tokens for Northwind-assigned merchants | Existing |
| veloxa-adapter | Veloxa (processor) | Hard | Not specified | Cannot process authorisations for Veloxa-assigned merchants | Planned |
| tessera-adapter | Tessera Pay (processor) | Hard | Not specified | Cannot process authorisations for Tessera-assigned merchants | Planned — contingent on §5 open question |
| Adapter layer | Routing table | Data | Direct read; table owned by adapter layer | Cannot determine which adapter/processor handles a merchant; all routing blocked | Existing |
| Merchant switching to Northwind | Veloxa/Tessera token vaults | Data | Token migration (format/timing undefined) | Merchant's cards do not work on Northwind until migration completes | **Assumption requiring validation** — explicitly flagged as open in §5 |

**Circular dependencies:** None detected in this document.

**Cross-team coordination flags:**
- Token migration (row 10) — format and timing are explicitly unresolved (§5); this looks like it requires a separate migration owner/team, not just the adapter team.
- Routing table (row 9) — doc says the adapter layer "owns" it, but doesn't state whether other services read or write it. If it's shared beyond this team, reassignments are a cross-team-visible change.

**Follow-up questions before I finalize this:**
1. Is the adapter-layer interface (row 1–4) in-process/library-level, or does it cross a network boundary (REST/gRPC/queue)? The doc never says.
2. Same question for adapter → processor calls (rows 5, 7, 8) — I assumed these are external processor integrations but the transport isn't named.
3. Does anything other than the adapter layer read or write the routing table? That changes row 9 from a private dependency to a shared-state one needing coordination.
4. Who owns the Veloxa/Tessera → Northwind token migration (row 10) — is this the Payments Platform team, a separate migrations team, or the processors themselves?
5. Should tessera-adapter's dependencies (row 4, 8) be marked "at risk" rather than "Planned," given §5 questions whether it's needed at all if Marketplace merchants migrate first?

This is a single-document extraction — let me know if there are other design docs (e.g., ones covering the "authorisation path" or "Marketplace merchants" referenced here) you want cross-referenced for additional dependencies or to resolve open questions 1–5.
