# DR-018 — ATLAS M9 Renegotiated from 15 to 9 Enterprise Customers by December 31

| Field | Value |
|-------|-------|
| **DR ID** | DR-018 |
| **Date** | September 4, 2026 |
| **Decision maker** | Yuki Tanaka (VP Engineering), co-signed Marcus Bauer (CFO) |
| **Proposed by** | Marcus Chen (Sr. TPM ATLAS), escalated by Karl Bergstrom (Head of TPM) |
| **Informed** | Rachel Lim (VP), Leo Nakamura (Dir. NovaAI), Priya Anand (CEO), Board |
| **Programs affected** | ATLAS · SPARK (shared Model Serving capacity) |
| **Status** | Decided — enters the Q3 QBR pre-read September 4 |

---

## Context

ATLAS M9 commits to **15 enterprise customers in production by December 31, 2026**.

As of September 1: **4 in production.** Halden Freight went live August 18 and is stable;
a 5th is in contracting with Dmitri Volkov.

The arithmetic does not work and has not worked for some time. Four months remain. Reaching
15 requires **2.75 new enterprise customers per month against a demonstrated pace of
roughly one.**

The pace is not a performance problem. It is the direct, accepted cost of **DR-011**, which
in July imposed a tenant onboarding rate limit to protect uptime for three production
customers. That rate limit held for four weeks, was lifted August 3, and the freeze it
caused was accepted at the time with its consequence stated.

This has been an open decision since **August 3** — carried through the Head of TPM's
absence with no forum able to settle it.

Marcus Bauer, August 24, naming it as a QBR pre-read requirement:
*"ATLAS M9, 15 enterprise customers by Dec 31 — I have seen 3 in production since July and
I want the renegotiated number, not a recovery plan."*

---

## Decision

Effective **September 4, 2026**:

- **ATLAS M9 is renegotiated from 15 to 9 enterprise customers in production by
  December 31, 2026.**
- The number enters the **Q3 QBR pre-read (due today, EOD)** as a renegotiation, not as a
  recovery plan and not as a forecast.
- The **cause is stated in the same line as the number**: DR-011's four-week onboarding
  freeze, taken deliberately to protect production uptime for existing customers.
- FY2026 revenue expectations tied to M9 are re-based accordingly by RevOps before the
  board pack cut-off.

---

## Rationale

Marcus Chen's own assessment, September 1: *"M9 is the one I cannot fix by executing
harder… The honest renegotiated number is 8, maybe 9 if the pipeline converts."*

**9 is chosen over 8** because the 5th customer is in contracting now, and because a
renegotiated number should carry the pipeline that is genuinely visible rather than only
what is signed. **9 is chosen over any number above 10** because the demonstrated pace does
not support it and a second renegotiation in December would cost more credibility than the
first one costs today.

Three alternatives were rejected:

| Option | Why rejected |
|--------|-------------|
| Hold 15 and present a recovery plan | The CFO explicitly pre-rejected this. The pace gap is 2.75× — no recovery plan closes it without reintroducing the uptime risk DR-011 was taken to remove. |
| Renegotiate to 8 | Understates visible contracted pipeline. A number that is beaten is a number that was wrong. |
| Defer the decision to the QBR itself | It has already been deferred a month. Settling it in the room, in front of the CFO, with no pre-read, is how a delivery conversation becomes a confidence conversation. |

---

## The argument this decision must survive

**ATLAS is executing well, and the number is still being cut.** Both things are true and
the pre-read has to hold them together:

- Uptime held **98.9%–99.2% every day** since the rate limit lifted August 3.
- **August month average 99.1% — the first month above the 99.0% commitment since GA.**
- 4th enterprise customer live and stable; F7 inference autoscaling at 80% and tracking
  to Sep 15; M7 at 4/5 with Sep 15 comfortable.
- DEP-002 (full-IAM refactor) sprint started Aug 17, Auth0 workaround retirement on track
  for late September.

The commitment is being missed because **the organisation chose, in July, to protect three
existing customers over onboarding new ones** — and that choice was correct. DR-011 has a
recorded consequence line: *"Froze M7 at 3/5 for four weeks."* What was never done is carry
that consequence forward into M9's number.

---

## Assessment

The failure here is not the miss. It is the **31 days between knowing and saying.**

Marcus Chen knew the number was unreachable on August 3 and said so. It was logged as an
open decision, correctly, on the Aug 10 operating file with the note: *"Defensible at the
Q3 QBR with the DR-011 freeze as cause. Indefensible in December."* That assessment was
exactly right — and the decision then sat for a month because the only forum that could
settle it required a person who was on leave, and no escalation path existed to route it
past them.

The auto-reply said *"for anything board-facing contact Yuki Tanaka."* Nothing routed this
there. **A named inbox is not an escalation path.**

The cost of the delay is small in this case — the number is the same today as it would have
been on August 3 — but the mechanism that produced it is the same mechanism that left
DEP-009 unclosed at the observation window and the MERIDIAN shim unowned three weeks from
EoL. See the absence reconstruction.

---

## Conditions and monitoring

- **Enters the QBR pre-read today (Sep 4, EOD).** Yuki Tanaka / Karl Bergstrom aligned at
  09:00 before Marcus Bauer sees the number, per Yuki's Aug 24 instruction.
- **Monthly tracking against 9 from October**, per-customer, not aggregate — the same
  correction Ingrid Solvang demanded on MERIDIAN.
- **No further renegotiation.** If 9 is at risk, that is an escalation in the month it
  becomes visible, not in December.
- **DR-011's consequence must propagate.** Any future protection decision that freezes
  onboarding carries an explicit M9 impact line at the time it is taken.
- RevOps re-bases FY2026 expansion revenue before the board pack cut-off.

---

## Related

- DR-011 — ATLAS uptime protection + tenant onboarding rate limit, **the cause of this miss**
- DR-014 — SOC 2 mandate restated; the same class of correction (a commitment no plan supported)
- DR-007 — Model Serving allocation split
- ATLAS M7 — 5 enterprise customers, Sep 15, at 4/5
- ATLAS M9 — **15 → 9 by this decision**
- ATLAS F7 — inference autoscaling, 80%, Sep 15
- RAID R-004 — NovaAI uptime; **August closed above commitment for the first time**
- THR-1010 · THR-1002 · EVT-2104 · EVT-2202 — source record
- CHG-002 — CFO cost efficiency directive, engineering cost ratio to 28% by Q4
- CHG-005 — Redmount activist investor escalation
