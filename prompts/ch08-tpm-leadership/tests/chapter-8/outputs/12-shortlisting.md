# 12 — Candidate scoring (no ranking)

**Sources** (in fixtures/hiring/):
- rubric.md
- JD from output 11
- candidate-pool.md (anonymized)

## Step 1: the model's three questions about the rubric (answered from hm-answers.md)

1. **Q:** What's the scale, and is "no evidence" the same as 1?
   **A:** The scale is 1–4. "No evidence" is not the same as 1.
2. **Q:** Do the dimensions have weights at screening?
   **A:** No, they're equal at screening.
3. **Q:** Does R2 require security or compliance specifically, or any cross-org partner?
   **A:** Not answered in hm-answers.md, so the rubric's own wording ("incl. security/compliance") is applied as written. Logged.

## Artifact 1: scores (candidates in the order given)

| Candidate | Dimension | Score | Resume line behind it |
|---|---|---|---|
| 1 | R1 Resilience | 4 | "ran 4 regional failover tests, cut recovery time from 3h to 50m" |
| 1 | R2 Cross-org | 3 | "Partnered with InfoSec and audit to deliver PCI evidence on schedule" |
| 1 | R3 Technical | no evidence | none |
| 1 | R4 Execution under slip | no evidence | none |
| 2 | R1 Resilience | no evidence | none |
| 2 | R2 Cross-org | no evidence | "across design, iOS and Android teams" (team names only; reporting lines not stated) |
| 2 | R3 Technical | no evidence | none |
| 2 | R4 Execution under slip | 3 | "Re-planned the launch after a 6-week vendor delay and shipped 2 weeks after the original date" |
| 3 | R1 Resilience | 2 | "coordinated the teams that moved traffic and brought it back" (scope and their own role unclear) |
| 3 | R2 Cross-org | 2 | "Worked with the security folks to get our access model signed off" |
| 3 | R3 Technical | no evidence | none |
| 3 | R4 Execution under slip | no evidence | none |
| 4 | R1 Resilience | no evidence | none |
| 4 | R2 Cross-org | 3 | "owned dependency map with network and security teams" |
| 4 | R3 Technical | 2 | "Kubernetes migration of 150 services" (scale shown; depth not shown) |
| 4 | R4 Execution under slip | 2 | "weekly dependency review that caught 3 slips early" (prevention, no recovery outcome) |

## Artifact 2: under-description log

| Candidate | Dimension scored low | What made you unsure | Confidence | Question that would resolve it |
|---|---|---|---|---|
| 3 | R1 Resilience (2) | "Kept the lights on… when a datacenter went dark" reads like a real regional-failure event described in casual language | Low | "When the datacenter went dark, what was your decision, and how long until traffic was back?" |
| 3 | R2 Cross-org (2) | "security folks" may be a separate org, but the reporting line isn't stated | Medium | "Was the security team in your org? What did you have to change to get sign-off?" |
| 4 | R4 Execution under slip (2) | "Caught 3 slips early" may hide recoveries | Medium | "Pick one of the 3 slips. What did you change, and what was the outcome?" |
| 4 | R1 Resilience (no evidence) | A 150-service migration usually involves rollback planning, but the resume doesn't say so | Low | "What was your rollback or failover plan during the migration?" |
