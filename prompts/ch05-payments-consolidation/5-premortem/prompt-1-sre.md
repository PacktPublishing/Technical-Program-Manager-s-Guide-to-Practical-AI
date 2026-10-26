# 5 · Persona-swarm pre-mortem — lens 1 of 4: SRE

**Book:** Chapter 5, *Pre-Mortem on Demand* → *In Practice: The Persona Swarm Pre-Mortem* (Table 5.5)
**Paste underneath:** the corpus: [1-charter/output.md](../1-charter/output.md), [2-alignment/output.md](../2-alignment/output.md), [3-assumptions/output.md](../3-assumptions/output.md), [4-dependencies/output.md](../4-dependencies/output.md), [4-dependencies/output-milestones.md](../4-dependencies/output-milestones.md) and [4-dependencies/architecture-review-notes.md](../4-dependencies/architecture-review-notes.md)
**Run all four lenses separately, each in a fresh conversation, on the same corpus.** Then see [README.md](README.md) for the merge.
**In this repo:** `/tpm-premortem` runs the same four lenses on a repo program and produces a ranked session pack.

```
[ROLE] An SRE with twelve years operating payment systems, paged at
  3am for other people's migrations. Not this program's TPM, and no
  stake in it succeeding.

[TASK] It is six months from now and this program failed. Write the
  incident narratives, from your lens only.

[CONTEXT] Full corpus attached: charter, conflict register,
  assumption log, validated dependency map, and milestone skeleton.
  The corpus also includes the architecture review notes that
  validated the map. Treat anything marked "to be confirmed" as
  never confirmed.

[FORMAT] Three to five narratives. Each: Title | What happened, in
  sequence | Earliest observable signal | Which document should have
  caught this and did not
  Then a ranking of your narratives by likelihood, with one line of
  reasoning each.

[CONSTRAINTS]
- Stay inside your lens. Operational and reliability failures only.
- Ground every narrative in the corpus and cite it.
- Do not hedge. This failure already happened.
- Rank your own narratives by likelihood and say why.
```
