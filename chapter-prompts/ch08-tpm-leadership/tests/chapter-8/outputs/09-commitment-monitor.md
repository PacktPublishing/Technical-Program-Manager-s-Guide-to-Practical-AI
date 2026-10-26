# 09 — Commitment monitor · check 2026-10-20 (last check 2026-10-13)

**Sources:**
- fixtures/commitments/commitments.md (not modified)
- planning-docs.md
- issue-tracker.md
- channels.md

## Artifact 1 — Drift report

| Dependency | Owning team | What changed | Where you saw it | Confidence | Who can confirm this |
|---|---|---|---|---|---|
| C-01 Security review, data retention | Security Eng | Scheduled for 2026-10-23, before the 2026-10-31 commitment (positive) | SEC-88, 2026-10-20 | High | Security Eng intake owner |
| C-02 Security review, default-deny | Security Eng | Intake says non-P0 programs should "expect delays into November". The 2026-11-10 commitment is at risk. No change on SEC-91 itself. | #security-eng-intake, 2026-10-16 | Medium (general statement, not SEC-91 specific) | CISO office / Security Eng manager |
| C-03 Reserved EC2 capacity | Cloud Finance | Approved 2026-10-19, ahead of 2026-10-24 (positive) | CF-512; #cloud-finance | High | Cloud Finance |
| C-04 CDC connector | Data Platform | **Owning team reorganized:** Sam, who made the commitment, moved to ML Platform on 2026-10-05; Priyanka R. is acting manager. The commitment exists only in a 1:1 note. | Org chart update, 2026-10-05 (planning-docs) | High that the change happened; status of the commitment unknown | Priyanka R. |
| C-05 SSO for internal tools | Identity | IDN-301 moved from Q4 committed to "Q1 stretch", priority P1 → P3. **Misses the 2026-11-30 commitment.** | Identity Q4 plan v3 (2026-10-16); IDN-301 (2026-10-16) | High | Identity team lead |
| C-05 (tone) | Identity | "Internal asks will have to wait" | #identity-team, 2026-10-17 | Low (inferred from tone; confirms the explicit change above) | Identity team lead |
| C-06 Global load balancer config | Edge Infra | **Owning team no longer exists:** merged into Network Eng on 2026-10-01; backlog under triage, owner TBD | Org announcement (planning-docs); #network-eng, 2026-10-18 | High (merge); Low (status of commitment, inferred from "still sorting the old Edge Infra backlog") | Lena Fischer (Network Eng lead) |
| C-07 Splunk renewal go/no-go | Procurement | No date change; Procurement is waiting on Program 3's recommendation | PROC-77, 2026-10-20 | High | Procurement / Aisha Okafor |

## Artifact 2 — Silence log

| Dependency | Owning team | Last signal | Days silent | Committed date |
|---|---|---|---|---|
| C-04 CDC connector (Program 1 M4) | Data Platform | 2026-09-02, the 1:1 between Daniella and Sam | 48 | 2026-11-01 |

Every other commitment had a signal since the last check.

## Flags for your review (artifact not updated)

- **C-06 maps to a team that no longer exists.** Sharpest question: *Who in Network Eng now owns the global load balancer config for Program 2 M4? Did a commitment made by email on 2026-08-20 survive the Edge Infra merge, or is it just sitting in the backlog under triage?*
- **C-04 is a commitment between two people, and one of them has changed roles.** Sharpest question: *Does Priyanka R. know Data Platform owes Program 1 a production-ready CDC connector by 2026-11-01, two weeks before a committed M4?*
- **C-05 now misses its date.** Program 4 M4 (VPN retirement, 2027-01-30) needs SSO on the last tool.
