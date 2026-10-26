# Agentic Architecture Map

How the layers of an agentic system map to folders in the [example agentic OS](../example-agentic-os/README.md). Every layer has a path you can open.

---

## Layer map

```
┌────────────────────────────┬───────────────────────────────────────────┐
│  Architecture layer        │  Where it lives in example-agentic-os/    │
├────────────────────────────┼───────────────────────────────────────────┤
│  1. Inputs & Triggers      │  1-inputs-triggers/                       │
│     Jira · Aha · Datadog   │     jira/ · aha/ · datadog/ · vanta/ ...  │
│     Slack · calendar       │     + MCP connectors (optional)           │
├────────────────────────────┼───────────────────────────────────────────┤
│  2. Goals, Policies        │  2-goals-policies/                        │
│     RAG · escalation · DoD │     domain-context.md · personal-context  │
├────────────────────────────┼───────────────────────────────────────────┤
│  3. Models / Reasoning     │  The AI tool you run it in                │
│                            │     (Claude Code or Cursor)               │
├────────────────────────────┼───────────────────────────────────────────┤
│  4. Memory & Knowledge     │  3-memory-knowledge/                      │
│     program state · RAID   │     layer1-4 · raid-log · cross-program   │
├────────────────────────────┼───────────────────────────────────────────┤
│  5. Skills, Tools          │  4-skills-tools/  (60+ skills)            │
│                            │     foldered by lifecycle stage 0-8       │
├────────────────────────────┼───────────────────────────────────────────┤
│  Agent Harness / Runtime   │  5-agent-harness/                         │
│  Observe→Plan→Act→Reflect  │     orchestrator · sub-agents · workflows │
├────────────────────────────┼───────────────────────────────────────────┤
│  6. Cross-cutting          │  /tpm-preflight · CLAUDE.md run rules     │
│     Guardrails             │     (story date, connector fallback)      │
├────────────────────────────┼───────────────────────────────────────────┤
│  7. Collaboration          │  Human checkpoints in the workflows       │
│     Human in the loop      │     escalation brief = the TPM sends it   │
├────────────────────────────┼───────────────────────────────────────────┤
│  8. Outputs & Actions      │  6-outputs/ · stakeholder updates         │
└────────────────────────────┴───────────────────────────────────────────┘
```

---

## The execution loop in practice

The agent loop **Observe → Plan → Act → Reflect → Update State → Check Goal** maps to an execution health check:

| Loop step | Example OS implementation |
|-----------|---------------------------|
| **Observe** | `/tpm-preflight` + Jira and Aha! exports + `this-week.md` |
| **Plan** | `/tpm-program-health` → focus areas for the epic check |
| **Act** | `/tpm-epic-checker` · `/tpm-risk-identifier` · `/tpm-stakeholder-update` |
| **Reflect** | Fruit bowl checkpoint 1: "is this interpretation correct?" |
| **Update State** | Write to `this-week.md` and the RAID log |
| **Check Goal** | SteerCo prep complete? Escalation ask sent? |

---

## Common TPM tasks and where they live

| Task | Path |
|------|------|
| Delivery health check | `/tpm-program-health` + Aha! export |
| Reconcile Jira, Aha! and the master doc | `/tpm-data-reconciliation` |
| Datadog incidents | `/tpm-incident-check` + Datadog export |
| Meeting follow-up | `/tpm-meeting-notes` → `/tpm-stakeholder-update` |
| Weekly status | `/tpm-steerco-prep` · `/org-weekly-digest` |
| Stakeholder map | `/tpm-stakeholder-map` |
| Roadmap health check | `/tpm-roadmap-health-check` |
