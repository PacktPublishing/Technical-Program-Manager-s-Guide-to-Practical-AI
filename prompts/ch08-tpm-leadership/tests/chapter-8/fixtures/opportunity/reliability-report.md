# Platform reliability report — September 2026
- Tier-1 availability: 99.91% (target 99.95%, BB-3).
- Platform Eng time on maintenance/toil: 34% (Q2: 26%).
  - Legacy self-managed cluster patching: 12%
  - Manual certificate rotation: 9%
  - On-call pages from legacy clusters: 8%
  - Flaky CI pipelines: 5%
- 3 of 5 Sev-2 incidents in September involved manual certificate rotation.
- Legacy cluster patching ends when Program 2 M5 decommissions self-managed clusters (2027-01-16).
