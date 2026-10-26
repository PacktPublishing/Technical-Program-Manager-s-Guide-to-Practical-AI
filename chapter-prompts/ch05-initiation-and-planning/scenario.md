# The scenario: consolidating three payment platforms

Every Chapter 5 use case runs on this one program, so the artifacts build on each other the way
they would on a real program. The company, people and systems are fictional.

## The mandate

Halden, a commerce software company, runs three payment platforms. On Monday 9 March 2026 the
VP of Engineering sends a four-sentence email: consolidate the three platforms by the end of Q3
(30 September 2026), Legal has flagged a licensing risk, you own the program, and the first
steering committee is in two weeks.

## The three platforms

| Platform | Origin | Processor | Where cardholder data is stored |
|----------|--------|-----------|---------------------------------|
| Halden Pay | Built in-house | Northwind Payments (US) | United States |
| Kestrel | Acquired in 2023 | Veloxa (EU) | Frankfurt |
| Marketplace Payments | Legacy marketplace stack | Tessera Pay (EU) | Dublin |

The consolidation target is Halden Pay on Northwind.

## The four engineering teams

| Team | Engineering manager | Systems it owns (per the ownership map) |
|------|---------------------|------------------------------------------|
| Payments Platform | Oskar Lindgren | payments-core, ledger-api |
| Billing Services | Kofi Mensah | billing-svc |
| Merchant Experience | Hana Sato | merchant-portal |
| Risk & Identity | Ravi Iyer | identity-svc, fraud-scoring |

## The fourteen stakeholders

Nine of them are interviewed in week one (use case 2).

| # | Name | Role | Interviewed |
|---|------|------|-------------|
| 1 | Marcus Webb | VP Engineering, program sponsor | Yes |
| 2 | Priya Raghavan | CFO | Yes |
| 3 | Lena Fischer | Director of Product, Payments | Yes |
| 4 | Tom Delacroix | Director, Platform Engineering | Yes |
| 5 | Ben Cortez | Head of Security Engineering | Yes |
| 6 | Anika Roth | Staff Engineer, Payments Architecture | Yes |
| 7 | Sara Okonjo | Senior Counsel, Commercial & Licensing | Yes |
| 8 | Jonas Brandt | SRE Lead, Payments Reliability | Yes |
| 9 | Maya Ostrowski | Head of Merchant Success | Yes |
| 10 | Oskar Lindgren | Engineering Manager, Payments Platform | No |
| 11 | Kofi Mensah | Engineering Manager, Billing Services | No |
| 12 | Hana Sato | Engineering Manager, Merchant Experience | No |
| 13 | Ravi Iyer | Engineering Manager, Risk & Identity | No |
| 14 | Elena Marchetti | Data Protection Officer | No |

## Timeline

| Date | Event | Use case |
|------|-------|----------|
| Mon 9 Mar 2026 | Mandate email arrives | 1 · Charter |
| 10–13 Mar | Nine stakeholder interviews | 2 · Alignment |
| Thu 19 Mar | First steering committee | 2 · Alignment |
| Thu 2 Apr | Scope document v1.0 approved | 3 · Assumptions |
| Thu 16 Apr | Architecture review of the dependency map | 4 · Dependencies |
| Mon 27 Apr | Program kickoff; pre-mortem the week before | 5 · Pre-mortem |
| Wed 30 Sep | End of Q3: the mandated date | |
