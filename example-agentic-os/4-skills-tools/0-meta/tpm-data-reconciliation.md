---
name: tpm-data-reconciliation
description: Cross-source conflict resolver. Runs when pre-flight flags a consistency mismatch or when sources differ by >15%. Explains why each conflict exists, applies the NovaGrid trust hierarchy, and returns a single reconciled view for downstream skills.
---
# /tpm-data-reconciliation — Cross-Source Data Reconciliation

**Lifecycle Stage:** Meta (runs when data sources conflict)
**Job-to-be-Done:** Surface conflicts between Jira, Aha!, Salesforce, and program master docs — explain why each conflict exists and which source to trust

---

## TPM Context

NovaGrid has a structural data problem: Jira/Linear (9 teams on Linear, 6 on Jira), Aha! (milestone SoT for TPMs), and Salesforce (revenue-at-risk) are updated at different cadences, by different people, for different purposes. The same program can show 47% complete in Jira and 34% complete in Aha! — not because one is wrong, but because they measure different things and update at different rates.

Running skills on conflicting data produces outputs that confidently contradict each other. This skill reconciles sources first, so downstream skills operate from a single agreed view.

---

## When to Use / When NOT to Use

**When to use:**
- When pre-flight (`/tpm-preflight`) returns WARN or BLOCK with a cross-program consistency flag
- When Jira/Linear and Aha! differ by >15% on the same milestone's completion percentage
- When program master doc RAG status contradicts Aha! milestone status
- When preparing an executive artifact and two data sources give different answers for the same field

**When NOT to use:**
- When sources differ by <15% and the gap is within expected structural lag (Aha! naturally lags Jira by 5–7 days — this is not a conflict)
- When only one source exists for a program (no reconciliation possible; flag the single-source dependency instead)
- When the conflict is already explained in the program master doc (e.g., "Jira data is stale pending migration") — trust the explanation, proceed

---

## Instructions

Read `domain-context.md` and `3-memory-knowledge/layer1-always/tech-stack.md` before starting.

---

## Interaction Flow

**Step 1 — Intake**

Identify which sources to reconcile:
1. Which program(s)?
2. Which sources conflict? (Jira vs Aha!, Aha! vs master doc, Salesforce vs program health)
3. What is the downstream skill that needs reconciled data?

**Step 2 — Load sources**

Consult `3-memory-knowledge/layer1-always/source-registry.md`:
1. Look up each program in scope in the **Program → Source Mapping** table
2. Identify which source columns are relevant for the conflict being investigated (execution tracker, milestone SoT, revenue source, compliance source)
3. Load those files using the export paths from the **Connected Sources** section
4. Always load the program master doc: `3-memory-knowledge/layer3-programs/[program]-master.md`
5. Do not load sources not listed for the program — irrelevant sources add noise, not signal

**Step 3 — Reconcile**

For each conflict pair identified in Step 1:

**3a. Classify the conflict type:**

| Type | Definition | Resolution approach |
|------|-----------|-------------------|
| **Structural lag** | Update cadence difference (e.g., Jira daily vs Aha! weekly). Delta ≤10% and age gap ≤7 days. | Use fresher source; note lag in output. No TPM action required. |
| **Stale update** | One source not updated in >7 days with no known reason. Delta any size. | Flag as stale. Request TPM update before downstream skill runs. |
| **Real disagreement** | Same data point, same time window, materially different values (>15% delta after accounting for lag). | Do NOT auto-resolve. Surface to TPM as a checkpoint — see below. |

**3b. Apply the trust hierarchy** from the table in this file to determine which source is authoritative for each field type.

**3c. Draft reconciled value** for each conflicted field:
- Assign confidence: **High** (one clear authoritative source), **Medium** (structural lag — fresher source likely correct), **Low** (real disagreement — TPM judgment required)
- Record which source the reconciled value came from

**3d. Flag TPM actions:** For each field with Medium or Low confidence, specify:
- What the TPM should do (e.g., "Ask Yuna Park to update Aha! M3 to 47% to match Jira")
- Or: "No action needed — conflict is within expected lag tolerance. Proceed with Jira as primary."

---

## Checkpoint — Reconciliation Interpretation

After Step 3, before finalizing the reconciled view, surface any **real disagreements** (Low confidence) to the TPM:

```
CHECKPOINT — Reconciliation Interpretation

I found [N] conflict(s) that require your judgment before I can finalize the reconciled view:

Conflict: [Source A] shows [value] vs [Source B] shows [value] for [field] on [program]
  - Delta: [X%] — outside expected structural lag
  - Both sources updated within [timeframe]
  - This may indicate [missed update / measurement difference / genuine slip]

Questions:
1. Is this difference a known lag, or does it signal a real issue?
2. Should I use [Source A] or [Source B] as primary for the downstream skill?

[If you want to proceed without answering: I'll apply the default trust hierarchy and mark
confidence as Low for any contested field. The downstream skill output will be flagged
DRAFT-QUALITY for those fields.]
```

If the TPM does not answer, proceed with the default trust hierarchy and mark contested fields Low confidence.

---

## Output Format

```markdown
# Data Reconciliation Report: [Program(s)]

**Date:** [Date]
**Requested by skill:** [downstream skill that needs clean data]
**Sources checked:** [list]

---

## Conflicts Found

### Conflict 1: [Source A] vs [Source B]

| Field | [Source A] | [Source B] | Delta | Conflict type |
|-------|-----------|-----------|-------|--------------|
| [milestone / epic / % complete / RAG] | [value] | [value] | [+/- N%] | [Structural lag / Stale update / Real disagreement] |

**Why this conflict exists:**
[1–2 sentences: explain the structural reason — e.g. "Aha! is updated weekly by TPM; Jira is updated
daily by engineers. 5–7 day lag is expected. This conflict reflects normal cadence gap, not a real
discrepancy."]

**Trust hierarchy applied:** [Which source to use for downstream skill, and why]
- Use [Source A] for: [what decision / field]
- Use [Source B] for: [what decision / field]

---

## Reconciled View

> This is the authoritative single view to use for downstream skill execution.

| Field | Reconciled value | Source | Confidence | TPM action required |
|-------|-----------------|--------|-----------|-------------------|
| Overall RAG | 🟡 Amber | Master doc (most recent) | High | None |
| Milestone M3 % | 47% | Jira | Medium — Aha! shows 34% (5-day lag) | Ask Yuna to update Aha! |
| Revenue at risk | $2.4M | Salesforce | High | None |

---

## Recommended actions before running downstream skill

- [ ] [Action 1 — e.g. "Ask Yuna Park to update Aha! M3 to 47% to match Jira"]
- [ ] [Action 2 — e.g. "Note in output that Aha! lags by 5 days"]
- [ ] [Or: "No action needed — conflict is within expected lag tolerance. Proceed with Jira as primary."]
```

---

## Trust Hierarchy (NovaGrid default)

| Decision type | Primary source | Fallback |
|--------------|---------------|---------|
| Milestone % complete | Jira/Linear (engineer-updated) | Aha! (5–7 day lag expected) |
| Milestone target dates | Aha! (TPM-owned, milestone SoT) | Program master doc |
| Overall RAG | Program master doc (TPM judgment) | Aha! |
| Revenue at risk | Salesforce (AE-owned) | Program master doc |
| Control completion (SHIELD) | Vanta via Jira | Program master doc |

---

## Key Concepts

- **Structural lag vs real conflict.** Aha! lagging Jira by 5 days is structural — not a conflict. Aha! showing 34% when Jira shows 67% after a week of work is a real conflict requiring TPM action.
- **TPM reconciles weekly.** The reconciliation cadence is intentional — don't auto-merge sources.
- **Trust hierarchy is program-specific.** Linear-tracked programs (NEXUS, ATLAS) have less Jira data; treat Linear export data as equivalent to Jira.
- **Salesforce is sales-owned.** Revenue-at-risk figures reflect AE probability assessments, not TPM program status. Surface conflicts but don't override AE judgment.

---

## Common Rationalizations

| Rationalization | Reality |
|----------------|---------|
| "I'll pick the higher number — it's more likely correct" | Always picking the optimistic number is how Watermelon patterns form. Pick the authoritative source per the trust hierarchy. |
| "I'll skip reconciliation — it's close enough" | >15% delta means skills will disagree. "Close enough" becomes a conflict in the exec update. |
| "I reconciled it — the explanation isn't necessary" | The explanation IS the output. TPMs need to understand the conflict to communicate it upward. |
| "The most recently updated source is right" | Recency doesn't mean accuracy. Jira epics update frequently with less context than a TPM's master doc judgment. |
| "I'll just note it as a caveat" | A caveat without a specific action doesn't get resolved. Specify what to do and who does it. |

---

## Red Flags

Signs this skill was run poorly:

- Conflict type not classified — output just lists two numbers without explaining whether it's structural lag or a real issue
- Confidence set to High on a field where sources disagree by >15%
- Checkpoint skipped for a real disagreement — agent chose a winner without TPM input
- Reconciled view has "TBD" or blank cells — that's not a reconciled view
- Salesforce revenue figure overridden based on Jira data — AE judgment supersedes program data
- Reconciliation report produced but never fed into the downstream skill — the report exists for that handoff, not as a standalone artifact

---

## Verification Checklist

```
- [ ] Every conflict classified as structural lag, stale update, or real disagreement
- [ ] Trust hierarchy applied per field type — not per source wholesale
- [ ] Reconciled view has exactly one value per field — no ambiguity, no TBD
- [ ] Confidence level assigned to every reconciled value (High / Medium / Low)
- [ ] At least one TPM action specified — even if it's "no action needed, proceed"
- [ ] Any Low-confidence field surfaced via the checkpoint before finalizing
- [ ] Reconciled view explicitly handed off to the downstream skill (not left as a standalone doc)
```

---

## Composes With

- `/tpm-preflight` — run pre-flight first; pre-flight triggers this skill when conflicts are found
- `/tpm-program-health` — reconciliation feeds the Dependencies and Schedule dimensions
- `5-agent-harness/sub-agents/portfolio-monitor.md` — portfolio monitor calls this skill when Step 1 flags conflicts

---

## Design Principles Applied
- Risk Visibility: Makes data conflicts visible before they become output errors
- Tool-Connected: Reads Jira, Aha!, Salesforce data directly
- Context Aware: Applies NovaGrid trust hierarchy from domain-context.md
