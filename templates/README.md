# Templates

Reusable output templates, used by the book's prompts and by the skills in [../example-agentic-os/](../example-agentic-os/). Use these when filling out skill outputs or as starting points for new artifacts.

All templates ship with a filled example using the NovaGrid fictional company context. Adapt the example to your program.

## Planning Templates (`02-planning/`)

| Template | Used By | What It Provides |
|----------|---------|-----------------|
| [02-planning/risk-register.md](02-planning/risk-register.md) | `/tpm-risk-identifier` | Risk detail template — trigger conditions, mitigation actions, escalation trigger — with NEXUS example |
| [02-planning/milestone-plan.md](02-planning/milestone-plan.md) | `/tpm-master-document`, `/tpm-timeline-stress-tester` | Milestone tracking — exit criteria, critical path, dependency table — with SHIELD example |
| [02-planning/program-master-template.md](02-planning/program-master-template.md) | *(manual / any program-health workflow)* | **Blank living program master** — header, scope, milestones, risks, deps, stakeholders, latest update; placeholders only. Copy into `3-memory-knowledge/layer3-programs/<code>-master.md` and fill. |
| [02-planning/alignment-gap-register.md](02-planning/alignment-gap-register.md) | `/tpm-alignment-gap-detector` | Stakeholder conflicts — two-sided quotes, hedge register, coverage/volume correction — with SHIELD example |
| [02-planning/assumption-log.md](02-planning/assumption-log.md) | `/tpm-assumption-extractor` | Assumption log — 4 classes, evidence-gate report, EXTRACTED→CONFIRMED/BROKEN/OPEN tracker — with NEXUS example |
| [02-planning/premortem-session-pack.md](02-planning/premortem-session-pack.md) | `/tpm-premortem` | Persona-swarm output — collision analysis, ranked scenarios, blind-by-construction, 60-min agenda — with SHIELD example |

## Execution Templates (`04-execution/`)

| Template | Used By | What It Provides |
|----------|---------|-----------------|
| [04-execution/raid-log.md](04-execution/raid-log.md) | `/tpm-raid-log` | RAID log — Risks / Assumptions / Issues / Dependencies quadrants — with SHIELD example |
| [04-execution/blocker-log.md](04-execution/blocker-log.md) | `/tpm-extract-blockers`, `/tpm-raid-log` | Blocker tracking — impact, resolution path, escalation trigger — with SHIELD example |
| [04-execution/steerco-prep.md](04-execution/steerco-prep.md) | `/tpm-steerco-prep` | SteerCo agenda — decisions / awareness / FYI structure, health snapshot — with NovaGrid example |
| [04-execution/qbr-mbr.md](04-execution/qbr-mbr.md) | `/tpm-qbr-prep` | QBR/MBR — plan vs. actuals, OKR contribution, ask for next period — with SHIELD Q1 example |
| [04-execution/incident-sitrep.md](04-execution/incident-sitrep.md) | `/tpm-incident-check` | Incident SitRep — timeline, impact, root cause hypothesis, customer comms — with NovaGrid guidance |

## Root-Level Templates

| Template | Used By | What It Provides |
|----------|---------|-----------------|
| [stakeholder-map.md](stakeholder-map.md) | `/tpm-stakeholder-map` | Stakeholder/comms table, program team summary, RACI matrix — with filled example |
| [status-brief.md](status-brief.md) | `/tpm-stakeholder-update`, `/tpm-execsummary` | Exec brief, team brief, and stakeholder brief variants, plus the 3P Report (Progress · Plans · Problems) and its portfolio roll-up from Chapter 8 — with examples |
| [artifact-index.md](artifact-index.md) | Prompt P6.5 | Index of every channel and document a debrief agent may read, from Chapter 6 - with NovaGrid example |
| [risk-mitigation-tracker.md](risk-mitigation-tracker.md) | Prompt P6.10 | Living risk register the risk agent checks new designs against, from Chapter 6 - with NovaGrid example |
| [persona.md](persona.md) | `/tpm-stakeholder-update` | Per-audience concerns, style, common questions and prompt instructions, from Chapter 6 — filled NovaGrid version: `example-agentic-os/2-goals-policies/stakeholder-personas.md` |

## How to Use

These templates are reference structures. When running a skill:
- The skill will ask you for inputs and generate output following these shapes
- You can also paste a template directly and ask Claude to fill it in from your program context
- Templates ship with real NovaGrid examples — adapt them to your program
