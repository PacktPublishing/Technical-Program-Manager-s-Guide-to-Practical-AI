# DR-016 — HORIZON Ships Android-Only for the August 31 Public GA; iOS Held for Resubmission

| Field | Value |
|-------|-------|
| **DR ID** | DR-016 |
| **Date** | August 20, 2026 (**decided**) · September 4, 2026 (**recorded and ratified**) |
| **Decision maker** | Ingrid Solvang (Dir. Platform & Infra) |
| **Proposed by** | Priya Kaur (Assoc. TPM HORIZON) |
| **Informed** | Sofia Reyes (VP Product), Sara Lindqvist (cover TPM), Karl Bergstrom (Head of TPM — absent) |
| **Programs affected** | HORIZON · MERIDIAN (mobile endpoints) |
| **Status** | Ratified September 4, 2026 — decision stands as taken |

> ⚠️ **Recorded 15 days after the fact.** This decision was taken in a call on August 20
> while the Head of TPM was on leave, was executed on August 31, and had no decision record
> until today. It changes the meaning of a board-visible milestone. The recording gap is
> itself part of the record — see *Assessment*.

---

## Context

HORIZON M8 committed to **public GA on both app stores, August 31, 2026**. The Aug 1
submission cleared Google Play on August 6 (four days). Apple had not responded by day 13.

On **August 19, day 18 of review, Apple rejected** under guideline **5.1.1(v)** — an app
offering account creation must offer in-app account deletion. NovaGrid routes deletion
through the web console. Engineering estimate to fix: three days.

Priya Kaur, same day: *"This is a known, well-documented requirement and we should have
caught it in pre-submission review; I own that."*

RAID assumption **A-002** — "App Store review takes 2–3 weeks" — was half right. The
duration held. The assumption that the *first pass would be approved* was never stated
explicitly and was never validated with Apple.

---

## Decision

Effective **August 20, 2026**:

- **Ship Android publicly on August 31** as planned.
- **Hold iOS** for the fix and resubmission rather than delaying both platforms.
- Marketing runs the August 31 campaign as an **Android launch with iOS "weeks away."**
- **M8's definition changes in substance:** "public GA" now means Android-only on Aug 31.

Resubmission went in **August 24** with in-app deletion. The review clock restarted from
zero; a decision is expected **September 7–14**.

---

## Rationale

Ingrid Solvang, summarising the call: *"Solaris and Kestrel are both majority-Android
estates, a staged launch we chose reads better than a launch we missed, and holding Android
to keep the platforms paired buys nothing."*

The alternative — hold both to preserve a paired launch — was rejected because it converts a
partial delivery into a total miss with no offsetting benefit, and because Android was
already approved and shippable.

On taking the decision without the Head of TPM: *"Karl, you were on the invite; I did not
want to hold the decision three weeks for you. If you disagree when you are back, say so
and we will re-cut the messaging, but the ship has left on the Android side."*

**That reasoning is accepted.** Holding a shippable launch for three weeks to wait for one
person would have been the worse error. This DR ratifies the decision as taken.

---

## Consequences already visible

**The Android launch worked.** Shipped on time August 31. 4,100 installs in the first 48
hours, zero SEV incidents, mobile backend p95 latency up 34% and still inside SLO.

**Solaris Logistics ($2.4M) now has no iOS date and needs one today.** Jennifer Wu, Sep 1:
*"their legal review starts Sep 4 and they want the mobile availability language settled
before it opens. If I have nothing by Sep 4 they will either strike the iOS clause — which
cuts scope and price — or push signature past Sep 15."* This is the **third** date
conversation with Solaris this year.

**Apple's review window is no longer treated as reliable.** Priya: *"expect a decision Sep
7–14 on the same 2–3 week window, and I am no longer treating that window as reliable."*

**I-005 got worse.** Public GA roughly tripled L1 mobile volume. Post-GA mobile support
still has no run owner, and the DR-012 engineer — scoped for onboarding, not run — is
absorbing it. Open since July 31.

---

## Assessment

The decision was right and the process around it was not.

Three things were correct: Priya identified the failure and owned it the same day; the fix
was scoped and shipped in three days; Ingrid made a shippable call rather than waiting for
an absent stakeholder.

Two things were wrong, and neither is about the decision itself:

1. **A board-visible milestone changed meaning with no record for 15 days.** M8 in the
   program master, the OKR set and the board pack all still read "public GA both stores."
   Anyone reading those between Aug 20 and Sep 4 would have read something untrue. Sara
   Lindqvist flagged this in the cover notes on Aug 21 — *"there is no decision record, and
   it changes what M8 means"* — and was right to; there was simply nobody with authority to
   act on the flag.

2. **A-002 encoded the wrong assumption.** It captured review *duration* and not review
   *outcome*. The pre-submission compliance check against Apple's published guidelines is
   the control that would have caught 5.1.1(v), and it did not exist.

---

## Conditions and monitoring

- **A written iOS availability date for Solaris is required September 4** — a conservative
  date with a stated dependency, not another "imminent." Escalation #1 this week.
- Apple decision expected Sep 7–14. **No third submission date to be communicated
  externally until a decision is in hand.**
- **A-002 to be rewritten** as two assumptions: review duration, and first-pass approval.
- **Pre-submission guideline compliance check** added to the mobile release gate before any
  future store submission.
- **I-005 must be resolved** — public GA has tripled the load that had no owner at soft GA.

---

## Related

- DR-008 — HORIZON mobile GA date (Aug 31), which this decision partially supersedes
- DR-012 — HORIZON dedicated onboarding engineer, now absorbing unscoped run work
- HORIZON M8 — public GA, **redefined by this decision**
- HORIZON I-005 — post-GA mobile support has no run owner
- RAID A-002 — App Store review timing, falsified on outcome
- RAID R-011 — Apple review gate (closed by this decision; replaced by R-013)
- THR-1003, THR-1004, THR-1005 · EVT-2102 — source record
- OPP Solaris Logistics — $2.4M, signature Sep 15
