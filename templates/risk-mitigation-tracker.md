# Template: Risk Mitigation Tracker

Book: Chapter 6, *Managing Project Risks*. Used by prompt P6.10, the risk agent ([../chapter-prompts/ch06-execution.md](../chapter-prompts/ch06-execution.md)).

A living register you carry from program to program. The risk agent reads a new design document against it and asks about patterns that bit you before.

| Risk Summary | Risk Explanation | Risk Impact | Risk Mitigation | Risk Status | Risk Identified Date | Risk Mitigated Date |
|---|---|---|---|---|---|---|
| [title or name] | [what could go wrong and why] | [what it would cost: dates, money, customers] | [what you did or will do] | Monitoring / Active / Mitigated | [YYYY-MM-DD] | [YYYY-MM-DD or blank] |

## Example (fictional NovaGrid programs)

| Risk Summary | Risk Explanation | Risk Impact | Risk Mitigation | Risk Status | Risk Identified Date | Risk Mitigated Date |
|---|---|---|---|---|---|---|
| Undocumented SDK dependency | A payments SDK upgrade was only known to one engineer and surfaced late | Mobile launch slipped four weeks | Dependency review added to every kickoff checklist | Mitigated | 2025-05-12 | 2025-07-01 |
| Unowned controls after reorg | 14 SOC 2 controls lost their owners when teams were reshuffled | Audit evidence at risk six weeks before the window | Controls mapped to new system owners; two escalated to the director | Mitigated | 2025-10-06 | 2025-11-21 |
| Shared database cutover window | Two services write to the same database during migration | Data loss or a long rollback if cutover overruns | Dual-write with reconciliation; cutover rehearsed twice | Monitoring | 2026-03-02 | |
