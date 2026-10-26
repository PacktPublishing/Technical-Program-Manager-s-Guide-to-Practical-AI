# Use Case 01: Program Kickoff

**Lifecycle stage:** Early — Program Initiation
**Time pressure:** High — you have days, not weeks
**AI complexity level:** Chained prompts → Orchestrated workflow

---

## The Problem

Maya is a senior TPM at a post-IPO B2B SaaS company. On Tuesday afternoon, her VP of Engineering drops a Slack message: *"You're owning the platform re-architecture program. Kickoff is two weeks from today. Board is watching this one."*

What Maya has: a 3-slide exec deck, a Slack thread with six engineers arguing about scope, and a vague deadline of "before Q3." What she doesn't have: a charter, a stakeholder map, a risk register, or any shared understanding of what "done" means.

The old way takes two weeks of workshops, three rounds of stakeholder interviews, and a charter doc nobody reads until something goes wrong. Maya needs to compress that into two days — and she needs the output to actually hold up in a room full of skeptical engineers and an exec sponsor who will ask hard questions.

The challenge isn't writing — it's thinking rigorously under time pressure, with incomplete information, across multiple dimensions (strategy, scope, stakeholders, risk) simultaneously.

---

## Prompting Approach

Start with the hardest question first: *Is the strategy actually sound?*

Before you write a single charter section, stress-test the program with a boardroom review. This surfaces the gaps that will bite you in Week 6 before you've committed to a plan.

**Step 1 — Stress-test the strategy**

```
/tpm-boardroom

Program: Platform Re-architecture
What we're doing: Consolidating 340 microservices to ~200, migrating CI/CD 
from Jenkins to GitHub Actions, replacing our homegrown IAM with a managed 
identity provider (Auth0 or Okta TBD). Target: Q3 completion.

Business reason: Current architecture is slowing down every team — average 
deployment time is 45 minutes, 3 P1 incidents per month trace back to 
service dependency fragility.

Known risks: Auth0 contract decision hasn't been made. CI/CD migration 
will touch 15 engineering teams. We don't have a rollback plan for the 
IAM switch.

Kick off the boardroom review.
```

The boardroom skill runs 8 advisor perspectives — Architect, PM, CTO, Finance, Compliance, Customer, CEO lens, Ops. Each advisor takes a position, then rebuts the others. You get a gap analysis you couldn't generate in a single afternoon of solo thinking.

**Step 2 — Build the charter with the gaps already addressed**

Take the boardroom's critical gaps and feed them directly into the charter. This is the key move: don't write a charter and then review it — write it *after* you know where it's weak.

```
/tpm-master-document

Program: Platform Re-architecture
Business problem: [paste from Step 1 or your brief]
Objectives: Reduce deployment time from 45 min to <10 min, cut P1 incidents 
caused by service dependency fragility by 80%, consolidate to ~200 services 
by end of Q3.

Scope: Microservice consolidation, CI/CD migration, IAM replacement.
Out of scope: Application layer refactors, database migrations.

Stakeholders: VP Engineering (sponsor), 15 engineering team leads, 
CISO (for IAM decision), Head of Infrastructure.

Timeline: Q3 target. 20-week execution window starting May 1.
Known risks: [paste the top 3 gaps from Step 1]

Build the program charter.
```

**Step 3 — Turn the stakeholder list into a real alignment plan**

```
/tpm-stakeholder-map

Using the stakeholder list from the charter above.

Known tensions:
- CI/CD team leads have deep investment in Jenkins — deprecation will 
  meet resistance
- CISO owns IAM decision but hasn't been formally included yet
- 3 team leads are skeptical the consolidation scope is achievable in Q3

Build the stakeholder map, RACI, and communication plan.
```

**Step 4 — Imagine the program has already failed**

```
/tpm-premortem

Using the charter and stakeholder map above.
Target completion: September 30.
Most confident items: CI/CD migration plan, team capacity for Q2.
Known dependencies: Auth0/Okta contract decision (unresolved), 
Jenkins deprecation acceptance from 15 team leads.

It's October 15 and the program missed Q3. What happened? 
Run the pre-mortem from 5 perspectives.
```

The premortem output gives you the Top 3 risk actions to take *this week* — before anyone's written a line of code.

---

## When to Level Up

Running these four prompts individually takes about 2–3 hours and works well when you're the only TPM involved and the program is relatively self-contained.

**Upgrade to the full workflow or orchestrator when:**

- The program spans 3 or more engineering teams with independent backlogs
- You need exec sign-off and the stakeholder map requires a comms plan with specific owners per audience
- The boardroom surfaces so many gaps that the charter needs a second pass
- You want to run the dependency map and timeline stress test in parallel with the charter work

**The concrete trigger:** If you find yourself copy-pasting boardroom output into the charter prompt, then copying charter sections into the stakeholder map, then copying both into the premortem — and each handoff takes 15 minutes — you're doing orchestration manually. That's the moment to delegate the whole sequence.

---

## Agent/Multi-Agent Design

For a complex kickoff, invoke `tpm-orchestrator` with Pattern A.

```
tpm-orchestrator
Goal: "Get Platform Re-architecture ready for execution kickoff"
Phase: Initiation
Urgency: Time-sensitive (kickoff in 2 weeks)
```

The orchestrator decomposes this into parallel and sequential workstreams:

```
PARALLEL (run simultaneously)
├── tpm-comms-agent
│   ├── /tpm-stakeholder-map    → stakeholder map + RACI
│   └── Comms plan per audience
│
└── tpm-delivery-agent
    ├── /tpm-dependency-map     → cross-team dependency grid
    └── /tpm-timeline-stress-tester → Q3 timeline confidence score

SEQUENTIAL (after parallel completes)
Step 1: /tpm-boardroom          → gaps + open questions
    ↓ [boardroom gaps feed charter]
Step 2: /tpm-master-document    → Program Charter v1
    ↓ [charter + stakeholder dynamics feed premortem]
Step 3: /tpm-premortem          → Top 3 risk actions
```

**Human decision points** — the orchestrator will pause and ask you to decide:
- Which identity provider (Auth0 vs. Okta) — it can't make a vendor call
- Which team leads to include in the RACI as DRI vs. Informed — needs your org knowledge
- Whether to accept the Q3 timeline or negotiate a phased target — a judgment call with exec implications

Everything else — synthesis, gap identification, document drafting, stakeholder segmentation — the agents handle.

---

## Reusable Assets

| Asset | What it does | When to use it |
|-------|-------------|----------------|
| [`/tpm-boardroom`](../example-agentic-os/4-skills-tools/1-program-strategy/tpm-boardroom.md) | 8-advisor strategy stress test | Start of every new program |
| [`/tpm-master-document`](../example-agentic-os/4-skills-tools/2-program-initiation/tpm-master-document.md) | Full program charter | After boardroom gaps are known |
| [`/tpm-stakeholder-map`](../example-agentic-os/4-skills-tools/2-program-initiation/tpm-stakeholder-map.md) | Influence matrix + RACI + comms plan | After charter stakeholder list is drafted |
| [`/tpm-premortem`](../example-agentic-os/4-skills-tools/2-program-initiation/tpm-premortem.md) | Pre-failure risk surfacing | After charter + stakeholder map complete |
| [`tpm-workflow-program-kickoff`](../example-agentic-os/5-agent-harness/workflows/tpm-workflow-program-kickoff.md) | Full 4-stage kickoff sequence | When running all four skills in order |
| [`tpm-orchestrator`](../example-agentic-os/5-agent-harness/orchestrator/tpm-orchestrator.md) | Parallel + sequential orchestration | When complexity justifies delegation |

**Prompt template — boardroom intake:**
```
/tpm-boardroom

Program: [Name]
What we're doing: [1-2 sentence description]
Business reason: [Why this matters now]
Known risks: [2-3 items you're already worried about]

Kick off the boardroom review.
```

**Prompt template — charter with boardroom gaps:**
```
/tpm-master-document

Program: [Name]
Business problem: [Problem statement]
Objectives: [3-5 measurable outcomes]
Scope: [In scope] / Out of scope: [Explicit exclusions]
Stakeholders: [List with roles]
Timeline: [Target + runway]
Known risks: [Paste boardroom top gaps here]

Build the program charter.
```

---

## Validation

AI is fast at structure. It's unreliable at knowing what it doesn't know. These are the two failure modes to watch for in program kickoff:

**Failure mode 1: Confident dates with no capacity backing**

The charter prompt will produce a milestone plan. If you gave Claude a target date and a list of workstreams, it will produce a coherent-looking schedule. It will not tell you that the CI/CD migration team is already 80% allocated to another program, or that the CISO is on a 3-week sabbatical when the IAM decision is due.

*Check:* Before accepting any milestone dates, validate against actual team headcount and known allocations. Run `/tpm-timeline-stress-tester` with real capacity numbers.

**Failure mode 2: Boardroom gaps that sound rigorous but aren't grounded in your reality**

The boardroom skill generates advisor perspectives based on what you told it. If your program description is vague or optimistic, the advisor critiques will be generic. You'll get "unclear rollback strategy" as a gap even if you already have a rollback plan — and you'll miss the real gap, which is that your rollback plan has never been tested.

*Check:* After the boardroom review, go through each critical gap and ask: "Is this actually a gap in our program, or is this a gap in my prompt?" Cross-reference against what engineers have already raised in Slack or in planning docs.

**Validation checklist:**
- [ ] Does the premortem include at least one risk you hadn't thought of before running it?
- [ ] Are stakeholder roles in the RACI grounded in your actual org chart, not just what you told Claude?
- [ ] Are charter timelines backed by capacity data, not just vibes?
- [ ] Has the charter been reviewed by at least one person who will tell you what's wrong with it?
- [ ] Did the boardroom review change anything in the charter — or did you just confirm what you already believed?

If the last answer is "no, it confirmed what I already believed," run the boardroom again with a more critical framing and a harder set of assumptions.
