---
name: project-plan
description: Use to bootstrap a draft project plan for a new or early-stage initiative. Trigger phrases include: "draft a project plan for", "bootstrap a plan for", "create a project plan", "help me plan out", "turn this ramp-up into a plan". Uses ramp-up guide output, meeting notes, and mined transcripts as source. Output is deliberately a draft — designed as a 30-minute curation input with EMs and engineers, not a final plan.
---
# /project-plan — Draft Project Plan Bootstrap

**Lifecycle Stage:** Daily Workflow | **Job-to-be-Done:** Bootstrap a draft project plan from ramp-up guide + meeting notes + mined transcripts, selecting the right tracker schema — so planning becomes a 30-minute curation session, not a blank-page build

---

## Overview

A project plan built from scratch takes days. One built from structured sources takes an afternoon — most of which is curation, not creation. This skill takes a ramp-up guide (from `/ramp-up`), meeting notes, and mined Zoom transcripts as source material and bootstraps a draft plan using one of four tracker schemas. The output is intentionally imperfect: owners may be wrong, ETAs optimistic, and some tasks superfluous. The point is to transform planning into a short curation session with EMs and engineers rather than a multi-day build-from-zero exercise. Always flag confidence gaps explicitly.

## When to Use

- After completing `/ramp-up` on a new program area
- When starting a new initiative and need a first-draft plan to curation with the team
- When taking over a program mid-flight and need to reconstruct the plan quickly

**When NOT to use:**
- As a final deliverable — always plan a curation session with EMs/engineers after generation
- To generate a detailed sprint plan — use Jira for ticket-level planning
- For a program already in late execution — use `/tpm-program-health` to assess current state instead

---

## Gated Workflow

```
Phase 1: Intake + source load    →    Phase 2: Select schema    →    Phase 3: Generate draft
     │                                       │                              │
     ▼                                       ▼                              ▼
Ramp-up guide (required)             Matrix / OKR /                 Draft plan in schema
Meeting notes (optional)             Cross-team /                   Confidence gaps flagged
Zoom transcripts (optional)          Phase-rollout                  Curation prompts included
```

### Phase 1 — Intake and Source Load

**Required:**
- Ramp-up guide output (paste or reference to the generated guide)

**Optional but improves quality:**
- Meeting notes from onboarding sessions with key collaborators
- Mined Zoom transcript output (from `/mine-meeting-ais`)
- Existing docs, PRDs, or design docs
- Program name and target quarter

**Confidence degrades without optional sources** — flag each gap explicitly in the output.

### Phase 2 — Select Tracker Schema

Select the schema that best fits the initiative:

| Schema | When to use | Structure |
|--------|-------------|-----------|
| **Matrix** | Multi-team initiative with mandate-level ownership per team | Rows = teams · Columns = mandates · Cells = ETA or status |
| **OKR** | Initiative driven by measurable objectives with key results | Rows = objectives · Columns = KRs, owner, ETA, status |
| **Cross-team** | Set of deliverables with multi-team dependencies | ID · Description · Owner · ETA · Dependencies · Status |
| **Phase-rollout** | Sequential phases (design → build → validate → ship → monitor) | Rows = workstreams or teams · Columns = phases · Cells = phase status |

If unclear, default to **Cross-team** — it's the most general.

Ask the user to confirm schema before generating if it's not obvious from the source material.

### Phase 3 — Generate Draft

Generate the full draft in the selected schema. Mark every field that is inferred (not explicitly sourced) with `[inferred]`. Mark every field that is unknown with `[TBD — confirm with team]`.

---

## Output Format

```markdown
# Draft Project Plan: [Program / Initiative Name]

**Schema:** [Matrix / OKR / Cross-team / Phase-rollout]
**Target quarter:** [Q or date range]
**Sources used:** [List — ramp-up guide, meeting notes, transcripts, etc.]
**Confidence:** [High / Medium / Low] — [What's well-sourced vs. inferred]

> ⚠️ This is a draft. Fields marked [inferred] or [TBD] must be validated with EMs and engineers. Plan a 30-minute curation session before treating this as the source of truth.

---

## [Schema-specific tracker]

[Cross-team schema example:]

| ID | Description | Owner | ETA | Dependencies | Status | LOE |
|----|-------------|-------|-----|-------------|--------|-----|
| T-01 | [Task] | [Name or [TBD]] | [Date or [inferred]] | [T-02, or None] | Not started | [S/M/L or [TBD]] |

---

## Confidence Gaps

[Fields or areas where the draft is weakest — must be resolved in curation session]

| Gap | What's unknown | Who to ask |
|-----|---------------|-----------|
| Owner for [workstream] | Not in any source — [name] was mentioned but not confirmed | [Suggested person to ask] |
| ETA for [milestone] | All ETAs in this phase are inferred from similar programs | [EM name] |

---

## Curation Session Agenda (30 min)

Use this to run the plan validation session with EMs and engineers:

1. **Validate owners** [10 min] — Walk the [TBD] owner fields; assign or escalate
2. **Pressure-test ETAs** [10 min] — Flag any [inferred] ETAs; adjust based on actual capacity
3. **Confirm dependencies** [5 min] — Are cross-team dependencies known to the other teams?
4. **Remove superfluous tasks** [5 min] — Cut anything the team confirms is not needed

---

*After curation, run `/tpm-dependency-map` to formalize cross-team dependencies, and `/tpm-risk-identifier` to surface risks in the validated plan.*
```

---

## Common Rationalizations

| Rationalization | Reality |
|----------------|---------|
| "This draft is good enough to share with leadership" | It's not. [inferred] ETAs and [TBD] owners will be spotted immediately. Run the curation session first. |
| "We don't need a curation session — I'll fix the [TBDs] myself" | Owners and ETAs assigned by a TPM without EM input get rejected or ignored in the first sprint review. |
| "The ramp-up guide has everything — skip the meeting notes" | Meeting notes contain commitment language ("we agreed to", "I'll have this done by") that ramp-up guides don't. Include them when available. |

---

## Verification

- [ ] Schema confirmed before generation (not just defaulted silently)
- [ ] All inferred fields marked `[inferred]`
- [ ] All unknown fields marked `[TBD — confirm with team]`
- [ ] Confidence gap table populated (not left empty)
- [ ] Curation session agenda included
- [ ] Downstream skill suggestions present (dependency-map, risk-identifier)

---

## Design Principles Applied

- **Delivery First:** Draft + curation agenda delivered together — planning becomes a 30-min session, not a multi-day exercise
- **Risk Visibility:** Confidence gaps explicit — the team knows what to challenge, not just what to approve
- **Cross-Team Alignment:** Dependencies column required in every schema — cross-team commitments visible from day one
