# Interview notes — Jonas Brandt, SRE Lead, Payments Reliability

Fri 13 Mar 2026 · 45 min · his desk · my notes, quotes marked

- Supportive of consolidation: three on-call rotations is "the thing burning my team out."
- Sequencing: "Kestrel goes last. Veloxa's API is the flakiest of the three, so we learn on
  Marketplace traffic first." Marketplace volume is steadier and Tessera's API is well documented.
- Cutover: wants per-cohort cutovers with a tested rollback for each. "Nobody has rehearsed a
  rollback on any of these platforms. Including 2024."
- Change freeze: payments change freeze runs 15 Nov – 5 Jan. Anything not done by mid-November
  waits until January.
- Observability: Northwind dashboards exist; Kestrel and Marketplace are "mostly logs."
- Dual running is fine with him "as long as someone pays for the on-call."
