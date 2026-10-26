> **Recorded output.** Produced by `run.sh` from `4-dependencies/prompt-stage3-milestones.md` with model `sonnet` on 2026-10-25.
> One real run: yours will differ in wording. Validate it the way the prompt file describes.

Back-scheduled from 30 Sept 2026, using the charter (`output.md`, Artifact 1), the assumption log (`output.md`, Phase 1–3 rows), and the architecture review corrections (`architecture-review-notes.md`).

## Milestones

| # | Milestone | Depends on | Duration (source) | Finish date | Gate owner |
|---|---|---|---|---|---|
| 1 | Steering committee kickoff | Mandate email (9 Mar 2026) | Fixed, "two weeks" out — Charter §6 | **23 Mar 2026** | Marcus Webb |
| 2 | Entitlements-svc owner assigned | M1 | Not stated in any artifact — architecture-review-notes.md: "Marcus Webb to assign an owner **before sequencing**" | Open — no date given; gates M3 | Marcus Webb |
| 3 | Q2 planning cycle resolves sequencing/resourcing/savings sizing | M1, M2 | Full Q2 2026 (13 wks) — Charter §6, Slide 17 | **30 Jun 2026** | Marcus Webb, Priya Raghavan, team leads |
| 4 | Phase 1 complete: feature parity, tooling, cohort plans, contract/legal review | M1, M3 | **Conflict** — stated Apr–May (9 wks, assumption row 5) vs. required: legal review alone is 11 wks (row 17, vs. stated "standard two-week cycle") *and* cohort-plan sub-task can't close before M3's 30 Jun sequencing decision → use **13 wks, through 30 Jun** | **30 Jun 2026** | Marcus Webb (eng/tooling); Legal (contract review) |
| 5 | ledger-api v2 gate: billing-svc cuts over to synchronous v3 writes; recon-batch resolved; Northwind capacity confirmed | External ledger-api v3 program; Billing's Q2 plan | Fixed external deadline — architecture-review-notes.md Confirmed section + Correction #2: ledger-api v2 switches off **30 Jun 2026**; Northwind capacity confirmation has no committed date anywhere in source (gap) | **30 Jun 2026** | Kofi Mensah |
| 6 | Phase 2 complete: cohort migration onto Northwind, incl. enterprise final cohort | M4, M5 | **Conflict** — stated ~13 wks (assumption row 7 narrative) vs. required ≥14 wks (7 cohorts × 2‑wk parallel run, row 7/8) → use **14 wks**. *(Unquantified additional risk: the enterprise cohort is 31% of volume against a stated 15% cap — rows 10, 22, 23 — which likely needs more than 7 cohorts; no source gives a revised count, so not folded into the 14 wks.)* | **6 Oct 2026** | Marcus Webb; Merchant Success |
| 7 | Phase 3 complete: Veloxa/Tessera switched off, credentials revoked, legacy reconciliation retired | M6 | 1 month, stated directly — assumption row 32 | **6 Nov 2026** | Marcus Webb; Legal (termination notices) |

## Critical path

M1 → M3 (Q2 sequencing) → M4/M5 (both pin to 30 Jun 2026) → M6 → M7. All four of M3, M4, M5, M6 run with zero slack against each other — M4 and M5 converge on the same 30 June 2026 date from two independent artifacts (the charter's Q2 planning cycle and the architecture review's ledger-api v2 shutdown), which cross-confirms 30 June as a real constraint rather than a schedule-writer's convenience. M2 (entitlements ownership) is the only milestone with plausible float, since no artifact bounds its duration — low apparent effort, but open-ended on paper.

## Float

**−5.3 weeks (≈37 days).** Working the backward pass against the 30 Sept target: M6 would need to finish by 31 Aug 2026, which requires M4/M5 to finish by **25 May 2026**. They actually finish **30 Jun 2026** — a 36-day deficit baked in before Phase 2 even starts. That deficit carries through unchanged (durations are stated minimums, not compressible), landing Phase 3 completion on **6 Nov 2026**, 37 days past the 30 Sept target.

Two consequences this surfaces rather than hides: the **1 Oct 2026 Tessera renewal** (Charter §6, assumption row 16) triggers before decommissioning even begins (Oct 6), so that contract renews regardless of this program; and 6 Nov sits only 9 days before the 15 Nov–5 Jan change freeze (assumption row 43), which itself assumed "zero slippage across all 41 prior assumptions" — already violated here.
