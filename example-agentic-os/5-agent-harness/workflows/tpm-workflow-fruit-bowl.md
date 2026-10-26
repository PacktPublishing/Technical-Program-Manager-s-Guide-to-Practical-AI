---
name: tpm-workflow-fruit-bowl
description: Run the full fruit bowl diagnostic workflow — one command that routes to either a single-program deep dive (two rounds + checkpoints + escalation/risk/stakeholder outputs) or a portfolio heat map scan across all 7 programs followed by targeted deep dives. Triggers on "/tpm-workflow-fruit-bowl", "run a fruit bowl on [program]", "scan all programs for failure patterns", "fruit bowl workflow", or "check my portfolio for watermelons".
---

# Workflow: Fruit Bowl Diagnostic

**Trigger:** `/tpm-workflow-fruit-bowl`
**Cadence:** On demand — before SteerCo, after a health check surfaces a contradiction, Monday portfolio scan
**Mid-entry:** Yes — start at any stage
**Output:** Pattern diagnostic → Actions → Communication (scaled to mode)

---

## Overview

One command. Two paths. Both end with something actionable.

```
/tpm-workflow-fruit-bowl
        │
        ▼
   MODE SELECTION
        │
        ├─── "one program" / program named ──────────────────────────┐
        │                                                             │
        │    Stage 1: Fruit Bowl — Single-Program                    │
        │    Round 1 (context audit) → Checkpoint 1 →               │
        │    Round 2 (pattern scoring) → Checkpoint 2               │
        │         ↓                                                   │
        │    Stage 2: Actions                                         │
        │    /tpm-escalation-brief  (if Watermelon/Avocado HIGH)     │
        │    /tpm-risk-identifier   (if Grape Cluster/Banana)        │
        │    /tpm-stakeholder-update (always)                        │
        │                                                             │
        └─── "all programs" / "portfolio" ──────────────────────────┐
                                                                     │
             Stage 1: Fruit Bowl — Portfolio Scan                    │
             One-round heat map across all 7 programs               │
                  ↓                                                   │
             Stage 2: Deep-Dive Selection                            │
             Pick 1–2 programs from the heat map                    │
                  ↓                                                   │
             Stage 3: Fruit Bowl — Single-Program (per selection)    │
             Full two-round diagnostic on chosen program(s)         │
                  ↓                                                   │
             Stage 4: Actions                                         │
             Same as single-program path above                       │
```

---

## Step 0 — Mode Selection

**Ask immediately after the workflow is triggered:**

> Single program or full portfolio?
> - **Single program:** name the initiative, paste or point to its artifacts
> - **Portfolio:** scans all 7 NovaGrid programs, then you pick which to deep-dive

If the user names a program directly (e.g., `/tpm-workflow-fruit-bowl SHIELD`), skip the question and enter single-program mode.

If the user says "all," "portfolio," or "everything," skip the question and enter portfolio mode.

---

## Single-Program Path

### Stage 1 — Fruit Bowl Diagnostic

**Skill:** `/tpm-fruit-bowl` (single-program mode)
**Reads:** `4-skills-tools/5-execution-delivery/tpm-fruit-bowl/SKILL.md`

Run the full two-round workflow:
1. Round 1 → coverage map + contradictions → **Checkpoint 1** (human annotates)
2. Round 2 → pattern scoring with confidence levels → **Checkpoint 2** (human approves)

**Key output to carry forward:**
- Primary pattern + confidence level
- Recommended actions table
- Chain of custody

---

### Stage 2 — Actions

Run based on what Stage 1 detected. Skip any stage that isn't triggered.

#### Stage 2a — Escalation Brief
**Skill:** `/tpm-escalation-brief`
**Trigger:** Primary pattern = Watermelon or Avocado at HIGH or MEDIUM confidence

**Inputs:** Primary pattern finding + recommended actions (Stage 1) + stakeholder map from `domain-context.md`

**Output:** Escalation brief ready to send to sponsor or SteerCo

---

#### Stage 2b — Risk Identifier
**Skill:** `/tpm-risk-identifier`
**Trigger:** Primary or secondary pattern = Grape Cluster, Banana, or Tomato at any confidence

**Inputs:** Pattern findings (Stage 1) + existing risk register if available

**Output:** Updated risk register with new entries surfaced by the pattern detection

---

#### Stage 2c — Stakeholder Update
**Skill:** `/tpm-stakeholder-update`
**Trigger:** Always — runs after Stage 1 regardless of pattern

**Inputs:** Diagnostic output (Stage 1) + escalation brief if produced (2a) + risk updates if produced (2b)

**Output:** Stakeholder-segmented update ready to send

---

### Single-Program Complete

**Artifacts produced:**
1. Fruit Bowl Diagnostic — pattern + confidence + chain of custody
2. Escalation Brief *(if Watermelon/Avocado HIGH or MEDIUM)*
3. Updated Risk Register *(if Grape Cluster/Banana/Tomato)*
4. Stakeholder Update — segmented and ready to send

**Time to run:** ~45–60 minutes (including checkpoint wait time)

---

## Portfolio Path

### Stage 1 — Portfolio Scan

**Skill:** `/tpm-fruit-bowl` (portfolio mode)
**Reads:** `4-skills-tools/5-execution-delivery/tpm-fruit-bowl/rounds/portfolio.md`

Load all program master docs + Jira/Aha exports + dependency matrix. Run one-round pattern assessment across all 7 programs. Output the heat map with recommended deep-dive order.

No checkpoints in this stage.

**Key output to carry forward:**
- Heat map table (pattern + confidence per program)
- Recommended deep-dive order
- Top signals per HIGH/MEDIUM program

---

### Stage 2 — Deep-Dive Selection

**Ask the user:**

> The heat map is ready. Which program(s) do you want to deep-dive?
> Recommended: [list HIGH-confidence non-Kiwi programs from heat map, ordered by urgency]
>
> You can pick 1–2. Each deep dive runs the full two-round diagnostic with checkpoints.
> Or say "none" to stop here with the heat map only.

If the user says "none" or "stop here," end the workflow and deliver only the heat map.

---

### Stage 3 — Single-Program Deep Dive(s)

For each program selected in Stage 2, run the full single-program path (Stages 1–2 above).

If 2 programs selected: complete the first fully (including actions) before starting the second.

---

### Portfolio Complete

**Artifacts produced:**
1. Fruit Bowl Portfolio Heat Map — all 7 programs, pattern + confidence
2. Per deep-dive program: full diagnostic + escalation/risk/stakeholder outputs (same as single-program)

**Time to run:** Heat map ~15 minutes · Each deep dive adds ~45–60 minutes

---

## Workflow Rules

- **Never skip Checkpoint 1 or 2 in single-program mode.** The checkpoints are load-bearing — they are where the human's institutional knowledge enters the diagnostic. A diagnostic produced without them is LOW confidence by definition.
- **Never deep-dive more than 2 programs in one session.** More than 2 and quality drops. If the heat map flags 4 programs, schedule additional sessions.
- **Stage 2 actions follow the pattern, not the other way around.** If Stage 1 produces a Kiwi finding, skip 2a and 2b. A stakeholder update that says "program is healthy, here's the evidence" is still worth sending (Stage 2c always runs).
- **Portfolio heat map is not a substitute for a deep dive.** It tells you where to look. The single-program diagnostic tells you what to do.
