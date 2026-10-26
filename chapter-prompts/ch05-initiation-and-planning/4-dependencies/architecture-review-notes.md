# Architecture review of the synthesized dependency map

Thu 16 Apr 2026 · 40 min · Attendees: Oskar Lindgren, Kofi Mensah, Hana Sato, Ravi Iyer,
Anika Roth, Jonas Brandt, [TPM]

This is scenario material: the human review the chapter makes mandatory. The synthesis in
[output.md](output.md) is the input; these notes are what the engineers changed.

## Corrections

1. **settlement-api is owned.** Billing Services took it over in the January 2026 reorg,
   when Finance Systems was merged into Billing. The ownership map was never updated.
   Kofi Mensah confirmed. *Action: Engineering Operations to update the ownership map.*
2. **A dependency no document mentions.** Anika Roth: the Marketplace month-end job
   `recon-batch`, a cron script on the Tessera integration host, reads ledger-api v2's
   reporting views directly. It was left behind by the 2024 attempt and is not in any design
   document. It breaks when ledger-api v2 is switched off on 30 June 2026.
   *Action: Kofi Mensah to confirm the script's owner and whether reconciliation still needs it.*

## Confirmed

- **entitlements-svc** has no owner. Nobody present claimed it. *Action: Marcus Webb to assign
  an owner before sequencing.*
- **ledger-api write semantics conflict** is real: billing-svc still submits nightly batches
  (doc 2) and v3 has no batch endpoint (doc 7). Billing must move to synchronous writes before
  30 June 2026. *Status: to be confirmed with Billing's Q2 plan.*
- **Token lifetime conflict** is real: billing-svc nightly jobs (doc 4) assume 24-hour tokens,
  enforced lifetime is 15 minutes since 1 December 2025 (doc 6). Kofi Mensah believes the jobs
  already re-authenticate; not verified.
- **The circular chain** payments-core → entitlements-svc → identity-svc → payments-core exists.
  Ravi Iyer: the identity-svc → payments-core call only happens for payout tokens, so the loop
  is real but not on the authorisation path.
- **fraud-scoring and risk-engine** are the same service. risk-engine was the working name in
  the doc 11 draft. Ravi Iyer to correct the draft.

## Carried into sequencing

The ledger-api write-semantics conflict goes into sequencing marked "to be confirmed".
