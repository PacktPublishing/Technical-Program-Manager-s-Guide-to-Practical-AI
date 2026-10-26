---
name: tpm-fruit-bowl
description: Run a two-round fruit bowl diagnostic on any engineering initiative — program, product launch, migration, or refactor. Detects which of 7 failure patterns (Watermelon, Avocado, Banana, Coconut, Grape Cluster, Tomato, Kiwi) are present using available context. Produces a confidence-rated, auditable diagnostic with human checkpoints where agent reasoning hits its limit. Use whenever someone asks to health-check an initiative, run a watermelon check, assess program status reality, or detect hidden failure patterns. Triggers on "/tpm-fruit-bowl", "is this a watermelon", "check this for failure patterns", "program health check", or any request to assess whether reported status reflects reality.
---
# /tpm-fruit-bowl — Program Fruit Bowl Diagnostic

**Lifecycle Stage:** Execution & Delivery
**Job-to-be-Done:** Detect which of the 7 failure patterns are present in an engineering initiative, surface contradictions between reported and actual state, and produce an auditable finding with confidence levels — not just a label.

---

## Overview

Every program portfolio has fruit hiding in it. A perfectly green dashboard can hide a program that's bleeding internally. This diagnostic runs a structured two-round assessment to surface the truth faster.

The 7 patterns:
- 🥝 **Kiwi** — genuinely healthy, green all the way through (the ideal state)
- 🍉 **Watermelon** — green on the outside, red on the inside
- 🥑 **Avocado** — has a tiny decision window before it rots
- 🍌 **Banana** — decays slowly when you stop paying attention
- 🥥 **Coconut** — requires force to crack open the truth
- 🍇 **Grape Cluster** — pull one problem, the whole bunch comes down
- 🍅 **Tomato** — miscategorized entirely; classified as a quick win, actually systemic

**Output is not a label. It is a defensible diagnostic** with confidence levels, evidence citations, and explicit flags for what cannot be assessed without human input.

---

## Supported Roles and Initiative Types

**Roles:** `tpm` · `pm` · `eng`

**Initiative types:**
- Technical programs (TPM context)
- Product feature launches and bets (PM context)
- Engineering initiatives: migrations, refactors, platform consolidation, tech debt paydown

---

## Workflow Architecture

```
CONTEXT LAYER (autonomous)
MCP agents pull live data before the skill runs
GitHub: artifact existence + commit freshness
Jira/Linear: sprint state, ticket age, blockers
Confluence/Notion: doc coverage, last modified
         │
         ▼
ROUND 1 — Context Audit (rounds/assess.md)
Coverage map, freshness scores, contradictions,
confidence pre-assessment
         │
         ▼
CHECKPOINT 1 (human)
NOT "what exists" — agents already know
IS "is this interpretation correct?"
Human annotates contradictions
Human adds institutional context agents can't read
         │
         ▼
ROUND 2 — Pattern Scoring (rounds/score.md)
Reads: Round 1 output + human annotations + original artifacts
Outputs: fruit rating per pattern, evidence, questions data can't answer
         │
         ▼
CHECKPOINT 2 (human)
Review evidence citations
Correct any misread artifacts
Approve or adjust rating before use
         │
         ▼
FINAL OUTPUT
Auditable diagnostic ready for stakeholder use
Chain of custody: what the agent found, what the human confirmed, what remains unknown
```

---

## Why Two Checkpoints

### Checkpoint 1 — Interpretation, not declaration

The context layer already knows what exists and what doesn't. The human is not assembling context — the human is explaining *why the data looks the way it does*, which the agent cannot infer.

An agent can detect:
- Velocity declined 3 consecutive sprints
- Status report says GREEN
- Risk register last updated 47 days ago

An agent cannot know:
- Two engineers were on PTO (explains velocity drop)
- The risk register owner left the company last month (explains staleness)
- Scope is intentionally vague pending a vendor decision (explains Coconut signal)

Checkpoint 1 extracts institutional knowledge precisely where the agent ran out of signal — and nowhere else.

### Checkpoint 2 — Calibration before use

The model cites artifacts as evidence. Artifacts can be wrong or stale in ways not detectable from the artifact alone. A milestone tracker showing no slippage might be wrong because nobody updated it — the agent reads it as a positive signal. The human calibrates before the diagnostic goes anywhere public.

---

## Mode Selection

Determine mode before doing anything else:

| Mode | When to use | Workflow |
|---|---|---|
| **Single-program** | One initiative named, or user wants depth + auditability | Two rounds + two human checkpoints (current behavior) |
| **Portfolio** | User says "all programs," "the portfolio," "every program," or "scan everything" | One round, no checkpoints, heat map output |

**Default:** single-program if a specific initiative is named. Portfolio if the scope is the whole portfolio.

Do not ask for clarification if the intent is clear from the user's message. If genuinely ambiguous, ask: "Single program or full portfolio scan?"

---

## Before You Start (Single-Program Mode)

1. Confirm role: `tpm`, `pm`, or `eng`
2. Confirm initiative name and one-line description
3. Check what context is already available:
   - MCP-connected tools (GitHub, Jira, Confluence, Linear, Notion)
   - Uploaded artifacts (any format accepted)
   - Markdown files in the current project

If MCP tools are connected, pull live context before running Round 1.
If no MCP tools, work with what is uploaded or pasted.

**Key principle:** If a context category is missing entirely, that absence is itself a finding. Missing dependency map = Grape Cluster signal. Missing decision log = Avocado signal. Missing everything = Coconut confirmed. Do not skip patterns because their input category is absent — the absence IS the signal.

---

## Running the Diagnostic

### Step 1 — Run Round 1

Read `rounds/assess.md`. Run the context audit against all available information. Output the structured coverage map and contradiction list.

**Stop after Round 1 output and surface Checkpoint 1 to the human. Do not proceed to Round 2 until Checkpoint 1 is complete.**

### Step 2 — Checkpoint 1

Present the contradiction list. Ask the human to:
- Confirm or correct each contradiction
- Add institutional context the artifacts don't contain
- Flag anything misread

### Step 3 — Run Round 2

Read `rounds/score.md`. Score all 7 patterns using:
- Round 1 output
- Human annotations from Checkpoint 1
- Original artifacts

Apply confidence levels per `references/confidence-model.md`.
Output the full diagnostic with chain of custody.

### Step 4 — Checkpoint 2

Ask the human to review evidence citations and approve or adjust the rating before the diagnostic is used in any stakeholder context.

---

## Running the Diagnostic (Portfolio Mode)

### Step 1 — Run portfolio scan

Read `rounds/portfolio.md`. Load all data sources in that file and run the one-round assessment across all active programs. Produce the heat map output.

No checkpoints. No Round 2. The output explicitly states what portfolio mode cannot tell you and flags which programs need a single-program deep dive.

### Step 2 — Offer deep dive

After the heat map, ask: "Which program do you want to deep-dive?" If the user names one, re-enter single-program mode for that program using the full two-round + checkpoint workflow.

---

## Reference Files

| File | Contents |
|---|---|
| `references/patterns.md` | Detection criteria for all 7 patterns |
| `references/information-categories.md` | 9 information categories × 3 roles artifact mapping |
| `references/confidence-model.md` | HIGH / MEDIUM / LOW / UNASSESSABLE logic |
| `references/official-frameworks.md` | EVM thresholds, PMBOK 7, PMI Program Standard citations |
| `rounds/assess.md` | Round 1 — context audit (single-program mode) |
| `rounds/score.md` | Round 2 — pattern scoring (single-program mode) |
| `rounds/portfolio.md` | Portfolio mode — one-round heat map across all programs |

---

## Design Principles Applied

- **Delivery First:** Output is a defensible diagnostic ready for action — not a report for its own sake
- **Risk Visibility:** Absence of information is surfaced as a signal, not silently skipped
- **Cross-Team Alignment:** Checkpoint 1 explicitly captures organizational context agents cannot read
- **Context Aware:** Read `domain-context.md` and `personal-context.md` before running

---

## Composes With

- `/tpm-program-health` — Run fruit bowl when health check surface contradictions or anomalies
- `/tpm-risk-identifier` — Use after identifying Watermelon or Tomato to enumerate specific risks
- `/tpm-premortem` — Run Coconut coconut pre-mortem prompt when information is too sparse
- `/tpm-dependency-map` — Run after detecting Grape Cluster to map the hidden interconnections
- `/tpm-escalation-brief` — Draft escalation after Watermelon is confirmed at HIGH confidence
- `/tpm-techdebt` — Use after identifying Tomato to assess whether complexity signals indicate systemic technical debt
