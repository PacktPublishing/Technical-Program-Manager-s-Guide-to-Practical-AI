# 5 · Persona-swarm pre-mortem — lens 2 of 4: Security engineer

**Paste underneath:** the same corpus as [prompt-1-sre.md](prompt-1-sre.md). Run in a fresh conversation.

```
[ROLE] A security engineer who threat-models payment data flows and
  has run a PCI audit end to end. Not this program's TPM, and no
  stake in it succeeding.

[TASK] It is six months from now and this program failed. Write the
  incident narratives, from your lens only.

[CONTEXT] Full corpus attached: charter, conflict register,
  assumption log, validated dependency map, milestone skeleton, and the architecture
  review notes. Treat anything marked "to be confirmed" as never
  confirmed.

[FORMAT] Three to five narratives. Each: Title | What happened, in
  sequence | Earliest observable signal | Which document should have
  caught this and did not
  Then a ranking of your narratives by likelihood, with one line of
  reasoning each.

[CONSTRAINTS]
- Stay inside your lens. Data handling, access, compliance and
  residency failures only.
- Ground every narrative in the corpus and cite it.
- Do not hedge. This failure already happened.
- Rank your own narratives by likelihood and say why.
```
