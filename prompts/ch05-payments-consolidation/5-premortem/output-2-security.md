> **Recorded output.** Produced by `run.sh` from `5-premortem/prompt-2-security.md` with model `sonnet` on 2026-09-29.
> One real run: yours will differ in wording. Validate it the way the prompt file describes.

# Incident Narratives — Payments Consolidation Program (Security Engineer's Lens)

*Six months out. Scope: data handling, access, compliance, residency only. "To be confirmed" items below never were.*

---

### 1. Undetected PCI Scope Expansion via a Halden Retry/Logging Path

**What happened, in sequence:** The assumption log asserted that processor-to-processor card data migration "keeps Halden out of the data flow and does not expand PCI scope" (Assumption row 19), and explicitly noted no QSA review would confirm this (row 20). Separately, Ben Cortez flagged that Veloxa API keys were "held by at least three services" and asked for an inventory before cutover, and asked for a security sign-off gate before each cohort migrated — neither request appears completed or adopted in any later sequencing document (Alignment doc, "Positions no one else addressed"; not referenced in the architecture review notes). During the two-week parallel-run window (row 8), one of the undisclosed key-holding services logged raw card data or tokens through standard error/retry diagnostics. Halden's own systems entered the cardholder data flow, contradicting row 19. Scope expansion surfaced in the post-migration PCI audit, not before.

**Earliest observable signal:** Ben Cortez's unresolved requests — the API-key inventory and the pre-cohort security sign-off gate — both raised and never actioned.

**Which document should have caught this and did not:** Assumption row 20 itself, which named this exact failure mode ("An incorrect scope conclusion surfaces during audit, not during planning") — but the charter's governance section (Charter §8) had "no RACI, escalation path, or decision framework," so nothing converted that named risk into a gate.

---

### 2. Legacy Processor Credentials Left Live Post-Decommission

**What happened, in sequence:** Ben Cortez's API-key inventory was never completed (see above). Architecture review confirmed entitlements-svc had no owner, with the action item "Marcus Webb to assign an owner before sequencing" — no confirmation this closed appears anywhere afterward. The same review also proved the ownership map itself unreliable: settlement-api had been misattributed as unowned when Billing Services had owned it since the January 2026 reorg. Decommissioning proceeded on Assumption row 32 ("Veloxa and Tessera Pay integrations are switched off, credentials revoked...") against that same unreliable map, without Cortez's inventory. Separately, the review surfaced `recon-batch` — an undocumented cron script on the Tessera integration host reading ledger-api v2 directly, present in no design document, with its owner still unconfirmed ("Action: Kofi Mensah to confirm the script's owner"). At least one credential path — inside the uninventoried "three services," or the undocumented script — remained live after the stated decommission date, discovered via Veloxa/Tessera access logs.

**Earliest observable signal:** The architecture review's discovery of `recon-batch`, an access path no design document tracked, paired with the still-open "assign an owner" action item for entitlements-svc.

**Which document should have caught this and did not:** The dependency map's UNOWNED table, and the architecture review's own action items — none of which were ever marked complete in any later artifact.

---

### 3. Kestrel Token Export Mishandled Under Licensing Pressure

**What happened, in sequence:** Sara Okonjo flagged that Kestrel's card tokens were issued under Veloxa's tokenization license, that Veloxa "never signed quickly for anyone," and that Veloxa carried a 180-day termination notice. Assumption row 15 nonetheless assumed "Veloxa will provide a token export under its standard token migration service," giving no reason why this would differ from 2024, when the same Veloxa contract review took eleven weeks (Appendix A, referenced at row 17). The charter's Known Risks section (§10) recorded only that "Legal has flagged a licensing risk; nature and severity are not detailed" — never resolved to a specific control. Under pressure from the Q3 deadline and the 15 Nov change freeze, the Kestrel token export proceeded without a fully executed licensing agreement, forcing tokens through a non-standard export or re-mint path outside Veloxa's licensed tokenization service.

**Earliest observable signal:** Sara Okonjo's licensing flag, paired with the charter's own admission that the risk's "nature and severity are not detailed."

**Which document should have caught this and did not:** Charter §10 (Known Risks) — it logged the risk's existence but never its detail, and no later artifact (assumption log, dependency map) closed that gap before cutover.

---

### 4. Silent Auth Failure in Billing Batch Jobs Post Token-Lifetime Change

**What happened, in sequence:** identity-svc's token lifetime was shortened from 24 hours to 15 minutes effective 1 December 2025 (dependency map, doc 6). billing-svc's nightly batch jobs (doc 4) were built assuming 24-hour tokens. The architecture review confirmed this conflict as real, adding: "Kofi Mensah believes the jobs already re-authenticate; not verified." That verification never appears in any subsequent document. During a cohort's nightly reconciliation run, a batch job's token expired mid-run; rather than failing loudly, it either retried on a stale cached token or silently dropped unauthenticated writes — a data-handling and access-control failure surfaced only when Finance Operations found reconciliation gaps with no matching outage.

**Earliest observable signal:** Kofi Mensah's own caveat, recorded verbatim in the architecture review notes as "not verified."

**Which document should have caught this and did not:** The architecture review notes' "Confirmed" section — it named the exact gap and flagged it as unverified, but nothing after that run closed it.

---

### 5. EU Cardholder Data Routed Through a US Processor — Residency Breach

**What happened, in sequence:** Anika Roth stated that "two of the three processors store cardholder data in the EU," and that consolidating onto a US processor would create "a data residency problem rather than a migration problem." This appears only under "Positions no one else addressed" — no conflict row was ever opened for it, and no later artifact revisits it. Migration proceeded on Assumption rows 13–14 (Northwind's contract and payment-method coverage), which validate processor *capability* but never data *location*. If the eventual single processor is Northwind (US) — itself only an inference, since the charter states the target processor is "not named anywhere in source" (§10) — EU cardholder data previously held by Veloxa/Tessera would migrate to a US-domiciled processor with no residency control in place.

**Earliest observable signal:** Anika Roth's flag, unanswered and absent from the conflict register.

**Which document should have caught this and did not:** Charter §10 (Known Risks) — it logs the licensing risk and the platform-risk concentration, but never data residency; the assumption log validates processor capacity and method support (rows 13–14) but never storage location.

---

## Ranking by likelihood

1. **PCI scope expansion (Narrative 1)** — Two independent, uncontested human flags (inventory + sign-off gate) plus a self-predicted failure mode written directly into the assumption log, with zero mitigating governance structure to catch it. This is the corpus's most overdetermined failure.
2. **Credential leftover post-decommission (Narrative 2)** — Ownership gaps were *confirmed*, not just assumed, at architecture review, and the ownership map was already caught being wrong once (settlement-api). An undocumented live script (`recon-batch`) discovered mid-review makes leftover access near-certain.
3. **Kestrel tokenization licensing (Narrative 3)** — Backed by a concrete historical precedent (11-week 2024 delay) and named external-party friction, but deadline pressure is as likely to produce a program slip as a covert compliance breach — slightly lowering certainty within this lens.
4. **Silent batch auth failure (Narrative 4)** — The gap is explicitly named and unverified, but it's the kind of thing integration testing has a real chance of surfacing before go-live, unlike the governance-shaped gaps above.
5. **Residency breach (Narrative 5)** — Most severe if it happens, but rests on a single unanswered comment and an unconfirmed premise (the charter itself says the target processor was never named) — the weakest evidentiary chain of the five.
