---
name: tpm-technical-brief
description: "Use when you need to generate a concise technical brief from PRD + architecture context — the bridge between product intent and engineering execution."
---
# /tpm-technical-brief — Technical Brief Generator

**Lifecycle Stage:** Architecture & Technical Alignment
**Job-to-be-Done:** Generate a concise technical brief from PRD + architecture context — the bridge between product intent and engineering execution

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

---

## Interaction Flow

**Step 1 — Intake**

1. Program / feature name
2. PRD summary or key sections (paste)
3. Architecture context or design doc summary (paste)
4. Target audience (engineers, architects, external partners)
5. Any constraints: timeline, compliance, performance SLOs

**Step 2 — Generate**

---

## Output Format

```markdown
# Technical Brief: [Program / Feature Name]

**Version:** 1.0
**Date:** [Date]
**Author:** [TPM Name]
**Status:** Draft / Review / Approved

---

## Overview

**Problem:** [1–2 sentences: what business problem this solves]
**Solution:** [1–2 sentences: technical approach at a glance]
**Scope:** [What's in / what's out]

---

## Technical Approach

[3–5 paragraphs covering:
- What's being built
- How it integrates with existing systems
- Key technical choices and why
- Performance / scale considerations]

---

## Requirements

### Functional Requirements
| # | Requirement | Priority | Notes |
|---|------------|---------|-------|
| FR-1 | | Must / Should / Could | |

### Non-Functional Requirements
| # | Requirement | Target | Measurement |
|---|------------|--------|-------------|
| NFR-1 | Latency | <200ms p99 | DataDog SLO |
| NFR-2 | Availability | 99.9% | |

---

## Interfaces & Contracts

| Interface | Type | Owner | Version | Notes |
|-----------|------|-------|---------|-------|
| | REST API / Event / DB | | | |

---

## Open Technical Questions

| Question | Owner | Needed By |
|---------|-------|----------|
| | | |

---

## Risks & Mitigations

| Risk | Impact | Mitigation |
|------|--------|-----------|
| | | |

---

## Compliance & Security
[SOC2 / GDPR / PCI implications based on domain-context.md]

---

## Approval Required
| Reviewer | Role | Status |
|---------|------|--------|
| | Architecture | ☐ |
| | Security | ☐ |
| | Product | ☐ |
```

---

## Design Principles Applied
- Tool-Connected: SLO targets use DataDog conventions from domain-context.md
- Delivery First: Functional requirements tied to delivery expectations
- Risk Visibility: Open questions and risks called out explicitly
