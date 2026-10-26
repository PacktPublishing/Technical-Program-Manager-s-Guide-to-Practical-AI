---
name: mine-meeting-ais
description: Use when you have Zoom transcripts, meeting AI summaries, or auto-generated meeting notes and need to extract structured outputs from them. Trigger phrases include: "mine this transcript", "extract action items from this meeting", "process meeting AI", "what came out of this meeting", "summarize Zoom transcript". Returns structured action items, decisions, open questions, and blocker flags — ready to feed into other skills.
---
# /mine-meeting-ais — Meeting Transcript Miner

**Lifecycle Stage:** Daily Workflow | **Job-to-be-Done:** Extract structured action items, decisions, open questions, and blockers from Zoom transcripts or meeting AI summaries — turning raw meeting output into program state

---

## Overview

Meeting AIs generate transcripts and auto-summaries that are long, repetitive, and unstructured. Reading them costs more time than the meeting itself. This skill ingests a transcript or AI summary and returns five structured outputs: action items (with owners and due dates), decisions made, open questions, blockers surfaced, and a one-paragraph executive summary. Output is formatted to feed directly into `/tpm-extract-blockers`, `/tpm-decision-record`, and `/tpm-meeting-notes`.

## When to Use

- After any meeting with a Zoom AI transcript or auto-summary
- As a subagent inside `start-day-prep` to process overnight transcripts
- When a colleague shares a transcript and asks for the key takeaways
- Before updating program state after a cross-team sync

**When NOT to use:**
- To write polished meeting notes for distribution — use `/tpm-meeting-notes` (which can consume the output of this skill)
- To log a formal decision with rationale — use `/tpm-decision-record`
- To process a text document that is not a meeting transcript — use `/tpm-prd-engdoc-analyze`

---

## Interaction Flow

```
Paste transcript or AI summary
       |
       v
Identify: participants, meeting type, program context
       |
       v
Extract: action items, decisions, open questions, blockers
       |
       v
Generate: executive summary (1 paragraph)
       |
       v
Return structured output + downstream skill suggestions
```

**Step 1 — Intake**

Accept any of:
- Full Zoom transcript (raw or AI-cleaned)
- Zoom AI auto-summary
- Pasted meeting notes in any format

Also accept: meeting name, date, and program (if not inferable from the content).

**Step 2 — Identify Context**

From the transcript, infer:
- **Participants** — names mentioned or listed in header
- **Meeting type** — standup / design review / stakeholder sync / retrospective / escalation / 1:1 / other
- **Program** — match keywords to `program-index.md`

**Step 3 — Extract**

Extract exactly these five categories. Do not invent items not present in the transcript.

| Category | Extraction Rule |
|----------|----------------|
| Action Items | Explicit commitments: "I'll", "we'll", "you'll", "will be done by", "will send" |
| Decisions | Statements of conclusion: "we decided", "agreed to", "going with", "confirmed" |
| Open Questions | Unresolved items: "we need to figure out", "TBD", "who owns", unanswered questions |
| Blockers | Explicit blockers: "blocked on", "waiting on", "can't proceed until", "dependency on" |
| Exec Summary | 1 paragraph, 3–5 sentences, plain prose — what happened, what was decided, what's next |

**Step 4 — Return**

Return the full structured output. Flag downstream skills where applicable.

---

## Output Format

```markdown
# Meeting Output: [Meeting Name]

**Date:** [Date] | **Program:** [Program or "General"] | **Meeting type:** [Type]
**Participants:** [Name1, Name2, ...]

---

## Executive Summary

[1 paragraph, 3–5 sentences. What was discussed, what was decided, and what happens next.]

---

## Action Items

| # | Action | Owner | Due | Source (quote) |
|---|--------|-------|-----|----------------|
| 1 | [Action description] | [Name or TBD] | [Date or TBD] | "[Direct quote from transcript]" |

---

## Decisions Made

| # | Decision | Context | Decision-maker |
|---|----------|---------|----------------|
| 1 | [What was decided] | [Brief context] | [Name or "Group"] |

---

## Open Questions

| # | Question | Assigned to | Target resolution |
|---|----------|-------------|------------------|
| 1 | [Unresolved question] | [Name or TBD] | [Date or "Next meeting"] |

---

## Blockers Surfaced

| # | Blocker | Program | Owner | Blocking what |
|---|---------|---------|-------|---------------|
| 1 | [Blocker description] | [Program] | [Name or TBD] | [What it's blocking] |

---

## Suggested Next Steps

- **Action items with no owner** → assign before EOD or route to `/add-task`
- **Blockers with no owner** → escalate via `/tpm-extract-blockers`
- **Decisions made** → log formally via `/tpm-decision-record` if consequential
- **Meeting notes for distribution** → run `/tpm-meeting-notes` using this output as input
```

---

## Common Rationalizations

| Rationalization | Reality |
|----------------|---------|
| "The AI summary already covered it" | AI summaries miss owner attribution and conflate decisions with discussion. This skill structures the output so it can be acted on. |
| "I'll read the full transcript later" | You won't. If it's not extracted now, action items disappear into the transcript archive. |
| "There were no blockers mentioned" | Blockers in meetings are often framed as "we're waiting on" or "we need X from Y team" — not the word "blocked." Extract those too. |

---

## Verification

- [ ] All five sections present (Exec Summary, Action Items, Decisions, Open Questions, Blockers)
- [ ] Action items have an owner field (even if "TBD")
- [ ] Source quotes included for action items — no invented commitments
- [ ] Exec summary is exactly 1 paragraph, 3–5 sentences
- [ ] Downstream skill suggestions shown

---

## Design Principles Applied

- **Delivery First:** Structured output ready to feed directly into extract-blockers, decision-record, and meeting-notes
- **Risk Visibility:** Blockers and unowned action items explicitly flagged
- **Context Aware:** Program tagged from loaded portfolio context
