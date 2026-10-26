# 1 · Program charter from mandate

**Book:** Chapter 5, *Scaffolding Program Infrastructure* → *In Practice: Program Charter from Mandate* (Table 5.1)
**Paste underneath:** [inputs/mandate-email.md](inputs/mandate-email.md), [inputs/parent-okr.md](inputs/parent-okr.md), [inputs/q2-strategy-deck.md](inputs/q2-strategy-deck.md)
**In this repo:** `/tpm-master-document` builds a full living master document. For the book's method (charter plus inference log), use this prompt.

## The prompt

```
[ROLE] Senior TPM drafting a program charter. You have just been handed a
  program by email and have not yet spoken to any stakeholder.

[TASK] From the source material, produce two artifacts:
  1. A draft charter, in our standard section order.
  2. An inference log: every place the source was thin and you
     filled the gap.

[CONTEXT] Attached: VP mandate email, parent OKR, Q2 strategy deck.
  Our standard charter section order is:
    1. Purpose
    2. Background
    3. In scope
    4. Out of scope
    5. Objectives and success metrics
    6. Key milestones
    7. Stakeholders
    8. Decision rights and governance
    9. Dependencies
    10. Known risks
    11. Assumptions

[FORMAT]
  Artifact 1 as markdown under the eleven section headings above.
  Artifact 2 as a table with columns:
  Charter section | What I inferred | What I inferred it from |
  Confidence (High/Med/Low) | Who can confirm this
  After the table, one line: how many inferences, and how many are Low.

[CONSTRAINTS]
- Mark every inference [INFERRED] inside the charter itself.
- Invent no success metric containing a number. Write "target TBD".
- If a section has no support in the source, leave it empty and log
  it. An empty section is more useful to me than a plausible one.
- "What I inferred it from" quotes the source words, or says
  "Nothing in source" and names the default you applied.
- "Who can confirm this" names a person from the source where one
  exists; otherwise the role that would know.
- Do not use knowledge about this company that is not in the source.

[FEEDBACK LOOP] Before drafting, ask your three sharpest questions.
```

## What to do with the output

The charter is the less important artifact. The inference log is your interview agenda for the
week: take every Low-confidence row into a short conversation with the person named in the last
column **before** the charter circulates. The chapter's point is that circulating the charter
first, because it looks finished, is how a wrong scope gets approved.

The recorded run in [output.md](output.md) could not pause for the three questions, so it listed
them first and then drafted. In a chat, answer them before letting it continue.
