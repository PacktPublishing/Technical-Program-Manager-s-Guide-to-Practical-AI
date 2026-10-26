# Chapter 8 kit: AI for TPM Leadership

Tested end to end on a synthetic portfolio on 2026-10-20. The prompt index with the book's section names is [../ch08.md](../ch08.md).

> **People data comes first.** Resumes, interview feedback, 1:1 notes and promotion packets are personal data. New York City requires bias audits for automated hiring tools, and the EU AI Act classifies recruitment AI as high-risk. Sometimes anonymized resumes are enough; sometimes candidates must consent. When in doubt, ask Legal or HR. Label people "Candidate A", "Candidate B" or "TPM-R" before you upload anything, and keep generated output private. Formal steps such as performance improvement plans belong with your HRBP, not with AI. Agents that report on programs should never become a tool for evaluating people.


Skills, agent and prompts from **Chapter 8, AI for TPM Leadership**, built as files and tested end to end against a synthetic four-program infrastructure portfolio (Platform Modernization).

This kit has three things:

1. **Working versions** of every code section in the chapter: the two skills, their configs, the agent, and 23 prompts (05 to 26, plus 04b, the executive review deck).
2. **Test outputs** from running each one, on 2026-10-20.
3. **What had to change** for each section to work, with a real unified diff per section: [`docs/chapter-8/CHANGES.md`](docs/chapter-8/CHANGES.md).

> **These examples are imaginary.** The org structure, portfolio, programs, people, candidates, tickets, metrics and dates were all generated for testing. They don't describe a real company. Connected tools (Jira, Confluence, Slack, Drive, DataDog) are stand-in files, so the skills run without MCP connections. To get useful output for your own situation, replace the input files. See [Adapt it to your situation](#adapt-it-to-your-situation).

**The story is set on 2026-10-20.** `CLAUDE.md` tells the skills to treat that date as today, so the reports read the way the chapter describes. When you switch to your own data, delete that rule and use your real report date.

## Results at a glance

- **26 code sections tested:** 25 needed changes and 1 worked as written (25, re-plan decision). Of the 26 runs, 24 passed fully and 2 passed with limits (19: unanswered clarifying questions; 24: thin month of reports).
- **Biggest fixes:**
  - **Agent frontmatter:** `----` isn't valid frontmatter, so the agent's name and description were ignored.
  - **Portfolio config:** the portfolio skill needed one, and the chapter didn't define it.
  - **Run modes:** the skill said ad hoc runs "stop and ask", while the agent said "log and continue".
  - **"Ask three questions" prompts:** they needed "and wait for my answers".
  - **Missing formats:** seven prompts defined a format for only one of their two artifacts.
- **Caught in testing:** three times the model reached beyond the sources a prompt allowed. The skills' pre-save checks and the "cite each statement" rules exposed all three.

Full per-test table: [`tests/chapter-8/RUNS.md`](tests/chapter-8/RUNS.md).

## Repository structure

```
├── CLAUDE.md                         # Claude Code config: registers skills, agent, prompts
├── domain-context.md                 # Portfolio context (aligned with the 3P skill's RAG definitions)
├── agents/
│   └── portfolio-reporting-agent.md  # Runs 3P per program, then the portfolio report
├── skills/8-tpm-leadership/
│   ├── program-3p-report/            # SKILL.md, templates/, configs/program-1..4.md
│   └── portfolio-executive-report/   # SKILL.md, templates/, configs/platform-modernization.md
├── prompts/8-tpm-leadership/         # 23 prompts (04b, 05–26), one file each
├── portfolio-reports/                # Skill outputs
│   ├── 2026-09-24 … 2026-10-15/      #   scheduled 3P reports (history used as input)
│   ├── ad-hoc/2026-10-20/            #   ad hoc 3P reports and Program 1 deep dive
│   └── executive/                    #   portfolio executive reports (scheduled and ad hoc)
├── tests/chapter-8/
│   ├── RUNS.md                       # Test index: inputs, outputs, result per prompt
│   ├── fixtures/                     # Synthetic sources (Jira/Confluence/Slack stand-ins, hiring, people, …)
│   └── outputs/                      # Outputs for prompts 07–26 and the T01/T03 tests
└── docs/chapter-8/
    └── CHANGES.md                    # Required changes and diffs per code section
```

## Chapter sections → files

| Chapter section | Fixed file | Test output |
|---|---|---|
| Portfolio Health: 3P skill and config | `skills/8-tpm-leadership/program-3p-report/` | `portfolio-reports/ad-hoc/2026-10-20/` |
| Portfolio executive skill | `skills/8-tpm-leadership/portfolio-executive-report/` | `portfolio-reports/executive/` |
| Agent and ad hoc run | `agents/portfolio-reporting-agent.md`, `prompts/…/05` | `tests/chapter-8/outputs/T03-…` |
| Program deep dive | `prompts/…/06` | `portfolio-reports/ad-hoc/2026-10-20/program-1-deep-dive-…` |
| Effective Resource Management | `prompts/…/07–09` | `tests/chapter-8/outputs/07–09` |
| Opportunity (Socratic) | `prompts/…/10` | `outputs/10` |
| Hiring | `prompts/…/11–14` | `outputs/11–14` |
| Onboarding | `prompts/…/15–17` | `outputs/15–17` |
| Performance and growing talent | `prompts/…/18–20` | `outputs/18–20` |
| Calibration and promotion | `prompts/…/21–22` | `outputs/21–22` |
| Program scaffolding | `prompts/…/23` | `outputs/23` |
| Continuous strategic planning | `prompts/…/24–26` | `outputs/24–26` |

## Run it yourself

1. Open this folder (`prompts/ch08-tpm-leadership/`) in Claude Code (`cd prompts/ch08-tpm-leadership` then `claude`). `CLAUDE.md` registers the skills.
2. Try the ad hoc portfolio run:
   ```
   Run /portfolio-reporting-agent as an ad hoc run.
   - Run type: Ad hoc
   - Report date: 2026-10-20
   - Programs: all programs in skills/8-tpm-leadership/program-3p-report/configs/
   ```
3. To use real data, replace the `tests/chapter-8/fixtures/sources/…` paths in each `configs/program-N.md` with your Jira, Confluence and Slack URLs, and connect those tools.

**For Claude.ai:**
- Zip each skill folder and upload it through Customize > Skills.
- Keep `configs/` in a connected location (for example, Drive). An uploaded skill is frozen, but the configs change every cycle.

## Adapt it to your situation

The outputs here are only as good as their inputs, and every input describes the imaginary Platform Modernization portfolio. For better output, update these files to match your own org, programs, people and tools before you run anything. Generated reports in `portfolio-reports/` and `tests/chapter-8/outputs/` are examples only; delete them or regenerate them from your own inputs.

### Portfolio reporting (skills and agent)

| File | What to change |
|---|---|
| `domain-context.md` | Your org structure, tools, stakeholders, RAG thresholds and escalation rules |
| `skills/8-tpm-leadership/program-3p-report/configs/program-*.md` | One config per program: name, owner, audience, cadence, last report date, and links to the charter, dependency file, Jira, Slack, Confluence and other tools. Add or remove files to match your number of programs. |
| `skills/8-tpm-leadership/portfolio-executive-report/configs/platform-modernization.md` | Rename it for your portfolio. Fill in company big bets, program priority, OKRs and the executive decision log. |
| `skills/8-tpm-leadership/program-3p-report/SKILL.md` | Health definitions, escalation rules and the reports folder, if yours differ |
| `skills/8-tpm-leadership/portfolio-executive-report/SKILL.md` | Portfolio health rules and the config/reports paths, if you rename the portfolio |
| `agents/portfolio-reporting-agent.md` | The config folder and portfolio config name |
| `tests/chapter-8/fixtures/sources/` | Test stand-ins only. Point the program configs at your real Jira, Confluence and Slack instead, and connect those tools. |

### Leadership prompts

Each prompt in `prompts/8-tpm-leadership/` has `[placeholders]`. Fill them in, and replace the matching fixture with your own material:

| Prompts | Replace these example inputs (`tests/chapter-8/fixtures/…`) |
|---|---|
| 07–08 Capacity trade-off and options | `resource/allocation-map.md`, `resource/team-charter.md`, `resource/new-program-dr.md` |
| 09 Commitment monitor | `commitments/commitments.md`; planning-docs, issue-tracker and channels become your connected sources |
| 10 Socratic proposal | `opportunity/q4-plan.md`, `opportunity/reliability-report.md`, plus your portfolio report, company priorities and allocation map |
| 11–14 Hiring | `hiring/org-structure.md`, `role-domains.md`, `leveling-senior-tpm.md`, `success-capabilities.md`, `jd-template.md`, `rubric.md`, `candidate-pool.md`, `question-bank.md`, `panel-notes.md`. Put your own answers to the model's clarifying questions in `hm-answers.md`. |
| 15–17 Onboarding | `onboarding/onboarding-doc.md`, `link-check.md`, `channel-activity.md`, `org-chart.md` |
| 18–22 Performance, growth and promotion | `people/tpm-r-1on1-file.md`, `tpm-r-idp.md`, `leveling-staff-tpm.md`, `promotion-packet-tpm-r.md`, `hard-conversation-notes.md` |
| 23 Program brief update agent | `evolution/brief-schema.md`, `evolution/briefs/*.md` |
| 24–25 Change triage and re-plan | `evolution/okr-progress.md`, plus your portfolio reports and decision log |
| 26 Decision reflection | `evolution/leader-decision-log.md` |

Anonymize hiring and people data before you use it (for example "Candidate A" or "TPM-R"), and check your company's AI, HR and legal policies first.

## Caveats

- **How the tests were run:** first in one Claude Code session on 2026-10-20, then again on 2026-10-25 from a fresh download of the repository, with each prompt pasted into a fresh model (see [TEST-CHECKLIST.md](../../TEST-CHECKLIST.md)). The results held. These aren't automated evals: your runs will differ in wording.
- **People data:** the people-leadership fixtures are anonymized ("TPM-R", "Candidate A/B"). Check your company's AI and HR policies before using these prompts with real people data.
