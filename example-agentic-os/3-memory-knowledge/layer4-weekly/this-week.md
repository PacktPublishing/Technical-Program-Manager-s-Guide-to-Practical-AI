# This Week — TPM Operating State

> *Fictional example: NovaGrid, Inc. is an invented company. All people, customers, numbers and events in this file are made up for the book.*

*Layer 4 · Weekly rhythm file · Updated by portfolio-monitor agent + TPM*
*Update cadence: daily during active programs · Replace content each Monday*

---

## Week of August 31, 2026

*Friday September 4, 08:00 (Sprint 23, Day 5). First day back after leave Aug 11 – Sep 2.
W33 archived; the blackout is reconstructed in `2026-absence-reconstruction-aug11-sep02.md`.*

> ⚠️ **DATA QUALITY — READ BEFORE USING THIS FILE.**
> The six system exports (Aha!, Jira ×2, Salesforce ×2, Vanta, DataDog) were last pulled
> **2026-08-10** and are **25 days stale**. State below is reconstructed from the Gmail and
> Calendar exports (2026-09-03), which are the only current sources. Program master docs
> were refreshed 2026-09-04 from the same reconstruction. **Re-pull the six exports before
> the Sep 8 QBR** — the pre-read cannot cite a 25-day-old Salesforce or Vanta position.

### SteerCo this week
**Last SteerCo:** Friday August 28, 10:00 CET (chaired by Sara Lindqvist, cover)
**This SteerCo:** **Friday September 4, 10:00 CET — today, first one back**
**Chair:** Karl Bergstrom
**Prep status:** 🔴 **Pre-read not circulated.** Three SteerCos ran under cover without one.

**Agenda for SteerCo September 4 — decisions-first:**
1. 🔴 **MERIDIAN compatibility shim** — who owns 4 weeks of work against a Sep 30 hard EoL.
2. 🔴 **SHIELD DEP-009** — re-evidence CC6.4/CC6.6 inside the window, or ride it out.
3. 🔴 **Solaris iOS date** — a defensible date today, or accept the clause is struck.
4. ⬜ Ratify or reverse: DR-016 (HORIZON Android-only GA), DR-017 (SPARK M3 → Oct 16).

---

### Top escalations requiring decisions this week

| # | Escalation | Decision needed from | Deadline | Consequence if missed |
|---|-----------|---------------------|----------|-----------------------|
| 1 | **Solaris iOS availability date.** Jennifer Wu has asked twice and escalated once. Solaris legal review opens today and wants mobile availability language settled before it does. Apple's second review is day 10 of an unreliable 14–21 day window. | Karl B. / Priya K. / Sofia R. | **TODAY** | iOS clause struck (cuts scope and price) or signature slips past Sep 15. **$2.4M.** Third slipped date shown to this customer this year. |
| 2 | **Q3 QBR pre-read.** Moved Sep 22 → Sep 8 on Aug 24. Three CFO requirements demanded *in writing*: PULSE dual-run reconciliation with the date the burn stops; ATLAS M9 renegotiated number; SPARK Dec 31 chain end to end. **None drafted.** | Karl B. | **TODAY EOD** | Board pack cut-off. Yuki's 09:00 1:1 is to align on M9 before Marcus Bauer sees it. |
| 3 | **ATLAS M9 renegotiation.** 4 in production against 15 by Dec 31, four months left. Needs 2.75/month against a demonstrated ~1. Marcus Chen's honest number is **8, maybe 9**. Open since Aug 3. | Yuki T. / Marcus B. | **TODAY** (feeds #2) | *"I want the renegotiated number, not a recovery plan."* — Marcus Bauer, Aug 24. |
| 4 | **NEXUS M7 target — <200 or <175.** Open since Jul 13. Q3 board trajectory chart is being built and whoever builds it must pick one. Redmount's letter cited service count specifically. | Karl B. / Yuki T. | **TODAY** | The difference is the entire story the chart tells. **See the pace discrepancy below — verify before choosing.** |
| 5 | **SHIELD DEP-009.** CC6.4 and CC6.6 entered the observation window on July compensating documentation, not on the completed Temporal audit trail. The auditor samples from the week of Sep 21. | James W. / Karl B. | **before Sep 21** | **$12.2M.** The weakest evidence in the pack sits on controls that have a real audit trail available and unused. |
| 6 | **MERIDIAN compatibility shim ownership.** Brightline and Corvid run on v2 through a shim hosted on v1 infrastructure. ~4 weeks of work, **owned by nobody**, 3.7 weeks remain. | Ingrid S. / James O. | **this week** | Two named customers break at v1 EoL. Thornbridge's $1.7M is in Contract Negotiation on the strength of that date. |
| 7 | **Ratify or reverse — 4 decisions taken in absence, 2 without a record.** | Karl B. | this week | Ingrid: *"If you disagree when you are back, say so."* That window is closing. |
| 8 | TPM hiring — 2 finalists, competing offers expire Sep 11. | Karl B. / Hanna L. | Sep 10 | Both lost. |

---

### Program master doc health (reconstructed to September 3)

| Program | TPM | Last updated | Status | Change | Notes |
|---------|-----|-------------|--------|--------|-------|
| NEXUS | Sara Lindqvist | Sep 4 | 🟡 At risk | 🟢→🟡 | 223 services, ~7/wk. Auth0 signed Aug 18, R-006 closed. **M7 target still undefined with a today deadline.** |
| ATLAS | Marcus Chen | Sep 4 | 🔴 Behind | 🟢→🔴 | Best month since GA: 99.1% Aug average, first above the 99.0% commitment. 4th customer live Aug 18. **M9 red is a commitment gap, not an execution gap.** |
| SHIELD | Fatima Al-Hassan | Sep 4 | 🔴 Behind | 🟡→🔴 | **M6 closed Aug 31 on the board date**, signed against 5 written criteria. Observation open. DEP-009 unclosed and now inside the window. |
| MERIDIAN | James Okonkwo | Sep 4 | 🔴 Behind | 🟡→🔴 | **M6 closed Aug 20 at 210/210, a day early.** The shim defect is not in that number. Sep 30 EoL confirmed to Kai Muller. |
| PULSE | Yuna Park | Sep 4 | 🔴 Behind | 🟡→🔴 | 14 pipelines still writing Airflow state. Read-only Sep 1 → Sep 14. SEV2 Aug 26. $2.13M accrued, $380K/month. |
| HORIZON | Priya Kaur | Sep 4 | 🔴 Behind | 🟡→🔴 | **Android public GA Aug 31 on time**, 4,100 installs/48h, no SEVs. Apple rejected Aug 19, resubmitted Aug 24, day 10 of second review. |
| SPARK | Daniel Rios | Sep 4 | 🔴 Behind | 🟡→🔴 | **M2 closed Aug 27**, DEP-008 closed. M3 → Oct 16. M6 missed Aug 31 at 52%, no new date. Dec 31 chain has no slack left. |

**0 red / 5 amber / 2 green (Aug 10) → 6 red / 1 amber / 0 green (Sep 3).**

---

### This week's focus (max 5 items)

- [ ] **Solaris iOS date** — before Solaris legal opens today. A conservative date with a stated dependency beats another "imminent."
- [ ] **QBR pre-read, all three CFO requirements** — due EOD. Yuki 09:00 first, on M9.
- [ ] **Pick the NEXUS M7 number** — and check the pace arithmetic before picking.
- [ ] **Name an owner for the MERIDIAN shim** — in SteerCo today, not by email after it.
- [ ] **SHIELD DEP-009 call** — Fatima leans (b), re-evidence early and disclose. Decide before Sep 21.

---

### Open decisions (not yet escalated)

| Decision | Owner | In limbo since | Impact if unresolved |
|---------|-------|---------------|---------------------|
| HORIZON post-GA mobile run owner (I-005) | Priya Kaur / Ingrid Solvang | Jul 31 | Public GA roughly tripled L1 mobile volume. The DR-012 engineer is doing unscoped run work. |
| SPARK M6 evaluation framework — no new date | Daniel Rios / Leo Nakamura | Aug 31 | Missed at 52% after competing with M2 all month. An orphaned milestone on a GA-chain program. |
| PULSE Sep 30 shutdown — go or move | Yuna Park | Sep 2 | Yuna will know Sep 14. Read-only Sep 14 + 2-week soak = Sep 28, zero margin. |
| FY2026 KR1.4 (EU/APAC data residency, Sep 2026) vs plan (Q1 2027) | Yuki Tanaka | Ongoing | Same defect DR-014 corrected for KR1.1 — a board KR date no plan supports. |
| Cover-TPM decision escalation path | Karl Bergstrom | Sep 4 | The gap this absence exposed. Four commitments acquired deadlines while waiting for one person. |

---

### Milestones closed during the absence (Aug 11 – Sep 2)

| Milestone | Program | Closed | Target | Delta |
|-----------|---------|--------|--------|-------|
| M6 Mid-market 100% on v2 (210/210) | MERIDIAN | Aug 20 | Aug 21 (DR-015) | **1 day early** |
| M2 New model serving alpha | SPARK | Aug 27 | Aug 11 | **16 days late** |
| M8 Public GA — Android | HORIZON | Aug 31 | Aug 31 | On time |
| M6 SOC 2 audit readiness | SHIELD | Aug 31 | Aug 31 | On time |
| M6 Evaluation framework | SPARK | **MISSED** | Aug 31 | 52% — no new date |

---

### Milestones closing next 4 weeks

| Milestone | Program | Target | Status | Risk |
|-----------|---------|--------|--------|------|
| Solaris signature ($2.4M) | HORIZON | Sep 15 | Gated on an iOS date | **High** |
| M8 Public GA — iOS | HORIZON | Sep 7–14 | Apple second review, day 10 | **High (external)** |
| M7 5 enterprise customers | ATLAS | Sep 15 | 4/5, 5th in contracting | Low |
| F7 inference autoscaling | ATLAS | Sep 15 | 80% | Low |
| The auditor first sampling pass | SHIELD | week of Sep 21 | CC6.4/CC6.6 on weak evidence | **High** |
| Read-only mode | PULSE | Sep 14 | Slipped from Sep 1 | **High** |
| **M7 v1 API EoL** | MERIDIAN | **Sep 30** | Shim work unowned | **High** |
| **M6 Airflow shutdown** | PULSE | **Sep 30** | Zero margin at Sep 28 | **High** |

---

### Decisions made since August 10

| DR | Decision | Date | Impact |
|----|---------|------|--------|
| DR-016 | **HORIZON ships Android-only for Aug 31 public GA; iOS held for resubmission** | Aug 20 (ratified Sep 4) | Redefines M8. Android shipped on time; iOS gated on Apple's second review. |
| DR-017 | **SPARK M3 moves Sep 30 → Oct 16** | Aug 27 (ratified Sep 4) | Removes the last slack from the Dec 31 GA chain. M5 (Nov 30) becomes the pressure point. |
| DR-018 | **ATLAS M9 renegotiated from 15 to 9 enterprise customers by Dec 31** | Sep 4 | Replaces an unreachable board commitment with a defensible one, before the QBR rather than in it. |
| DR-019 | **SHIELD CC6.4/CC6.6 re-evidenced inside the observation window, disclosed to the auditor** | Sep 4 | Trades a disclosed mid-window evidence change for the strongest available evidence ahead of Sep 21 sampling. |

---

### Fruit bowl diagnostic status

**Last scan:** May 20, 2026 — **16 weeks stale. Run this week.**

Three patterns look live again on the reconstructed state:

| Program | Pattern to test | Why now |
|---------|----------------|---------|
| **MERIDIAN** | 🍉 **Watermelon — likely** | M6 reported 210/210 and closed early. Two of those 210 run on a shim hosted on the infrastructure being shut down Sep 30. The defect is real, four weeks of work, and excluded from the number. **James disclosed it himself on Aug 31**, which is the opposite of concealment — but the *metric* still hid it, and nobody acted for four days. |
| **SPARK** | 🥥 **Coconut — test** | M2 closed and demonstrable. M3 moved 16 days. M6 missed with no new date. The Dec 31 chain has now absorbed every slip and still reports Dec 31. Hard shell, nothing behind it. R-009 has been open since May 20 for exactly this. |
| **HORIZON** | 🥑 **Avocado — persists, moved again** | The soft centre moved from the GA definition, to Apple, and now to an unowned post-GA run load (I-005) that public GA tripled. |

---

### Portfolio monitor last run

**Last run:** 2026-09-04T08:00:00 (first run after the absence)
**Mode:** ⚠️ **DEGRADED** — scored from Gmail + Calendar reconstruction, not from system exports.
**Data quality flags:** Six system exports 25 days stale. `gmail/` and `calendar/` — the only
current sources — are correctly registered in `source-registry.md`, but are **absent from
CLAUDE.md's "Data sources" list and from the consistency checker's export set**, so nothing
outside `/tpm-catchup-brief` routinely reaches for them and nothing checks their freshness.
`check_novagrid_consistency.py` returned OK throughout the blackout because it validated
against a self-declared as-of date rather than the clock — **fixed Sep 4**; it now correctly
fails on a stale export set, on a weekly heading that outruns the anchor, and on an
un-archived week.

---

## Signals going into the week of August 31

- **Six programs are red, and almost none of it is execution failure.** MERIDIAN delivered early. SHIELD closed on a board-mandated date. ATLAS posted its best uptime month since GA. HORIZON shipped Android on time. SPARK made an honest NO-GO and then closed. The reds are **decisions not taken, work not owned, and commitments not renegotiated** — every one of them needing the person who was away.

- **Two hard shutdowns land on Sep 30 and nobody has looked at them together.** MERIDIAN's v1 API EoL and PULSE's Airflow decommission. Both at zero margin, both with known unresolved defects, in the same fortnight, owned by different TPMs in different divisions. Neither program's plan mentions the other.

- **A NEXUS number that does not reconcile.** Sara reports ~6/week and says that hits <200 comfortably but not <175. But 247 → 223 over 24 days is ~7/week, and 17 weeks remain to Dec 31 — even at 4/week that lands near 155. Either the retirement tail gets materially harder and someone should say so in the chart, or **<175 is reachable and NovaGrid is about to under-commit to the board on the one metric its activist investor named.** Verify before Sep 4 EOD.

- **The Jul 16 SHIELD lesson has repeated, one level up.** "A control that is built is not a control that has operated" became "a milestone that is closed is not scope that is complete" — MERIDIAN 210/210 with a shim underneath, SPARK M2 closed while M6 was abandoned at 52%. Closure is being measured at the milestone, not at the outcome.

- **The absence was the test and the portfolio half-passed.** Delivery held; judgment queued. Four commitments acquired hard deadlines while waiting for one person, and two board-visible decisions were taken with no record. The fix is not "don't take leave" — it is a named decision escalation path for the cover TPM, which did not exist.

- **The data pipeline failed silently for 24 days and the checker said OK.** The exports are the portfolio's senses. They stopped, nothing alarmed, and the only reason this run has a state at all is that email and calendar were exported for a different skill entirely.

---

## How to use this file

**Monday morning:** Portfolio-monitor agent updates the program health table.
TPM fills in SteerCo prep status and top 3 escalations.

**During the week:** Check the open decisions table. If something has been
in limbo for 5+ days, it goes on the escalation list.

**Friday (pre-SteerCo):** Verify prep status is checkmark.
Decisions needed column feeds directly into the SteerCo agenda.

**To update via agent:**
```
@3-memory-knowledge/layer4-weekly/this-week.md
@5-agent-harness/sub-agents/portfolio-monitor.md

Update this week's operating file from the latest program master docs.
Populate: program health table, stale doc flags, open decision count.
```
