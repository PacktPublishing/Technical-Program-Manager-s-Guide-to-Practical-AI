# Chapter 7 - AI Usage in Delivery & Closure / Monitoring: every prompt

Each prompt exactly as printed in the book, with the inputs to paste underneath it and where the repo
has a skill or agent for the same job. Placeholders in [brackets] are yours to fill.

## P7.0 · Chris's retro prompt - what not to do

**Section:** Retrospective Prep & Analysis · **Type:** Anti-example  
**Paste with it:** nothing, it is the shallow version  

> Shown in the book as the shallow approach. Compare with P7.1.

```
Summarize what went well and what didn't.
```

## P7.1 · Retrospective Root-Cause Engine

**Section:** Retrospective Prep & Analysis · **Type:** Production-ready prompt  
**Paste with it:** Async retro notes, Jira delivery metrics, Git PR cycle times, goal stability data (change request volume), layered defect metrics, the program risk register  
**Try it with:** [example-agentic-os/3-memory-knowledge/raid-log.md](../example-agentic-os/3-memory-knowledge/raid-log.md), [example-agentic-os/1-inputs-triggers/jira/novagrid-jira-export.json](../example-agentic-os/1-inputs-triggers/jira/novagrid-jira-export.json) and a few weekly logs from [layer4-weekly/](../example-agentic-os/3-memory-knowledge/layer4-weekly/)  
**In the example OS:** Agent `/tpm-retro-rootcause` · workflow `/tpm-workflow-benefits-closure`

> The book prints the first two items and then "...". Items 3 and 4 below complete the prompt.

```
Act as an expert Principal TPM specializing in systemic root-cause analysis, software engineering telemetry, and program risk governance. I am providing a multi-modal dataset from our recently completed platform migration program, including async retro notes, Jira delivery metrics, Git PR cycle times, goal stability data (change request volume), layered defect metrics, and our live historical program risk register.

Analyze this dataset to extract the top 4 systemic themes that impacted engineering velocity, delivery predictability, or strategic alignment.

For each theme, provide:

1. A clear technical or operational description of the bottleneck or goal defect.

2. Direct corroborating evidence (combining qualitative quotes from retro notes, quantitative Jira/Git telemetry, scope churn metrics, platform vs. application defect ratios, and documented risk triggers).

3. An analysis of how effectively the team's documented risk mitigations performed versus the actual engineering outcomes shown in the telemetry.

4. An actionable architectural or operational recommendation for the next program kickoff to permanently eliminate this class of risk.

Eliminate generic filler summaries. Focus heavily on technical friction points, dependency lag, tool governance failures, and gaps between anticipated risks and realized execution issues.
```

## P7.2 · Interactive Program Brain Evaluator

**Section:** Capturing Institutional Knowledge · **Type:** Production-ready prompt  
**Paste with it:** Final production docs, architecture specs, accepted ADRs  
**In the example OS:** Agent `/tpm-program-brain`

> Replace "Project Titan" with your program's name.

```
You are an advanced technical program repository agent. You have been granted access to the finalized production documentation, core architecture specifications, and accepted ADRs for Project Titan. Build an interactive, structural knowledge base summary designed for onboarding incoming engineers to this codebase. Structure your output into the following explicit sections:

1. Production Architecture Core: What is the finalized data flow and system boundaries?

2. The Critical "Why": What were the 3 most significant technical trade-offs made during the program lifecycle, and what alternatives were rejected based on the ADRs?

3. Inherited Technical Debt: What known architectural limitations or temporary workarounds were intentionally left in the production code that downstream teams must monitor? Cite specific grounding documents and ADR numbers for every assertion made. Do not pull information from outdated planning specs.
```

## P7.3 · Querying the Program Brain later

**Section:** Capturing Institutional Knowledge · **Type:** Example query  
**Paste with it:** A published Program Brain  
**In the example OS:** Agent `/tpm-program-brain`

```
Why did we choose vertical sharding over horizontal sharding for the transaction database?
```

## P7.4 · Operational Handshake & Risk Categorization

**Section:** Loose Ends & Next Steps · **Type:** Production-ready prompt  
**Paste with it:** The list of unresolved tickets and undocumented workarounds  
**In the example OS:** Agent `/tpm-operational-handshake`

```
Act as a Senior TPM managing an operational transition. Review the attached list of 15 unresolved tickets and undocumented code workarounds remaining at the conclusion of our migration program. Categorize these remaining items into a 3-tier operational backlog matrix:

1. Tier 1: Immediate Tail Risks (Items that impact system reliability, security compliance, or SLA targets within the next 30 days).

2. Tier 2: Managed Technical Debt (Known architectural compromises that require dedicated cleanup sprints in the next quarter).

3. Tier 3: Deferred Feature Backlog (Low-impact user experience enhancements to be evaluated by product management).

For every item in Tier 1 and Tier 2, generate an explicit, sprint-ready description specifying the downstream operational impact if left unaddressed, and suggest the ideal engineering team owner based on the system boundaries.
```

> The book prints the last paragraph ("For every item in Tier 1 and Tier 2...") as body text after the code block. It belongs to the prompt, so it is kept here.

## Contributor highlights: the guardrails (no prompt)

**Section:** Program Brain Contributor Highlights · **Type:** Guardrails, no prompt text  
**In the example OS:** Agent `tpm-contribution-synthesis` ([5-agent-harness/sub-agents/tpm-contribution-synthesis.md](../example-agentic-os/5-agent-harness/sub-agents/tpm-contribution-synthesis.md))

The chapter prints no prompt for this use case, only the three guardrails that any version must follow:

1. **No automated individual evaluation.** AI is never used to score, rank, compare, hire, fire or generate performance ratings for named employees.
2. **Opt-in self-advocacy and manager assist only.** The AI helps engineers summarize their own technical impact, or helps managers compile program-level technical milestones.
3. **Contextual synthesis over surveillance.** Use public technical artifacts (ADRs, post-mortems, architecture specs), never private 360 reviews or individual activity telemetry.

> **Before you use contributor data:** the EU AI Act classifies AI used for worker evaluation, performance monitoring or recruitment as high-risk, GDPR applies to the personal data involved, and where works councils (Betriebsrat) exist, tracking developer behaviour needs their agreement. Ask Legal or HR first. This note is for awareness only, not legal advice.
