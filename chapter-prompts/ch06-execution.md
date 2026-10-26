# Chapter 6 - AI Use Cases for Execution: every prompt

Each prompt exactly as printed in the book, with the inputs to paste underneath it and where the repo
has a skill or agent for the same job. Placeholders in [brackets] are yours to fill.

## P6.1 · Persona-based stakeholder communications

**Section:** Communicating with Stakeholders · **Type:** Full prompt  
**Paste with it:** Your persona.md, the situation (incident report, scope change, notes)  
**Try it with:** [example-agentic-os/2-goals-policies/stakeholder-personas.md](../example-agentic-os/2-goals-policies/stakeholder-personas.md) as persona.md, and the latest week in [layer4-weekly/this-week.md](../example-agentic-os/3-memory-knowledge/layer4-weekly/this-week.md) as the situation  
**In the example OS:** Template: [templates/persona.md](../templates/persona.md) · skill `/tpm-stakeholder-update`

```
I have provided two inputs:

1. `persona.md` containing communication preferences for my stakeholders.  
2. The situation described below.

Read the stakeholder information from `persona.md` and create tailored communications for the following audiences:

* Engineering Team  
* Executive Sponsor  
* Customer Success Team

Keep all facts consistent across versions, but adjust the level of detail, tone, and focus based on what each audience cares about.

Situation:  
[Paste incident report, scope change, meeting notes, email thread, or project update here]
```

## P6.3 · Red-status escalation in three versions

**Section:** Communicating with Stakeholders · **Type:** Described, no prompt text  
**Paste with it:** The core facts of the escalation  
**In the example OS:** `/tpm-escalation-brief`

```
When a program goes red, timelines change due to unforeseen risks, or critical systems breakdown, use AI to generate three parallel escalation messages from the same core facts: one for the engineering director (detailed, action steps), one for the CEO (brief, decision-focused), one for sales/CS (customer impact framing). This turns a high-stress writing task into a structured prompt.
```

## P6.4 · Weekly debrief pre-draft

**Section:** The Monday Morning Debrief · **Type:** Instruction with a list of asks  
**Paste with it:** Connected task tracker, chat, docs, meeting notes  
**In the example OS:** `/tpm-catchup-brief`, `/tpm-daily-briefing`

```
An AI-enabled TPM would connect their task management tool (Jira, Linear), communication/messaging tool (e.g. slack) and any other relevant tool (e.g. salesforce) along with meeting notes, important google docs etc to their favorite AI tool. Then ask the LLM to generate a weekly debrief that covers information they care about or want to know:

* Decisions and Action items from Slack threads.   
* Issues closed in the last x number of days.   
* Upcoming milestones in the next x weeks or time horizon.  
* Which artifacts (shared docs, like Google Docs) were updated and summarize the changes, any comments closed etc.   
* Identify any Blockers or Risk that need attention this week.
```

## P6.5 · Monday Morning Debrief agent - core prompt

**Section:** The Monday Morning Debrief · **Type:** Full prompt (agent)  
**Paste with it:** Your artifact index (name, type, URL, description, project): template [templates/artifact-index.md](../templates/artifact-index.md)  
**In the example OS:** `/tpm-catchup-brief`

```
Every Monday at 9 AM, review the artifact list, read through the artifacts listed and look at new information and messages in the last 7 seven days, write a summary in the format provided below, and send me a private Slack DM with the summary.

Format Template for the Summary  
Week of <Today’s Date> Morning Debrief  
Project Name: <ProjectName>  
- 2 bullets on each change (Reference: <which artifact this is from>)

General Updates:  
- Add updates for changes that don’t have a project associated with or part of the General project category.
```

## P6.6 · Meeting transcript to RAID entries

**Section:** Managing Project Risks · **Type:** One-line prompt  
**Paste with it:** A standup, sync or retro transcript  
**Try it with:** [example-agentic-os/3-memory-knowledge/layer4-weekly/this-week.md](../example-agentic-os/3-memory-knowledge/layer4-weekly/this-week.md)  
**In the example OS:** `/tpm-meeting-notes`, `/tpm-raid-log`

```
Extract all risks, actions, issues, and decisions mentioned and format as RAID log entries.
```

## P6.7 · Risk scoring and stale-item flagging

**Section:** Managing Project Risks · **Type:** Instruction with a list of asks  
**Paste with it:** Your full RAID log  
**Try it with:** [example-agentic-os/3-memory-knowledge/raid-log.md](../example-agentic-os/3-memory-knowledge/raid-log.md)  
**In the example OS:** `/tpm-raid-log`, `/tpm-risk-identifier`

```
**Automated risk scoring and stale-item flagging:** Feed your full RAID log on a regular basis to an LLM tool and ask it to:

* Rank open risks by likelihood × impact × proximity to the next milestone.  
* Flag any items with no update in more than seven days.   
* Identify any risks with missing action information or decisions, especially if the risk is marked closed or mitigated.   
* (If LLM tool has access to codebase) recommend possible solutions and estimated engineering effort to deploy the various solutions.
```

## P6.8 · Historical risk patterns for a new kickoff

**Section:** Managing Project Risks · **Type:** One-line prompt  
**Paste with it:** RAID logs from three to five completed programs  
**In the example OS:** `/tpm-premortem` (historical pattern mode)

```
What are the top ten risks that consistently materialized?
```

## P6.9 · Early-warning signals from communication channels

**Section:** Managing Project Risks · **Type:** Described, no prompt text  
**Paste with it:** Chat channels, PR review comments, ticket descriptions  
**In the example OS:** —

```
Configure an AI to monitor Slack channels, PR review comments, and Jira ticket descriptions for language that historically precedes risk materialization -- phrases like "this is getting complicated," "we may need to rethink," or "blocked on X pending a decision." Surface these as candidate RAID items before they become real problems. One thing to confirm is the data and privacy policy in place for monitoring private and public Slack channels. Beyond the implications of surveillance, we want to ensure we don’t end up sending data to tools and models outside the control of the organization without explicit review and approval from your Legal, Privacy, and Security teams.
```

## P6.10 · Risk agent - core prompt (design document review)

**Section:** Managing Project Risks · **Type:** Full prompt  
**Paste with it:** A technical design document, your Risk Mitigation tracker: template [templates/risk-mitigation-tracker.md](../templates/risk-mitigation-tracker.md)  
**Try it with:** [ch05-initiation-and-planning/4-dependencies/inputs/doc-07-payments-core-ledger-v3.md](ch05-initiation-and-planning/4-dependencies/inputs/doc-07-payments-core-ledger-v3.md) and the tracker's example rows  
**In the example OS:** `/tpm-architecture-review`

```
You are a TPM expert with System Design and Architecture specialization. Read through the document I have given you. Evaluate the technical details in the document. Run it against the Risk Mitigation tracker and look for overlooked potential risk patterns, and provide potential risk questions I can follow up with the product development team on.
```

## P6.11 · On-demand state-of-program brief

**Section:** Building a Program Knowledge Base · **Type:** Described, with the request quoted  
**Paste with it:** Your program's Second Brain sources  
**In the example OS:** `/tpm-program-brain`

```
At any point during execution, ask the second brain to generate a complete "state of the program" brief -- current milestone status, open blockers, recent decisions, upcoming dependencies -- compiled from all ingested artifacts. No manual assembly. Useful before a Steering Committee meeting, a leadership review, or whenever a new executive asks, "so where are we?"
```

## P6.12 · Questions a new team member can ask the Second Brain

**Section:** Building a Program Knowledge Base · **Type:** Question list  
**Paste with it:** Your program's Second Brain sources  
**In the example OS:** `/ramp-up`

```
* What is the status of the program?  
* What are we trying to build?  
* What are the P0 core features?  
* Who is the Design Lead on this project?  
* What meetings are scheduled for this program?  
* Is there a daily standup? If so, is it async or sync.
```

## P6.13 · Program health questions

**Section:** Measuring Program Health · **Type:** Question list  
**Paste with it:** Links to your Jira, Asana or Linear projects  
**In the example OS:** `/tpm-program-health`

```
* How many tickets did Team A close out in the last week?  
* What is the current close rate for Team B in the last month?  
* How many P0 bugs are still open for Release X for Team A, B, C?
```
