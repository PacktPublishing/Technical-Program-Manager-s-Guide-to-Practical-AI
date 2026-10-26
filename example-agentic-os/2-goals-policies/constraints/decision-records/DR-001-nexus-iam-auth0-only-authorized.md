# DR-001 — NEXUS IAM: Auth0-Only Path Authorized

| Field | Value |
|-------|-------|
| **Decision ID** | DR-001 |
| **Date** | May 1, 2026 |
| **Decision maker** | Yuki Tanaka (VP Engineering) |
| **Stakeholders** | Sara Lindqvist (NEXUS TPM), Ingrid Solvang (Dir. Platform & Infra), James Whitfield (CISO), Fatima Al-Hassan (SHIELD TPM), Priya Kaur (HORIZON TPM), Marcus Chen (ATLAS TPM) |
| **Programs affected** | NEXUS · SHIELD · HORIZON · ATLAS |
| **Status** | ✅ Decided |

---

## Decision

**Yuki Tanaka authorizes the Auth0-only IAM fast path.**

Build a production-ready IAM unified service using Auth0 as the identity provider, with a planned migration off Auth0 to a custom Go-based IAM service in H2 2026 (post-NEXUS overall delivery).

Auth0 contract: CISO James Whitfield has authorized a 12-month Auth0 enterprise contract ($680K) effective May 2, 2026. The contract includes a migration-out clause and data portability guarantees.

---

## Options considered

| Option | Summary | Timeline | Cost | Cascade impact |
|--------|---------|----------|------|----------------|
| **A — Auth0-only (chosen)** | Build IAM with Auth0 as identity provider. Migrate off Auth0 in H2 2026. | Jun 30, 2026 | $680K (Auth0) + $280K eng = $960K | SHIELD 14 controls unblocked Jul 1. HORIZON Jul 31 GA recovery possible. ATLAS refactor date: Aug-Sep 2026. |
| B — Full custom IAM | Build Go-based IAM from scratch, no Auth0. | Aug 28, 2026 | $1.1M eng | SHIELD 14 controls blocked through Aug. HORIZON Aug 31 GA — zero buffer. $4M mobile deals at risk. |
| C — Defer to H2 2026 | Punt full IAM to H2 2026. Workarounds continue. | Dec 2026 | — | August SOC 2 certification fails. Kestrel and Solaris deals lost. Auth0 workaround in ATLAS becomes permanent. |

---

## Rationale

Sara Lindqvist's April 18 technical estimate confirmed that an Auth0-only build can deliver Jun 30 with 8 engineers × 10 weeks. The comparison against Option B was presented to Yuki's technical advisor the week of April 21. The portfolio cascade case was unambiguous:

- Option B keeps 14 SHIELD controls blocked through August, putting the August 31 board-mandated SOC 2 audit at serious risk
- Option B gives HORIZON zero buffer between IAM delivery (Aug 28) and GA (Aug 31) — making the Kestrel ($1.6M) and Solaris ($2.4M) mobile deals unrecoverable
- Option A costs $140K less in engineering time (10-week Auth0 build vs 18-week custom build) and preserves the ability to migrate off Auth0 in H2

Yuki's decision: "The board timeline for SOC 2 takes priority. We take the Auth0 path now, migrate properly in H2 when we're not in a certification crunch."

---

## What changes immediately

| Program | Effect | Date |
|---------|--------|------|
| NEXUS | M6 target changes from Aug 28 → Jun 30. 8-engineer IAM squad begins Auth0-only build May 2. Sara Lindqvist DRI. | May 2, 2026 |
| SHIELD | 14 IAM-blocked controls unblocked from Jul 1. M4 (100 controls, Jul 1 target) becomes feasible. | Jul 1, 2026 |
| HORIZON | Jul 31 GA recovery path open. Priya Kaur activates Jul 31 commitment for Solaris deal. Beta target adjusts to Jul 15. | Effective immediately |
| ATLAS | Auth0 workaround now has a defined refactor-out date: August-September 2026. R-001 changes from "accepted" to "planned." | Aug 2026 |

---

## What does NOT change

- The full custom Go-based IAM service (no Auth0 dependency) remains on the NEXUS H2 2026 roadmap
- Auth0 workaround in ATLAS is *not* the same as the new IAM service — ATLAS will still require a refactor sprint when the new IAM lands
- NEXUS M6 (Jun 30) delivers the Auth0-backed IAM; M7 (total service count <200, Dec 2026) is unaffected

---

## Risks accepted

| Risk | Owner | Mitigation |
|------|-------|-----------|
| Auth0 vendor dependency — if Auth0 changes pricing or terms, migration is forced | CISO James Whitfield | 12-month contract with migration-out clause. H2 migration plan initiated Q3. |
| ATLAS Auth0 workaround refactor (3 weeks) — must not land during enterprise deal closings | Marcus Chen | Planned for Aug-Sep 2026 post-GA. Not on critical path. |
| Auth0-only IAM may not satisfy all 14 SHIELD control requirements | Fatima Al-Hassan | Sara confirmed Apr 18: Auth0-only covers all 14 controls. Deloitte format reviewed. |

---

## Related decisions

- SHIELD compensating controls for PULSE dependency: Fatima Al-Hassan, May 4, 2026 (not a formal DR — documented in SHIELD master doc)
- HORIZON Solaris commitment letter: DR-004 (May 9, 2026)
