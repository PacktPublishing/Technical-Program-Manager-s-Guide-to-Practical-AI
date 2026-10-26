# 3 · The assumption extractor

**Book:** Chapter 5, *Scoping What You Don't Know Yet* → *In Practice: The Assumption Extractor* (Table 5.3)
**Paste underneath:** [inputs/scope-document.md](inputs/scope-document.md)
**In this repo:** `/tpm-assumption-extractor` is the standing agent built from this prompt. It tracks each assumption's state (OPEN → VALIDATED or BROKEN) and cross-checks the highest-risk ones against the program's other documents.

## The prompt

```
[ROLE] A skeptical reviewer reading this scope document
  adversarially, with no stake in it being approved.

[TASK] Extract every claim the document treats as settled without
  stating evidence for it.

[CONTEXT] Categories: capacity, sequencing, definitions, external
  parties, technical.
  The document was approved by the steering committee last week.
  Smooth approval is a reason to read it more carefully, not less.

[FORMAT] Table: Verbatim sentence | What it assumes | Category |
  If this is wrong, what breaks | Blast radius (High/Med/Low)
  Number the rows. Sort by blast radius, High first.
  After the table: the row count, and the count per category.

[CONSTRAINTS]
- Column one must be an exact quote, character for character. If you
  cannot produce the quote, do not produce the row. Not negotiable.
- Do not extract assumptions about topics the document never
  mentions. Silence is not an assumption.
- One assumption per row. A sentence that assumes two things gets
  two rows with the same quote.
- Where the document contradicts itself (for example a history
  section that undercuts a plan), say so in "If this is wrong".
- Aim for coverage. Thirty rows is a normal result here.
```

## The validation step: the quote gate

Every row must quote a sentence that is actually in the document. Check each one before the log
goes anywhere. With the recorded output:

```bash
python book/ch5-payments-consolidation/3-assumptions/check-quotes.py \
  book/ch5-payments-consolidation/3-assumptions/output.md
```

The script prints each row's quote as FOUND or NOT FOUND in the scope document. In a chat tool,
do the same by searching the document for each quote. Discard every NOT FOUND row: the chapter's
example is a row about "the mobile team", in a document that never mentions a mobile team.

Rows that survive become the assumption log. Give each an owner and a validation date, and
schedule validation conversations for the top ten by blast radius before kickoff. Re-sort the
blast radius column yourself: the model cannot know which slips your organization survives.
