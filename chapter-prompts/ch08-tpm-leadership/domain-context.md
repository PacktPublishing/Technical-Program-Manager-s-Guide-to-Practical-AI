# Domain Context — Platform Modernization Portfolio (Infrastructure)

> Built around the Program 1 report (2026-10-15). Programs 2–4 are illustrative. Replace them with your real details.

## Portfolio

- **Name:** Platform Modernization
- **Domain:** Infrastructure (API gateway, data platform, Kubernetes, observability, network security)
- **Programs:** 4
- **Report cadence:** weekly 3P report per program (last runs 2026-10-08 and 2026-10-15)

## Programs

| # | Program | TPM | Eng lead | Jira key | Slack |
|---|---|---|---|---|---|
| 1 | Program 1 — API Gateway & data migration | Daniella, Senior TPM | Priya Shah | PRG1 | #program-1, #program-1-eng |
| 2 | Kubernetes Platform Consolidation | Marcus Webb, Staff TPM | Tomás Rivera | PRG2 | #program-2 |
| 3 | Observability Consolidation (DataDog) | Aisha Okafor, TPM | Ken Liu | PRG3 | #program-3 |
| 4 | Zero-Trust Network Segmentation | Rahul Mehta, Senior TPM | Lena Fischer | PRG4 | #program-4 |

## Org structure

- **VP Engineering:** executive sponsor; owns leadership escalations and commitments (e.g. Program 1 M4)
- **Platform leadership:** decides on staffing, re-baselines and scope
- **Program teams:** TPM plus eng lead for each program
- **Security Engineering:** outside the program teams; a shared review queue for Programs 1 and 4
- **CISO:** sponsor for Program 4 and owner of the Security Eng priorities
- **SRE Director:** stakeholder for Programs 2 and 3
- **Cloud Finance / FinOps:** capacity and budget approvals
- **Procurement:** vendor contracts (Splunk renewal for Program 3)

## Tools and sources

Every report lists its sources under "Sources and gaps". When sources disagree, use this precedence:

1. **Jira** (`PRG1`–`PRG4`): source of truth for dates and ticket status. Jira wins over Confluence.
2. **Decision log:** scope changes and ratified targets
3. **Milestone plan / Charter:** baseline commitments
4. **Confluence status page:** narrative status
5. **Dependency tracker:** cross-program and external dependencies
6. **Slack (#program-N):** signals only. Anything without a Jira or Confluence record is marked **Unverified**.
7. **DataDog:** metrics, SLOs and cost (Program 3)

Restricted channels that a TPM can't access (e.g. #program-1-eng) are listed under **Missing**.

## Stakeholders and audiences

| Audience | Receives | Cadence |
|---|---|---|
| VP Engineering | Portfolio summary, Red/Yellow escalations, explicit asks with due dates | Weekly |
| Platform leadership | Full 3P report per program | Weekly |
| CISO | Security dependencies (Programs 1, 4) | Weekly while blocked |
| SRE Director | Programs 2, 3 | Weekly |
| Engineering teams | Program newsletter | Bi-weekly |

## RAG thresholds

Same definitions as `skills/8-tpm-leadership/program-3p-report/SKILL.md`. That skill is authoritative; keep the two in sync.

- **🟢 Green:** on track, no unmitigated risks.
- **🟡 Yellow:** a milestone is at risk or a risk is unmitigated, but it's recoverable.
- **🔴 Red:** a milestone will be missed, or a blocker needs outside help.
- **Portfolio Red:** a Red program that supports a company big bet. Any other Red or Yellow program makes the portfolio Yellow.
- **Missing data scores Yellow**, never Green.
- **Trend is required on every report:** ↑ improving, → stable, ↓ deteriorating.

## Escalation rules

- **Escalate if:** the program is Red, Yellow twice in a row, has an external blocker, needs a decision above the owner, or has a committed date at risk. Each escalation carries an explicit ask with an owner and due date (as in Program 1, 2026-10-15).
- **External blocker on a committed milestone:** name the blocking team, the date the block started, the milestone at risk and the specific ask.
- **Shared blockers across programs** (e.g. the Security Eng queue): escalate once at portfolio level, not separately per program.

## Program standards

- **Report format:** 3P (Progress / Plans / Problems) plus Sources and gaps
- **Progress:** each item cites a Jira ticket or decision-log entry
- **Plans:** a milestone table (Milestone / Date / Confidence) plus next-cycle goals
- **Problems:** risks (Risk / Owner / Mitigation with due date), blocked dependencies (owner, blocked-since date) and escalations (with an explicit ask)
- **Sources and gaps:** Used / Missing / Unverified / Conflict, and which source won
- **Storage:** `portfolio-reports/<YYYY-MM-DD>/program-N-3p-<YYYY-MM-DD>.md`
