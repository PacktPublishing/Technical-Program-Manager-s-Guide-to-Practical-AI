---
name: portfolio-executive-report
description: Use when rolling the latest program 3P reports into an executive portfolio report, adding portfolio-level context such as big bets, program priority, OKRs, and the executive decision log.
---
[ROLE] TPM leader drafting a portfolio report for executive leadership.

[TASK] Roll the latest program 3P reports into one executive view. Add portfolio context, surface cross-program risks and shared dependencies, and flag what needs executive attention and why now.

[CONTEXT]
Inputs:
- Run type (Scheduled or Ad hoc) and report date.
- Latest 3P report for each program in the portfolio config, on or before the report date:
  Scheduled: portfolio-reports/[YYYY-MM-DD]/[program-name]-3p-[YYYY-MM-DD].md (use -v2 if present).
  Ad hoc: portfolio-reports/ad-hoc/[YYYY-MM-DD]/[program-name]-3p-[YYYY-MM-DD]-adhoc.md; if a program has no ad hoc report for that date, use its latest scheduled report and say so.
- Portfolio config (skills/8-tpm-leadership/portfolio-executive-report/configs/[portfolio-name].md): company big bets, program priority, company OKRs, executive decision log.
- Previous portfolio report: the latest scheduled report in portfolio-reports/executive/ before the report date, for trends. If none exists, say "No previous portfolio report" and take trends from the program reports.

Definitions:
- Take program health, risks, and escalations as reported. Do not re-assess.
- Portfolio health:
  Red = a Red program that supports a company big bet.
  Yellow = any other Red or Yellow program. Green = all Green. Consecutive
  Yellows and concentration risk trigger escalation, not a color change.
- Weigh issues by program priority and their impact on big bets and OKRs.
- Cross-program risk = a risk or dependency that appears in more than one program report.
- Bottleneck = a team or org that several programs depend on at once, based on the dependencies in the program reports.
- Check open asks against the decision log. Don't re-raise anything already decided; if a decision conflicts with an ask, show the decision instead of the ask.
- Use only decision-log entries dated on or before the report date.

[FORMAT]
Header: Portfolio · Health · Date · Programs reported (x/n)
Summary: 2–3 sentences on the state of the big bets and OKRs, and the main ask
Executive attention: ask, why now, impact on big bet or OKR, by when (table)
Program table: Program | Priority | Owner | Health | Trend | Next milestone | Top issue
Cross-program risks and bottlenecks
Gaps: missing reports, unverified items, conflicts
Last line: "Saved as [path]."

Save to portfolio-reports/executive/[portfolio-name]-exec-[YYYY-MM-DD].md.
Ad hoc runs: portfolio-reports/executive/ad-hoc/[portfolio-name]-exec-[YYYY-MM-DD]-adhoc.md.

[CONSTRAINTS]
- Every statement traces to a program report or the portfolio config. Add nothing else. Cite the source after each statement, e.g. (P1 3P 2026-10-15) or (Portfolio config, Decision log D-03).
- If the portfolio config is missing: ad hoc runs stop and ask; scheduled runs return "Skipped — missing portfolio config."
- If a program report is missing, flag the program by name and continue.
- Carry "Unverified" tags through.
- Never overwrite. Ad hoc runs ask (when called by the reporting agent, save -v2); scheduled runs save -v2.
- Executive attention first. One page.
- Before saving, trace every health status, risk, and ask to its source, and confirm no ask duplicates a logged decision.
