# 25 — Re-plan pressure test: Kubernetes Platform Consolidation

**What changed:** M3 (2026-10-31) can't be met. Service-level network policies arrive 2026-11-11, and 2 engineers leave 2026-11-01.

**Sources:**
- Triage (output 24)
- Exec reports 2026-10-15 and 2026-10-20
- Decision log
- OKR progress

## Month view

- First appeared Red on 2026-10-15.
- The Cloud Finance blocker faded (approved 2026-10-19).
- The network-policy issue changed shape into the two-drop plan on 2026-10-17.
- The staffing loss is fixed by D-03.
- So the change grew in one dimension (staffing) and shrank in two (capacity, dependency clarity).

## 1. What would change my mind

- The Redis runbook (PRG2-161) lands by 2026-10-27, *and* Program 4 pulls service-level policies earlier than 2026-11-11. That would make the original M4 (2026-11-21) credible again.
- The backfill denial reverses. It's Unverified in the 10-20 report, and D-03 says otherwise.

## 2. Reversible vs. not

- **Reversible:** moving Jira epic dates; the internal sequencing of migration waves.
- **Not reversible:** a moved date that the reports have already shown leadership (M4 2026-11-21 appears in both exec reports). Whether it was formally committed isn't in the sources; the decision log has no M4 entry for this program.

## 3. What this re-plan forecloses

- **Program 3:** the Splunk exit on 2026-12-01 likely loses Medium confidence. The go/no-go is due 2026-11-10, before the new M4 (2026-12-12).
- **Program 1:** the gateway workloads move (M5) keeps its float only if Program 2 M5 stays on 2027-01-16.
- **OKRs:** O1-KR2 keeps about 2 weeks of buffer. O2-KR1 is at risk.
- **Shared dependencies:** none new.

## 4. Who has to be told before it's real

| Stakeholder | Why they need to know | Before or after the decision |
|---|---|---|
| CTO staff / VP Engineering | M4 commitment, D-03 owner, O1-KR2 owner | Before |
| Program 4 TPM (Rahul Mehta) | Two-drop plan timing; the buffer changes | Before |
| Program 3 TPM (Aisha Okafor) and Procurement | Splunk go/no-go on 2026-11-10 | Before |
| SRE Director | O2-KR1 owner; Program 2 audience | Before |
| Program 1 TPM (Daniella) | M5 → Program 2 M5 handoff | After |

**Not in the sources:** what CTO staff were told about M4 beyond the date, and any cost of delaying the self-managed cluster decommission.
