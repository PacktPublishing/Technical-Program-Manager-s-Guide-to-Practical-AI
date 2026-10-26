# Chapter 8 — Prompt test results, required changes and diffs

Run on 2026-10-20 in Claude Code against the four-program Platform Modernization test portfolio.

- **Originals and raw diffs:** in Liana's working repository; the diffs below are complete
- **Fixed versions:** `skills/8-tpm-leadership/`, `agents/`, `prompts/8-tpm-leadership/`
- **Test index:** `tests/chapter-8/RUNS.md`

**Legend:**
- **Required:** the prompt fails or behaves wrongly without the change.
- **Recommended:** it works, but better with the change.

## Cross-cutting changes

1. **"Ask your three sharpest questions" (11–14, 19):** add "and wait for my answers". Without it the model asks and then answers in the same turn. In scheduled or non-interactive runs, supply the answers up front.
2. **Placeholders (`[location]`, `[config folder]`, …):** resolve them before running, especially inside skills, which can't resolve them at run time.
3. **"Attached" / "Here is":** in Claude Code, give file paths. In Claude.ai, upload the files. Every artifact needs a defined format; seven prompts defined only Artifact 2.
4. **Two health definitions:** the chapter has one in the 3P skill and another in Program Scaffolding. `domain-context.md` was aligned to the 3P skill (see the diff below).
5. **Sources outside the prompt:** the model reached beyond the listed sources twice in testing (the charter in 06, the leader's decision log in 25), and once derived dates no source stated (03/T03). The pre-save checks in the skills caught the date case. For the free-form prompts, a "cite each statement" rule is what exposed the problem.

## Configuration changes

### CLAUDE.md

This diff is against the source playbook repo. This repo ships its own standalone `CLAUDE.md`.

```diff
diff --git a/CLAUDE.md b/CLAUDE.md
index 6e6fd1f..0eca1d9 100644
--- a/CLAUDE.md
+++ b/CLAUDE.md
@@ -19,11 +19,17 @@ Before running skills, create these context files in the repo root:
 - `/tpm-stakeholder-update` → `skills/5-execution-delivery/tpm-stakeholder-update.md`
 - `/tpm-power-questions` → `skills/5-execution-delivery/tpm-power-questions.md`
 
+### Stage 8 — TPM Leadership (Portfolio reporting)
+- `/program-3p-report` → `skills/8-tpm-leadership/program-3p-report/SKILL.md` (program configs in `configs/`)
+- `/portfolio-executive-report` → `skills/8-tpm-leadership/portfolio-executive-report/SKILL.md` (portfolio config in `configs/`)
+- Leadership prompts (resource, opportunity, people, planning) → `prompts/8-tpm-leadership/`
+
 ## Workflows
 - `/tpm-workflow-execution-health` → `workflows/tpm-workflow-execution-health.md`
 
 ## Agents
 - `tpm-comms-agent` → `agents/tpm-comms-agent.md`
+- `portfolio-reporting-agent` → `agents/portfolio-reporting-agent.md` (runs `/program-3p-report` per program, then `/portfolio-executive-report`)
 
 ## Design Principles
```

### domain-context.md
```diff
--- domain-context.md.before
+++ domain-context.md
@@ -55,15 +55,18 @@
 
 ## RAG thresholds
 
-- **🟢 Green:** all milestones are at Medium or High confidence, with no external blockers and no unmitigated risks.
-- **🟡 Yellow:** any milestone is at Low confidence, or an external dependency has been blocked for over 5 business days, or a milestone slipped by up to 2 weeks.
-- **🔴 Red:** a leadership-committed milestone will miss without a decision, a slip is over 2 weeks with no re-baseline, or the program has been Yellow for 3 or more consecutive reports.
+Same definitions as `skills/8-tpm-leadership/program-3p-report/SKILL.md`. That skill is authoritative; keep the two in sync.
+
+- **🟢 Green:** on track, no unmitigated risks.
+- **🟡 Yellow:** a milestone is at risk or a risk is unmitigated, but it's recoverable.
+- **🔴 Red:** a milestone will be missed, or a blocker needs outside help.
+- **Portfolio Red:** a Red program that supports a company big bet. Any other Red or Yellow program makes the portfolio Yellow.
 - **Missing data scores Yellow**, never Green.
 - **Trend is required on every report:** ↑ improving, → stable, ↓ deteriorating.
 
 ## Escalation rules
 
-- **2 consecutive Yellow reports:** an explicit ask to VP Engineering with an owner and due date (as in Program 1, 2026-10-15).
+- **Escalate if:** the program is Red, Yellow twice in a row, has an external blocker, needs a decision above the owner, or has a committed date at risk. Each escalation carries an explicit ask with an owner and due date (as in Program 1, 2026-10-15).
 - **External blocker on a committed milestone:** name the blocking team, the date the block started, the milestone at risk and the specific ask.
 - **Shared blockers across programs** (e.g. the Security Eng queue): escalate once at portfolio level, not separately per program.
```

## 00 — Folder structure

**Test result:** ✅ Used by all portfolio runs (T01–T04).

**Changes:**

- **Required:** the chapter's tree has nowhere for the portfolio skill, its config, the agent, or the reports. The agent's "every [program-name].md in [config folder]" would also pick up the portfolio config if the two shared a folder. The fixed tree gives each skill its own `configs/` and adds `portfolio-reports/` (scheduled, `ad-hoc/`, `executive/`).
- **Recommended (Claude.ai):** a zipped skill is frozen once uploaded, but configs change every cycle ("update the last report date"). Keep `configs/` in a connected location (Drive, repo), as the agent section of the chapter already says. In Claude Code the repo folders work as is.

```diff
--- chapter/00-folder-structure.md
+++ docs/chapter-8/fixed-folder-structure.md
@@ -1,7 +1,24 @@
-program-3p-report/
-├── SKILL.md
-└── configs/
-    ├── program-1.md
-    ├── program-2.md
-    ├── program-3.md
-    └── program-4.md
+skills/8-tpm-leadership/
+├── program-3p-report/
+│   ├── SKILL.md
+│   ├── templates/
+│   │   └── program-config-template.md
+│   └── configs/
+│       ├── program-1.md
+│       ├── program-2.md
+│       ├── program-3.md
+│       └── program-4.md
+└── portfolio-executive-report/
+    ├── SKILL.md
+    ├── templates/
+    │   └── portfolio-config-template.md
+    └── configs/
+        └── platform-modernization.md
+agents/
+└── portfolio-reporting-agent.md
+portfolio-reports/
+├── [YYYY-MM-DD]/[program-name]-3p-[YYYY-MM-DD].md
+├── ad-hoc/[YYYY-MM-DD]/[program-name]-3p-[YYYY-MM-DD]-adhoc.md
+└── executive/
+    ├── platform-modernization-exec-[YYYY-MM-DD].md
+    └── ad-hoc/platform-modernization-exec-[YYYY-MM-DD]-adhoc.md
```

## 01 — Program config template

**Test result:** ✅ 4 configs filled; negative test (T01) detects 17 placeholders.

**Changes:**

- **Required:** added `Config file name`. The skill's file names use `[program-name]`, but "Program 1" isn't a usable slug.
- **Required:** said that a local path is allowed instead of a URL. Without it, the skill can't be tested without MCP connections.
- **Recommended:** say that `[...]` placeholders trigger stop or skip, and write "None" for unused Other tools. Otherwise an empty Other tools section reads as an unfilled placeholder.

```diff
--- chapter/01-program-config-template.md
+++ skills/8-tpm-leadership/program-3p-report/templates/program-config-template.md
@@ -1,9 +1,11 @@
 # Program configuration
 
-Fill in every field before running the 3P report skill.
+Fill in every field before running the 3P report skill. Any field left as [...] makes the run stop (ad hoc) or skip (scheduled).
+Use a URL for connected tools, or a local file path when testing without a connection.
 
 ## Program
 Program name: [program name]
+Config file name: [program-name] (used in report file names, e.g. program-1)
 Program owner: [owner name, role]
 Portfolio: [portfolio name]
 Date of the last report: [YYYY-MM-DD]
@@ -33,3 +35,4 @@
 ## Other tools
 [tool name]: [workspace, project, or folder name and URL]
 [tool name]: [workspace, project, or folder name and URL]
+(Write "None" if the program uses no other tools.)
```

## 02 — program-3p-report SKILL.md

**Test result:** ✅ 4 ad hoc reports for 2026-10-20 (T03), plus a -v2 on re-run (T04). ⚠️ The pre-save check caught two derived dates in the Program 4 ask; they were replaced with source-backed dates.

**Changes:**

- **Required:** filled `[config folder]` and `[reports folder]` with real paths. Placeholders inside a skill can't be resolved at run time.
- **Required:** "Please add every tool from all programs". Added an *Other tools* source rule (DataDog, migration tracker, procurement calendar, flow inventory): metrics only, status still from Jira.
- **Required:** gave the previous report a file pattern (`[program-name]-3p-*`, scheduled only) and a no-previous-report rule. Otherwise the first run can't apply "Yellow twice in a row", and stray files in the folder (e.g. `portfolio-index-*.md`) get read as reports.
- **Required:** an ad hoc run called by the agent can't "stop and ask" mid-loop. Added a `Needs input — …` return and a "Draft — owner confirmation needed" mark. The agent asks once at the end.
- **Required:** the format header was missing Portfolio, Audience and trend, which the chapter's own example report includes. Added a Milestone table, Ask/owner/by-when per escalation, and a "Saved as" line, to match the example.
- **Required:** defined the ad hoc filename (`…-adhoc.md`) and that ad hoc runs never change the config.

```diff
--- chapter/02-program-3p-report-SKILL.md
+++ skills/8-tpm-leadership/program-3p-report/SKILL.md
@@ -1,6 +1,6 @@
 ---
 name: program-3p-report
-description: Use when producing a 3P (Progress, Plans, Problems) status report for a single program from its program charter, dependencies and connected sources such as Jira, Slack, and Confluence.
+description: Use when producing a 3P (Progress, Plans, Problems) status report for a single program from its program config, charter, dependencies and connected sources such as Jira, Slack, Confluence, and DataDog.
 ---
 [ROLE] Staff TPM drafting a program status report for portfolio leadership.
 
@@ -8,38 +8,43 @@
 
 [CONTEXT]
 Inputs:
-- Program name and its config file ([program-name].md from [config folder]).
+- Program name and its config file ([program-name].md from skills/8-tpm-leadership/program-3p-report/configs/). [program-name] is the config file name without .md (e.g. program-1).
 - Run type (Scheduled or Ad hoc) and report date.
-- Previous report: the latest scheduled 3P report for this program before the report date, from [reports folder].
+- Previous report: the latest scheduled 3P report for this program before the report date, from portfolio-reports/[YYYY-MM-DD]/[program-name]-3p-*.md. Ignore ad-hoc reports and other files. If none exists, say "No previous report" and do not apply the "Yellow twice in a row" rule.
 
-Sources:
+Sources (reach each through its connected tool; if the config gives a local file path instead of a URL, read the file):
 - Charter (required): open from the config link.
-- Jira: status changes, completions, blockers, open risks since last report.
-- Confluence: scope, milestone, or date changes.
+- Jira: status changes, completions, blockers, open risks since the last report date.
+- Confluence: scope, milestone, or date changes; decision log; milestone plan.
 - Slack: decisions and escalations. Context only; confirm in Jira or Confluence.
-- Dependencies: check each tracking link.
+- Dependencies: check each tracking link in the dependency file.
+- Other tools listed in the config (e.g. DataDog dashboards, migration trackers, procurement calendar, network inventory): evidence for metrics and progress only. Status and dates still come from Jira.
+- A source listed in the config that cannot be opened goes under "Missing" with the reason.
 
 Definitions:
 - Health: Green = on track, no unmitigated risks. Yellow = milestone at risk or risk unmitigated, recoverable. Red = milestone will be missed or blocker needs outside help.
+- Trend vs previous report: ↑ improving / → stable / ↓ deteriorating.
 - Risk = future event with an owner and mitigation. Past events are problems.
-- Escalate if: Red, Yellow twice in a row, external blocker, decision above owner, or committed date at risk.
+- Escalate if: Red, Yellow twice in a row (this report and the previous scheduled report), external blocker, decision above owner, or committed date at risk.
 
 [FORMAT]
-Header: Program · Owner · Health · Last updated
-Progress: milestones done, deliverables, changes
-Plans: next goals, upcoming milestones, date confidence (High/Med/Low)
-Problems: risks (owner, mitigation), blocked dependencies, escalations
-Sources and gaps: used, missing, unverified, conflicts
+Header: Program · Owner · Health (with trend and consecutive count) · Last updated
+Second line: Portfolio · Audience (from config)
+Progress: milestones done, deliverables, changes (cite ticket or decision-log entry)
+Plans: next goals; upcoming milestones as a table Milestone | Date | Confidence (High/Med/Low)
+Problems: risks as a table Risk | Owner | Mitigation (with due date); blocked dependencies (owner, blocked since); escalations (each with an explicit Ask, owner, by when)
+Sources and gaps: used, missing, unverified, conflicts (and which source won)
+Last line: "Saved as [path]."
 
-Save to [reports folder]/[YYYY-MM-DD]/[program-name]-3p-[YYYY-MM-DD].md.
-Ad hoc runs: [reports folder]/ad-hoc/[YYYY-MM-DD]/, filename ends in -adhoc.
+Save to portfolio-reports/[YYYY-MM-DD]/[program-name]-3p-[YYYY-MM-DD].md.
+Ad hoc runs: portfolio-reports/ad-hoc/[YYYY-MM-DD]/[program-name]-3p-[YYYY-MM-DD]-adhoc.md.
 
 [CONSTRAINTS]
 - Use only the charter and config-listed sources. One program per run.
-- If an input is missing, unclear, or the config has unfilled placeholders, or the charter is inaccessible: ad hoc runs stop and ask; scheduled runs return "Skipped — [reason]."
+- If an input is missing, unclear, or the config has unfilled placeholders ([...]), or the charter is inaccessible: ad hoc runs stop and ask (when called by the reporting agent, return "Needs input — [question]" instead, so the agent can ask once at the end); scheduled runs return "Skipped — [reason]."
 - Conflicts: Jira for status and dates, charter and Confluence for scope. Note the conflict.
 - Never invent a date, number, owner, or status. Mark gaps "Unverified" and name the missing source. A gap is more useful than a guess.
-- Never overwrite. Ad hoc runs ask; scheduled runs save -v2.
+- Never overwrite. Ad hoc runs ask (when called by the reporting agent, save -v2); scheduled runs save -v2.
 - One page.
-- Before saving, check claims and health against the definitions. Ad hoc runs ask the owner to confirm unverified items; scheduled runs mark the report "Draft — owner review needed."
-- After saving a scheduled report, remind the owner to update the last report date in the config.
+- Before saving, check claims and health against the definitions. Ad hoc runs ask the owner to confirm unverified items (when called by the reporting agent, save marked "Draft — owner confirmation needed" and return the questions); scheduled runs mark the report "Draft — owner review needed."
+- After saving a scheduled report, remind the owner to update the last report date in the config. Ad hoc runs never change the config.
```

## 03 — portfolio-executive-report SKILL.md

**Test result:** ✅ Scheduled 2026-10-15 (T02) and ad hoc 2026-10-20 (T03). D-03 removed the headcount option; D-04 closed Program 1's ask but not Program 4's (P1 priority).

**Changes:**

- **Required:** removed the stray `"` after [ROLE].
- **Required:** the format line `Top issue Executive Attention:` merged two items. They're split into an Executive attention table (listed first, per "Executive attention first") and the program table.
- **Required:** changed the save extension from `.doc` to `.md`. The skill writes markdown, and a `.doc` file would be unreadable.
- **Required:** a **portfolio config template** didn't exist in the chapter. Created `templates/portfolio-config-template.md` (big bets, priority, OKRs, decision log) and `configs/platform-modernization.md`.
- **Required:** the "latest 3P report … from [reports folder]/[YYYY-MM-DD]/" lookup fails when a program reported on another date or ran ad hoc. Added the ad hoc folder, a fallback to the latest scheduled report, and -v2 handling.
- **Required:** use only decision-log entries dated on or before the report date. Without this, re-running 2026-10-15 on 2026-10-20 would apply D-04 (2026-10-16) retroactively.
- **Required:** ad hoc path now includes the date in the name, consistent with the 3P skill. Added an inline citation format so the traceability rule can be checked.
- **Recommended:** if a decision rules out an ask's option (D-03 vs "add two engineers"), show the decision instead of the ask.

```diff
--- chapter/03-portfolio-executive-report-SKILL.md
+++ skills/8-tpm-leadership/portfolio-executive-report/SKILL.md
@@ -1,18 +1,19 @@
 ---
 name: portfolio-executive-report
-description: Use when rolling the latest program 3P reports into an executive portfolio report, adding portfolio-level context.
+description: Use when rolling the latest program 3P reports into an executive portfolio report, adding portfolio-level context such as big bets, program priority, OKRs, and the executive decision log.
 ---
 [ROLE] TPM leader drafting a portfolio report for executive leadership.
-"
 
 [TASK] Roll the latest program 3P reports into one executive view. Add portfolio context, surface cross-program risks and shared dependencies, and flag what needs executive attention and why now.
 
 [CONTEXT]
 Inputs:
 - Run type (Scheduled or Ad hoc) and report date.
-- Latest 3P report for each program, from [reports folder]/[YYYY-MM-DD]/.
-- Portfolio config ([portfolio-name].md): company big bets, program priority, company OKRs, executive decision log.
-- Previous portfolio report: the latest scheduled report before the report date, for trends.
+- Latest 3P report for each program in the portfolio config, on or before the report date:
+  Scheduled: portfolio-reports/[YYYY-MM-DD]/[program-name]-3p-[YYYY-MM-DD].md (use -v2 if present).
+  Ad hoc: portfolio-reports/ad-hoc/[YYYY-MM-DD]/[program-name]-3p-[YYYY-MM-DD]-adhoc.md; if a program has no ad hoc report for that date, use its latest scheduled report and say so.
+- Portfolio config (skills/8-tpm-leadership/portfolio-executive-report/configs/[portfolio-name].md): company big bets, program priority, company OKRs, executive decision log.
+- Previous portfolio report: the latest scheduled report in portfolio-reports/executive/ before the report date, for trends. If none exists, say "No previous portfolio report" and take trends from the program reports.
 
 Definitions:
 - Take program health, risks, and escalations as reported. Do not re-assess.
@@ -23,23 +24,26 @@
 - Weigh issues by program priority and their impact on big bets and OKRs.
 - Cross-program risk = a risk or dependency that appears in more than one program report.
 - Bottleneck = a team or org that several programs depend on at once, based on the dependencies in the program reports.
-- Check open asks against the decision log. Don't re-raise anything already decided.
+- Check open asks against the decision log. Don't re-raise anything already decided; if a decision conflicts with an ask, show the decision instead of the ask.
+- Use only decision-log entries dated on or before the report date.
 
 [FORMAT]
 Header: Portfolio · Health · Date · Programs reported (x/n)
 Summary: 2–3 sentences on the state of the big bets and OKRs, and the main ask
-Table: Program | Priority | Owner | Health | Trend | Next milestone | Top issue Executive Attention: ask, why now, impact on big bet or OKR, by when
+Executive attention: ask, why now, impact on big bet or OKR, by when (table)
+Program table: Program | Priority | Owner | Health | Trend | Next milestone | Top issue
 Cross-program risks and bottlenecks
 Gaps: missing reports, unverified items, conflicts
+Last line: "Saved as [path]."
 
-Save to [portfolio reports folder]/[portfolio-name]-exec-[YYYY-MM-DD].doc.
-Ad hoc runs: [portfolio reports folder]/ad-hoc/, filename ends in -adhoc.
+Save to portfolio-reports/executive/[portfolio-name]-exec-[YYYY-MM-DD].md.
+Ad hoc runs: portfolio-reports/executive/ad-hoc/[portfolio-name]-exec-[YYYY-MM-DD]-adhoc.md.
 
 [CONSTRAINTS]
-- Every statement traces to a program report or the portfolio config. Add nothing else.
+- Every statement traces to a program report or the portfolio config. Add nothing else. Cite the source after each statement, e.g. (P1 3P 2026-10-15) or (Portfolio config, Decision log D-03).
 - If the portfolio config is missing: ad hoc runs stop and ask; scheduled runs return "Skipped — missing portfolio config."
 - If a program report is missing, flag the program by name and continue.
 - Carry "Unverified" tags through.
-- Never overwrite. Ad hoc runs ask; scheduled runs save -v2.
+- Never overwrite. Ad hoc runs ask (when called by the reporting agent, save -v2); scheduled runs save -v2.
 - Executive attention first. One page.
 - Before saving, trace every health status, risk, and ask to its source, and confirm no ask duplicates a logged decision.
```

## 04 — portfolio-reporting-agent

**Test result:** ✅ Ran ad hoc for all 4 programs (T03) and for Program 1 only (T04, -v2).

**Changes:**

- **Required:** the frontmatter used `----` (4 dashes), which isn't valid YAML frontmatter, so name and description are ignored. Changed to `---`.
- **Required:** added a `Programs` input. The chapter's deep-dive prompt runs the agent "for Program 1", but the agent only knew "every config". A subset run now skips the portfolio report unless asked.
- **Required:** split the program and portfolio config folders (see 00).
- **Required:** in ad hoc runs, collect the skills' `Needs input` questions and ask once at the end. This resolves the conflict between "Log failures and continue" and the skill's "ad hoc runs stop and ask".
- **Required:** fixed the typo "given;ask".
- **Recommended (Claude.ai):** this is a scheduled task, not an uploaded skill, so the frontmatter is for repo use only.

```diff
--- chapter/04-portfolio-reporting-agent.md
+++ agents/portfolio-reporting-agent.md
@@ -1,24 +1,25 @@
-----
+---
 name: portfolio-reporting-agent
-description: Runs the 3P report for every program, then the portfolio executive report. Weekly on a schedule, or ad hoc for a given date.
-----
+description: Runs the 3P report for every program (or the programs given), then the portfolio executive report. Weekly on a schedule, or ad hoc for a given date.
+---
 [ROLE] TPM leader's reporting agent.
 
 [TASK] Run program-3p-report for each program, then portfolio-executive-report
 on the results:
 1. For each program config, run program-3p-report with the program name, its config file, the run type, and the report date. One program at a time. Log failures and continue.
-2. Run portfolio-executive-report with that cycle's 3P reports, the portfolio config, and the latest scheduled portfolio report before the report date. Skip if no program report succeeded.
-3. Return a run summary: reports saved, programs skipped and why, and gaps that need owner review.
+2. Run portfolio-executive-report with that cycle's 3P reports, the portfolio config, and the latest scheduled portfolio report before the report date. Skip if no program report succeeded, or if the run covers only some programs (a subset run produces program reports only, unless asked for the portfolio report).
+3. Return a run summary: reports saved, programs skipped and why, and gaps that need owner review. In ad hoc runs, list every "Needs input" question from step 1 together, once, at the end.
 
 [CONTEXT]
 - Run type: Scheduled or Ad hoc.
-- Report date: today for scheduled runs. For ad hoc runs, the date given;ask if missing.
-- Program configs: every [program-name].md in [config folder].
-- Portfolio config: [portfolio-name].md from [config folder].
+- Report date: today for scheduled runs. For ad hoc runs, the date given; ask if missing.
+- Programs: all programs, or the program names given in the request.
+- Program configs: every program-*.md in skills/8-tpm-leadership/program-3p-report/configs/.
+- Portfolio config: platform-modernization.md from skills/8-tpm-leadership/portfolio-executive-report/configs/.
 
 [FORMAT]
-- Scheduled: [reports folder]/[YYYY-MM-DD]/ and [portfolio reports folder]/.
-- Ad hoc: [reports folder]/ad-hoc/[YYYY-MM-DD]/ and [portfolio reports folder]/ad-hoc/. Filenames end in -adhoc.
+- Scheduled: portfolio-reports/[YYYY-MM-DD]/ and portfolio-reports/executive/.
+- Ad hoc: portfolio-reports/ad-hoc/[YYYY-MM-DD]/ and portfolio-reports/executive/ad-hoc/. Filenames end in -adhoc.
 
 [CONSTRAINTS]
 - Scheduled runs never stop to ask; skip, log the gap, and continue.
```

## 05 — Ad hoc agent run prompt

**Test result:** ✅ T03: 5 reports saved, 0 skipped, 2 owner questions.

**Changes:**

- **Required:** removed the unbalanced opening `"`.
- **Required:** split "Report date … - Programs …", which were merged on one line.
- **Required:** filled `[config folder]`.

```diff
--- chapter/05-adhoc-agent-run.md
+++ prompts/8-tpm-leadership/05-adhoc-agent-run.md
@@ -1,3 +1,4 @@
-"Run /portfolio-reporting-agent as an ad hoc run.
+Run /portfolio-reporting-agent as an ad hoc run.
 - Run type: Ad hoc
-- Report date: [YYYY-MM-DD] - Programs: all programs in [config folder]
+- Report date: [YYYY-MM-DD]
+- Programs: all programs in skills/8-tpm-leadership/program-3p-report/configs/
```

## 06 — Program deep dive

**Test result:** ✅ 4 of 4 scheduled reports found. 5 root causes, 3 marked Hypothesis; 5-question Q&A. ⚠️ The first draft used the charter, which isn't a listed source. Caught and removed.

**Changes:**

- **Required:** removed the duplicated first line.
- **Required:** gave the report locations. "4 latest scheduled reports" had no path.
- **Required:** said whether "latest portfolio executive report" includes ad hoc reports.
- **Required:** turned `[executive role]` into an input line.
- **Required:** depends on the agent's new `Programs` input (04).

```diff
--- chapter/06-program-deep-dive.md
+++ prompts/8-tpm-leadership/06-program-deep-dive.md
@@ -1,11 +1,10 @@
 Run /portfolio-reporting-agent ad hoc for Program 1, then a deep dive.
 
- Run /portfolio-reporting-agent ad hoc for Program 1, then a deep dive.
-
 - Report date: [YYYY-MM-DD]
-- Program: [Program 1 name], program-1.md from [config folder]
+- Program: [Program 1 name], program-1.md from skills/8-tpm-leadership/program-3p-report/configs/
+- Executive: [executive role]
 
-1. Deep dive, using the 4 latest scheduled Program 1 reports, today's ad hoc report, the latest portfolio executive report, and the portfolio config:
+1. Deep dive, using the 4 latest scheduled Program 1 reports (portfolio-reports/[YYYY-MM-DD]/program-1-3p-*.md), today's ad hoc report, the latest portfolio executive report, scheduled or ad hoc (portfolio-reports/executive/), and the portfolio config:
    - Health trend: improving, stable, or degrading, and why
    - Milestone slips, recurring risks and blockers, open escalations
    - What's new since the latest scheduled report
@@ -22,7 +21,7 @@
    - Anything needing executive attention, with why now
 
 4. Executive Q&A:
-   - List the 5 questions [executive role] is most likely to ask
+   - List the 5 questions the executive is most likely to ask
    - Answer each in 1–2 sentences, with its source
    - If the reports can't answer a question, say so and name what's missing
 
@@ -31,4 +30,4 @@
 
 Rules: Use only the sources above and cite each statement. Don't change health statuses; flag disagreements. If fewer than 4 reports exist, say so and continue. Flag missing or unverified data; don't fill gaps.
 
-Save as [reports folder]/ad-hoc/[YYYY-MM-DD]/program-1-deep-dive-[YYYY-MM-DD]-adhoc.md
+Save as portfolio-reports/ad-hoc/[YYYY-MM-DD]/program-1-deep-dive-[YYYY-MM-DD]-adhoc.md
```

## 07 — Capacity: what breaks first

**Test result:** ✅ Platform Eng breaks first (2 short on 2026-11-01, before DR); Program 1 M4 is the first committed date at risk. Every slip length is tagged Assumption.

**Changes:**

- **Required:** the prompt says "Here is…" but names no files. Added slots for the portfolio report, allocation map, charter and new-program scope.
- **Required:** "take one [new program name]" → "take on [new program name]".
- **Recommended:** cite files and mark unsupported estimates as "Assumption". Slip lengths are never in the sources, so without this the model invents them silently.

```diff
--- chapter/07-capacity-tradeoff.md
+++ prompts/8-tpm-leadership/07-capacity-tradeoff.md
@@ -1 +1 @@
-"Here is my current portfolio, a resource allocation map and a team charter. If I take one [new program name] at the scope described, what breaks first? Be specific about which existing commitment slips and roughly by how long. Do not propose a solution, I want to see the cost before I see the options."
+Here is my current portfolio ([latest portfolio executive report]), a resource allocation map ([allocation map]) and a team charter ([team charter]). If I take on [new program name] at the scope described in [new program scope], what breaks first? Be specific about which existing commitment slips and roughly by how long. Use only these files and cite them; mark any estimate the files don't support as "Assumption". Do not propose a solution, I want to see the cost before I see the options.
```

## 08 — Capacity: three options

**Test result:** ✅ 3 options with start dates; hire flagged against D-03.

**Changes:**

- **Required:** works only as a follow-up in the same conversation as 07. Said which files to use.
- **Recommended:** flag conflicts with the decision log. The hire option collides with D-03 (Q4 headcount freeze).

```diff
--- chapter/08-capacity-options.md
+++ prompts/8-tpm-leadership/08-capacity-options.md
@@ -1 +1 @@
-"Show me three options: absorb it with current staffing, absorb it by descoping something existing, or hiring. For each, give me the earliest realistic start date and what it costs me. Flag any option that depends on a team outside my portfolio."
+Show me three options: absorb it with current staffing, absorb it by descoping something existing, or hiring. For each, give me the earliest realistic start date and what it costs me. Flag any option that depends on a team outside my portfolio, and any option that conflicts with a decision in the executive decision log. Use only the files from the previous prompt.
```

## 09 — Commitment monitor

**Test result:** ✅ 7 drifts, including a reorg of the owning team (C-04) and a team that no longer exists (C-06); 1 silence entry (C-04, 48 days).

**Changes:**

- **Required:** added last-check and this-check dates. "This week" and "since the last check" can't be resolved in a scheduled run.
- **Required:** the silence log (Artifact 2) had no format. Added columns.
- **Required:** gave locations for each source and an output file.
- **Required:** fixed the missing space in "sources:planning".

```diff
--- chapter/09-commitment-monitor.md
+++ prompts/8-tpm-leadership/09-commitment-monitor.md
@@ -1,12 +1,14 @@
 [ROLE] Commitment monitor for my portfolio.
 
 [TASK] From the source material, produce two artifacts:
-1. A drift report: every cross-org dependency where something appears to have changed this week.
+1. A drift report: every cross-org dependency where something appears to have changed since the last check.
 2. A silence log: dependencies with no signal at all since the last check.
 
-[CONTEXT] My commitments artifact is at [location]. Connected sources:planning docs, the issue tracker, and the channels where this org communicates plans.
+[CONTEXT] My commitments artifact is at [location]. Last check: [YYYY-MM-DD]. This check: [YYYY-MM-DD]. Connected sources: planning docs ([location]), the issue tracker ([location]), and the channels where this org communicates plans ([location]).
 
 [FORMAT] Artifact 1 as a table with columns: Dependency | Owning team | What changed | Where you saw it | Confidence (High/Med/Low) | Who can confirm this
+Artifact 2 as a table with columns: Dependency | Owning team | Last signal (date and source) | Days silent | Committed date
+Save both to [output file].
 
 [CONSTRAINTS]
 - Report only what changed.
```

## 10 — Socratic proposal

**Test result:** ✅ One question at a time; summarized positions; a one-page proposal from scripted answers only.

**Changes:**

- **Required:** "Switch to Socratic mode" isn't a Claude setting; the prompt itself defines the mode. Removed the line.
- **Required:** materials need file slots.
- **Recommended:** the chapter says the model "gives a hint" if you're stuck, but the prompt didn't say so. Added a hint rule.

```diff
--- chapter/10-socratic-proposal.md
+++ prompts/8-tpm-leadership/10-socratic-proposal.md
@@ -1,5 +1,3 @@
-Switch to Socratic mode
-
 [ROLE]
 Socratic thinking partner for a TPM leader preparing a new program proposal.
 
@@ -14,18 +12,18 @@
 - Trade-off: deprioritize something existing or ask for headcount?
 
 Materials (source of truth):
-1. My portfolio progress
-2. Company priorities
-3. Quarterly plans
-4. Latest reliability report
-5. Team structure and allocation
-[Paste or attach here.]
+1. My portfolio progress: [file]
+2. Company priorities: [file]
+3. Quarterly plans: [file]
+4. Latest reliability report: [file]
+5. Team structure and allocation: [file]
 
 [FORMAT]
 - Short responses. No preamble.
 - One focused question at a time. Wait for my answer.
 - When I reach a position, summarize it in my words and ask whether to move on.
 - If I ask for your view: two or three sentences, cite the materials, then ask a question that tests it.
+- If I'm stuck or say "hint", give one hint, then ask again.
 - "Draft the proposal": one page, built from my positions.
 
 [CONSTRAINTS]
```

## 11 — Job description

**Test result:** ✅ JD with 3 logged gaps (years of experience "level TBD", empty How we work, no comp or location); 6-row audit.

**Changes:**

- **Required:** "ask your three sharpest questions" needs "and wait for my answers". Otherwise the model asks and drafts in the same turn.
- **Required:** added role title and level. The leveling definition alone doesn't say which level.
- **Recommended:** said where logged gaps go (end of Artifact 1).

```diff
--- chapter/11-job-description.md
+++ prompts/8-tpm-leadership/11-job-description.md
@@ -4,19 +4,21 @@
 1. A draft JD following our standard JD template.
 2. A requirements audit: what each requirement is really testing for, and who it screens out.
 
-[CONTEXT] Attached:
+[CONTEXT] Attached (file paths or uploads):
 - The org structure this role sits in
 - The program details
 - The domains this role will work with or own
 - Company leveling definition for this job
 - The two or three capabilities that would make someone succeed on this team
 - Standard JD template
+- Role title and target level: [title, level]
 
-[FORMAT] Artifact 2 as a table with columns: Requirement | Required or preferred | What it is really testing for | Proxy? (Yes/No) | Who this screens out
+[FORMAT] Artifact 1 in the JD template's own sections. End it with a "Logged gaps" list (empty sections, "level TBD" items).
+Artifact 2 as a table with columns: Requirement | Required or preferred | What it is really testing for | Proxy? (Yes/No) | Who this screens out
 
 [CONSTRAINTS]
 - Anything a strong candidate could learn in the first quarter is preferred, not required.
 - Don't invent a years-of-experience threshold. Write "level TBD" and log it.
 - Every line must be true of this role on this team. No generic TPM language.
 - If a section has no support in the source, leave it empty and log it. An empty section is more useful to me than a plausible one.
-- Before drafting, ask your three sharpest questions.
+- Before drafting, ask your three sharpest questions and wait for my answers. Use the answers as source material.
```

## 12 — Shortlisting

**Test result:** ✅ 16 scores with cited lines; 4 under-description entries. The casual-language Candidate 3 was flagged, as the chapter intends.

**Changes:**

- **Required:** Artifact 1 had no format. Added columns.
- **Required:** typo "Do not rank with the candidates".
- **Required:** wait for answers (as in 11).

```diff
--- chapter/12-shortlisting.md
+++ prompts/8-tpm-leadership/12-shortlisting.md
@@ -9,12 +9,12 @@
 - The JD
 - The anonymized candidate pool, without personal data
 
-[FORMAT] Artifact 2 as a table with columns: Candidate | Dimension scored low |
-What made you unsure | Confidence (High/Med/Low) | Question that would resolve it
+[FORMAT] Artifact 1 as a table with columns: Candidate | Dimension | Score (rubric scale) | Resume line behind it
+Artifact 2 as a table with columns: Candidate | Dimension scored low | What made you unsure | Confidence (High/Med/Low) | Question that would resolve it
 
 [CONSTRAINTS]
 - Cite the specific resume line behind every score.
-- Do not rank with the candidates. Scores and evidence only.
+- Do not rank the candidates. Keep them in the order given. Scores and evidence only.
 - Don't score any dimension the resume does not address. Mark it "no evidence" rather than inferring from an adjacent experience.
 - Don't comment on anything outside what the rubric asks about.
-- Before scoring, ask your three sharpest questions about the rubric itself.
+- Before scoring, ask your three sharpest questions about the rubric itself and wait for my answers.
```

## 13 — Interview questions

**Test result:** ✅ 8 questions; the 2 dimensions with no resume evidence were adapted from the question bank and marked.

**Changes:**

- **Required:** wait for answers.
- Works otherwise. Fill `[interview round]`.

```diff
--- chapter/13-interview-questions.md
+++ prompts/8-tpm-leadership/13-interview-questions.md
@@ -14,4 +14,4 @@
 - Match the depth of each question to the level in the question bank.
 - No generic questions that could be asked of any candidate.
 - If the resume has no evidence for a dimension, say so and adapt a question bank item that would surface it.
-- Before writing, ask your three sharpest questions about the question bank or the evaluation dimensions.
+- Before writing, ask your three sharpest questions about the question bank or the evaluation dimensions and wait for my answers.
```

## 14 — Finalist comparison

**Test result:** ✅ Real vs. wording disagreements separated; style comments ("quiet", "concise") ignored per the rubric rule; no recommendation.

**Changes:**

- **Recommended:** normalized `[RULES]` / `[FEEDBACK LOOP]` to `[CONSTRAINTS]`, to match every other prompt.
- **Required:** wait for answers.

```diff
--- chapter/14-finalist-comparison.md
+++ prompts/8-tpm-leadership/14-finalist-comparison.md
@@ -16,11 +16,10 @@
 - A short list of real disagreements
 - A short list of open questions, each marked "Worth a follow-up" or "Not needed"
 
-[RULES]
+[CONSTRAINTS]
 - Use only what's in the notes. If the notes are silent on a criterion, write "no evidence."
 - Ignore names, backgrounds, and anything unrelated to the evaluation rubric attached. Evaluate signals only.
 - Flag vague notes or single-interviewer opinions as low confidence.
 - Do not recommend who to hire. Give me the comparison; the decision is mine.
 
-[FEEDBACK LOOP]
-Before comparing, ask your three sharpest questions about the rubric or the notes.
+- Before comparing, ask your three sharpest questions about the rubric or the notes and wait for my answers.
```

## 15 — Onboarding maintenance agent

**Test result:** ✅ 4 sections outdated; 8 replacements; unknown doc owner logged.

**Changes:**

- **Required:** Artifact 1 had no format.
- **Required:** "activity in the last thirty days" needs a run date.
- **Required:** each connected source needs a location, and the run needs an output file.

```diff
--- chapter/15-onboarding-maintenance-agent.md
+++ prompts/8-tpm-leadership/15-onboarding-maintenance-agent.md
@@ -4,12 +4,14 @@
 1. A freshness report per section: confirmed current, appears outdated, appears dead.
 2. A replacement log for everything outdated or dead.
 
-[CONTEXT] The onboarding doc is at [location]. Connected sources: Portfolio repository, our docs, our communication tool, the current org chart.
+[CONTEXT] The onboarding doc is at [location]. Run date: [YYYY-MM-DD]. Connected sources: Portfolio repository ([location]), our docs ([location]), our communication tool ([location]), the current org chart ([location]).
 
-[FORMAT] Artifact 2 as a table with columns: Section | Item | What is wrong with it | Proposed replacement | Confidence (High/Med/Low) | Who can confirm this
+[FORMAT] Artifact 1 as a table with columns: Section | Status (Current / Outdated / Dead) | Evidence
+Artifact 2 as a table with columns: Section | Item | What is wrong with it | Proposed replacement | Confidence (High/Med/Low) | Who can confirm this
 
 [CONSTRAINTS]
 - Check links for resolution and last update date, channels for activity in the last thirty days, named people against the current org chart, listed programs for active status.
 - Do not edit the document. Flag for review.
 - Propose a replacement only where a connected source supports one. Otherwise, write "unknown" and log it.
 - Read nothing outside what a new hire would legitimately see.
+- Save both artifacts to [output file].
```

## 16 — New hire query

**Test result:** ✅ Answered from reports only; listed what the reports can't answer.

**Changes:**

- **Required:** "Using the portfolio skills": the skills produce reports and the new hire reads those. Pointed it at the reports and configs, and added citations.

```diff
--- chapter/16-new-hire-query.md
+++ prompts/8-tpm-leadership/16-new-hire-query.md
@@ -1 +1 @@
-"I am new to this [domain]. Using the portfolio skills, explain what this domain owns, how the programs relate to each other, which teams we depend on most, and where those dependencies have been fragile, and who I should meet in my first two weeks and why."
+I am new to this [domain]. Using the latest portfolio reports and configs produced by the portfolio skills ([reports folder], [config folders]), explain what this domain owns, how the programs relate to each other, which teams we depend on most, and where those dependencies have been fragile, and who I should meet in my first two weeks and why. Cite the report or config behind each answer, and say when they don't answer something.
```

## 17 — First 30 days plan

**Test result:** ✅ 4-week plan; 4 ungrounded items; 3 decisions for the manager.

**Changes:**

- **Required:** same as 16. Also fixed the comma in "Flag anything, you could not".

```diff
--- chapter/17-first-30-days-plan.md
+++ prompts/8-tpm-leadership/17-first-30-days-plan.md
@@ -1 +1 @@
-"Draft a first-thirty-days plan for a new TPM joining [portfolio] and owning [programs]. Base it only on the current state of the portfolio skills. Flag anything, you could not ground in them, and list what I need to decide myself."
+Draft a first-thirty-days plan for a new TPM joining [portfolio] and owning [programs]. Base it only on the current portfolio reports and configs ([reports folder], [config folders]). Flag anything you could not ground in them, and list what I need to decide myself.
```

## 18 — 1:1 pre-meeting brief

**Test result:** ✅ Found a 6-week-old manager commitment (the CISO CoS intro) and an unanswered mentor ask.

**Changes:**

- **Recommended:** added the next 1:1 date, which makes "over a month" and "two or more weeks" computable.

```diff
--- chapter/18-one-on-one-brief.md
+++ prompts/8-tpm-leadership/18-one-on-one-brief.md
@@ -8,7 +8,7 @@
 5. Two things worth asking about that we have not discussed in over a month
 
 [CONTEXT] [Person]'s one-on-one file at [location], and their programs'
-latest 3P reports at [location].
+latest 3P reports at [location]. Next one-on-one: [YYYY-MM-DD].
 
 [FORMAT] Half a page. One short section per item above. For carried-over items, note when each was first raised.
```

## 19 — Career development sync

**Test result:** ⚠️ Ran, but only 3 Program 4 reports exist in the 90-day window (gap stated). The unanswered clarifying questions limit accuracy.

**Changes:**

- **Required:** wait for answers. In a single-shot test the 3 questions had no answers, and the output records how that changed the result.

```diff
--- chapter/19-career-development-sync.md
+++ prompts/8-tpm-leadership/19-career-development-sync.md
@@ -18,4 +18,4 @@
 - If there is no evidence for a behavior, mark it "Open." Don't infer from adjacent work.
 - Suggest only opportunities that appear in the portfolio report.
 - Do not rate or rank the person. Evidence and gaps only.
-- Before comparing, ask your three sharpest questions about the development plan or the leveling definition.
+- Before comparing, ask your three sharpest questions about the development plan or the leveling definition and wait for my answers.
```

## 20 — Hard conversation prep

**Test result:** ✅ No script; covers likely misreads, defensive points and an opener.

**Changes:**

- **Required:** "Here is what I know…" needs a slot for the notes. Removed the outer quotes so it pastes cleanly.

```diff
--- chapter/20-hard-conversation-prep.md
+++ prompts/8-tpm-leadership/20-hard-conversation-prep.md
@@ -1 +1 @@
-"I need to tell [person] that [situation]. Here is what I know about how they take feedback, what motivates them, and our history. Help me think through what they are likely to hear that I do not intend to say, where they are likely to get defensive, and what I should lead with. Do not write the script."
+I need to tell [person] that [situation]. Here is what I know about how they take feedback, what motivates them, and our history: [notes or file]. Help me think through what they are likely to hear that I do not intend to say, where they are likely to get defensive, and what I should lead with. Do not write the script.
```

## 21 — Promotion evidence map

**Test result:** ✅ 6 competencies; 2 Absent and 4 Thin. Nothing attributed beyond the files.

**Changes:**

- **Required:** Artifact 1 had no format.
- **Editorial:** the chapter puts "For the conversations you are dreading:" above this prompt. That line belongs to the hard-conversation prompt (20).

```diff
--- chapter/21-promotion-evidence-map.md
+++ prompts/8-tpm-leadership/21-promotion-evidence-map.md
@@ -6,7 +6,8 @@
 
 [CONTEXT] Attached: this person's IDP and one-on-one notes for the review period, and our career ladder for the target level.
 
-[FORMAT] Artifact 2 as a table with columns: Competency | What the notes show | What is missing | Strength (Strong/Thin/Absent) | Where I might go looking
+[FORMAT] Artifact 1 as a table with columns: Competency | Evidence | Date | Source file
+Artifact 2 as a table with columns: Competency | What the notes show | What is missing | Strength (Strong/Thin/Absent) | Where I might go looking
 
 [CONSTRAINTS]
 - Use only what is in the listed files. Attribute nothing to this person that is not written down.
```

## 22 — Promotion stress test

**Test result:** ✅ The weakest evidence ("proactively surfaced" vs. the 5-day gap) came from the packet itself.

**Changes:**

- **Required:** file slots for the packet and leveling definition.
- **Recommended:** quote the packet line behind each objection.

```diff
--- chapter/22-promotion-stress-test.md
+++ prompts/8-tpm-leadership/22-promotion-stress-test.md
@@ -1 +1 @@
-"Here is my packet and the leveling definition. Argue against this promotion the way a skeptical calibration participant would. What is the weakest piece of evidence, and what will I be asked that I currently cannot answer?"
+Here is my packet ([file]) and the leveling definition ([file]). Argue against this promotion the way a skeptical calibration participant would. What is the weakest piece of evidence, and what will I be asked that I currently cannot answer? Quote the packet line behind each objection.
```

## 23 — Program brief update agent

**Test result:** ✅ 13 proposed changes; 2 health disagreements flagged, not changed; 2 schema-fit questions.

**Changes:**

- **Required:** briefs and connected-source locations were missing.
- **Required:** Artifact 1 had no format.
- **Required:** "Post drafts to the program owner" is a send action that needs a messaging connector and your approval. Added a file fallback per owner.
- **Found in testing:** the brief schema's health definitions ("intervention at program level") differ from the 3P skill's ("milestone at risk"). The chapter defines health twice; pick one.

```diff
--- chapter/23-brief-update-agent.md
+++ prompts/8-tpm-leadership/23-brief-update-agent.md
@@ -4,13 +4,14 @@
 1. Proposed changes to the schema fields.
 2. A source log for every proposed change.
 
-[CONTEXT] The brief schema and skill instructions are at [location]. Review connected-source activity since each brief's last update.
+[CONTEXT] The brief schema and skill instructions are at [location]. The briefs are at [location]. Review connected-source activity ([location]) since each brief's last update.
 
-[FORMAT] Artifact 2 as a table with columns: Program | Field | Proposed value | Source | Confidence (High/Med/Low) | Owner to confirm
+[FORMAT] Artifact 1 as a table with columns: Program | Field | Current value | Proposed value
+Artifact 2 as a table with columns: Program | Field | Proposed value | Source | Confidence (High/Med/Low) | Owner to confirm
 
 [CONSTRAINTS]
 - Do not change health values. Where the evidence and the current health value disagree, flag it and leave it for the owner.
 - Don't propose a milestone date that is not stated in a source. Write "unchanged" instead.
 - Where a field has no supporting activity, leave it and log it as unverified. Stale and marked beats confidently wrong.
-- Post drafts to the program owner for confirmation, not to me.
+- Post drafts to the program owner for confirmation, not to me. Without a messaging connection, save one draft file per owner in [output folder].
 - Flag any brief where the schema no longer fits the program, with your sharpest question about why.
```

## 24 — Portfolio change triage

**Test result:** ✅ 1 re-plan-now, 6 watching, 2 noise. ⚠️ Only 2 exec reports exist for the month (gap stated).

**Changes:**

- **Required:** "this month" needs a date range.

```diff
--- chapter/24-portfolio-change-triage.md
+++ prompts/8-tpm-leadership/24-portfolio-change-triage.md
@@ -1,4 +1,4 @@
-[ROLE] Portfolio analyst helping me triage this month's changes.
+[ROLE] Portfolio analyst helping me triage this month's changes ([start date] to [end date]).
 
 [TASK] From the source material, produce two artifacts:
 1. A triage of every change across the portfolio this month, sorted into
```

## 25 — Re-plan decision

**Test result:** ✅ Ran on Kubernetes Platform Consolidation. ⚠️ The first draft used a fact from the leader's decision log, which isn't a listed source. Caught and removed.

**Changes:**

- No change needed. Fill `[program]` and `[what changed]`.

```diff
(no diff — unchanged)
```

## 26 — Decision log reflection

**Test result:** ✅ 3 patterns, each with at least 3 entries; 2 candidate patterns rejected for too few entries; 3 outcomes not logged.

**Changes:**

- **Required:** the constraint says to write "outcome not logged", but the 5-field logging habit the chapter teaches has no outcome field. Added outcome to the log definition; the chapter's habit text should add it too.

```diff
--- chapter/26-decision-reflection.md
+++ prompts/8-tpm-leadership/26-decision-reflection.md
@@ -7,7 +7,7 @@
 
 [CONTEXT] Attached: my decision log for the last two quarters. Each entry
 records the decision, the reasoning, what I expected to happen, what would
-have told me I was wrong, and the date.
+have told me I was wrong, the date, and (when known) what actually happened.
 
 [FORMAT] A table with columns: Pattern | Type (Optimism / Underweighted risk /
 Revisited decision) | Decisions it appears in | Signal I missed | Log entries
```

