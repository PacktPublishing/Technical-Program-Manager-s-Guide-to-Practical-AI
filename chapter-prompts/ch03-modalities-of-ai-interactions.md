# Chapter 3 - Modalities of AI Interactions: every prompt

Each prompt exactly as printed in the book, with the inputs to paste underneath it. Placeholders in [brackets] are yours to fill. The chapter moves from a one-off prompt to a reusable template, then a skill, then an agent (Table 3.1). The prompts below follow the same order.

The "Try it with" files are fictional sample data, so you can run every prompt without touching real program data.

## P3.1 · Chris's dependency prompt (what not to do)

**Section:** Prompt engineering and critical thinking · **Type:** Anti-example  
**Why it's here:** It returns a general summary and misses the two circular dependencies that P3.2 finds. Run both on the same document and compare.

```
Read this architecture doc and tell me what the dependencies are.
```

## P3.2 · Daniella's dependency extraction (one-shot RTCFC)

**Section:** Prompt engineering and critical thinking · **Type:** Full prompt  
**Paste with it:** One architecture or system design document  
**Try it with:** [ch05-initiation-and-planning/4-dependencies/inputs/doc-07-payments-core-ledger-v3.md](ch05-initiation-and-planning/4-dependencies/inputs/doc-07-payments-core-ledger-v3.md)  
**Saved as a skill:** [skills/dependency-extraction/SKILL.md](skills/dependency-extraction/SKILL.md)  
**Expect:** One Markdown table (Source | Target | Type | Method | Failure Impact | Status), circular dependencies flagged, follow-up questions where the document is unclear.

```
You are a senior technical architect reviewing this system design document.

Your task: Extract ALL technical dependencies and categorize them precisely.

Categories:
1. Hard dependencies (blocking) - system cannot function without these
2. Soft dependencies (optional) - degraded functionality if unavailable
3. Data dependencies (shared state) - systems that share databases or state.

I've provided an architectural diagram of our systems and data pipelines for reference.

For each dependency, identify:
- Source service (what depends on something else)
- Target service (what is being depended upon)
- Integration method (REST API, message queue, shared database, etc.)
- Failure impact (what breaks if this dependency fails)
- Current status (existing, planned, or assumption requiring validation)

Output format: Markdown table with columns: Source | Target | Type | Method | Failure Impact | Status

Constraints:
- Only extract dependencies explicitly stated in the document
- Flag any circular dependencies you detect
- Note integration points requiring cross-team coordination

Ask follow up questions where you have uncertainty, I will validate the output and give feedback.
```

**If you have no diagram:** delete the line "I've provided an architectural diagram...". Chapter 5's dependency kit does the same.

### The same prompt with its RTCFC components labelled

**Section:** RTCFC In Action

```
[ROLE] You are a senior technical architect reviewing this system design document.

[TASK] Your task: Extract ALL technical dependencies and categorize them precisely.

[CONTEXT - Categories defined]
Categories:
1. Hard dependencies (blocking) - system cannot function without these
2. Soft dependencies (optional) - degraded functionality if unavailable
3. Data dependencies (shared state) - systems that share databases or state

I've provided an architectural diagram of our systems and data pipelines for reference.

[CONTEXT - What to extract]
For each dependency, identify:
- Source service (what depends on something else)
- Target service (what is being depended upon)
- Integration method (REST API, message queue, shared database, etc.)
- Failure impact (what breaks if this dependency fails)
- Current status (existing, planned, or assumption requiring validation)

[FORMAT]
Output format: Markdown table with columns: Source | Target | Type | Method | Failure Impact | Status

[CONSTRAINTS] Constraints:
- Only extract dependencies explicitly stated in the document
- Flag any circular dependencies you detect
- Note integration points requiring cross-team coordination

[FEEDBACK LOOP]
Ask follow up questions where you have uncertainty, I will validate the output and give feedback.
```

## P3.3 · Chris's iterative refinement (turns 1 to 3)

**Section:** RTCFC In Action · **Type:** Multi-turn conversation  
**Paste with it:** The same architecture document as P3.2  
**Expect:** Each turn sharpens the output. By turn 5 you have built P3.2 yourself.

Turn 1 (calibrating shot):

```
Read this architecture doc and tell me what the dependencies are.
```

Turn 2 (adding Role and Structure):

```
Okay, these are decent results, I'm particularly interested in the technical ones you pulled out. But now I want you to act as a technical architect. Categorize dependencies as:
- Hard dependencies (blocking)
- Soft dependencies (optional)
- Data dependencies (shared state)
```

Turn 3 (adding more Context):

```
For each dependency, I need to know: source service, target service, integration method, and what breaks if it fails. Also, consider the fact that we just went through a major merger.
```

## P3.4 · Chain-of-thought prioritization

**Section:** Advanced Prompting Techniques · **Type:** Full prompt plus a course-correction follow-up  
**Paste with it:** Details or documents for three competing initiatives  
**Try it with:** three program docs from [example-agentic-os/3-memory-knowledge/layer3-programs/](../example-agentic-os/3-memory-knowledge/layer3-programs/), for example `atlas-master.md`, `horizon-master.md` and `pulse-master.md`  
**Expect:** The criteria, an assessment of each initiative, dependencies, and a ranked order with the reasoning visible so you can challenge it.

```
You are an experienced TPM helping prioritize initiatives. We have three proposals:

[Initiative A details or documents]
[Initiative B details or documents]
[Initiative C details or documents]

Walk me through your prioritization reasoning step by step:
1. First, identify the key criteria we should use to evaluate these
2. Then, assess each initiative against those criteria
3. Note any dependencies or constraints that affect priority
4. Finally, provide your recommended priority order with rationale

Show your thinking at each step.
```

If the reasoning is off, course-correct:

```
Actually, leadership cares more about customer impact than engineering efficiency. Redo your analysis with that priority.
```

## P3.5 · Meta-prompting: a prompt that writes a prompt

**Section:** Meta-Prompting · **Type:** Full prompt plus a one-liner  
**Expect:** A reusable prompt template you can save and run again.

At the end of any iterative conversation:

```
Help me turn our conversation into a repeatable prompt template.
```

Daniella's template request:

```
I need to create a prompt template that I can reuse for translating vague stakeholder requests into clear technical requirements with acceptance criteria.

The input will be: rough notes from stakeholder conversations
The output should be: structured requirements with user stories and testable acceptance criteria

Help me design a prompt that will:
- Extract the core user need from messy notes
- Identify technical assumptions that need validation
- Generate acceptance criteria in Given-When-Then format
- Flag any ambiguities that need stakeholder clarification

What should that prompt include? Give me a template I can reuse.
```

## P3.6 · The prep-execute pattern (technical debt)

**Section:** The Prep-Execute Pattern · **Type:** Two conversations  
**Try it with:** [example-agentic-os/3-memory-knowledge/layer1-always/tech-stack.md](../example-agentic-os/3-memory-knowledge/layer1-always/tech-stack.md) and [example-agentic-os/3-memory-knowledge/layer2-portfolio/dependency-matrix.md](../example-agentic-os/3-memory-knowledge/layer2-portfolio/dependency-matrix.md)  
**Expect:** First a method you can review, then the analysis done with that method.

Prep conversation:

```
I need to assess technical debt across our microservices architecture. I have: service dependency maps, code quality metrics, incident history, and team velocity data.

What's the best framework for analyzing this? Give me:
1. The key questions I should be asking
2. How to structure the data analysis
3. What output format would be most useful for decision-making
4. What I should watch out for or validate
5. Point out anything else I'm missing that might be helpful in this analysis
```

Execute conversation (separate, or later in the same conversation):

```
Using the framework you just designed, analyze this technical debt data:
[provide data]
[paste framework from prep conversation]
```

## P3.7 · Validation lines to add to any high-stakes prompt

**Section:** Systematic Validation · **Type:** Add-on lines  
**How to use:** Paste these at the end of any prompt where being wrong is costly.

```
Flag any assumptions you're making so I can validate them
Note which parts are based on provided documents vs. general knowledge
Ask questions where you have a high degree of uncertainty
```

Show-your-work follow-ups:

```
Explain the reasoning behind this recommendation
```

```
What assumptions are you making?
```

Rule of thumb from the chapter: validation effort should match the consequence of being wrong.

## P3.8 · The dependency-extraction skill

**Section:** Skills · **Type:** Skill (P3.2, saved)  
**File:** [skills/dependency-extraction/SKILL.md](skills/dependency-extraction/SKILL.md)  
**How to use:** In Claude, upload the `dependency-extraction` folder as a skill (Customize > Skills). Then attach an architecture document and say "Extract the dependencies." In any other tool, paste the body of `SKILL.md` as the prompt.

> **Warning (from the book):** treat shared skills like shared code. Read a skill in full and confirm your organization approves it before you use it. Keep credentials and sensitive data out of the skills you write.

## P3.9 · Triage agent: the reasoning engine

**Section:** How Daniella Built Her First Agent (Step 3) · **Type:** Agent prompt  
**Where it runs:** In an orchestration tool (n8n, Zapier or similar), between a Slack trigger and a routing step. You can test it in any chat tool first by pasting a message underneath.  
**Expect:** JSON only, for example `{"team": "Backend", "priority": "High", "summary": "...", "acceptance_criteria": "..."}`.

```
You are a Principal TPM Triage Agent. Read the incoming Slack message. Extract the core issue, assign a priority (High, Medium, Low), and determine the responsible team (Frontend or Backend). Return your response as a JSON object with fields: team, priority, summary, and acceptance_criteria.
```

Sample messages to test with (fictional), including the "sad path" the chapter warns about:

```
1. Checkout page throws a 500 for EU users since this morning's deploy, about 40 failed orders so far.
2. Can we make the settings button a bit bigger on mobile? Not urgent.
3. Ugh, the reporting API is so slow today.
```

The third message is venting, not a request. **The printed prompt will still turn it into a ticket**, because it has no rule for messages that aren't requests. That is the chapter's point: Chris's agent made exactly this mistake, and Daniella's design catches it with the human-in-the-loop approval in P3.10, not with the prompt. If you also want the prompt to filter, add a line such as: *"If the message is not a request for work, return {"team": null} and do not draft a ticket."*

## P3.10 · Triage agent: the human-in-the-loop message

**Section:** How Daniella Built Her First Agent (Step 5) · **Type:** Approval message the agent sends you  
**Why:** The agent drafts the ticket, and a person approves it. Nothing irreversible happens without your sign-off.

```
I categorized this request as a High Priority Backend Bug. Here's the drafted ticket: [summary]. Should I create it? [Approve / Reject]
```

## P3.11 · Supervisor agent

**Section:** Pattern 2: The Supervisor · **Type:** Agent prompt (coordinates three workers)  
**Workers:** Extractor (pulls the dependencies out of the document, which is P3.2), Cross-referencer (compares them against existing Jira tickets), Reporter (writes the stakeholder summary)  
**Try it with:** [ch05-initiation-and-planning/4-dependencies/inputs/](ch05-initiation-and-planning/4-dependencies/inputs/) and [example-agentic-os/1-inputs-triggers/jira/](../example-agentic-os/1-inputs-triggers/jira/)  
**Set a limit:** at most 3 retries per worker, so a rejected output can't loop forever.

```
Act as a supervisor our agent group of the extractor, cross-referencer, and reporter. The outcome is an analysis of the dependency risks that especially focus on tech debt of our architecture. Provide a high-level outline first that I can verify before proceeding to a more detailed report. Ask questions me clarifying questions where you feel like you have to make assumptions.
```

## P3.12 · Swarm: four personas stress-test one plan

**Section:** Pattern 3: The Swarm · **Type:** Four independent prompts, one per agent  
**Paste with it:** The same migration plan for all four, run in four separate chats  
**Try it with:** [ch05-initiation-and-planning/3-assumptions/inputs/scope-document.md](ch05-initiation-and-planning/3-assumptions/inputs/scope-document.md)  
**Expect:** Four outputs that disagree. The disagreements are the value. Chapter 5's pre-mortem ([ch05-initiation-and-planning/5-premortem/](ch05-initiation-and-planning/5-premortem/README.md)) is the full version of this pattern.

Agent 1 (Security Engineer):

```
Review this migration plan for security vulnerabilities, auth gaps, and compliance risks.
```

Agent 2 (Site Reliability Engineer):

```
Evaluate this plan for availability risks, failover gaps, and performance bottlenecks during the migration window.
```

Agent 3 (Staff Engineer on the platform team):

```
Identify technical debt this plan creates, integration points that will break, and dependencies on systems scheduled for deprecation.
```

Agent 4 (Product Manager):

```
Flag anywhere this migration plan creates customer-facing risk, feature regression, or timeline conflicts with the product roadmap.
```
