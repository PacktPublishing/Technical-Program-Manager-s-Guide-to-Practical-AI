# DR-008 — HORIZON GA Definition: Soft GA July 31 / App Store GA August 31

| Field | Value |
|-------|-------|
| **DR ID** | DR-008 |
| **Date** | June 15, 2026 |
| **Decision makers** | Rachel Lim (CPO), Ingrid Solvang (SVP Engineering) |
| **Informed** | Priya Kaur (TPM HORIZON), Karl Bergstrom (CTO), Solaris Logistics (customer), Kestrel (customer) |
| **Programs affected** | HORIZON |
| **Status** | Authorized — GA definition locked |

---

## Context

Since May 16 (10 days in limbo), HORIZON's GA definition had been open: the question was whether "Jul 31 GA" meant (a) App Store submission with 2-3 week review, or (b) limited release to committed enterprise customers without App Store presence.

Karl held a working session at SteerCo May 22 and committed Rachel Lim + Ingrid Solvang to resolve the definition by June 15. They held the working session June 15 as committed.

The App Store review timeline (Apple: 1-3 weeks, Google: 3-7 days) makes a formal App Store GA before July 31 technically possible but operationally risky — it would require App Store submission by July 8 at the latest, with zero buffer for rejection or resubmission.

---

## Decision

**Two-stage GA definition:**

### Stage 1 — Soft GA: July 31, 2026
- Limited release to committed enterprise beta customers: **Kestrel** (contracted, $800K), **Solaris Logistics** (deal probability 65%), and up to 3 additional enterprise customers accepted into the July 15 beta cohort (M6).
- Direct distribution (TestFlight / enterprise MDM), not App Store.
- Full enterprise feature set enabled: IAM via NEXUS Auth0, push notifications, offline sync.
- Marketing framing: "Early Access for Enterprise" — not a public App Store launch.
- **This is what Solaris and Kestrel are contractually aligned to** (per DR-004).

### Stage 2 — App Store GA: August 31, 2026
- iOS App Store + Google Play Store submission targeting August 1. Expected review time: iOS 2-3 weeks, Android 3-7 days.
- Full public launch with analyst comms, press release, and marketing campaign.
- M7 (App Store / Play Store submission) target: August 1 (revised target confirmed).
- M8 (GA launch) target: August 31 (revised from July 31).

---

## Rationale

- **Protects the Solaris deal.** Solaris paused Palantir evaluation based on the July 31 commitment (DR-004). Soft GA July 31 honors that commitment without App Store dependency.
- **Reduces go-live risk.** App Store rejection risk is non-zero (enterprise features, permissions, review criteria). Removing that risk from the July 31 path is prudent.
- **Preserves marketing moment.** August 31 App Store GA gives the team 2-3 weeks to polish the public-facing experience beyond the enterprise-focused soft GA.

---

## Customer communications

- Priya Kaur sent Kestrel onboarding package June 25.
- Priya Kaur sent Solaris Logistics onboarding package June 25.
- Both customers acknowledged and confirmed July 15 beta cohort participation.

---

## Related

- DR-004 — HORIZON Solaris Jul 31 GA commitment (May 9)
- NEXUS M6 — IAM dependency (deploying June 30 tonight)
- HORIZON M6 target: Jul 15 (beta cohort)
- HORIZON M7 target: Aug 1 (App Store submission)
- HORIZON M8 target: Aug 31 (public GA — revised from Jul 31)
