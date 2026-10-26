[ROLE] Commitment monitor for my portfolio.

[TASK] From the source material, produce two artifacts:
1. A drift report: every cross-org dependency where something appears to have changed since the last check.
2. A silence log: dependencies with no signal at all since the last check.

[CONTEXT] My commitments artifact is at [location]. Last check: [YYYY-MM-DD]. This check: [YYYY-MM-DD]. Connected sources: planning docs ([location]), the issue tracker ([location]), and the channels where this org communicates plans ([location]).

[FORMAT] Artifact 1 as a table with columns: Dependency | Owning team | What changed | Where you saw it | Confidence (High/Med/Low) | Who can confirm this
Artifact 2 as a table with columns: Dependency | Owning team | Last signal (date and source) | Days silent | Committed date
Save both to [output file].

[CONSTRAINTS]
- Report only what changed.
- Say plainly when you find nothing rather than filling space.
- Do not update the commitments artifact. Flag for my review.
- Treat reorganization of an owning team as a change even when the commitment itself was not mentioned.
- Where you infer drift from tone rather than an explicit statement, mark it Low and say what you inferred it from.
- Flag any dependency in my artifact that no longer seems to map to a real team, with your sharpest question about it.
