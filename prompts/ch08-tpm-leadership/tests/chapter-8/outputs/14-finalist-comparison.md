# 14 — Finalist comparison (no recommendation)

**Sources** (in fixtures/hiring/):
- panel-notes.md
- leveling-senior-tpm.md
- rubric.md (incl. hiring guide)
- JD from output 11

## Step 1: the model's three questions

1. **Q:** Which criteria weigh most?
   **A:** R4 Execution and R2 Influence (hiring guide).
2. **Q:** Is "seemed hesitant" (Interviewer 3) evidence on influence, or a comment on communication style?
   **A:** Not answered, so treated as low confidence and not scored.
3. **Q:** Are there notes on R3 for Candidate A beyond the technical round?
   **A:** No, only Interviewer 2.

## Comparison

| Criterion | Candidate A | Candidate B | Confidence | Source |
|---|---|---|---|---|
| R1 Resilience programs | Ran 4 failover tests; explained why the second failed (DNS TTL); owned the go/no-go | Coordinated a datacenter evacuation; made the call to fail back early and owned the risk | High (A); Medium (B, one interviewer) | Interviewer 1, HM screen |
| R2 Cross-org influence | Got audit to accept partial evidence with a phased plan. Bar raiser wanted more on handling a partner who said no | Security sign-off story was vague on their role vs. the team's | Medium (A); **Low** (B, vague notes) | Interviewers 3, 4 |
| R3 Technical depth | "Good, not exceptional"; weaker on Kubernetes networking | Found a gap in the sample replication design within 10 minutes | Low (A, vague); High (B, specific) | Interviewer 2 |
| R4 Execution under slip | no evidence | Recovered a slipping storage migration by cutting scope with the sponsor; shipped on the new date | — (A); Medium (B, one interviewer) | Interviewer 4 |

## Real disagreements

- **Candidate B, influence:** Interviewer 3 ("seemed hesitant", vague) vs. Interviewer 4 (recovered a slip by negotiating scope with the sponsor). These look like a real difference in signal, not just different wording.
- None for Candidate A. Interviewer 4's "leans on process" is the same observation as the missing "partner said no" story, not a contradiction.

## Open questions

- **Candidate A, R4:** no slip-recovery evidence in any round. **Worth a follow-up** (R4 weighs highest).
- **Candidate B, R2:** what they personally did for the Security sign-off. **Worth a follow-up.**
- **Candidate A, Kubernetes networking depth:** **Not needed**. It's a preferred item in the JD.

**Ignored as not rubric-related:**
- "Long answers, took time to get to the point" (B)
- "Concise, confident" (A)
- "Quiet but sharp" (B)
