# 10 — Socratic proposal session (transcript)

**Materials:**
- [EX] 2026-10-20 exec report
- [PC] portfolio config
- [Q4] fixtures/opportunity/q4-plan.md
- [RR] fixtures/opportunity/reliability-report.md
- [AM] allocation map

"Leader" answers are scripted test inputs.

---

**AI:** Your reliability report says Platform Eng spends 34% of its time on maintenance, up from 26% in Q2 [RR]. Which part of that 34% is the one holding the portfolio back, and how do you know?

**Leader:** All of it. It's slowing Program 2.

**AI:** 12 of the 34 points are legacy cluster patching, which ends when Program 2 M5 decommissions the self-managed clusters on 2027-01-16 [RR]. If that part goes away on its own, is that part of the problem you're proposing to solve?

**Leader:** No, fair. It's the rest, mainly certificate rotation.

**AI:** Manual certificate rotation is 9%, and it was involved in 3 of September's 5 Sev-2 incidents [RR]. Is your problem time lost, or incidents that hurt BB-3 while tier-1 is at 99.91% against a 99.95% target [RR, PC]?

**Leader:** Incidents. The time is a symptom.

**AI:** Position so far, in your words: *the problem is manual certificate rotation causing Sev-2 incidents that block BB-3, not maintenance in general.* Move on to portfolio impact?

**Leader:** Yes.

**AI:** Platform Eng is already 2 engineers short from 2026-11-01, and Program 2 is Red [AM, EX]. Whose time would this work come from?

**Leader:** The 2 engineers on toil. Automating rotation is toil work.

**AI:** Then the 2 toil engineers stop doing the toil while they automate it. What happens to the 9% of manual rotation work during the build?

**Leader:** It stays with on-call for 4–6 weeks. I can live with that.

**AI:** Position: *staff it from the 2 toil engineers; on-call absorbs manual rotation for 4–6 weeks.* On size: is this the small, targeted fix, or does it grow into "reduce all toil"?

**Leader:** Small. Certificate rotation only.

**AI:** On timing: Q4 headcount is frozen (D-03), and Q1 planning opens 2026-11-16 [Q4, PC]. Does this need to start now, or can it wait for Q1 planning?

**Leader:** Now. It's inside existing allocation and every month is more Sev-2s.

**AI:** On the trade-off: you aren't deprioritizing a program and you aren't asking for headcount. What are you giving up?

**Leader:** Toil response capacity for about 6 weeks.

**Leader:** Draft the proposal.

---

## Proposal (one page): Certificate Rotation Automation

**Problem:**
- Manual certificate rotation takes 9% of Platform Eng time, and it was involved in 3 of 5 Sev-2s in September [RR].
- Tier-1 availability is 99.91% against the BB-3 target of 99.95% [RR, PC].
- Not in scope: legacy cluster patching (12%). It ends with Program 2 M5 on 2027-01-16 [RR].

**Size:** small and targeted. Automate certificate rotation only.

**Staffing:**
- The 2 Platform engineers currently on toil [AM]. No new headcount, so it's consistent with D-03 [PC].
- On-call absorbs manual rotation during the build (about 4–6 weeks, leader estimate).

**Timing:** start now, inside Q4 allocation. It doesn't wait for the Q1 planning cycle (opens 2026-11-16) [Q4].

**Portfolio impact:**
- No change to Programs 1–4.
- Platform Eng's existing shortfall from 2026-11-01 is unchanged [AM].

**Trade-off:** reduced toil response capacity for about 6 weeks.

**Open items:**
- Build estimate (leader estimate, not in materials).
- The incident-reduction target isn't set.
