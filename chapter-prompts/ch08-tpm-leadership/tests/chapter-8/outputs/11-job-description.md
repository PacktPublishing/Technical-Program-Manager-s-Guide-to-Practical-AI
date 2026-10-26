# 11 — JD draft and requirements audit

**Sources** (in fixtures/hiring/):
- org-structure.md
- role-domains.md
- leveling-senior-tpm.md
- success-capabilities.md
- jd-template.md
- Role: Senior TPM (L6)

## Step 1: the model's three questions (answered from hm-answers.md)

1. **Q:** Is hands-on failover execution required, or is designing replication part of the job?
   **A:** Running a failover test end to end is required. Engineers own the replication design.
2. **Q:** Does the role carry on-call?
   **A:** Only the DR-event escalation rotation, about 1 week per quarter.
3. **Q:** Is prior audit experience required for the SOC 2 evidence?
   **A:** Preferred. The Compliance team coaches.

## Artifact 1: draft JD

### About the team
Platform TPM sits under the Director of Platform TPM and runs four infrastructure programs: API gateway and data migration, Kubernetes consolidation, observability and zero-trust networking. You'll be the fifth TPM.

### What you'll do
- Own the Multi-Region Disaster Recovery program: a us-west-2 warm standby, RTO 1h and RPO 15m, failover game days, and SOC 2 DR evidence by 2027-02-01.
- Run regional failover tests end to end and own the go/no-go call.
- Hold dates with Security Eng, Cloud Finance and Compliance, which sit outside the portfolio.
- Manage the dependencies on the Kubernetes platform, data platform and observability programs.
- Join the DR-event escalation rotation (about 1 week per quarter).

### What you'll need (required)
- You've run a program where regional failure, data loss or a failover test was a real constraint.
- You've delivered through teams outside your reporting line, including security or compliance partners.
- You can read replication and failover designs closely enough to find unlisted dependencies.
- Years of experience: **level TBD** (logged).

### Nice to have (preferred)
- You've taken a program through an audit (SOC 2 or similar).
- Familiarity with Kubernetes platform migrations.

### How we work
- (empty: no source; logged)

### Logged gaps
1. Years of experience: "level TBD" (no threshold is used).
2. "How we work" has no source material.
3. Compensation and location aren't in the sources.

## Artifact 2: requirements audit

| Requirement | Required or preferred | What it is really testing for | Proxy? | Who this screens out |
|---|---|---|---|---|
| Ran a program with real failure or failover constraints | Required | Judgment under recovery pressure; the go/no-go call | No | Strong TPMs from product or app domains, which is intended for this role |
| Delivered through teams outside your line, incl. security/compliance | Required | Influence without authority with gatekeeper teams | Partly ("security/compliance" narrows it) | Candidates who influenced other gatekeepers (legal, finance) and don't use the word "security" |
| Read replication/failover designs to find unlisted dependencies | Required | Technical depth to challenge designs | No | Candidates who are strong technically but describe their work as "coordination" |
| Audit experience | Preferred | Evidence discipline | Yes (it can be learned in the first quarter, so it's preferred) | Candidates from unregulated companies |
| Kubernetes migration familiarity | Preferred | Context on Program 2 dependencies | Yes | Candidates from VM- or serverless-heavy shops |
| DR on-call about 1 week per quarter | Required (role condition) | Availability for DR events | No | People who can't take any on-call; state this clearly so they can self-select |
