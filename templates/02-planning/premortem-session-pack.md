# Template: Pre-Mortem Session Pack

Referenced by: `/tpm-premortem`

> The swarm produces **candidates**, not conclusions. A pre-mortem where no humans ever met has not happened.
> Every scenario names its **early signature** — what you would observe in weeks 2–6 if this failure were forming.
> `CORROBORATED` (2+ lenses reaching the same failure through different reasoning) outranks a confident single lens.
> **Blind by construction** is the most important section. Coverage follows the corpus; politics, attrition, and vendor health are in no document.
> Bring the ranked list to the room. Do not bring the raw narratives — fluent failure fiction crowds out tribal knowledge.

---

```markdown
# Pre-Mortem Session Pack — [Program Name]

> It is [target date + 3 months]. The program has failed.
> The post-mortem is happening now. What went wrong?

**TPM:** [Name] · **Run:** YYYY-MM-DD · **Human session:** [date, 60 min]
**Corpus grade:** 🟢 Full (5–6 artifacts) / 🟡 Thin (2–4) / 🔴 Insufficient (1 — do not run)
**Artifacts loaded:** [list] · **Missing:** [list]
**Scenario yield:** [N] vs expected [range] → 🟢 to spec / 🟡 under-performed
**Memory pass:** ✅ [N] prior retros / ⬜ none available

---

## Executive Read

[3 sentences: the most plausible failure, which lenses saw it, the one thing to do this week.]

---

## Collision Analysis

| # | Scenario | Lenses | Class | Grounding | Recurrent? |
|---|---------|--------|-------|-----------|-----------|
| 1 | | SRE + Staff Eng | CORROBORATED | GROUNDED — [artifact] | ⚠️ [prior program] |
| 2 | | Security | SINGULAR | INFERRED | — |

**Classes:** CORROBORATED = named by 2+ lenses in different vocabularies · SINGULAR = one lens, often the sharpest · COLLIDING = mitigations conflict, the room decides

**Colliding mitigations:**
- [Lens A wants X · Lens B wants Y · because …] → **decision required at the session**

---

## Ranked Scenarios

### 1. [Specific failure name — not "Scope Collapse"]

**Class:** [CORROBORATED (lenses) / SINGULAR (lens)] · **Grounding:** [GROUNDED — artifact / INFERRED] · **Recurrent:** [prior program or —]

**What happened:** [Vivid narrative, past tense. Specific systems, teams, weeks.]
**Early signature (weeks 2–6):** [Observable now, if this were beginning. Not a feeling.]
**Why we missed it:** [Structural reason, not "we were busy."]
**Prevention:** [The control, and what it costs.]
**Mitigation owner:** [role] · **Confirm by:** [date]

### 2 … N

*Ranked by (plausibility × blast radius). CORROBORATED and RECURRENT promoted. Plausibility is the TPM's call — re-order before the session. Do not pad to a fixed count.*

---

## Blind By Construction — spend the human hour here

The swarm read documents. These risk classes are in no document and were invisible to it.

| Class | Why the corpus cannot encode it | Question for the room |
|-------|-------------------------------|----------------------|
| Interpersonal / political | | "Which two people on this program need to agree and currently do not talk?" |
| Attrition / team stability | | "Who leaving would stall this for a month?" |
| Vendor & partner relationship health | | |
| Unwritten organizational commitments | | |

---

## Risk Priority Matrix

| Risk | Likelihood (1–5) | Impact (1–5) | Score | Mitigation Owner |
|------|----------------|--------------|-------|-----------------|
| | | | | |

---

## Top 3 Actions This Week

1. [Against the highest-ranked scenario]
2. [...]
3. [...]

---

## Session Agenda — 60 minutes

| Time | Segment | Material |
|------|---------|----------|
| 0–5 | Frame: "it failed, explain why" | Executive read |
| 5–25 | Walk top 4 scenarios — confirm, kill, or re-rank | Ranked scenarios |
| 25–40 | **Blind-by-construction questions** — only the room can do this | Blind spots table |
| 40–50 | Resolve colliding mitigations | Collision analysis |
| 50–60 | Assign owners and confirm-by dates | Risk priority matrix |

---

## Post-Session Record

| Scenario | Room verdict | Owner | Confirm by | → Risk register |
|----------|-------------|-------|-----------|----------------|
| | Confirmed / Killed / Re-ranked to [N] | | | R-0NN |

**Found only by the room:** [Scenarios the swarm could not see. These are the feedback signal — record what would have had to be in the corpus.]

---

## Retro Feedback Loop *(complete at program close)*

| Materialized risk | Named by the pre-mortem? | Which lens | If missed — what shape? |
|------------------|-------------------------|-----------|------------------------|
| | ✅ / ❌ | | |

*Feed this table into `/tpm-programmemory`. Next program's memory pass reads it.*
```

---

## Filled Example (NovaGrid — SHIELD)

```markdown
# Pre-Mortem Session Pack — SHIELD

> It is November 2026. SOC 2 Type II certification failed.
> The post-mortem is happening now. What went wrong?

**TPM:** Karl Bergstrom (acting) · **Run:** 2026-05-15 · **Human session:** 2026-05-19, 60 min
**Corpus grade:** 🟢 Full
**Artifacts loaded:** SHIELD master doc · Vanta control export · assumption log (2026-05-13) · dependency matrix · alignment gap register (2026-05-14)
**Scenario yield:** 7 vs expected 6–10 → 🟢 to spec
**Memory pass:** ✅ 2 prior retros (MERIDIAN 2025, PULSE Q1 2026)

## Executive Read

The most plausible failure is not missing the audit date — it is arriving at fieldwork with controls that pass in Vanta but lack the evidence period the auditor requires. Three lenses reached this independently. This week: reconcile all 11 "complete" controls against evidence history, not tool state.

## Collision Analysis

| # | Scenario | Lenses | Class | Grounding | Recurrent? |
|---|---------|--------|-------|-----------|-----------|
| 1 | Evidence period gap discovered at fieldwork | Security + SRE + Staff Eng | CORROBORATED | GROUNDED — alignment gap register, Gap 2 | — |
| 2 | Evidence freeze lands 6 weeks early, remediation tail deleted | Security + PM | CORROBORATED | GROUNDED — alignment gap register, Gap 1 | — |
| 3 | Platform engineers pulled to NEXUS mid-remediation | SRE + PM | CORROBORATED | GROUNDED — hedge register, Tanaka | ⚠️ MERIDIAN 2025 — same conditional staffing pattern |
| 4 | Control owners left the company; nobody can produce evidence | Security | SINGULAR | GROUNDED — unverified concern, Vogt | ⚠️ PULSE Q1 2026 |
| 5 | APAC residency work lands in SOC 2 scope late | Staff Eng | SINGULAR | INFERRED | — |

**Colliding mitigations:**
- SRE wants a 3-week evidence-collection freeze *before* the auditor's freeze, to catch gaps. PM says that removes the last remediation window entirely. → **decision required at the session**

## Ranked Scenarios

### 1. Evidence period gap discovered at fieldwork

**Class:** CORROBORATED (Security Engineer + SRE + Staff Engineer) · **Grounding:** GROUNDED — alignment gap register Gap 2 · **Recurrent:** —

**What happened:** We reported 78% control completion to the board through the summer on the basis of Vanta passing state. In September, the auditor asked for 90 days of evidence on four controls and we had 11 days. The controls were genuinely implemented — we just implemented them in July. There was no remediation window left, the qualified opinion landed in October, and two enterprise renewals that named SOC 2 as a condition went to a competitor.

**Early signature (weeks 2–6):** Anyone asks "how long has this control been passing?" and the answer requires opening Vanta rather than being known. Also: control completion percentage rises faster than evidence age.

**Why we missed it:** The reporting metric measured tool state, and nobody had asked what the auditor counts. The CISO and the platform staff engineer had different definitions of "complete" and both were internally consistent.

**Prevention:** Add an evidence-age column to the weekly Vanta report and make control completion conditional on it. Cost: half a day of Vanta configuration, plus an uncomfortable restatement of the current 78%.

**Mitigation owner:** James Whitfield (CISO) · **Confirm by:** 2026-05-20

### 3. Platform engineers pulled to NEXUS mid-remediation

**Class:** CORROBORATED (SRE + Product Manager) · **Grounding:** GROUNDED — hedge register · **Recurrent:** ⚠️ MERIDIAN 2025

**What happened:** The two platform engineers were never committed — they were conditionally offered, contingent on NEXUS holding Q2 dates. NEXUS slipped in June, the engineers never arrived, and the six infrastructure controls they owned sat unremediated until August.

**Early signature (weeks 2–6):** NEXUS milestone M3 slips by more than a week, and no one re-confirms the SHIELD staffing in writing.

**Why we missed it:** A hedged statement in a 1:1 was recorded in the plan as a commitment. This is the identical pattern the MERIDIAN 2025 retro flagged as a systemic theme — conditional staffing promises entering plans as firm.

**Prevention:** Any cross-program staffing commitment requires a written confirmation with the condition named, or it is planned as absent. Cost: one uncomfortable email.

**Mitigation owner:** Karl Bergstrom · **Confirm by:** 2026-05-22

## Blind By Construction

| Class | Why the corpus cannot encode it | Question for the room |
|-------|-------------------------------|----------------------|
| Interpersonal / political | The CISO's non-responsiveness on the Auth0 decision is logged as a risk, but *why* he is not responding is in no document | "Is there a reason James is not engaging that we are working around instead of naming?" |
| Attrition / team stability | Vanta lists control owners; it does not list who is interviewing | "Who leaving would stall this for a month?" |
| Vendor & partner relationship health | The auditor's relationship exists as a contract and a date | "Is our engagement lead giving us early warnings, or minimum compliance?" |
| Unwritten organizational commitments | DataCore's 3 controls have no captured conversation at all | "What did we promise DataCore that isn't written down?" |

## Top 3 Actions This Week

1. Reconcile all 11 "complete" controls against evidence age, not Vanta state — Whitfield, by May 20
2. Get the exact evidence freeze date from the auditor in writing — Tanaka, by May 26
3. Convert the Tanaka staffing hedge into a written condition or plan as absent — Bergstrom, by May 22
```
