# Template: Stakeholder Map

Referenced by: `/tpm-stakeholder-map`

---

## 1. Stakeholder / Communication Table

| Group | Type | Key People | Channel | Cadence | Purpose |
|-------|------|-----------|---------|---------|---------|
| [Group name] | Sponsor / SteerCo / Core Team / Working Team / Partner | [Names] | [Slack / Email / Meeting] | [Daily / Weekly / Bi-weekly / Monthly] | [Decisions / Awareness / Input] |

**Group types:**
- **Sponsor** — Executive accountable for program success; final decision authority
- **SteerCo** — Steering committee; approve scope changes, resolve escalations
- **Core Team** — Leads and owners directly running the program
- **Working Team** — Contributors executing specific workstreams
- **Partner / Dependent** — External teams or vendors with dependencies

---

## 2. Program Team Summary

| Area | Assignee(s) |
|------|-------------|
| Executive Sponsor | |
| TPM | |
| Engineering Lead | |
| Product Lead | |
| SteerCo Members | |
| Core Team | |

---

## 3. Review / RACI Matrix

| Artifact / Decision | [Group A] | [Group B] | [Group C] | [Group D] |
|--------------------|----------|----------|----------|----------|
| Program Charter | Review | Informed | — | — |
| Scope changes | A | R | C | I |
| Architecture decisions | Informed | A | R | C |
| Go/No-Go launch | A | C | C | I |
| SteerCo updates | Review | Informed | Informed | — |

**Values:**
- **R** = Responsible (does the work)
- **A** = Accountable (owns the outcome)
- **C** = Consulted (provides input)
- **I** = Informed (needs to know)
- **Review** = Substantive feedback expected before finalization
- **—** = Not involved

---

## Filled Example: Platform Alpha Program

*Adapted from a real TPM use case — replace with your program details.*

### Stakeholder Map

| Group | Type | Key People | Channel | Cadence | Purpose |
|-------|------|-----------|---------|---------|---------|
| Executive Sponsors | Sponsor | CTO (David Park), VP Eng (Maria Chen) | Email + 1:1 | Monthly written + bi-weekly verbal | Decisions, escalations, strategic alignment |
| SteerCo | SteerCo | Maria Chen (chair), CPO, Head of Platform | SteerCo meeting | Bi-weekly | Approve scope changes, resolve cross-team blockers |
| Platform Core Team | Core Team | TPM, Platform EM, Tech Lead, PM | Slack #prog-platform-alpha | Weekly sync + async | Program execution, decisions, blockers |
| API Team | Working Team | API EM, 2 engineers | Slack, Jira | Sprint cadence | API contract delivery |
| Frontend Team | Working Team | Frontend EM, 3 engineers | Slack, Jira | Sprint cadence | Integration delivery |
| Security | Partner | Kevin Wu (Head of Security) | Email + review | Per milestone | Security sign-off for launch |
| Customer Success | Dependent | Aisha Patel | Email + monthly brief | Monthly | CS readiness for customer-facing changes |

### Program Team Summary

| Area | Assignee(s) |
|------|-------------|
| Executive Sponsor | David Park (CTO) |
| TPM | [Your name] |
| Engineering Lead | [Platform EM name] |
| Product Lead | [PM name] |
| SteerCo | Maria Chen, Rachel Torres |
| Core Team | TPM, Platform EM, Tech Lead, PM, API EM |

### Review / RACI

| Artifact | CTO | VP Eng | TPM | Platform EM | API EM | Security |
|---------|-----|--------|-----|------------|--------|---------|
| Program Charter | Informed | Review | A/R | Review | Informed | — |
| Scope changes (>20%) | A | C | R | C | I | — |
| Architecture decisions | Informed | Informed | C | C | R/A | Review |
| Launch Go/No-Go | A | C | R | C | C | Review |
| SteerCo updates | Informed | Review | A/R | C | I | — |
