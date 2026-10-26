# DR-019 — SHIELD CC6.4 and CC6.6 Re-Evidenced Inside the Observation Window, Disclosed to the auditor

| Field | Value |
|-------|-------|
| **DR ID** | DR-019 |
| **Date** | September 4, 2026 |
| **Decision maker** | James Whitfield (CISO) |
| **Proposed by** | Fatima Al-Hassan (TPM SHIELD), escalated by Karl Bergstrom (Head of TPM) |
| **Informed** | Yuna Park (TPM PULSE), Amara Osei (Dir. FlowEngine), Yuki Tanaka (VP Eng), E. McBride (The auditor) |
| **Programs affected** | SHIELD · PULSE |
| **Status** | Decided — execute before the auditor's first sampling pass, week of September 21 |

---

## Context

SHIELD M6 (audit readiness) **closed on August 31, on the board-mandated date.** James
Whitfield signed against five acceptance criteria agreed August 13: 100/100 controls with
accepted evidence, a named owner per control, monitoring live on all 100, drift detection
armed, and a documented exception path. The auditor's observation window opened **September
1** and runs to **November 30**, with the Type II report due **December 15** (DR-014).

**DEP-009 did not close.** Two controls — **CC6.4** and **CC6.6** — entered the observation
window on **July compensating documentation** rather than on the completed Temporal audit
trail that PULSE M4 delivered on August 7.

The audit trail is real, complete across 677/677 pipelines, and sitting unused.

Fatima Al-Hassan, September 1: *"Yuna was consumed by the decommission and I did not
escalate hard enough. Those two controls entered the observation window on the July
compensating documentation, which the auditor accepted for readiness but which is the weakest
evidence in the pack… this is exactly the $12.2M question and I do not want to choose
alone."*

The auditor, September 1 (THR-1014): *"We will sample across the period rather than at the
end, with the first sampling pass in the week of Sep 21 and monthly thereafter. Please
treat every control as live from today."*

That last line removes the option of waiting.

---

## Decision

Effective **September 4, 2026**:

- **Re-evidence CC6.4 and CC6.6 against the completed Temporal audit trail, inside the
  observation window, during September.**
- **Disclose the change to the auditor proactively**, in writing, before the first sampling
  pass in the week of September 21 — stating what changed, why, and that the underlying
  control did not change.
- **Complete before September 18** to give a clear week of margin ahead of sampling.
- Yuna Park is released from decommission work for the duration required. The task is
  small; the constraint was attention, not effort.

---

## Rationale

Two options were on the table, both Fatima's:

| Option | Assessment |
|--------|-----------|
| **(a)** Leave them and re-evidence at the first quarterly cycle | Accepts defending compensating documentation on a control that has a complete audit trail available and unused. If the auditor samples CC6.4 or CC6.6 in September or October, NovaGrid explains why it presented weaker evidence when stronger evidence existed. That is a hard conversation to win. |
| **(b)** Re-evidence inside the window and disclose | Requires changing evidence mid-observation and telling the auditor why — which is uncomfortable, visible, and correct. |

**(b) is chosen.** Fatima's own preference, and the right one.

The decisive argument is the one the July SHIELD finding already taught this portfolio at
a cost: *a control that is built is not a control that has operated.* Compensating
documentation describes a control operating in July. The Temporal audit trail evidences it
operating continuously. In an observation period that samples monthly for three months,
the second thing is the only one that survives.

The discomfort in (b) is a disclosure conversation. The risk in (a) is a **material
exception**, which moves the December 15 Type II report into FY2027 and takes **$12.2M**
of gated Q4 pipeline with it.

**Disclosing early is also cheaper than being found.** NovaGrid has done this once already
this quarter and it worked: the July uptime breach was detected in minutes, disclosed
proactively, and the missed commitment reported as missed. That is the reason ATLAS is no
longer carrying a Watermelon pattern.

---

## Consequences and exposure

**R-009 is no longer theoretical.** It was written as "SHIELD control drift during the
observation period." On day one of the window it has two specific control IDs attached.
Fatima: *"R-009 is no longer theoretical — it has a specific name on day one."*

**The cause is a cross-program capacity cascade, not a SHIELD failure.** PULSE's
decommission overrun consumed Yuna Park entirely — the same overrun that produced the 14
Airflow-state pipelines and INC-2026-0131. DEP-009 was low-effort work with a hard deadline
that lost to a program in trouble. **SHIELD's compliance red is PULSE's capacity red,
one hop downstream.**

**PULSE cannot absorb another claim on Yuna Park without a decision.** Read-only mode has
already moved Sep 1 → Sep 14, and the Sep 30 shutdown sits at Sep 28 with zero margin. This
DR takes her attention back deliberately, and PULSE's Sep 30 position must be re-stated
with that included — not silently absorbed.

---

## Assessment

Nobody in this chain did anything wrong at their own level. Yuna prioritised a $380K/month
production decommission with a live SEV2 over a documentation task. Fatima flagged the
gap and said plainly that she under-escalated. James Whitfield signed a readiness milestone
that was genuinely ready against criteria that genuinely existed.

**The gap is that DEP-009 had a hard external deadline — September 1 — and no owner senior
enough to enforce it across two programs.** It was logged correctly on August 10 as *"low
effort, hard deadline."* It then sat for 25 days because the person who could arbitrate
between a SHIELD compliance need and a PULSE production need was on leave, and the
dependency's own registry entry recorded only *"Yuna owes Fatima confirmation"* — a
person-to-person courtesy, not an enforceable commitment with an escalation path.

This is the second time this quarter that a **percentage or a promise substituted for a
protection** (see A-005, DR-007). The pattern is now general enough to name:
**cross-program commitments with hard external deadlines need an owner above both
programs, recorded at the time the commitment is made.**

---

## Conditions and monitoring

- **Re-evidencing complete by September 18.** the auditor samples from the week of Sep 21.
- **Written disclosure to E. McBride before the first sampling pass**, stating: what changed,
  why, and that the control itself did not change.
- **PULSE Sep 30 position to be re-stated at SteerCo today** with Yuna's diverted attention
  included as a named input, not absorbed silently.
- **DEP-009 stays open until the evidence is accepted**, not until the work is done.
- **R-009 tracking moves to weekly** for the duration of the observation window, with CC6.4
  required to evidence a complete quarterly cycle by October 31 for one cycle of margin.
- Escalation path if re-evidencing slips: James Whitfield → Yuki Tanaka, same day.

---

## Related

- DR-014 — SOC 2 mandate restated: Aug 31 readiness, Dec 15 report
- DR-009 / DR-013 — PULSE resourcing decisions upstream of the capacity cascade
- DEP-009 — PULSE → SHIELD audit trail re-evidencing, **open until evidence accepted**
- SHIELD M6 — audit readiness, closed Aug 31 on the board date
- RAID R-009 — control drift during observation, **now specific**
- RAID A-006 — decommission sequence unrehearsed (the upstream cause)
- INC-2026-0131 — PULSE SEV2, Aug 26 *(note: this ID collides with a MERIDIAN v1 gateway incident cited in DR-015 — see the data-integrity flag in the Sep 4 monitor run)*
- THR-1006 · THR-1007 · THR-1014 · EVT-2107 — source record
- $12.2M Q4 pipeline gated on the Dec 15 Type II report
