# DR-014 — SOC 2 Board Mandate Restated: August 31 Is Audit-Readiness, Certification Is December 15

| Field | Value |
|-------|-------|
| **DR ID** | DR-014 |
| **Date** | July 22, 2026 |
| **Decision maker** | NovaGrid Board of Directors |
| **Presented by** | James Whitfield (CISO), Karl Bergstrom (CTO) |
| **Informed** | Priya Anand (CEO), Fatima Al-Hassan (TPM SHIELD), Marcus Bauer (CFO), CRO / RevOps, all account executives on SOC 2-gated deals |
| **Programs affected** | SHIELD (primary) · ATLAS · MERIDIAN (commercial second-order) |
| **Status** | Active — governs all SOC 2 dates and customer commitments |

---

## Context

Since program kickoff in September 2025, SHIELD has carried the objective **"achieve SOC 2 Type II certification by August 2026."** That language appeared in the board mandate, the program master document, FY2026 OKR KR1.1, the company snapshot, the Vanta export, and in customer-facing commitments made by at least four account executives.

**It was never achievable, and the contradiction was visible in NovaGrid's own data the entire time.** The Vanta export recorded, in the same object:

```
"boardMandateDeadline":      "2026-08-31"
"observationPeriodStart":    "2026-09-01"
"observationPeriodEnd":      "2026-11-30"
"reportExpected":            "2026-12-15"
```

A SOC 2 Type II report attests that controls **operated effectively over an observation period**. This engagement's observation period does not open until September 1. No Type II report can exist on August 31 — not because anything slipped, but because the date describes a deliverable that does not exist in Deloitte's engagement letter.

Eleven months of program reporting, executive updates, and sales commitments were built on a date nobody had reconciled against the auditor's own contract.

---

## What surfaced it

Not a review. An audit finding.

SHIELD closed M4 (100 controls complete) on time July 15 and delivered the full evidence package the same day. On **July 16**, Deloitte returned findings: 97 of 100 controls accepted, **3 failed on evidence sufficiency** — A1.7 (log retention, closed Jun 30), CC6.4 (quarterly access review) and CC6.6 (privileged access management), the latter two live only since July 1.

The failures were not implementation defects. Every control was built and operating. They were **operating-history** defects: a quarterly access review with fifteen days of history cannot evidence a quarterly cycle.

While raising them, Deloitte's engagement partner added an observation NovaGrid had not asked for:

> "The August 31 date in your board materials describes a certification we cannot issue. Our observation period opens September 1 and closes November 30, with the report following December 15. We flag this because your board appears to be tracking a date that does not correspond to any deliverable in our engagement letter."

---

## Decision

The August 31, 2026 board mandate is **restated, not moved**:

| | Old (as recorded) | New (as decided) |
|---|---|---|
| **Aug 31, 2026** | SOC 2 Type II certification achieved | **SOC 2 Type II audit-readiness confirmed** |
| **Sep 1 – Nov 30, 2026** | *(not tracked)* | **Deloitte observation period** |
| **Dec 15, 2026** | *(not tracked)* | **SOC 2 Type II report issued** |

The board accepted the restatement on July 22 on the basis that the original mandate **conflated readiness with certification**, and that no engineering commitment had been missed.

### Program changes

- SHIELD **M6** renamed: "SOC 2 Type II certification received" → **"SOC 2 Type II audit readiness (board mandate)"**, Aug 31
- SHIELD **M7** created: **"SOC 2 Type II report issued"**, Dec 15 — holds what M6 used to imply
- SHIELD program `targetEndDate` moved Aug 31 → **Dec 15, 2026**
- Risk **R-004** ("August audit date immovable") dissolved — the date was misunderstood, not immovable
- Risk **R-008** opened: control drift during the observation period is now the program's dominant risk

---

## Commercial consequence

Roughly **$6.3M of pipeline moved from Q3 to Q4.** This is a timing loss, not a lost-deal loss, but it is real and it was reported as such.

| Account | Value | Change | Note |
|---------|-------|--------|------|
| Nuvera Insurance | $2.1M | Aug 31 → Q4, probability 80% → 72% | Rajiv Patel (CDO) asked the direct question on Jul 28 via support ticket SC-2026-0399. His Q3 board window cannot be met with a readiness statement. |
| Meridian Financial Group | $4.2M | Q3 → Q4, probability 75% → **78%** | Yvonne Tran's response: the clarity helps more than the earlier date did — her legal team had assumed a report, not a readiness milestone. Probability rose. |
| Apex Health / Finex / Corinthia expansions | $9.4M combined | Unlock moved Aug 31 → Dec 15 | Expansion tracks, not new logos |

Two accounts responded to the same restatement in opposite directions. The difference was whether the customer had a fixed internal deadline behind the date.

---

## Assessment

The restatement cost one uncomfortable board conversation and a quarter of pipeline timing. It removed a structural falsehood from the portfolio that four account executives had been repeating to customers in good faith.

**The failure mode worth naming is not that a date was wrong.** It is that the correct date was sitting in NovaGrid's own compliance export, in the same object as the wrong one, for eleven months — and that it took an external auditor volunteering an unsolicited observation to make anyone read the two fields together.

Nothing in the program's reporting cadence was designed to catch a contradiction between a mandate and a vendor contract, because both were treated as inputs rather than as claims to be reconciled.

---

## Conditions and monitoring

- **Readiness sign-off criteria for Aug 31 are still undefined** as of Aug 10 — twenty-one days out. Fatima Al-Hassan to propose criteria and a named signer to James Whitfield this week. Leaving "ready" undefined is a repeat of the ambiguity that created this decision (SHIELD R-010).
- All customer-facing SOC 2 language re-issued to RevOps Jul 27. No account executive may quote an Aug 31 certification date.
- CC6.4 must evidence a **complete quarterly cycle before Nov 30**; schedule it to complete by Oct 31 for one cycle of margin (SHIELD R-009).
- Any material control exception during Sep 1 – Nov 30 moves the Dec 15 report and takes Meridian Financial and Nuvera into FY2027.

---

## Related

- SHIELD M4 (closed Jul 15) · M5 (closed Aug 7) · M6 (Aug 31) · M7 (Dec 15)
- SHIELD R-008 — control drift during observation; the dominant risk now
- SHIELD R-009 — CC6.4 / CC6.6 carry compensating documentation, not operating history
- SHIELD R-010 — readiness sign-off criteria undefined
- Vanta `deloitteInteractions` — DELOITTE-FINDING-2026-001 (Jul 16), NG-GOV-2026-003 (Jul 22), DELOITTE-ACK-2026-003 (Aug 7)
- SC-2026-0399 — Nuvera's direct question, arriving through support rather than the account team
- FY2026 OKR KR1.1 — restated against the Dec 15 report date
