# 16 — New hire: "I am new to the Platform Modernization domain…"

**Sources:**
- portfolio-reports/executive/ad-hoc/…-2026-10-20-adhoc.md [EX]
- 2026-10-20 ad hoc 3P reports [P1–P4]
- Portfolio config [PC]
- Program configs

## What this domain owns

Four infrastructure programs serving three company big bets [PC]:

- **Program 1:** API Gateway cutover and core data migration [P1]
- **Kubernetes Platform Consolidation:** 68 services onto one EKS fleet [P2]
- **Observability Consolidation:** DataDog, plus the Splunk exit [P3]
- **Zero-Trust Network Segmentation:** network policies, default-deny, VPN retirement [P4]

The big bets are enterprise readiness, cloud cost and reliability [PC].

## How the programs relate

- Program 4's network policies gate Program 2's production cutover [P2, P4].
- Program 2's migration waves gate Program 3's Splunk exit [P3].
- Program 1's legacy decommission gates the gateway move in Program 2 M5 [EX].

## Teams we depend on most

- **Security Eng:** reviews for Programs 1 and 4 [EX]
- **Cloud Finance:** capacity for Program 2 [P2]
- **Procurement:** the Splunk renewal [P3]

## Where dependencies have been fragile

- **Security Eng:** Program 1 was blocked from 2026-10-06 until its review was scheduled on 2026-10-20. Program 4 has been queued since 2026-10-02 [P1, P4].
- **Program 4 → Program 2 handoff:** M2 slipped 18 days, which helped turn Program 2 Red [EX 2026-10-15].

## Who to meet in your first two weeks

| Person | Why | Source |
|---|---|---|
| Marcus Webb | Owns the Red P0 program; re-baseline decision this week | P2 |
| Daniella | Owns the other P0; committed M4 on 2026-11-14 | P1, PC (D-01) |
| Rahul Mehta | Owns the Security Eng dependency still open | P4 |
| Aisha Okafor | Splunk go/no-go on 2026-11-10 | P3 |
| Security Eng intake owner | Shared bottleneck | EX |

## Not answered by the sources

- Who to talk to in Cloud Finance and Procurement (the reports don't name anyone).
- How decisions actually get made. That's for your manager.
