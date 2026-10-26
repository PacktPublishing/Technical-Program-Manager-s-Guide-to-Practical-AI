---
name: tpm-master-document
description: "Use when you need to generate a complete Program Charter or Master Document covering charter, stakeholder map, objectives, and problem framing."
---
# /tpm-master-document — Program Charter / Master Document Generator

**Lifecycle Stage:** Program Initiation
**Job-to-be-Done:** Generate a complete Program Charter or Master Document covering charter, stakeholder map, objectives, and problem framing

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

You generate the foundational program document that anchors every downstream deliverable. This is the single source of truth for why the program exists, what it will deliver, and who owns it.

---

## Interaction Flow

**Step 1 — Intake (ask only what you don't have)**

Gather:
1. Program name
2. Business problem / opportunity (why now?)
3. Proposed solution approach
4. Key objectives (what does success look like in 6–12 months?)
5. Scope: what's IN and what's explicitly OUT
6. Key stakeholders and sponsors
7. Target timeline / major milestones
8. Known risks and dependencies
9. Success metrics (leading and lagging)

**Step 2 — Generate**

Produce the full Program Charter document.

---

## Output Format

```markdown
# Program Charter: [Program Name]

**Version:** 1.0
**Date:** [Date]
**Program Lead:** [TPM Name]
**Executive Sponsor:** [Name / Role]
**Status:** Draft

---

## 1. Executive Summary
[2–3 sentence summary: problem, solution, expected outcome]

## 2. Problem Statement
**Current state:** [What's broken or missing today]
**Impact:** [What this costs the business / customers]
**Root cause:** [Why this exists]

## 3. Objectives
| Objective | Key Result | Target | Timeline |
|-----------|-----------|--------|----------|
| | | | |

## 4. Scope

**In Scope:**
- ...

**Out of Scope:**
- ...

**Assumptions:**
- ...

## 5. Stakeholders
| Name | Role | Responsibility | Communication |
|------|------|---------------|---------------|
| | | | |

## 6. Program Approach
[High-level delivery strategy: phases, key workstreams, sequencing rationale]

## 7. Timeline
| Milestone | Target Date | Owner | Dependencies |
|-----------|------------|-------|--------------|
| | | | |

## 8. Risks & Mitigations
| Risk | Likelihood | Impact | Mitigation | Owner |
|------|-----------|--------|------------|-------|
| | | | | |

## 9. Dependencies
| Dependency | Team | Status | Risk if Delayed |
|-----------|------|--------|-----------------|
| | | | |

## 10. Success Metrics
| Metric | Type | Baseline | Target | Measurement |
|--------|------|---------|--------|-------------|
| | Leading | | | |
| | Lagging | | | |

## 11. Resources & Budget
[Headcount, budget envelope, tooling needs]

## 12. Approvals
| Name | Role | Date | Signature |
|------|------|------|-----------|
| | | | |
```

---

## Design Principles Applied
- Delivery First: Charter focuses on outcomes, not process documentation
- Risk Visibility: Dedicated risks section, risks tied to owners
- Cross-Team Alignment: Dependencies table makes cross-team needs explicit
