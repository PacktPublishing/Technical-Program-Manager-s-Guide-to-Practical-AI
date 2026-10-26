---
name: tpm-prd-engdoc-analyze
description: "Use when you need to analyze an existing PRD or Engineering Design Document for completeness, ambiguity, and delivery readiness — or draft a Technical Requirements Document / Engineering Design Doc brief from program context, meeting notes, or a brain dump."
---
# /tpm-prd-engdoc-analyze — PRD / Eng Design Doc Analyzer & Drafter

**Lifecycle Stage:** Execution & Delivery
**Job-to-be-Done:** Analyze an existing PRD or Engineering Design Document for completeness, ambiguity, and delivery readiness — or draft a Technical Requirements Document / Engineering Design Doc brief from program context, meeting notes, or a brain dump

---

## TPM Context

A TPM works with two types of doc problems: a doc that exists but isn't ready for engineering to act on, and a doc that doesn't exist yet but engineering is waiting on. This skill handles both modes.

**Analyze mode** is the quality gate: is this doc complete and unambiguous enough for engineering to begin? The TPM reads it as the bridge between intent and execution — flagging what's missing, what's vague, and what will generate rework if not resolved before kickoff.

**Draft mode** is the translation layer: the TPM captures what was discussed in a planning session, architecture review, or stakeholder meeting, and produces a Technical Requirements Document or Engineering Design Doc brief that engineering can use to kick off — even before the PM has written the formal PRD. This is not writing a PM's product requirements. It is documenting technical scope, interface contracts, dependencies, and acceptance criteria so that engineering doesn't start cold.

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

For Draft mode: load `3-memory-knowledge/layer3-programs/[program]-master.md` for program context and dependency information.

---

## Interaction Flow

**Step 1 — Intake**

1. Mode: **Analyze** (review an existing doc) or **Draft** (generate a doc from inputs)
2. Document type: PRD / EDD / RFC / Tech Brief / Technical Requirements Doc
3. For Analyze: paste or summarize the document; stage (early draft / ready for review / pre-launch); audience and purpose (engineering kickoff / architecture review / launch sign-off)
4. For Draft: paste meeting notes, brain dump, or describe the scope — program, milestone, owning team, known dependencies, and what engineering needs to build

**Step 2 — Analyze or Draft**

---

## Output Format

```markdown
# Document Analysis: [Document Title]

**Type:** PRD / EDD / RFC / Technical Brief
**Stage:** Early draft / Review-ready / Pre-launch
**Analyzed:** [Date]
**Overall readiness:** 🔴 Not ready / 🟡 Needs work / 🟢 Ready

---

## Completeness Check

| Section | Present? | Quality | Notes |
|---------|---------|---------|-------|
| Problem statement | ✅/❌ | 🔴🟡🟢 | |
| Success metrics | ✅/❌ | 🔴🟡🟢 | |
| Scope (in/out) | ✅/❌ | 🔴🟡🟢 | |
| Requirements | ✅/❌ | 🔴🟡🟢 | |
| Non-functional requirements | ✅/❌ | 🔴🟡🟢 | |
| Dependencies | ✅/❌ | 🔴🟡🟢 | |
| Risks | ✅/❌ | 🔴🟡🟢 | |
| Timeline / milestones | ✅/❌ | 🔴🟡🟢 | |
| Approvals | ✅/❌ | 🔴🟡🟢 | |

---

## Issues Found

### 🔴 Blockers (must fix before proceeding)
1. [Issue] — [Where it is / what's missing] — [Recommended fix]

### 🟡 Improvements (should fix)
1. [Issue] — [Recommended fix]

### 🟢 Suggestions (nice to fix)
1. [Issue] — [Suggestion]

---

## Ambiguity Flags

[Phrases or statements that are vague and could be interpreted differently by different engineers:]
- "[Quoted text]" — Ambiguous because: [reason] — Suggest: [clearer version]

---

## Missing Scope Analysis

[Things that are likely in scope but not explicitly addressed:]
- [Missing item] — Implication: [...]

---

## Delivery Readiness Assessment

**Can engineering begin?** Yes / No / Partially
**Blockers to starting:** [...]
**Estimated rework effort:** [Small / Medium / Large]
```

---

---

## Draft Mode Output Format

```markdown
# Technical Requirements Doc: [Feature / Milestone / Program]

**Type:** Technical Requirements / Engineering Design Brief / RFC
**Program:** [Program name] · **Milestone:** [M#]
**Owning team:** [Team name]
**Draft date:** [Date] · **TPM:** [Name]
**Status:** Draft — pending engineering review

---

## Problem Statement

[2-3 sentences: what technical problem is being solved, why it must be solved now, and what breaks if it isn't]

---

## Scope

### In scope
- [Specific capability or interface to be built]
- [...]

### Out of scope
- [Explicitly excluded — prevents scope creep]
- [...]

### Open questions (must resolve before kickoff)
1. [Question — owner — deadline]

---

## Technical Requirements

| ID | Requirement | Type | Priority | Notes |
|----|------------|------|---------|-------|
| TR-1 | [Requirement] | Functional / NFR / Interface | Must / Should / Could | [Context] |

---

## Interface Contracts

[API endpoints, data schemas, event payloads, or system boundaries this doc defines]

### [Interface name]
**Type:** REST / gRPC / Event / SDK
**Owner:** [Team]
**Contract:** [What it accepts and returns — or link to spec]
**SLA:** [Latency / throughput / availability requirement]

---

## Dependencies

| Depends on | What is needed | When needed | Owner | Risk if late |
|-----------|---------------|-------------|-------|-------------|
| [Team/Program] | [Specific deliverable] | [Date] | [Name] | [Impact] |

---

## Non-Functional Requirements

| NFR | Target | Measurement |
|-----|--------|------------|
| Latency | [e.g., p99 < 200ms] | [How measured] |
| Availability | [e.g., 99.9%] | [SLA window] |
| Scale | [e.g., 10K req/s] | [Load test criteria] |
| Security | [e.g., SOC 2 control X applies] | [Control reference] |

---

## Acceptance Criteria

[What "done" looks like — in terms that both engineering and the TPM can verify]

- [ ] [Criterion 1 — measurable, not vague]
- [ ] [Criterion 2]
- [ ] [Integration test passes for dependency X]

---

## Risks

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|-----------|
| [Risk] | High/Med/Low | High/Med/Low | [Mitigation] |

---

## Approvals Needed Before Engineering Starts

| Approver | Role | Decision needed | By |
|----------|------|----------------|-----|
| [Name] | [Role] | [What they need to sign off] | [Date] |
```

---

## Design Principles Applied
- **Delivery First:** Both modes focus on whether engineering can begin — Analyze flags blockers, Draft produces the artifact that removes them
- **Risk Visibility:** Ambiguity and missing scope surfaced as delivery risks in Analyze; open questions and dependency risks explicit in Draft
- **Cross-Team Alignment:** Draft mode requires dependency table and interface contracts — cross-team accountability built in
- **Tool-Connected:** Draft output includes Jira-ready acceptance criteria and links to program milestones
