# Workflow: Launch Readiness

**Stages:** 3
**When to run:** 2–4 weeks before target launch
**Output:** Architecture Brief + Launch Checklist + Exec Summary
**Mid-entry:** Yes — start at Stage 2 or 3 if architecture is already reviewed

---

## Overview

This workflow prepares a program for launch. It starts with a final architecture review, moves to a systematic launch checklist, and produces an exec summary for go/no-go approval. Run it 2–4 weeks before launch — not the day before.

```
Stage 1: /tpm-architecture-review → Final architecture synthesis and sign-off readiness
    ↓   [Output: Architecture Brief + Open Questions + Risks]
Stage 2: /tpm-launchreview        → Fill out the launch checklist
    ↓   [Output: Launch Checklist with Go/No-Go approvals]
Stage 3: /tpm-execsummary         → Exec-ready launch summary for sign-off
    ↓   [Output: 1-page Exec Summary for Go/No-Go decision]
```

---

## Stage 1 — Architecture Review

**Skill:** `/tpm-architecture-review`
**Goal:** Confirm architecture is solid, risks are mitigated, and operational readiness is planned

**Inputs needed:**
- RFCs or Design Review documents
- Open architecture questions
- Operational readiness status (runbooks, monitoring)

**Key output to carry forward:** Technical risks and open questions → must be resolved in Stage 2 checklist

**Gate:** All open architecture questions resolved before proceeding to Stage 2

---

## Stage 2 — Launch Review

**Skill:** `/tpm-launchreview`
**Goal:** Systematically verify every launch readiness area

**Inputs needed:**
- DPLY ticket
- PRD summary
- EDD summary
- Architecture brief (Stage 1)

**Key output to carry forward:** Launch checklist completion status + risk level → inform exec summary framing

**Gate:** All checklist items green, all Go/No-Go approvals obtained

---

## Stage 3 — Exec Summary

**Skill:** `/tpm-execsummary`
**Goal:** Produce the executive summary that finalizes the go/no-go decision

**Inputs needed:**
- Launch checklist (Stage 2)
- Program status
- Business impact expected

**Output:** 1-page exec summary ready for CEO/CTO/sponsor sign-off

---

## Workflow Complete

**Artifacts produced:**
1. `Architecture Synthesis` — Final architecture brief
2. `Launch Review Checklist` — Signed off by all required stakeholders
3. `Exec Summary` — Go/No-Go decision document

**Time to run:** 1–3 days (approvals may take time)
**Next step:** Launch + post-launch monitoring (see `/tpm-program-health`)
