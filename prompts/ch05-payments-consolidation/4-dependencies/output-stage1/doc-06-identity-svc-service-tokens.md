> **Recorded output.** Produced by `run.sh` from `4-dependencies/prompt-stage1-extract.md` with model `sonnet` on 2026-09-28.
> One real run: yours will differ in wording. Validate it the way the prompt file describes.

## Dependency Extraction — doc-06-identity-svc-service-tokens.md

| Source | Target | Type | Method | Failure Impact | Status |
|---|---|---|---|---|---|
| identity-svc | Secrets manager | Hard | Not specified (credential retrieval, method unstated) | No new tokens issued; callers fail once their current token expires (≤15 min) | Existing (Live) |
| Internal callers (services calling each other) | identity-svc | Hard | Service token issuance (transport/protocol not stated) | Not stated — doc only covers token *lifetime/rollout*, not identity-svc outage behavior | Existing (Live), enforced org-wide from 1 Dec 2025 |
| Batch clients | Workload credential provider (re-auth source) | Hard | Not specified — "re-authenticate with its workload credential" | Batch job stalls/fails once token expires (no refresh path) | Existing (Live) |

**Circular dependencies:** None detected — only one document, no reverse edge found.

**Cross-team coordination flagged:** The 1 Dec 2025 enforcement date breaks any caller still using long-lived tokens — that's every team owning an internal service calling another internal service. Needs confirmation of who's tracking caller migration.

### Follow-up questions (uncertain / unstated in this doc)
1. **Integration method** for identity-svc ↔ secrets manager — REST, SDK, sidecar? Not stated.
2. **Integration method** for callers ↔ identity-svc — REST API assumed but not confirmed.
3. What is identity-svc's own failure impact on *its* callers if identity-svc itself is down (not just secrets manager)? Not covered in this doc — likely in another doc.
4. Is this the only document, or are there others (e.g., the services identity-svc is called *by*) that would let me trace the other side of these edges? I only have doc-06 so far — the table above reflects identity-svc's own stated dependencies, not a full system map.

Let me know if there are more docs to fold in, or if you want me to mark items 1–3 as `assumption requiring validation` in the Status column instead of leaving them out.
