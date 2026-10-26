# Test checklist

Use this to check that a fresh clone works, or to test a chapter before it ships. Run each prompt in a **new conversation**, with only the files listed pasted underneath. Mark the result and add a note when something is off.

Result: ✅ works as described · ⚠️ works with a caveat (say which) · ❌ fails (say how)

## Part 1: prompts in any AI tool

| # | Prompt | Paste with it | A good result | Tester | Result |
|---|---|---|---|---|---|
| 1 | [P1.1](prompts/ch01.md) quick win | `example-agentic-os/3-memory-knowledge/layer3-programs/atlas-master.md` | Five tables, every item with a quoted source sentence | Claude, 2026-10-25 | ✅ |
| 2 | [P3.1 then P3.2](prompts/ch03.md) | `prompts/ch05-payments-consolidation/4-dependencies/inputs/doc-07-payments-core-ledger-v3.md` | P3.2 returns one table and flags what P3.1 missed | Claude, 2026-10-25 | ✅ |
| 3 | [P3.9](prompts/ch03.md) triage agent | the three sample messages in ch03.md | JSON only; message 3 is not turned into a ticket | Claude, 2026-10-25 | ⚠️ msg 3 (venting) is ticketed: expected, see note in ch03.md |
| 4 | [P3.12](prompts/ch03.md) swarm, 4 chats | `prompts/ch05-payments-consolidation/3-assumptions/inputs/scope-document.md` | Four different sets of risks that disagree | Claude, 2026-10-25 | ✅ |
| 5 | [Ch5 kit](prompts/ch05-payments-consolidation/README.md) use cases 1 to 5 | the inputs listed in each prompt file | Findings match the "What the recorded run found" table in the kit README | Claude, 2026-10-25 | ✅ |
| 6 | [P6.1](prompts/ch06.md) persona comms | `stakeholder-personas.md` + `this-week.md` | Three versions with the same facts, different depth and tone | Claude, 2026-10-25 | ✅ |
| 7 | [P6.10](prompts/ch06.md) risk agent | design doc + `templates/risk-mitigation-tracker.md` | Follow-up questions tied to patterns in the tracker | Claude, 2026-10-25 | ✅ |
| 8 | [P7.1](prompts/ch07.md) root-cause engine | `raid-log.md`, Jira export, two weekly logs | Four themes, each with quoted evidence and a recommendation | Claude, 2026-10-25 | ✅ |
| 9 | [8.07 and 8.08](prompts/ch08.md) capacity | `prompts/ch08-tpm-leadership/tests/chapter-8/fixtures/resource/` | Matches `tests/chapter-8/outputs/07` and `08` in substance; no recommendation in 8.08 | Claude, 2026-10-25 | ✅ 8.07 and 8.08 |
| 10 | [8.11 to 8.14](prompts/ch08.md) hiring | `prompts/ch08-tpm-leadership/tests/chapter-8/fixtures/hiring/` | Anonymized candidates only; no ranking in 8.12; every score cites a resume line | Claude, 2026-10-25 | ✅ 8.11 to 8.14 |
| 11 | [8.18 to 8.22](prompts/ch08.md) people | `prompts/ch08-tpm-leadership/tests/chapter-8/fixtures/people/` | Every statement traced to a source; no promotion language drafted | Claude, 2026-10-25 | ✅ |
| 12 | [8.24 to 8.26](prompts/ch08.md) strategic planning | `prompts/ch08-tpm-leadership/tests/chapter-8/fixtures/evolution/` | Matches `tests/chapter-8/outputs/24` to `26` in substance | Claude, 2026-10-25 | ✅ |
| 13 | [P11.1 and P11.2](prompts/ch11.md) | `prompts/ch11-career-kit/brain-dump-sample.md` | One question at a time; the entry marks missing fields "missing" | Claude, 2026-10-25 | ✅ |
| 14 | [P11.5](prompts/ch11.md) resume editor | `master-resume-sample.md` + `job-posting-sample.md` | No new claims; gaps listed separately (for example zero-downtime migrations) | Claude, 2026-10-25 | ✅ |
| 15 | [P11.9](prompts/ch11.md) skeptical interviewer | the sample posting | Quotes your weakest sentence; holds its position when you push back without evidence | Claude, 2026-10-25 | ✅ |
| 16 | [P11.18](prompts/ch11.md) frameworks | `decision-case-george.md` | The three frameworks lean differently, as in Table 11.1 | Claude, 2026-10-25 | ✅ |

## Part 2: Claude Code

| # | Step | A good result | Tester | Result |
|---|---|---|---|---|
| 17 | Clone into an empty folder, `cd example-agentic-os`, `claude`, trust the folder | No errors on start; no hook or settings warnings | Claude, 2026-10-25 | ✅ |
| 18 | `/tpm-program-health SHIELD` | A scored health check citing the Jira, Vanta and Datadog files | Claude, 2026-10-25 | ✅ |
| 19 | `/tpm-workflow-program-kickoff` for a new program | All four stages run in order, with a pause for you between stages | Claude, 2026-10-25 | ✅ |
| 20 | `/start-day-prep` | Runs without connectors, says which sources were missing, writes `1-inputs-triggers/start-day-state.md` | Claude, 2026-10-25 | ✅ |
| 21 | `cd prompts/ch08-tpm-leadership`, `claude`, then the ad hoc run in [8.05](prompts/ch08-tpm-leadership/prompts/8-tpm-leadership/05-adhoc-agent-run.md) | Four 3P reports and one executive report, saved under `portfolio-reports/ad-hoc/` | Claude, 2026-10-25 | ✅ |
| 22 | `bash prompts/ch05-payments-consolidation/run.sh 3` | Writes `3-assumptions/output.new.md`; the quote gate reports how many rows matched | Claude, 2026-10-25 | ✅ full run.sh, all five use cases |

## Test log

### 2026-10-25, fresh clone of `simplify/reader-repo`, model Sonnet

Prompt tests were pasted into a model with no tools, from an empty folder, exactly as a reader would paste them into a chat tool. Claude Code tests ran headless from inside the kit folder.

| Test | Result | Notes |
|---|---|---|
| 8.07 capacity trade-off | ✅ | Every finding cites a fixture; the first finding is that the team charter's own staffing rule fails on day one |
| 8.09 commitment monitor | ✅ | Drift table with source and confidence on every row; a team-wide Slack post is rated Low confidence rather than treated as fact |
| 8.12 shortlisting | ✅ | Scores against the rubric, keeps candidates in the given order, no ranking |
| 8.14 finalist comparison | ✅ | Candidate A / B only; single-interviewer remarks flagged as low confidence instead of used |
| `/tpm-program-health SHIELD` (example OS) | ✅ ⚠️ | Runs with no setup and reads Vanta, Jira, the master doc, RAID log and seed files. Run against the real date it reported 51 to 76 days of stale data; fixed by setting the story date (see the re-run below) |
| 8.05 ad hoc portfolio agent (Ch8 kit) | ✅ | Four 3P reports and one executive report saved in the right folders; portfolio rolls up Red because the P0 program is Red. It caught a label it had invented and asked for edit permission to fix it |

Two non-issues seen during the run: on Windows, a very deep clone folder hits the 260-character path limit (see START_HERE troubleshooting), and git may show files as modified when only line endings differ.

### 2026-10-25, re-run after setting the story dates

| Test | Result | Notes |
|---|---|---|
| `/tpm-program-health SHIELD` (example OS, story date 2026-09-04) | ✅ | Report dated 2026-09-04; the 51-to-76-day data gap is gone. It names the 25-day-old system exports, scores from the current Gmail and Calendar data, and rates SHIELD Red on the story's merits |
| 8.05 ad hoc portfolio agent (Ch8 kit, report date 2026-10-20) | ✅ | Existing reports for that date were kept; new ones saved as `-v2` / `-v3`. Configs untouched. Portfolio Red, 4/4 programs |

**Judgement call to review (Ch8):** Program 3 self-reports Green while its DataDog budget guardrail is breached (+6% against a 5% limit). The first run accepted Green; the re-run scored Yellow by the guardrail, marked the report as a draft and asked the owner to confirm. Decide which behaviour the `program-3p-report` skill should require.

### 2026-10-25, reader walkthrough: fresh clone from GitHub, all 22 items

Cloned from github.com (commit `fe60420`), not from a local copy. Every prompt was copied from its chapter page with its "Try it with" files and pasted into a model with no tools; the Claude Code items ran from inside the cloned folders. About 45 runs, model Sonnet.

**Result: 22 of 22 pass.** Highlights:

- **Ch3 triage agent (P3.9):** correct team and priority for the two real requests. The venting message was ticketed as Medium, because the printed prompt has no rule for non-requests. That is the chapter's lesson (the human approval step in P3.10 catches it); `ch03.md` now says so and offers an optional filter line.
- **Ch11 skeptical interviewer (P11.9):** quoted the weakest sentence, rated it 1/5, and held its position when pushed without new evidence.
- **Ch8 hiring and people prompts:** no ranking, no hire recommendation, no promotion language, no gendered pronouns; style remarks kept out of rubric scores.
- **Ch8 prompts with `[placeholders]`** stopped to ask for values. `ch08.md` now lists the values Liana used for every such prompt.
- **`/start-day-prep`:** all six sub-agents ran with no connectors, fell back to the calendar export and seed files, said which sources were missing, and wrote `start-day-state.md`.
- **Chapter 5 kit (`run.sh`):** 20 runs, all five use cases plus back-scheduling; quote gate 36 of 36; no tool-call artifacts; 8 alignment conflicts, a circular dependency, and the 2-week vs. 11-week legal review identified as what breaks 30 September.

**Testing note for maintainers on Windows:** when calling `claude -p "/some-command"` from Git Bash, set `MSYS_NO_PATHCONV=1`, or Git Bash rewrites the slash command into a file path. This does not affect readers typing commands in Claude Code.
