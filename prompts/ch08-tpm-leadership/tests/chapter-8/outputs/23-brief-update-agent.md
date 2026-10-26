# 23 — Program brief update agent · 2026-10-20

**Sources:**
- fixtures/evolution/brief-schema.md
- briefs/*.md (last updated 2026-10-08)
- fixtures/sources/** (activity 2026-10-09 → 2026-10-20)

The briefs aren't edited. Drafts for owners are in 23-owner-drafts/; there's no messaging connection, so they're saved as files.

## Artifact 1: proposed field changes

| Program | Field | Current value | Proposed value |
|---|---|---|---|
| Program 1 | 6 Dependencies | SEC-88 (no date) | SEC-88 review 2026-10-23 |
| Program 1 | 7 Milestones | M2 2026-10-13 (Med) | M2 Done 2026-10-13 |
| Program 1 | 5 Risks | Schema mismatches (not escalated) | 3 billing-table mismatches open, due 2026-10-23 |
| Program 1 | 8 Changed | M2 slipped one week | Validation done (9/12 fixed); Security review scheduled |
| Program 2 | 6 Dependencies | Program 4 M2 (2026-10-10); Cloud Finance (not requested) | Program 4 two drops (2026-10-28, 2026-11-11); Cloud Finance approved |
| Program 2 | 7 Milestones | M3 2026-10-31, M4 2026-11-21 | unchanged (re-baseline is only proposed) |
| Program 2 | 8 Changed | 35 services migrated | 44 of 68 migrated; Kafka runbook done; re-baseline proposed |
| Program 3 | 7 Milestones | — | unchanged |
| Program 3 | 8 Changed | 45 services on metrics | 55 of 68; 9 of 14 SLO dashboards; spend +6% |
| Program 3 | 6 Dependencies | none | Procurement Splunk go/no-go by 2026-11-10 |
| Program 4 | 7 Milestones | M2 2026-10-10 | M2 2026-10-28 (Jira PRG4-M2); M2b 2026-11-11 (PRG4-081) |
| Program 4 | 5 Risks | Undocumented paths | 74 undocumented paths; Security review unscheduled |
| Program 4 | 8 Changed | mTLS for 60 services | M2 split into two drops; 4 of 5 tools off VPN |

## Artifact 2: source log

| Program | Field | Proposed value | Source | Confidence | Owner to confirm |
|---|---|---|---|---|---|
| Program 1 | 6 | SEC-88 review 2026-10-23 | Jira SEC-88 | High | Daniella |
| Program 1 | 7 | M2 Done | Jira PRG1-M2 | High | Daniella |
| Program 1 | 5 | 3 mismatches, due 10-23 | Jira PRG1-247 | High | Daniella |
| Program 2 | 6 | Two drops; capacity approved | Confluence decision log 10-17; Jira CF-512 | High | Marcus Webb |
| Program 2 | 8 | 44 of 68 | Jira PRG2-118 (tracker says 46) | Medium (conflict) | Marcus Webb |
| Program 3 | 8 | 55 of 68; +6% | Jira PRG3-077; DataDog dashboard | High | Aisha Okafor |
| Program 3 | 6 | Splunk go/no-go 2026-11-10 | Procurement calendar; PROC-77 | High | Aisha Okafor |
| Program 4 | 7 | M2 2026-10-28; M2b 2026-11-11 | Jira PRG4-M2, PRG4-081 | High | Rahul Mehta |
| Program 4 | 5 | 74 paths; SEC-91 queued | Flow inventory; Jira SEC-91 | High | Rahul Mehta |
| All | 7 confidence values | left as-is | no source states confidence (logged as **Unverified**) | — | each owner |

## Flags

- **Health disagreement, Program 2:** the brief says Yellow; Confluence status says Red (2026-10-18). Not changed; Marcus Webb to decide.
- **Health disagreement, Program 4:** the brief says Green; Confluence status says Yellow (2026-10-17) and SEC-91 has been blocked for 18 days. Not changed; Rahul Mehta to decide.
- **Schema fit, Program 2:** the milestone field has no place for a *proposed* re-baseline awaiting decision. Sharpest question: *Should the brief show a pending re-baseline, or does that belong only in "what changed" until it's approved?*
- **Schema fit, all programs:** the brief's health definitions ("intervention needed at program level") differ from the 3P skill's definitions ("milestone at risk"). Sharpest question: *Which definition is authoritative when a 3P report and a brief disagree?*
