# Absence Reconstruction — August 11 to September 2, 2026

> **This is not a contemporaneous weekly file.** No operating file was written between
> Aug 10 and Sep 4. Karl Bergstrom was on leave Aug 11 – Sep 2 (Sara Lindqvist covering),
> and the six system exports were never refreshed during the window — Aha!, Jira ×2,
> Salesforce ×2, Vanta and DataDog all still read `2026-08-10`.
>
> **Reconstructed 2026-09-04** by `portfolio-monitor` from the only two current sources:
> `1-inputs-triggers/gmail/novagrid-gmail-export.json` and
> `1-inputs-triggers/calendar/novagrid-calendar-export.json` (both exported 2026-09-03).
> Every claim below traces to a thread ID or an event ID. Nothing is inferred from the
> system exports, because they do not cover this window.

---

## The shape of the gap

| Measure | Value |
|---|---|
| Working days missed | 17 |
| Meetings declined or missed | 47 |
| Decision forums held without the Head of TPM | 3 |
| **Decisions taken without the Head of TPM** | **4** |
| **…of those, with no decision record** | **2** |
| SteerCos chaired by the cover TPM | 3 |
| Unread mail on return | 214 (41 direct, 9 requiring reply) |

**Handoff log:** `THR-1001` — Sara Lindqvist, four cover notes (Aug 14, Aug 21, Aug 28, Sep 2).
It is a good handoff log. It named every item below, in the week it happened, and flagged
which ones were not hers to decide. The failure in this window was not communication.

---

## Week 1 — Aug 11 to Aug 14 (W33)

| Date | Event | Source |
|---|---|---|
| Aug 11 | **SPARK M2 called NO-GO.** 88%, remaining 12% is integration testing against ATLAS multi-tenant serving. Revised target Aug 25. | THR-1008 |
| Aug 13 | **SHIELD readiness criteria tabled** — 5 acceptance items, James Whitfield named as signer. I-004 on a path. | EVT-2101 |
| Aug 14 | Weekly TPM SteerCo, chaired by Sara Lindqvist. Apple still silent at day 13. | EVT-2101 |

Daniel Rios on the NO-GO: *"Forcing a close today would mean declaring an alpha that has
not been integration tested, which is the kind of green that turns red in September."*
The call was correct and made on the day. Sara: *"Nothing needs you this week."*

## Week 2 — Aug 17 to Aug 21 (W34) — the week it turned

| Date | Event | Source |
|---|---|---|
| Aug 17 | ATLAS full-IAM refactor sprint started. Sec Eng holding 15%. | THR-1012 |
| Aug 18 | **Auth0 renewal signed** — 24 months, pricing flat. NEXUS R-006 closed. | THR-1016 |
| Aug 18 | **ATLAS 4th enterprise customer live** (Halden Freight). 4/5 on M7. | THR-1010 |
| **Aug 19** | **Apple REJECTED HORIZON** — guideline 5.1.1(v), no in-app account deletion. Day 18 of review. | THR-1003 |
| **Aug 20** | **DECIDED: ship Android-only Aug 31, hold iOS.** Contingency call, Ingrid Solvang. **No decision record.** | EVT-2102 / THR-1004 |
| Aug 20 | **MERIDIAN M6 closed at 210/210** — one day early against the DR-015 revised date. | THR-1011 |
| Aug 21 | Weekly TPM SteerCo, chaired by Sara Lindqvist. | EVT-2103 |

Priya Kaur owned the rejection without prompting: *"This is a known, well-documented
requirement and we should have caught it in pre-submission review; I own that."*
Fix was three days; resubmitted Aug 24; review clock restarted.

Sara flagged the decision-record gap in the same week it happened:
*"it was taken in a call, there is no decision record, and it changes what M8 means.
That is yours to ratify."*

Ingrid, on holding the decision: *"Karl, you were on the invite; I did not want to hold
the decision three weeks for you. If you disagree when you are back, say so and we will
re-cut the messaging, but the ship has left on the Android side."*

## Week 3 — Aug 24 to Aug 28 (W35)

| Date | Event | Source |
|---|---|---|
| Aug 24 | HORIZON resubmitted to Apple with in-app deletion. Second review clock starts. | THR-1003 |
| **Aug 24** | **Q3 QBR moved Sep 22 → Sep 8.** Pre-read due Sep 4 EOD. Three named CFO requirements. | EVT-2104 / THR-1002 |
| Aug 24 | Thornbridge $1.7M expansion moved to Contract Negotiation. | THR-1011 |
| Aug 25 | MERIDIAN SMB reached 96%. | THR-1011 |
| **Aug 26** | **INC-2026-0131 — SEV2, PULSE, 4h11m.** Traffic-verification cutover dropped a DataCore ingestion pipeline. MTTD 9 min, no customer-visible loss, backfill same day. PIR Sep 4. | THR-1007 |
| Aug 26 | **NEXUS M7 target conflict escalated with a deadline** — <200 (KR) vs <175 (CHG-002). Board chart being built. | THR-1009 |
| **Aug 27** | **SPARK M2 CLOSED** — 16 days late vs Aug 11, 2 days vs revised. DEP-008 closed. | THR-1008 |
| **Aug 27** | **DECIDED: SPARK M3 moves Sep 30 → Oct 16.** Daniel Rios / Leo Nakamura. **No decision record.** | EVT-2106 |
| **Aug 28** | **PULSE traffic verification: 14 pipelines still writing Airflow-managed state.** Read-only mode Sep 1 → Sep 14. | THR-1007 |
| Aug 28 | Weekly TPM SteerCo, chaired by Sara Lindqvist. | EVT-2105 |

Marcus Bauer set the QBR deadline knowing it landed on the return:
*"I know you are out. I am sending this so it is waiting for you."*
Yuki Tanaka: *"do not try to answer this from a beach… let us talk before you send
anything on ATLAS M9 — I want us aligned on the number before Marcus sees it."*

Yuna Park on the 14 pipelines: *"They pass every functional check and they would have
failed silently at shutdown. This is A-006 exactly: the sequence was never rehearsed on
this estate, and the runbook did not know what actually depended on what."*

## Week 4 — Aug 31 to Sep 2 (W36)

| Date | Event | Source |
|---|---|---|
| **Aug 31** | **HORIZON Android public GA shipped on time.** 4,100 installs in 48h, no SEV incidents. | THR-1003 |
| **Aug 31** | **SHIELD M6 readiness CLOSED on the board-mandated date.** Signed by James Whitfield against the 5 criteria agreed Aug 13. | EVT-2107 / THR-1006 |
| **Aug 31** | **SPARK M6 evaluation framework MISSED at 52%.** No new date set. | THR-1008 |
| Aug 31 | MERIDIAN: **compatibility-shim caveat put on the record** — Brightline and Corvid are on v2 via a shim hosted on v1 infrastructure. | THR-1011 |
| **Sep 1** | **The auditor observation window OPENED** (Sep 1 – Nov 30, report Dec 15). Sampling from week of Sep 21, monthly thereafter. | THR-1014 |
| **Sep 1** | **DEP-009 did NOT close.** CC6.4 and CC6.6 entered the window on July compensating documentation. | THR-1006 |
| Sep 1 | ATLAS M9 escalated — honest number is 8, maybe 9, against a commitment of 15. | THR-1010 |
| Sep 1 | Solaris escalation — written iOS date needed by Sep 4, legal review opens that day. | THR-1005 |
| Sep 1 | Two Sr. TPM candidates at final stage; competing offers expire Sep 11. | THR-1015 |

Fatima Al-Hassan, on the one thing that did not land: *"Yuna was consumed by the
decommission and I did not escalate hard enough… this is exactly the $12.2M question and
I do not want to choose alone. R-009 is no longer theoretical — it has a specific name on
day one."*

---

## What the window actually cost

**Delivery held up well.** MERIDIAN closed a day early. SHIELD closed on a board-mandated
date. ATLAS had its first month above the 99.0% uptime commitment since GA (99.1% August
average). HORIZON shipped Android on time. SPARK made an honest NO-GO and then closed.
Auth0 was signed. Nobody hid anything.

**What did not happen was portfolio-level judgment.** Every item that needed the Head of
TPM waited, and four of them acquired deadlines while waiting:

| Item | Open since | Now due |
|---|---|---|
| NEXUS M7 target — <200 or <175 | Jul 13 | Sep 4 (board chart) |
| ATLAS M9 renegotiated number | Aug 3 | Sep 4 (QBR pre-read) |
| SHIELD DEP-009 evidence call | Aug 7 | Sep 21 (The auditor sampling) |
| MERIDIAN shim ownership | Aug 31 | Sep 30 (hard EoL) |

**Two decisions were taken with no decision record**, both of which change something
board-visible: HORIZON M8's definition, and a date on the SPARK Dec 31 GA chain.
Ratified retrospectively as DR-016 and DR-017 on Sep 4.

---

## The transferable lesson

The cover arrangement worked exactly as designed for *execution* and not at all for
*commitment*. Sara Lindqvist could chair SteerCo, could keep programs moving, and could
correctly identify what was not hers to decide — but she had no authority to renegotiate a
board commitment, and no mechanism existed to escalate one past her while Karl was out.
The auto-reply said *"for anything board-facing contact Yuki Tanaka"*; nothing routed the
M9 or M7 questions there, and both sat until they had deadlines.

**A cover TPM needs a named decision escalation path, not just a named inbox.**

Second lesson, cheaper to learn here than in December: **six system exports went 24 days
without a refresh and nothing noticed.** `scripts/check_novagrid_consistency.py` returned
OK throughout, because it validates internal consistency against a self-declared as-of
date rather than against the clock.
