# Catch-Up Brief - Persona Profiles

The five-bucket structure never changes. The **persona** changes two things: which sources weigh
highest, and what counts as "Act now." Default to `tpm` if the user does not say. Infer the persona
from how the user describes themselves ("I'm a backend engineer", "I run a team") or from which
sources are connected.

## Contents
- tpm (default)
- swe (software engineer)
- em (engineering manager)
- pm (product manager)
- Applying a persona

## tpm (default)

- **"Act now" means:** a decision or escalation with a live or same-day deadline; a dependency that broke; a launch gate that needs you.
- **Sources weighted highest:** RAID / decision log, issue tracker across all your programs, roadmap tool, exec mail, calendar (SteerCo / go-no-go forums).
- **Especially surface:** decisions made in your absence (they go to "Ratify or reverse"), assumptions that were falsified while you were out, milestones that slipped, cross-program dependencies newly opened.

## swe (software engineer)

- **"Act now" means:** a review blocking a teammate, a red build on your branch, an incident or page on a service you own, a breaking change in a dependency you consume.
- **Sources weighted highest:** code host (PRs authored and requested-of-you, CI status, reverts), incident/telemetry (pages, SLO breaches on your services), issue tracker filtered to *assigned to me*, chat @-mentions and DMs.
- **Especially surface:** PRs waiting on your review, review comments left on your open PRs, failing checks, incidents opened on your services during the window. Portfolio-level program politics go to "Safe to ignore" for this persona.

## em (engineering manager)

- **"Act now" means:** a report blocked on your decision, an escalation routed to you, a sign-off only you can give, an interview or offer with a clock.
- **Sources weighted highest:** issue tracker filtered to *your team*, chat (mentions + your reports' escalations), mail, calendar, HR/ATS.
- **Especially surface:** reports' blockers that aged past a threshold, decisions awaiting your sign-off, team incidents, PTO/attrition/hiring moves.

## pm (product manager)

- **"Act now" means:** a launch gate, a customer or exec escalation, a metric regression that changes a call, a decision with a deadline.
- **Sources weighted highest:** roadmap tool, mail, product analytics, chat, support/customer signals.
- **Especially surface:** roadmap or scope changes made without you, customer asks, launch-readiness changes, competitive moves in your space.

## Applying a persona

1. Resolve the persona (explicit flag > self-description > connected-source inference > `tpm` default).
2. Re-rank every change through that persona's "Act now" definition and source weighting. The same
   event can be "Act now" for one persona and "Safe to ignore" for another (a portfolio go/no-go is
   critical for a TPM, noise for an SWE two teams away).
3. Keep the five buckets and the actionable format identical; only the contents and priority shift.
