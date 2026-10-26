# 2 · The alignment gap detector

**Book:** Chapter 5, *Aligning Stakeholders from the Start* → *In Practice: The Alignment Gap Detector* (Table 5.2)
**Paste underneath:** all nine files in [inputs/](inputs/), each under its file name as a heading
**In this repo:** `/tpm-alignment-gap-detector` is the standing agent built from this prompt. It adds a coverage check and the hedge register, and runs on any set of notes you point it at.

## The prompt

```
[ROLE] You reconcile conflicting accounts. You are not a summarizer.

[TASK] From these nine sets of stakeholder notes, find every place
  where two or more people state or imply expectations that cannot
  both be true.

[CONTEXT] Domains, in priority order: scope, timeline and sequencing,
  ownership and decision rights, definition of "done." A conflict
  counts even if the two never discussed the same topic.
  The notes were taken by the program TPM in week one of a payments
  platform consolidation. Text in quotation marks is verbatim; the
  rest is the TPM's paraphrase. The notes vary in length and quality,
  and length says nothing about importance.

[FORMAT] Table: Conflict | Stakeholder A + verbatim quote |
  Stakeholder B + verbatim quote | Why both cannot hold | Domain
  Order the rows by domain priority, then by how much of the program
  each conflict would change.
  Below the table, a section headed "Positions no one else
  addressed".

[CONSTRAINTS]
- Every row carries a verbatim quote from each side. No quote, no row.
  Quote only text that appears in quotation marks in the notes.
- Do not resolve conflicts or say who is right.
- Preserve hedges exactly. Never harden "probably" into a commitment.
- Below the table, list separately every position stated by exactly
  one person that nobody else addressed. Quote it, name who said it,
  and say in one line why it may matter. Do not rank these below the
  table rows; they are a separate list, not a lesser one.
- Do not treat a difference in emphasis as a conflict. Two positions
  conflict only if both cannot be true at the same time.
```

## What to do with the output

Take each row back to the two people it names, separately, before the steering committee. Ask
whether the quote is accurate and whether the tension looks real to them. Some rows collapse;
the ones that survive reach the committee already agreed as open questions.

Read the "Positions no one else addressed" list twice. The chapter's example, Anika Roth's
data residency point, is one sentence in the shortest set of notes and changes the program.
It has nobody to be reconciled against, so it goes to the person best placed to judge it
(here Legal and the Data Protection Officer) before the committee meets.
