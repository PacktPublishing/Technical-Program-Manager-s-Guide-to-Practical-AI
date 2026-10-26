# Payments Platform Consolidation — Program Scope

| | |
|---|---|
| **Version** | 1.0 — approved |
| **Approved by** | Steering committee, Thursday 2 April 2026 |
| **Sponsor** | Marcus Webb, VP Engineering |
| **Program TPM** | [TPM] |
| **Status** | Baseline for planning. Changes go through the steering committee. |

---

## 1. Purpose

This document defines the scope of the Payments Platform Consolidation program. It is the
reference for planning, sequencing and staffing, and the baseline against which scope changes
are assessed.

## 2. Background

Halden runs three payment platforms: Halden Pay, Kestrel and Marketplace Payments. Each has its
own processor, its own on-call rotation and its own month-end reconciliation. Running all three
slows every payments feature and consumes three to four days of Finance Operations time at each
month-end.

A consolidation was attempted in 2024 and stopped. The lessons from that attempt are summarised
in Appendix A.

## 3. Objectives

1. Migrate all users to the consolidated platform.
2. Operate payments on a single processor, Northwind Payments, by the end of Q3 2026.
3. Reduce payments operating cost from Q4 2026.
4. Run one payments on-call rotation instead of three.

Halden Pay is the target platform. It is the most modern of the three and already runs on
Northwind, so no new platform work is required beyond capacity and feature parity.

## 4. In scope

- Migration of all merchant accounts from Kestrel and Marketplace Payments to Halden Pay.
- Migration of stored card tokens from Veloxa and Tessera Pay to Northwind.
- Feature parity on Halden Pay for every payment method currently offered on Kestrel and
  Marketplace Payments.
- Termination of the Veloxa and Tessera Pay processor agreements.
- Consolidation of the three reconciliation jobs into one.
- Merchant communications for every migration cohort.

## 5. Out of scope

- Changes to the merchant checkout experience.
- New payment methods not already offered on at least one platform.
- Changes to pricing or merchant fees.
- The Halden Pay roadmap items already planned for 2026, which continue unchanged.

## 6. Phases

The program runs in three phases.

**Phase one — Readiness (April to May).** Build migration tooling, complete feature parity on
Halden Pay, agree cohort plans with Merchant Success, and complete the processor contract work.
Northwind confirms capacity for the combined volume during this phase.

**Phase two — Migration (June to August).** User migration completes in phase two. Merchants
move in cohorts, smallest platform first. Each cohort runs in parallel on the old and new
processor for two weeks before the old path is switched off.

**Phase three — Decommissioning (September).** The Veloxa and Tessera Pay integrations are
switched off, credentials revoked and the legacy reconciliation jobs retired. Phase three
completes by 30 September 2026.

Cohorts are sized so that no single cohort carries more than 15% of processed volume.

## 7. Teams and capacity

| Team | Role in the program |
|------|---------------------|
| Payments Platform | Target platform readiness, feature parity, cutover execution |
| Billing Services | Merchant record migration, reconciliation consolidation |
| Merchant Experience | Merchant-facing settings and settlement reporting |
| Risk & Identity | Fraud rules and identity mapping for migrated merchants |

The platform team has capacity in Q3. Billing Services absorbs the reconciliation work within
its existing plan. Merchant Experience and Risk & Identity contribute part-time and need no
dedicated staffing. No additional headcount is required.

Migration tooling is built by Payments Platform during phase one and reused for every cohort.

## 8. External parties and contracts

- **Northwind Payments** is the continuing processor. Our existing agreement covers the combined
  volume, and Northwind supports every payment method currently offered on Kestrel and
  Marketplace Payments.
- **Veloxa** will provide a token export under its standard token migration service. Card tokens
  move directly from Veloxa to Northwind and never pass through Halden systems.
- **Tessera Pay** will receive notice of termination in time to avoid the 1 October renewal.
- Legal review of the processor contracts follows the standard two-week cycle.
- Merchant notice periods are covered by the standard 30-day notice in our merchant terms.

## 9. Data and compliance

- Card data migration is handled processor-to-processor, which keeps Halden out of the data
  flow and does not expand PCI scope.
- The consolidated platform will expose the same settlement API.
- Existing fraud rules on Kestrel and Marketplace Payments map onto Halden Pay's rule engine
  without redesign.
- Merchant identity mapping between platforms is one-to-one.

## 10. Enterprise merchants

Enterprise merchants (approximately 40 accounts on individually negotiated terms) represent 31%
of processed volume across the three platforms. They migrate in the final cohort of phase two,
after the process has been proven on standard merchants. Their account managers handle
communications.

## 11. Success criteria

- All merchants processing on Northwind.
- Veloxa and Tessera Pay agreements terminated.
- One payments on-call rotation.
- Month-end reconciliation completed in one day.
- No increase in payout delays during migration.

## 12. Risks

| Risk | Mitigation |
|------|------------|
| Merchant churn during migration | Cohort-based migration with merchant communications |
| Northwind outage affecting all volume | Northwind's contracted availability |
| Delay in contract work | Early engagement with Legal |

## 13. Governance

- Steering committee: Marcus Webb (chair), Priya Raghavan, Lena Fischer, Tom Delacroix,
  Sara Okonjo. Meets every two weeks.
- The steering committee approves changes to scope and to the Q3 date.
- Weekly program status to the steering committee by email.
- A go/no-go decision is taken before each migration cohort.

## 14. Dependencies

- ledger-api v3 rollout completes before phase two begins.
- Merchant settlement reporting continues to work unchanged for migrated merchants.
- The payments change freeze (15 November to 5 January) does not affect the program, which
  completes before it starts.

---

## Appendix A — Lessons from the 2024 attempt

- The 2024 attempt cut Kestrel merchants over before a rollback path existed and could not
  return them to Veloxa when payout errors appeared.
- The Veloxa contract review during the 2024 renewal took eleven weeks, most of it waiting on
  Veloxa.
- Migration scripts written in 2024 were specific to that attempt and are not reused.
- Ownership of the merchant data model was unclear between Platform Engineering and Billing
  Services.

## Appendix B — Sign-off

| Name | Role | Date |
|------|------|------|
| Marcus Webb | VP Engineering (sponsor) | 2 Apr 2026 |
| Priya Raghavan | CFO | 2 Apr 2026 |
| Lena Fischer | Director of Product, Payments | 2 Apr 2026 |
| Tom Delacroix | Director, Platform Engineering | 2 Apr 2026 |
| Sara Okonjo | Senior Counsel, Commercial & Licensing | 2 Apr 2026 |
