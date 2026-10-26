# Q2 Strategy Review — Payments (slides 14–17, speaker notes included)

## Slide 14 — Where we are
- Three payment platforms: Halden Pay, Kestrel (acquired 2023), Marketplace Payments
- Three processors: Northwind Payments, Veloxa, Tessera Pay
- 2025 processed volume up 22%; payments incidents up 40%

*Speaker notes:* Most of the incident growth is on Kestrel and Marketplace. Each platform has its
own on-call rotation and its own reconciliation jobs.

## Slide 15 — Why consolidate now
- Every new payment method ships three times
- Reconciliation differences between platforms consume Finance Operations time every month-end
- The Tessera contract renews on 1 October

*Speaker notes:* We tried a consolidation in 2024 and stopped it after the Kestrel integration
proved harder than expected. The lessons from that attempt are in the 2024 runbook.

## Slide 16 — Direction
- One platform, one processor
- Halden Pay is the most modern of the three
- Savings expected from Q4

## Slide 17 — Open questions for Q2 planning
- Size of the savings
- Sequencing across merchant segments
- Resourcing across Platform Engineering, Billing and Merchant Experience
