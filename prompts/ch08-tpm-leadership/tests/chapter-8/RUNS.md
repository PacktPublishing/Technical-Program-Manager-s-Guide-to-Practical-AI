# Chapter 8 — Test runs (2026-10-20)

All data is synthetic. The connected sources (Jira, Confluence, Slack, Drive, DataDog) are stand-in files under `tests/chapter-8/fixtures/sources/`, referenced from the program configs, so the skills run without MCP connections. To run against real tools, replace those paths with the tool URLs.

| # | Prompt / skill | Placeholder values used | Output | Result |
|---|---|---|---|---|
| T01 | program-3p-report (negative test) | config `tests/chapter-8/fixtures/negative/program-9.md` | tests/chapter-8/outputs/T01-placeholder-config.md | ✅ Skip / ask / Needs input |
| T02 | portfolio-executive-report, scheduled | date 2026-10-15 | portfolio-reports/executive/platform-modernization-exec-2026-10-15.md | ✅ |
| T03 | 05 ad hoc agent run | date 2026-10-20; all programs | portfolio-reports/ad-hoc/2026-10-20/*; executive/ad-hoc/*; outputs/T03-adhoc-agent-run-summary.md | ✅ (1 fix in pre-save check) |
| T04 | 06 deep dive | date 2026-10-20; Program 1; VP Engineering | portfolio-reports/ad-hoc/2026-10-20/program-1-deep-dive-2026-10-20-adhoc.md (+ -v2 3P) | ✅ (1 source fix) |
| 07 | Capacity: what breaks first | new program = Multi-Region DR (`tests/chapter-8/fixtures/resource/`) | outputs/07-capacity-tradeoff.md | ✅ |
| 08 | Capacity: three options | follow-up to 07 | outputs/08-capacity-options.md | ✅ |
| 09 | Commitment monitor | last check 2026-10-13; `tests/chapter-8/fixtures/commitments/` | outputs/09-commitment-monitor.md | ✅ |
| 10 | Socratic proposal | `tests/chapter-8/fixtures/opportunity/`, exec report, allocation map; scripted answers | outputs/10-socratic-proposal.md | ✅ |
| 11 | Job description | `tests/chapter-8/fixtures/hiring/`; Senior TPM (L6) | outputs/11-job-description.md | ✅ |
| 12 | Shortlisting | rubric, JD (11), anonymized pool | outputs/12-shortlisting.md | ✅ |
| 13 | Interview questions | HM screen; Candidate 3 | outputs/13-interview-questions.md | ✅ |
| 14 | Finalist comparison | panel notes A/B | outputs/14-finalist-comparison.md | ✅ |
| 15 | Onboarding maintenance agent | `tests/chapter-8/fixtures/onboarding/`; run date 2026-10-20 | outputs/15-onboarding-maintenance.md | ✅ |
| 16 | New hire query | domain = Platform Modernization | outputs/16-new-hire-query.md | ✅ |
| 17 | First 30 days plan | portfolio = Platform Modernization; programs = Program 4 | outputs/17-first-30-days-plan.md | ✅ |
| 18 | 1:1 brief | person = TPM-R; `tests/chapter-8/fixtures/people/` | outputs/18-one-on-one-brief.md | ✅ |
| 19 | Career development sync | TPM-R → Staff (L7) | outputs/19-career-development-sync.md | ⚠️ Questions unanswered; short 90-day window |
| 20 | Hard conversation prep | hard-conversation-notes.md | outputs/20-hard-conversation-prep.md | ✅ |
| 21 | Promotion evidence map | IDP, 1:1 file, Staff ladder | outputs/21-promotion-evidence-map.md | ✅ |
| 22 | Promotion stress test | promotion-packet-tpm-r.md | outputs/22-promotion-stress-test.md | ✅ |
| 23 | Brief update agent | `tests/chapter-8/fixtures/evolution/` briefs and schema | outputs/23-brief-update-agent.md, outputs/23-owner-drafts/ | ✅ |
| 24 | Portfolio change triage | 2026-09-21 → 2026-10-20 | outputs/24-portfolio-change-triage.md | ⚠️ Only 2 exec reports in the month |
| 25 | Re-plan decision | Kubernetes Platform Consolidation | outputs/25-replan-decision.md | ✅ (1 source fix) |
| 26 | Decision reflection | leader-decision-log.md | outputs/26-decision-reflection.md | ✅ |

**How these were run:** in this Claude Code session, with the model following each fixed prompt and skill against the fixtures. These aren't automated evals. Re-run them in Claude.ai or with `claude -p` to confirm the results hold in a fresh context.
