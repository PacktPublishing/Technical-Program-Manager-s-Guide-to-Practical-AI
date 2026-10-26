# DR-007 — Model Serving Capacity Allocation Split Resolved

> *Fictional example: NovaGrid, Inc. is an invented company. All people, customers, numbers and events in this file are made up for the book.*

| Field | Value |
|-------|-------|
| **DR ID** | DR-007 |
| **Date** | June 4, 2026 |
| **Decision maker** | Karl Bergstrom (CTO) |
| **Informed** | Leo Nakamura (Dir. NovaAI), Marcus Chen (TPM ATLAS), Daniel Rios (TPM SPARK), Rachel Lim (CPO) |
| **Programs affected** | ATLAS, SPARK |
| **Status** | Active — in effect through August 11, 2026 |

---

## Context

Since SPARK program launch (Feb 2026), the Model Serving team has been over-allocated across two simultaneous programs:
- **ATLAS** requires Model Serving for multi-tenant isolation, audit logging, and enterprise GA support
- **SPARK M2** (new model serving alpha) is the core Model Serving deliverable for the NovaAI v2 platform

DEP-007 (cross-program dependency) identified this as a 190%+ allocation — both programs claiming the same team without a formal split. Karl Bergstrom committed at SteerCo May 22 to force a working session before June 1.

Leo Nakamura confirmed the Model Serving working session for June 4. Karl chaired. Marcus Chen and Daniel Rios both attended. Leo, Awa Diallo (Group PM NovaAI), and the Model Serving tech lead (Wei Zhang) attended.

---

## Decision

Effective June 4 through **August 11, 2026** (SPARK M2 target date):

| Program | Model Serving allocation |
|---------|--------------------------|
| **SPARK M2** (new model serving alpha) | **65%** |
| **ATLAS** (enterprise GA, M7 customer onboarding) | **35%** |

Additionally:
- 1 new hire (approved by Karl Apr 22) joins Model Serving **June 16**. Assigned to ATLAS M7 customer onboarding support for first 90 days.
- ATLAS M7/M8 customer onboarding work to be designed to minimize Model Serving involvement (use AI App Builder + Embeddings teams where possible).

Post-August 11: allocation reverts to discussion based on M2 delivery status.

---

## Rationale

- SPARK M2 is the strategic architecture work. At 21% as of June 4, it cannot absorb further ATLAS re-prioritization without making Aug 11 untenable.
- ATLAS June 30 GA only requires 2-3 customer onboarding completions — manageable at 35% allocation.
- The new hire landing June 16 gives ATLAS a dedicated resource buffer for M7.
- Both TPMs (Marcus, Daniel) accepted the split as equitable.

---

## Impact

| Metric | Before (May 26) | After (Jun 28) |
|--------|----------------|----------------|
| SPARK M2 % complete | 21% | 39% |
| ATLAS M7 enterprise customers | 0/5 | 2/5 + 3rd in contracting |
| DEP-007 status | Unresolved (190%+) | Resolved |

---

## Related

- DEP-007 — Model Serving shared resource dependency
- DR-006 — ATLAS uptime improvement plan (also uses Model Serving capacity within ATLAS 35% slice)
- SPARK Risk R-002 (resource constraint)
