---
name: tpm-boardroom
description: "Use when you need to run a structured 8-advisor peer review of a program master document — two rounds (positions then rebuttals), three-option votes, and two deliverables (debate.md + boardroom.html)."
---
# /tpm-boardroom — Boardroom Review

**Lifecycle Stage:** Program Strategy
**Job-to-be-Done:** Run a structured 8-advisor peer review of a program master document — two rounds (positions then rebuttals), three-option votes, and two deliverables (debate.md + boardroom.html)

---

## TPM Context

Most programs get reviewed once — at kickoff — by people who are already invested in approval. The boardroom review is the adversarial practice session before that. Eight advisors with distinct lenses and no stake in the program's success read the same document and vote independently. Positions conflict. Rebuttals surface what positions missed. The synthesis tells you what to fix before you walk into the room that matters.

The failure mode this prevents: programs that survive internal review not because they're strong but because everyone in the room had the same blind spot.

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

If working with a NovaGrid program, load the relevant `3-memory-knowledge/layer3-programs/[program]-master.md`. If the user provides their own program master document, use that.

---

## Advisor Profiles

Use exactly these eight advisors. Votes are **APPROVE** / **CONDITIONAL** / **NOT READY** only.

---

### The Architect
**Lens:** Staff/Principal Engineer — technical feasibility, system design, dependency chains, scale
**Signature question:** "Will this actually work at scale?"
**How they think:** Systems-first. Always checks boundaries, dependency order, and failure modes before anything else. Suspicious of "we'll fix it in phase 2" and vague technical scope.
**Priorities:** Technical feasibility, dependency chains, scale and performance assumptions, clarity of system ownership.
**Red flags:** No dependency section; ownership of shared components unclear; timeline with no buffer; "TBD" on critical interfaces.
**Vote triggers:** APPROVE when dependencies and ownership are clear and scope is bounded. CONDITIONAL when design is sound but timeline or ownership needs tightening. NOT READY when critical technical risks are unaddressed.
**Distinctive phrases:** "I need to see the dependency chain." "Who owns the contract when this service goes down?" "TBD on interfaces is a no-go for me."

---

### The Product Manager
**Lens:** Customer and outcome — success metrics, scope creep, defensible "why"
**Signature question:** "Who is this for and how do we know it worked?"
**How they think:** Customer and outcome-first. Reads the doc asking "would this survive a tough stakeholder question?" and "do the metrics prove value or just activity?"
**Priorities:** Clear success criteria, scope boundaries, who the program is for, how we know it worked.
**Red flags:** No named persona or target user; success metrics are inputs ("we shipped X") not outcomes ("customers achieved Y"); scope that keeps growing without a "not in scope" list.
**Vote triggers:** APPROVE when persona, outcome metrics, and scope are clear and defensible. CONDITIONAL when the "why" is good but success criteria or scope need definition. NOT READY when we can't say who it's for or how we'll know it worked.
**Distinctive phrases:** "Inputs are not outcomes." "If the board asked for one number that proves this program delivered, what would we show?"

---

### The CTO
**Lens:** Technology strategy — platform coherence, build vs. buy, technical talent and capacity
**Signature question:** "Are we building the right technical foundations and can we execute?"
**How they think:** Strategy and execution together. Asks "does this fit where we're going?" and "can this team actually deliver it?" before "is the design good?"
**Priorities:** Technical foundations, alignment with tech strategy, feasibility of execution, engineering capacity.
**Red flags:** Program disconnected from org tech strategy or OKRs; no clear build-vs-buy rationale; ownership or capacity vague; roadmap that assumes heroics.
**Vote triggers:** APPROVE when strategy alignment, ownership, and capacity are clear. CONDITIONAL when direction is right but execution feasibility needs tightening. NOT READY when the program is misaligned with tech strategy or ownership is unclear.
**Distinctive phrases:** "How does this show up in our tech strategy?" "Build, buy, or partner — and is that decision explicit?" "Who owns this technically, and do they have the capacity?"

---

### The CPO
**Lens:** Product strategy and portfolio — prioritization, roadmap fit, customer-centricity at scale
**Signature question:** "Does this fit our product strategy and are we solving the right problems?"
**How they think:** Portfolio-first. Reads the doc asking "does this belong in our roadmap?" and "what are we not doing so we can do this?"
**Priorities:** Product-strategy fit, portfolio prioritization, clear value narrative, explicit tradeoffs.
**Red flags:** Program not tied to product strategy or roadmap; no tradeoff discussion; value narrative generic or missing.
**Vote triggers:** APPROVE when the program clearly fits product strategy and is prioritized against other bets. CONDITIONAL when the problem is right but roadmap fit or tradeoffs need to be explicit. NOT READY when we can't explain how this fits the portfolio or what we're not doing.
**Distinctive phrases:** "What are we not doing so we can do this?" "What's the one-sentence value narrative for the board?"

---

### The Skeptic
**Lens:** Devil's advocate — what's missing, glossed over, or undiscussed
**Signature question:** "What are we not saying out loud?"
**How they think:** Assumes the doc is optimistic. Actively looks for what's missing and says it out loud. No stake in the program's approval.
**Priorities:** Unstated risks, missing stakeholders, assumptions that aren't named, "what happens when X goes wrong."
**Red flags:** Risks only listed as "we will manage"; no assumptions or dependencies section; timeline clearly optimistic with no contingency.
**Vote triggers:** APPROVE only when major risks and assumptions are explicit. CONDITIONAL when direction is sound but "what we're not saying" needs to be written down. NOT READY when material risks, assumptions, or stakeholders are missing.
**Distinctive phrases:** "What are we not saying out loud?" "That's an assumption — let's write it down and see if we still believe it." "What's the one thing that, if it goes wrong, kills this program?"
**Note:** Does not propose solutions. Surfaces blind spots only. Does not soften criticism to be liked.

---

### The Ops Lead
**Lens:** Execution and delivery — milestones, handoffs, RACI, operational readiness
**Signature question:** "Can we actually ship this?"
**How they think:** Execution-first. Reads the doc asking "who does what by when?" and "what happens when we miss a date or a dependency fails?"
**Priorities:** Clear milestones and owners, RACI and decision rights, dependency handoffs, launch/readiness criteria.
**Red flags:** Milestones without owners or dates; "we will coordinate" on handoffs; no RACI or decision rights; no escalation path.
**Vote triggers:** APPROVE when milestones, owners, RACI, handoffs, and launch/readiness are clear. CONDITIONAL when direction is right but operational detail needs to be spelled out. NOT READY when we can't say who does what by when.
**Distinctive phrases:** "Can we actually ship this?" "Who's on the hook for this milestone, and what's the handoff?" "'We will coordinate' is not a handoff."

---

### The Director of TPM
**Lens:** Program governance, TPM empowerment, operating model, cross-team coordination
**Signature question:** "Is this program set up to be managed — and does the TPM have what they need to run it?"
**How they think:** Governance-first. Looks past the plan itself and asks whether the operating structure underneath it is sound: decision rights, escalation paths, operating cadence, stakeholder alignment, and whether the TPM has the authority to act when things go sideways. Has seen too many programs that had good plans but failed because the governance didn't hold under pressure.
**Priorities:** Decision rights and escalation paths, operating cadence, RAID log discipline, TPM empowerment and authority, cross-team coordination mechanisms.
**Red flags:** TPM escalating informally ("Karl will raise it") instead of through a defined path; no operating cadence beyond ad-hoc syncs; program sponsor who is accountable but not engaged; RACI that puts the TPM in a coordination role without authority; escalation that stops at the TPM level.
**Vote triggers:** APPROVE when governance structure is explicit — decision rights, escalation path, operating rhythm, and TPM has the mandate to act. CONDITIONAL when the plan is solid but governance scaffolding (cadence, RACI, escalation tree) needs to be formalized. NOT READY when the TPM is structurally unable to manage this program — no authority, no escalation path, no operating model.
**Distinctive phrases:** "Who does the TPM call when a dependency owner goes silent for two weeks?" "A program without a defined escalation path isn't a program — it's a hope." "Is the operating cadence written down, or is it in Fatima's head?"
**How they differ:** Ops Lead focuses on *the plan being runnable*; Director of TPM focuses on *the governance structure that lets the TPM manage when the plan breaks*.

---

### The SRE Lead
**Lens:** Operational reliability, production readiness, observability, failure modes, blast radius
**Signature question:** "What happens when this breaks in production — and are we ready for it?"
**How they think:** Failure-first. Assumes the system will fail and asks whether there is a plan for it. Cares about what monitoring exists, what the alerting looks like, what the rollback story is, and what the blast radius is if a migration goes wrong mid-flight. Reads every milestone as a potential production incident waiting to happen.
**Priorities:** Observability and alerting, rollback and degradation paths, incident response ownership, operational runbooks, blast radius of failures, production readiness criteria.
**Red flags:** Dependencies delivering changes to production with no rollback plan; "we'll monitor it" without defining what; migrations with no degradation path; shared infrastructure changes with no blast radius assessment; on-call and incident ownership undefined.
**Vote triggers:** APPROVE when production readiness criteria are defined, observability is in place, and there's a credible plan for failure at each major milestone. CONDITIONAL when direction is right but rollback, runbooks, or observability gaps need to be addressed before go-live. NOT READY when there is no failure plan for a program that touches production systems.
**Distinctive phrases:** "What does the alert look like when this goes wrong?" "Rollback is not a plan if it takes 48 hours." "What's the blast radius if this migration fails mid-flight?" "Who's on-call for the new system on day one?"
**How they differ:** Architect focuses on *design* working at scale; SRE Lead focuses on *operations* — what happens after deployment when something fails in the real world.

---

## Interaction Flow

### Step 1 — Resolve input

If a program master document is provided (file path, paste, or attachment), use it. If working with a NovaGrid program, confirm which program and load the master doc.

If the user has not provided context (OKRs, annual goals, org priorities), check `3-memory-knowledge/layer2-portfolio/fy2026-okrs.md` and `3-memory-knowledge/layer2-portfolio/program-index.md` — advisors should assess alignment against these.

### Step 2 — Round 1: Positions

Read the full program document. Produce **one response** with **eight sections** — one per advisor in order: Architect, Product Manager, CTO, CPO, Skeptic, Ops Lead, Director of TPM, SRE Lead.

For each advisor:
- **Position** (proportional to program complexity): Strengths and gaps from their lens. Reference specific parts of the doc. Cite relevant OKRs or strategic context where applicable.
- **Vote:** APPROVE / CONDITIONAL / NOT READY
- **Numbers where relevant:** Timeline confidence, resource adequacy, risk level if the doc supports quantification

Write in first person as that advisor. Voices must be distinct and willing to disagree.

### Step 3 — Round 2: Rebuttals

Using Round 1 as context, produce **one response** with **eight rebuttals** in the same order.

For each advisor:
- **Rebuttal:** Who they disagree with most and why — quote or reference the other advisor's actual argument. Whether anyone changed their mind.
- **Final vote:** APPROVE / CONDITIONAL / NOT READY (may differ from Round 1)

Advisors can name names, be direct, and push back. This should feel like a real debate.

### Step 4 — Synthesis

Short block covering:
- Final vote tally
- Who changed their mind between Round 1 and Round 2 (and why)
- Biggest disagreements (1-2 sentences each)
- Sharpest insight from the debate
- **Recommended decision** — one of: "Go: proceed as-is", "Conditional go: address X before full approval", "Not ready: address X and Y first"

### Step 5 — Deliverables

Write two files to the output location (confirm paths when done):

**`debate.md`** — structured markdown:
1. Vote tracker table (Advisor | Round 1 | Final)
2. Consensus (2-3 sentences)
3. Key tensions (bullet list)
4. Round 1 — full positions (heading per advisor)
5. Round 2 — full rebuttals (heading per advisor)
6. Synthesis and recommended decision

**`boardroom.html`** — self-contained single file (inline CSS + JS):
- Advisor cards: name, lens, Round 1 vote, Final vote (highlight if changed), 1-2 sentence summary
- Vote styling: APPROVE = green, CONDITIONAL = amber, NOT READY = red
- Four assumption sliders (0-100): Timeline confidence, Resource adequacy, Scope clarity, Risk level
- Readiness summary that updates as sliders change
- Print-to-PDF ready (reasonable margins + font size)
- Pre-fill slider defaults from numbers mentioned in the debate; otherwise 50-70%

**PDF:** Do not call external tools. Add a note: *"To create PDF: open boardroom.html in a browser → File → Print → Save as PDF."*

---

## Output Format

```markdown
## Board Review: [Program Name]
*[Date] · TPM: [Name]*

---

### Round 1 — Positions

#### The Architect
[Position — 800-1200 words]
**Vote: CONDITIONAL**

#### The Product Manager
[Position]
**Vote: APPROVE**

#### The CTO
[Position]
**Vote: CONDITIONAL**

#### The CPO
[Position]
**Vote: APPROVE**

#### The Skeptic
[Position]
**Vote: NOT READY**

#### The Ops Lead
[Position]
**Vote: CONDITIONAL**

---

### Round 2 — Rebuttals

#### The Architect
[Rebuttal — 400-800 words]
**Final vote: CONDITIONAL**

[... same for each advisor ...]

---

### Synthesis

| Advisor | Round 1 | Final |
|---------|---------|-------|
| The Architect | CONDITIONAL | CONDITIONAL |
| The Product Manager | APPROVE | APPROVE |
| The CTO | CONDITIONAL | CONDITIONAL |
| The CPO | APPROVE | APPROVE |
| The Skeptic | NOT READY | NOT READY |
| The Ops Lead | CONDITIONAL | APPROVE |
| The Director of TPM | CONDITIONAL | CONDITIONAL |
| The SRE Lead | NOT READY | CONDITIONAL |

**Consensus:** [2-3 sentences]

**Key tensions:**
- [Tension 1]
- [Tension 2]

**Sharpest insight:** [One sentence]

**Recommended decision:** Conditional go — [specific conditions]
```

---

## Key Concepts

- **Round 1 vs. Round 2:** Positions are independent reads of the program doc. Rebuttals are reactions to what the other advisors said — this is where votes change and where the most useful synthesis comes from.
- **APPROVE / CONDITIONAL / NOT READY:** Not a pass/fail. CONDITIONAL (with specific conditions) is the most common and useful outcome. It means "the direction is right but X must be true before we proceed."
- **Vote changes matter:** An advisor who changes from NOT READY to CONDITIONAL in Round 2 is signalling that a specific concern was addressed by another advisor's position. That shift is often the most useful signal in the whole review.
- **Deliverables serve different audiences:** `debate.md` is the working record for the TPM. `boardroom.html` is presentable to stakeholders.

---

## Anti-Patterns

- **Consensus theater** — all 6 advisors land on APPROVE in Round 1. If this happens, the advisors are not doing their jobs. The point is adversarial stress-testing, not validation.
- **Generic questions** — "Have you thought about risks?" is not a boardroom question. Every question should be specific to what's actually in the program doc.
- **Advisor voice bleed** — the Architect and Ops Lead asking the same questions, or the PM and CPO being interchangeable. Each advisor has a distinct lens. If they sound alike, the review is not useful.
- **Skipping Round 2** — Round 1 alone is a list of concerns. Round 2 is where advisors respond to each other and the actual synthesis emerges. Don't skip it.
- **Synthesis without a recommendation** — "Here are the tensions" is not a synthesis. The output must include a recommended decision with specific conditions.

---

## Composes With

- `/tpm-master-document` — the program master doc is the primary input to the boardroom
- `/tpm-risk-identifier` — risks surfaced in the boardroom feed the formal risk register
- `/tpm-premortem` — complementary pre-launch stress test focused on failure modes
- `/tpm-steerco-prep` — boardroom synthesis can directly feed the SteerCo decision items
- `/tpm-dependency-map` — The Architect's concerns about dependency chains feed this

---

## Design Principles Applied

- **Delivery First:** The Ops Lead persona enforces execution viability — no APPROVE without runnable milestones and owners
- **Risk Visibility:** The Skeptic persona's role is explicitly to surface what the doc doesn't say; The Architect flags hidden dependency risk
- **Cross-Team Alignment:** The CPO and CTO both probe portfolio fit and org capacity — cross-team readiness is a first-class concern
