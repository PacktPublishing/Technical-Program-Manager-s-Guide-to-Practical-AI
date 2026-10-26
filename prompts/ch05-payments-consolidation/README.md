# Chapter 5 - AI for Initiation & Planning: the complete kit

Chapter 5 prints each prompt trimmed and says the complete versions, sample inputs and the
outputs they produced live here. This folder is that material, for all five Act 1 use cases,
on the chapter's one running scenario: a payments platform consolidation.
Start with [scenario.md](scenario.md) for the company, people, systems and dates.

Run the use cases in order. Each one produces an artifact the next one uses, and use case 5
reads all of them.

| # | Use case | Prompt | Paste underneath it | Recorded output | Book |
|---|----------|--------|---------------------|-----------------|------|
| 1 | Charter from mandate | [1-charter/prompt.md](1-charter/prompt.md) | [1-charter/inputs/](1-charter/inputs/) (3 files) | [output.md](1-charter/output.md) | Table 5.1 |
| 2 | Alignment gap detector | [2-alignment/prompt.md](2-alignment/prompt.md) | [2-alignment/inputs/](2-alignment/inputs/) (9 interview notes) | [output.md](2-alignment/output.md) | Table 5.2 |
| 3 | Assumption extractor | [3-assumptions/prompt.md](3-assumptions/prompt.md) | [scope-document.md](3-assumptions/inputs/scope-document.md) | [output.md](3-assumptions/output.md) | Table 5.3 |
| 4 | Dependency synthesis | [stage 1](4-dependencies/prompt-stage1-extract.md), [stage 2](4-dependencies/prompt-stage2-synthesize.md), then [stage 3: milestones](4-dependencies/prompt-stage3-milestones.md) | [4-dependencies/inputs/](4-dependencies/inputs/) (11 design docs + ownership map) | [stage 1](4-dependencies/output-stage1/), [output.md](4-dependencies/output.md), [output-milestones.md](4-dependencies/output-milestones.md) | Table 5.4 |
| 5 | Persona-swarm pre-mortem | [four lens prompts](5-premortem/README.md) | Outputs of 1–4, the milestone skeleton + [architecture review notes](4-dependencies/architecture-review-notes.md) | [output-1…4](5-premortem/) | Table 5.5 |

## How to run it

**In a chat tool:** open the prompt file, copy the code block, paste it into a new conversation,
then paste each input file underneath under its file name. For use case 4, run stage 1 once
per design document, paste all eleven results into stage 2, then run stage 3 on the validated map.

**With Claude Code installed** (optional; needs Git Bash on Windows), from the repo root:

```bash
bash prompts/ch05-payments-consolidation/run.sh        # all five, about 30 minutes
bash prompts/ch05-payments-consolidation/run.sh 3      # one use case
```

Your results are written as `*.new.md` next to the recorded outputs, so you can compare the two.

## What the recorded run found, against the book

The inputs were written so that everything the chapter prints can be found in them. A real
run finds it in its own words, and finds other things too. That difference is the lesson:
**every output is a draft for you to validate, not a result.**

| # | The book shows | This recorded run |
|---|----------------|-------------------|
| 1 | 11 inferences, 4 Low confidence | 7 inferences, 2 Low; empty sections (Out of scope, decision rights) logged separately. Same method, different count. |
| 2 | 7 conflicts; Anika Roth's data residency point in its own list | 8 conflicts, including all three in Table 5.2. Anika's residency point is in the "no one else addressed" list. Two entries in that list quote the TPM's paraphrase rather than the speaker: the kind of slip the validation step exists to catch. |
| 3 | 35 rows, 4 rejected at the quote gate (the "mobile team" row) | 44 rows, all five of Table 5.3 among them. Row 17 catches the document contradicting itself (a two-week legal review against the eleven weeks in Appendix A). All 44 quotes passed the gate: this run invented nothing. The gate still has to run every time, because you only know that after checking. |
| 4 | Aliases for payments-core, ledger-api, entitlements-svc; 3 unowned, 2 conflicting, 1 circular, 1 possible alias | The alias table matches Table 5.4 (payments-core in docs 2, 4, 7, 9, 11; ledger-api in 2, 3, 7; entitlements in 4, 9). All three unowned systems found, alongside infrastructure noise (event bus, secrets manager) you would prune. The ledger-api batch-versus-synchronous conflict found; the token-lifetime conflict (doc 4 versus doc 6) missed, because stage 1 flattened doc 6's detail. The loop found, plus a second loop built on an edge no document states. Both the miss and the invented edge are what the [architecture review](4-dependencies/architecture-review-notes.md) is for. |
| 4c | Back-scheduling: the float drops from ten weeks to one once the real eleven-week legal review is used | The run used every duration in the artifacts, including the Q2 planning cycle, and came back with negative float. Same conclusion: the date does not fit the plan. See [the stage 3 note](4-dependencies/prompt-stage3-milestones.md). |
| 5 | 17 narratives; the SRE's "cutover with no way back" | 18 narratives (5 SRE, 5 security, 4 staff engineer, 4 product). The SRE ranks "the cutover with no rollback" second, behind the ledger-api conflict it traces to the review's "to be confirmed". Anika's residency point returns through two lenses. SRE and staff engineer both lead with the ledger-api conflict, so deduplicate before the session. |

## Where the example OS's agents fit

Two of the five use cases became standing agents in the [example agentic OS](../../example-agentic-os/README.md).
They run on your own program's notes and documents rather than on this sample:

- `/tpm-alignment-gap-detector` — use case 2, with a coverage check and a hedge register
- `/tpm-assumption-extractor` — use case 3, with OPEN → VALIDATED / BROKEN tracking

`/tpm-premortem` runs the use case 5 lenses on a program in the example OS. `/tpm-master-document` and
`/tpm-dependency-map` cover related ground but not the book's inference log or multi-document
synthesis; for those, use the prompts here.

## Reviewing this kit

The scenario, names and sample documents are fictional and were written for this kit.
