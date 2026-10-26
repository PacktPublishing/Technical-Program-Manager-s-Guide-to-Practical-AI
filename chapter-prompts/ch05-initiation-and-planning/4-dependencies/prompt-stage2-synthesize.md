# 4b · Multi-document dependency synthesis (stage 2)

**Book:** Chapter 5, *Technical Dependency and Architecture Synthesizing* → *In Practice: Multi-Document Dependency Synthesis* (Table 5.4)
**Paste underneath:** the eleven stage 1 results (each under its document number and title), then [inputs/ownership-map.md](inputs/ownership-map.md)
**In this repo:** `/tpm-dependency-map` builds a dependency map from a list of workstreams; it does not yet run this multi-document synthesis. Use this prompt for the book's method.

## The prompt

```
[ROLE] A systems architect reconciling dependency extractions taken
  independently from eleven design documents.

[TASK] Merge them into one graph, then produce three lists.

[CONTEXT] Four teams, eighteen months, different names for the same
  systems. Ownership map attached. "payments-core", "the core
  payments service" and "PCS" are one node.
  Each extraction is headed with its document number, title, team
  and date. Documents disagree; a later date does not make a
  document right, but note the dates when two documents conflict.

[FORMAT] First the alias table you used: Canonical | Aliases | Docs.
  Then: 1. UNOWNED  2. CONFLICTING (quote both)  3. CIRCULAR (show
  the full chain).
  UNOWNED: every system that some document depends on and that
  appears in no row of the ownership map. Name who depends on it,
  with document and section.
  CONFLICTING: two documents that make incompatible statements
  about the same system or interface. Quote both, with document,
  team and date. Check how each document says the interface
  behaves, not only its labels: for every target, compare the
  Method and Failure Impact columns across all documents that use
  it. A different write mode, protocol, token or credential
  lifetime, or data format for the same interface is a conflict,
  because one of the two callers is built on the wrong assumption.
  CIRCULAR: every chain that loops back on itself, with the
  document that states each edge.
  End with the merged edge list: Source | Target | Type | Docs.

[CONSTRAINTS]
- Do not merge two names without a reason. When unsure, keep them
  separate and add a fourth list, POSSIBLE ALIASES, for a human.
- Every claim traces to a document and, where available, a section.
- Do not infer a dependency no document states. A missing edge beats
  an invented one: this goes to an architecture review.
```

## The validation step

This map does not go into any sequencing decision until the engineers who own the systems have
reviewed it. In the scenario, the review took forty minutes and changed two things; see
[architecture-review-notes.md](architecture-review-notes.md). Two corrections out of roughly
seven findings is the review working, not the synthesis failing.
