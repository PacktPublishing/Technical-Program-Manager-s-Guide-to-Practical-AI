# NovaGrid — Skill Testing Scenarios & Raw Data

> *Fictional example: NovaGrid, Inc. is an invented company. All people, customers, numbers and events in this file are made up for the book.*

*Reference inputs for running practical-ai-for-tpms skills against realistic program context*

---

## SCENARIO DATA: Meeting Notes (raw, unprocessed)

### Cross-Program Sync — March 11, 2026

Attendees: Karl B., Sara L., Marcus C., Fatima A., James O., Yuna P., Priya K., Daniel R.

Karl opened by noting that the weekly health dashboard shows 4 of 7 programs now in amber or red.

Sara updated on Nexus: IAM design is approved and Core Infra has started implementation. The concern is Auth0's contract — it expires June 30th and renewal takes 90 days minimum. If they don't start the renewal conversation now, the IAM unified service can't go live in July. She needs a decision from James Whitfield (CISO) by March 18th or the timeline breaks. She tried to schedule with James twice — no response.

Marcus flagged that Atlas is the downstream victim of this. He has two enterprise prospects ($4.2M combined) asking for SSO in their April pilots. If IAM isn't ready, he's going to have to build a parallel Auth0 integration as a stopgap — which is exactly the technical debt they're trying to avoid with Nexus. He asked Karl to escalate to Yuki directly.

Fatima said Shield is on a knife's edge. 33 controls not started. She's been tracking the teams responsible and three of them — Storage & Indexing, Developer Experience, and Model Serving — have not assigned owners to their controls. She sent reminders on Feb 24th and March 4th. No response from Model Serving (Leo's org). She asked Marcus if he could raise it in his NovaAI sync. Marcus said Leo is already underwater with Spark architecture review.

James O. reported that Meridian is at 88% v2 API feature parity. The gap is 12 endpoints that have complex behavior in v1 with no documented spec. He needs the teams that originally built these endpoints to document the expected behavior, but they've moved on or left the company. He's going to have to reverse-engineer from production traffic. Priya K. flagged that three of those 12 missing endpoints are the ones Horizon needs for mobile push notifications. This is new information — wasn't in either program's plan.

Yuna updated Pulse: DataCore ingestion pipelines are 47% migrated to Temporal. The problem is schema drift — 22 pipelines have undocumented schema changes that cause migration failures. She's working with Ethan Park's team but they're slow to respond. She's worried the August Airflow decommission date is at risk, which means they'll run dual infrastructure ($380K/month cost) past the budget line.

Priya K. said Horizon backend API contracts need to be finalized by April but she doesn't have confirmation from Meridian (James) that the mobile-specific endpoints will be in scope. She asked directly — James said they're not in the current Meridian plan. This is an unresolved gap.

Daniel R. said the Spark architecture review has been waiting on Leo Nakamura for three weeks. Leo hasn't been available for the scheduled review meetings. Daniel asked Karl how to escalate without damaging the relationship with Leo.

Karl closed by identifying the top three items for escalation: (1) IAM Auth0 contract — needs CISO response in 7 days. (2) Shield control ownership — Leo's org specifically. (3) Horizon/Meridian endpoint gap — needs resolution in two weeks or Horizon slips.

Action items:
- Karl: escalate IAM Auth0 decision to Yuki by EOD Thursday
- Karl: raise Shield Model Serving ownership gap with Leo directly, cc James Whitfield
- James O. + Priya K.: schedule joint working session to scope Horizon endpoints into Meridian plan
- Daniel R.: Karl will facilitate Spark architecture review with Leo — meeting being set for March 17th

---

## SCENARIO DATA: Fake Jira Export (Epic-level, for /tpm-extract-blockers and /tpm-program-health testing)

### Program: Shield

| Epic | Team | Status | Last Updated | Days Since Update | Notes |
|------|------|--------|-------------|-------------------|-------|
| SOC2-001: Access Control Implementation | Security Eng | In Progress | Mar 10 | 1 | On track |
| SOC2-002: Encryption at Rest | Storage & Indexing | Not Started | Feb 3 | 36 | No owner assigned |
| SOC2-003: Audit Logging (API) | Developer Experience | In Progress | Feb 28 | 11 | Blocked on Meridian v2 |
| SOC2-004: Network Segmentation | Core Infra | In Progress | Mar 8 | 3 | 60% complete |
| SOC2-005: Vulnerability Management | Security Eng | Done | Mar 1 | 10 | ✅ |
| SOC2-006: Incident Response Plan | Security Eng | Done | Feb 20 | 19 | ✅ |
| SOC2-007: Model Serving Access Controls | Model Serving | Not Started | Jan 15 | 55 | No owner, not prioritized |
| SOC2-008: Pipeline Audit Trail | Pipeline Orchestration | Not Started | Feb 1 | 38 | Blocked on Temporal migration |

### Program: Meridian

| Epic | Team | Status | Last Updated | Days Since Update | Notes |
|------|------|--------|-------------|-------------------|-------|
| MER-001: v2 API feature parity | Query Engine | In Progress | Mar 11 | 0 | 88% complete |
| MER-002: Python SDK v2 | Developer Experience | In Progress | Mar 10 | 1 | Beta shipped |
| MER-003: Migration tooling | Developer Experience | In Progress | Mar 9 | 2 | Behind — 60% |
| MER-004: Enterprise migration support | DevEx + CS | Not Started | Feb 15 | 24 | No resourcing |
| MER-005: SMB self-service migration | Developer Experience | Not Started | Feb 1 | 38 | Deprioritized |
| MER-006: v1 infrastructure shutdown | Core Infra | Not Started | Jan 20 | 50 | Waiting on full migration |

---

## SCENARIO DATA: Risk Register (for /tpm-risk-identifier testing)

| ID | Risk Description | Likelihood | Impact | Owner | Mitigation | Status |
|----|-----------------|-----------|--------|-------|-----------|--------|
| R-001 | Auth0 contract expiry (Jun 30) blocks IAM unification | High | Critical | James W. | Decision needed by Mar 18 | Unmitigated |
| R-002 | 33 Shield controls not started — August audit at risk | High | Critical | Yuki T. | Exec mandate required | Escalated |
| R-003 | Model Serving at 190% capacity across Atlas + Spark | High | Critical | Leo N. | Team split or descope | Unmitigated |
| R-004 | Horizon mobile endpoint gap in Meridian plan | High | High | James O. | Joint scoping session Mar 13 | In progress |
| R-005 | FlowEngine pipeline failures up 23% QoQ | High | High | Amara O. | Temporal migration acceleration | In progress |
| R-006 | Schema drift blocking 22 Pulse pipeline migrations | Medium | High | Yuna P. | Ethan Park escalation | In progress |
| R-007 | Spark architecture review stalled 3 weeks | High | Medium | Daniel R. | Karl B. facilitating Mar 17 | In progress |
| R-008 | SMB customers not self-migrating API — 453 at risk | Medium | High | James O. | Resourcing decision needed | Unmitigated |
| R-009 | NovaAI uptime 94.2% vs 99.5% SLA — customer SLA breach | High | Critical | Leo N. | Emergency infra fix in flight | In progress |
| R-010 | Dual Airflow+Temporal infrastructure cost $380K/mo | Medium | Medium | Marcus B. | Accelerate migration | Monitoring |

---

## SCENARIO SEEDS: Skill-specific test prompts

Use these to run any practical-ai-for-tpms skill against realistic NovaGrid context.

### /tpm-stakeholder-map
*Input:* Program: ATLAS (Enterprise NovaAI Launch). Use company-snapshot.md and atlas-master.md as context.
*Expected output:* Stakeholder table with groups, communication channels, cadence, and RACI.
*TPM challenge:* Atlas has commercial, technical, compliance, and executive stakeholders with competing urgency. Good output distinguishes who needs what signal.

### /tpm-dependency-map
*Input:* Map the cross-program dependencies for Q2 2026 (April–June). Use dependency-matrix.md.
*Expected output:* Structured dependency table with upstream/downstream, owner, due date, and risk flag.
*TPM challenge:* NEXUS IAM is a shared dependency for three programs. Good output surfaces the sequencing conflict clearly.

### /tpm-escalation-brief
*Input:* The Auth0 contract situation from the March 11 meeting notes above.
*Expected output:* Escalation brief addressed to Yuki Tanaka, with context, ask, options, and recommended path.
*TPM challenge:* The escalation crosses two programs (NEXUS + ATLAS) and involves a CISO who isn't responding. Good output is direct about the stakes without being political.

### /tpm-stakeholder-update
*Input:* SHIELD program, for the Monthly Executive SteerCo.
*Expected output:* Executive status brief — 1 page, signal over noise, clear RAG status, risks, and asks.
*TPM challenge:* SHIELD is behind. Good output tells the truth about August risk without triggering panic. Bad output buries the lead.

### /tpm-steerco-prep
*Input:* The March 11 cross-program sync notes. Prepare SteerCo agenda for Karl B.
*Expected output:* Structured agenda with 3 escalation items, supporting context, and recommended decision frames.
*TPM challenge:* Karl needs to make decisions, not just report status. Good output is decision-ready, not a status list.

### /tpm-program-health
*Input:* Program-index.md — assess portfolio health across all 7 programs.
*Expected output:* Health scorecard with RAG per program, top 3 risks, and recommended actions.
*TPM challenge:* Programs are interdependent — a red in NEXUS affects 4 others. Good output surfaces cascading risk, not just per-program status.

### /tpm-premortem
*Input:* Program: HORIZON mobile launch (July 2026 target). Use nexus-master.md, meridian-master.md, horizon-master.md.
*Expected output:* Pre-mortem with failure modes ranked by likelihood, contributing factors, and mitigation asks.
*TPM challenge:* HORIZON has 4 external dependencies. Good pre-mortem identifies the NEXUS IAM gap and MERIDIAN endpoint gap as the most likely failure paths.

### /tpm-decision-record
*Input:* The NEXUS team needs to decide: build a parallel Auth0 SSO integration as a stopgap for ATLAS, or hold the line on IAM unification and accept the April delay.
*Expected output:* Decision record with context, options, trade-offs, and recommended path.
*TPM challenge:* Short-term vs. long-term trade-off with real cost on both sides. Good output quantifies the trade-off (tech debt cost vs. enterprise deal risk).

### /tpm-meeting-notes
*Input:* The raw March 11 cross-program sync transcript above.
*Expected output:* Structured meeting summary — decisions, action items with owners and due dates, open questions.
*TPM challenge:* The raw notes have a lot of implicit context and some unresolved issues. Good output captures the unresolved HORIZON/MERIDIAN gap as an open question, not an action item.

### /tpm-raid-log
*Input:* Program: SHIELD. Use shield-master.md as context.
*Expected output:* RAID log with Risks, Actions, Issues, Decisions — all sourced from the master doc.
*TPM challenge:* SHIELD has overlapping risks and actions — good output distinguishes risks (things that might happen) from issues (things actively blocking progress).
