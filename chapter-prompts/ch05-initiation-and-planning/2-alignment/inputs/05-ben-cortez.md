# Interview notes — Ben Cortez, Head of Security Engineering

Thu 12 Mar 2026 · 30 min · video call · my notes, quotes marked

- Direct. "Done means the legacy processors are decommissioned and their credentials revoked.
  Until then we are carrying three attack surfaces, not one."
- Credential sprawl on Kestrel: API keys for Veloxa are held by at least three services. Wants an
  inventory before any cutover.
- PCI: consolidation should shrink PCI scope, "but only once the old environments are gone."
  Next PCI assessment is in Q4.
- Token migration: expects card tokens to move processor-to-processor, "never through our systems."
- Wants a security sign-off gate before each cohort migrates.
- No view on timeline beyond "don't skip the decommissioning."
