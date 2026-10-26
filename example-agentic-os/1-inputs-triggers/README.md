# 1-inputs-triggers/

> **Fictional company.** NovaGrid, Inc. and everything about it in this folder (people, customers, programs, numbers, events) is invented for the book. It is not a real company, and any resemblance to real companies or people is coincidental.

Layer 1 of the example OS: the data the skills read. Everything here is synthetic data for NovaGrid, a fictional company, shaped like real tool exports so the skills work on a fresh clone without any connections.

**Start here:** [novagrid-inputs-overview.md](novagrid-inputs-overview.md) shows every source as a readable table. The skills read the JSON files; the overview is for you. The data is set on 2026-09-04; the tool-system exports (Aha!, Jira, Datadog, Salesforce, Vanta) are deliberately older (2026-08-10). Gmail and Calendar are current.

## Tool exports (what the skills read)

| Source | File | What's in it | Programs |
|---|---|---|---|
| Aha! | [aha/novagrid-aha-export.json](aha/novagrid-aha-export.json) | Programs, milestones, features, RAG. The milestone source of truth | All 7 |
| Jira | [jira/novagrid-jira-export.json](jira/novagrid-jira-export.json) | Epics, sprints, blockers, team capacity | SHIELD, PULSE, MERIDIAN |
| Jira | [jira/novagrid-jira-l3-tickets.json](jira/novagrid-jira-l3-tickets.json) | L3 engineering support tickets | All |
| Datadog | [datadog/novagrid-datadog-export.json](datadog/novagrid-datadog-export.json) | Incidents (SEV1-3), SLO targets and actuals | All |
| Salesforce | [salesforce/novagrid-sfdc-export.json](salesforce/novagrid-sfdc-export.json) | Accounts, opportunities, revenue at risk | NEXUS, ATLAS, HORIZON |
| Salesforce | [salesforce/novagrid-sfdc-support-tickets.json](salesforce/novagrid-sfdc-support-tickets.json) | L1/L2 support cases with pattern analysis | All |
| Vanta | [vanta/novagrid-vanta-export.json](vanta/novagrid-vanta-export.json) | SOC 2 controls, evidence, auditor log | SHIELD |
| Gmail | [gmail/](gmail/) | Mailbox threads for the Head of TPM and one Director | All |
| Calendar | [calendar/](calendar/) | Meetings held and upcoming, per person | All |
| Org | [org/novagrid-org.csv](org/novagrid-org.csv) | People, titles, managers, handles | All |

NEXUS, ATLAS, HORIZON and SPARK are tracked in Linear in the story, but no Linear export exists. Skills fall back to the Aha! export for them.

## Working files (seeded, the skills append to them)

| File | Written by | Read by |
|---|---|---|
| [active-tasks.md](active-tasks.md) | `/add-task` | `/focus-tasks`, `/start-day` |
| [reading-backlog.md](reading-backlog.md) | `/save-to-read` | `/reading-recommendations`, `/podcast` |
| [start-day-state.md](start-day-state.md) | `/start-day-prep` | `/start-day` |
| [okr-cycle-log.md](okr-cycle-log.md) | `/okr-reminder` | `/okr-reminder` |
| [preflight-override-log.json](preflight-override-log.json) | `/tpm-preflight` | `/tpm-preflight` |
| [simulation-log.json](simulation-log.json) | `portfolio-simulator` | `portfolio-simulator` |

## Using your own data

Replace a file with your own export in the same shape, or connect the real tool through an MCP connector and point the skill at it. Remove personal and customer data first, and use a tool your organization has approved for that data.
