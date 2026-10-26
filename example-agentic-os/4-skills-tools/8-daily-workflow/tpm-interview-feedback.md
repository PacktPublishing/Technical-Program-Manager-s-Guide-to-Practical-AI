---
name: tpm-interview-feedback
description: Use after a TPM candidate interview to structure feedback into a scored debrief with signal/noise analysis and a hire recommendation. Trigger phrases include: "write interview feedback for", "structure my TPM interview notes", "interview debrief for", "should we hire [candidate]", "help me write feedback for a TPM candidate". Takes raw interview notes and returns a calibrated debrief ready for the hiring committee.
---
# /tpm-interview-feedback — TPM Interview Feedback

**Lifecycle Stage:** Daily Workflow | **Job-to-be-Done:** Transform raw interview notes into a structured, scored debrief with signal/noise analysis, competency ratings, and a hire recommendation — ready for the hiring committee without additional cleanup

---

## Overview

Interview feedback written from memory an hour after the interview is unreliable. Feedback written from raw notes without structure is inconsistent across interviewers and hard to compare. This skill takes raw notes — however messy — and structures them into a scored debrief across the core TPM competencies: cross-functional program management, technical depth, stakeholder influence, risk identification, and communication. It separates signal (behavioral evidence) from noise (impressions and gut feel), produces a hire/no-hire recommendation with calibration notes, and formats the output for a debrief meeting.

## When to Use

- After interviewing a TPM candidate at any level (IC to Staff+)
- When preparing for a hiring committee debrief and need to calibrate your notes
- When reviewing another interviewer's feedback for calibration gaps

**When NOT to use:**
- For non-TPM roles — competency framework is TPM-specific
- To write interview prep questions for a candidate — use `/tpm-power-questions` (AI governance mode) or create a custom question set
- To evaluate internal promotions — use a different calibration framework

---

## Interaction Flow

```
Phase 1: Intake           →    Phase 2: Score         →    Phase 3: Debrief
     │                              │                             │
     ▼                              ▼                             ▼
Candidate name + level        Signal vs. noise           Scored debrief
Interview type                Competency ratings         Hire recommendation
Raw notes                     Evidence per signal        Calibration notes
                                                          Debrief agenda
```

### Phase 1 — Intake

Required:
- Candidate name (or initials for privacy)
- Target level (e.g., "L5 TPM", "Senior TPM", "Staff TPM")
- Interview type (e.g., program management, cross-functional leadership, technical depth, behavioral, case study)
- Raw notes (paste as-is — messy is fine)

Optional:
- Interview question(s) asked
- Any context on the role or team this candidate is being evaluated for

### Phase 2 — Score Competencies

Evaluate the notes across five core TPM competencies. For each competency:
- Identify signals (concrete behavioral evidence from the notes)
- Separate impressions (gut reactions without behavioral backing)
- Rate the signal strength: Strong / Sufficient / Weak / No signal

| Competency | What strong signal looks like |
|-----------|-------------------------------|
| **Cross-functional program management** | Structured examples of driving alignment across 3+ teams; clear RACI thinking; milestone ownership |
| **Technical depth** | Engages with technical tradeoffs, not just status tracking; asks the right engineering questions; understands architecture enough to manage risk |
| **Stakeholder influence** | Evidence of changing a decision, managing up, or aligning a skeptic — not just "I communicated well" |
| **Risk identification** | Proactively surfaces risks before they become blockers; has a framework for prioritization, not just reaction |
| **Communication** | Structured answers (situation → action → outcome), clear under pressure, calibrated to audience in the answer itself |

**Level calibration:** Adjust the bar based on target level. Staff TPM is expected to demonstrate influence without authority at org level; L4/L5 is expected to demonstrate program ownership with coaching needs acceptable.

### Phase 3 — Produce Debrief

Generate the structured debrief with recommendation and calibration notes.

---

## Output Format

```markdown
# Interview Feedback: [Candidate Name / Initials]

**Target level:** [Level] | **Interview type:** [Type] | **Date:** [Date]
**Recommendation:** STRONG HIRE / HIRE / NO HIRE / STRONG NO HIRE

---

## Summary (2–3 sentences)

[What stood out most — both positive and negative. What drove the recommendation. Written for a committee member who won't read the full debrief.]

---

## Competency Ratings

| Competency | Signal strength | Rating |
|-----------|----------------|--------|
| Cross-functional program management | Strong / Sufficient / Weak / No signal | ⭐⭐⭐ / ⭐⭐ / ⭐ / — |
| Technical depth | | |
| Stakeholder influence | | |
| Risk identification | | |
| Communication | | |

---

## Signal vs. Noise

**Signals (behavioral evidence):**
- [Competency]: "[Direct quote or paraphrase from notes]" → [What this demonstrates]
- [Competency]: "[...]" → [...]

**Impressions (not counted as signal):**
- "[Impression or gut feel]" — [Why this is noise: no behavioral backing / not specific enough]

---

## Competency Notes

### Cross-functional program management
[2–4 sentences on what the evidence shows — strengths and gaps at this level]

### Technical depth
[...]

### Stakeholder influence
[...]

### Risk identification
[...]

### Communication
[...]

---

## Level Calibration

**For [target level]:** [1–2 sentences on whether the signal meets the bar, is below it, or exceeds it — with specific reference to the level's expected scope]

**Hire risk (if HIRE):** [What would need to be monitored or coached in the first 6 months]
**Bar miss (if NO HIRE):** [The specific gap that drove the recommendation — not a list, one thing]

---

## Suggested Debrief Questions

[Questions to raise in the hiring committee if you want the group to pressure-test your read]

1. [Question — e.g., "Did others see evidence of stakeholder influence? I only heard 'I communicated well.'"]
2. [Question]
```

---

## Common Rationalizations

| Rationalization | Reality |
|----------------|---------|
| "The candidate was nervous — discount the weak signals" | Nervousness explains communication style, not the absence of behavioral examples. A prepared candidate has stories regardless of nerves. |
| "They had great energy — HIRE" | Energy is an impression, not a signal. Which competency is 'great energy' evidence for? |
| "I don't have enough signal on technical depth — skip it" | No signal is a data point. Rate it as "No signal" and flag it for another interviewer, not silence. |
| "They gave a weak answer but recovered well" | Note both — the initial gap and the recovery. Both are signal. |

---

## Verification

- [ ] All five competencies scored (none blank — "No signal" is a valid rating)
- [ ] At least 2 behavioral signals identified (quotes or paraphrases from notes)
- [ ] Impressions separated from signals
- [ ] Recommendation is one of four options: STRONG HIRE / HIRE / NO HIRE / STRONG NO HIRE
- [ ] Level calibration section present with specific reference to target level bar

---

## Design Principles Applied

- **Delivery First:** Debrief ready for committee without additional cleanup — committee gets calibrated feedback, not raw notes
- **Risk Visibility:** Hire risk (for HIRE) and bar miss (for NO HIRE) made explicit — committee walks in knowing what to watch for
