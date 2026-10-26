# DR-017 — SPARK M3 Moves from September 30 to October 16; Dec 31 GA Chain Loses Its Last Slack

> *Fictional example: NovaGrid, Inc. is an invented company. All people, customers, numbers and events in this file are made up for the book.*

| Field | Value |
|-------|-------|
| **DR ID** | DR-017 |
| **Date** | August 27, 2026 (**decided**) · September 4, 2026 (**recorded and ratified**) |
| **Decision maker** | Leo Nakamura (Dir. NovaAI) |
| **Proposed by** | Daniel Rios (Assoc. TPM SPARK) |
| **Informed** | Rachel Lim (VP), Sara Lindqvist (cover TPM), Karl Bergstrom (Head of TPM — absent) |
| **Programs affected** | SPARK · ATLAS (shared Model Serving capacity) |
| **Status** | Ratified September 4, 2026 — with a condition attached, see *Conditions* |

> ⚠️ **Recorded 8 days after the fact.** A date on the board-committed December 31 GA chain
> moved in a 30-minute call with no decision record and no portfolio review.

---

## Context

SPARK M2 (new model serving alpha) was due **August 11**. On that day it stood at 88%, with
the remaining 12% being integration testing against ATLAS multi-tenant serving — work that
depended on ATLAS engineers who had spent July on the uptime response (DR-011).

Daniel Rios called **NO-GO on August 11**: *"Forcing a close today would mean declaring an
alpha that has not been integration tested, which is the kind of green that turns red in
September."* Revised target August 25.

**M2 closed August 27** — 16 days late against the original date, 2 days late against the
revised one. Model serving alpha is live and integration tested. **DEP-008 closed.**

M3 (visual workflow builder beta) could not start until the M2 architecture patterns
existed. That was August 31, not August 25.

---

## Decision

Effective **August 27, 2026**:

- **SPARK M3 moves from September 30 to October 16, 2026.**
- The team takes six clear weeks rather than compressing into a date that no longer has a
  runway behind it.
- **The Dec 31 GA chain is explicitly not re-baselined.** M3 Oct 16 → M5 Nov 30 → M7 GA
  Dec 31 stands, with the slack removed rather than the endpoint moved.

---

## Rationale

Daniel Rios: *"M3 could not start until the M2 architecture patterns existed, that was Aug
31 not Aug 25, and the team needs six clear weeks."*

And, to his credit, on the cost — stated at the time rather than discovered later:
*"Consequence we are not pretending about: the Dec 31 GA chain now has M3 Oct 16 → M5 Nov
30 → GA Dec 31, which removes the last of the slack and makes M5 the next pressure point."*

The alternative — hold Sep 30 and compress M3 into four weeks — was rejected on the direct
evidence of M2: the last milestone that was squeezed produced an alpha at 88% on its due
date and slipped 16 days anyway.

---

## Consequences already visible

**The Dec 31 chain now has zero buffer at every link.** This was already flagged as
**SPARK R-009** — *"chain never reviewed end-to-end"* — carried since May 20 and originally
due before June 30. It is now more than three months overdue, on a chain with no slack.

**M6 (evaluation framework) missed August 31 at 52%, with no new date.** Daniel: *"it
competed with M2 for the same engineers all month and lost."* An orphaned milestone on a
program with a board-committed GA.

**A-005 is confirmed twice over.** The DR-007 Model Serving split (SPARK 65% / ATLAS 35%)
was reported as holding all quarter while actual SPARK time ran nearer 60%. That shortfall
is the direct cause of M2's 16 days, and M2's 16 days are the direct cause of this DR.
**A percentage allocation is not a protection mechanism.**

**VantagePoint's Sep 15 contractual roadmap review is now a place where this is visible.**
The $1.8M renewal signed July 15 on the strength of the roadmap. M2 is closed and
demonstrable, which is the thing that review most needs — but M3 moving to Oct 16 will be
in the room.

---

## Assessment

The individual calls were good. The NO-GO on Aug 11 was honest and made on the day. The M3
move was proposed with its consequence stated in the same breath rather than buried. Daniel
Rios has been consistently straight about this program.

**The portfolio-level failure is that nobody netted it out.** Three separate slips —
M2 +16 days, M3 +16 days, M6 missed entirely — were each individually justified, each
individually communicated, and never once assessed together against the December 31
commitment they all feed. The chain has absorbed every one of them and still reports
Dec 31.

That is the definition of the pattern this playbook calls a **Coconut**: a hard, confident
outer shell around a milestone date that nothing behind it any longer supports.

R-009 has been open for this exact reason since May 20. It was not closed because it was
never a program-level question — it needed Leo Nakamura and Rachel Lim in a room, and the
only person who convenes that was on leave.

---

## Conditions and monitoring

**This DR is ratified with one condition, and the condition is not optional.**

1. **The Dec 31 GA chain must be reviewed end to end, by Leo Nakamura and Rachel Lim,
   before the Q3 QBR on September 8.** R-009 has been carried since May 20. It is a named
   CFO pre-read requirement. It stops being a risk and becomes a finding if it is not
   closed this week.
2. **SPARK M6 needs a date or a formal descope.** A milestone missed at 52% with no new
   date is not a plan.
3. **M5 (Nov 30) is now the pressure point** — weekly tracking from Oct 16, not from Nov.
4. **DR-007's allocation split needs re-stating as a protection, not a percentage** — or
   A-005 will falsify a third time.

---

## Related

- DR-007 — Model Serving allocation split (SPARK 65% / ATLAS 35%), falsified as a protection
- DR-011 — ATLAS uptime protection, which consumed the shared capacity in July
- SPARK M2 — closed Aug 27, 16 days late · **DEP-008 closed**
- SPARK M3 — **Sep 30 → Oct 16 by this decision**
- SPARK M5 (Nov 30) · M7 GA (Dec 31) — chain now without slack
- SPARK M6 — evaluation framework, missed Aug 31 at 52%, no date
- RAID R-009 — Dec 31 chain never reviewed end-to-end, **overdue since Jun 30**
- RAID A-005 — DR-007 split is not a protection mechanism
- THR-1008 · EVT-2106 — source record
- VantagePoint — $1.8M, contractual roadmap review Sep 15
