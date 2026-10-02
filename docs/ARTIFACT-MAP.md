# Artifact Map — Who Produces What, and When

Every artifact is Markdown, owned by exactly one agent, produced at one phase, and
validated at one gate. Shapes are defined in
`.agents/skills/dev-team/reference/documentation-contract.md`; scaffolds are in
`.agents/skills/dev-team/templates/`.

---

## Production Matrix

| Artifact | Owner | Phase | Consumed by | Gate |
| :--- | :--- | :--- | :--- | :--- |
| `EXISTING-PROJECT-ANALYSIS.md` | Team Leader | X | everyone | GX |
| `PROJECT-CHARTER.md` | Team Leader | 1 | all | G1 |
| `REQUIREMENTS.md` | Team Leader | 1 | all | G1 |
| `ARCHITECTURE.md` | Team Leader | 1 | all | G1 |
| `TECH-STACK.md` | Team Leader | 1 | BE, Legal | G1 |
| `CONTEXT.md` | Team Leader | 1 | all | G1 |
| `DECISIONS.md` | Team Leader | ongoing | all | G7 |
| `APPROVALS.md` | Team Leader | ongoing | all | G7 |
| `RESEARCH-REPORT.md` | Planner+Researcher | 2 | Leader, Legal | G2 |
| `SYSTEM-FLOWCHART.md` | Planner+Researcher | 2 | all | G2 |
| `PROJECT-PLAN.md` | Planner+Researcher | 2 | all | G2 |
| `UI-SPEC.md` | Frontend | 4 | QA, Multimedia | G5 |
| `FRONTEND-NOTES.md` | Frontend | 4 | Leader | G7 |
| `API-CONTRACT.md` | Backend | 4 | FE, QA, Pentest | G5 |
| `DATA-MODEL.md` | Backend | 4 | Pentest, Legal | G5 |
| `BACKEND-NOTES.md` | Backend | 4 | Leader | G7 |
| `TEST-PLAN.md` | QA | 4 | Leader, FE, BE | G5 |
| `TEST-REPORT.md` | QA | 5 | Leader | G5 |
| `THREAT-MODEL.md` | Pentest | 4 | Leader | G5 |
| `SECURITY-ASSESSMENT.md` | Pentest | 5 | Leader | G5 |
| `LICENSE-AUDIT.md` | Legal | 4 | Leader | G6 |
| `LEGAL-COMPLIANCE-REVIEW.md` | Legal | 6 | Leader | G6 |
| `MEDIA-CATALOG.md` + `media/` | Multimedia | 5 | Leader, user | G5 |
| `progress/<agent>-PROGRESS-LOG.md` | every agent | ongoing | Leader | G7 |
| `skill-patch.md` | error owner | 8 | Leader | G8 |

---

## Directory Convention

```
workspace/runs/<run>/
├─ docs/            # all Markdown artifacts above
│  └─ progress/     # one PROGRESS-LOG.md per agent
├─ code/            # source produced by FE + BE
└─ media/           # rendered UI images + SEQUENCE.md
```

---

## Naming Conventions

| Thing | Convention | Example |
| :--- | :--- | :--- |
| Run folder | `YYYY-MM-DD-<slug>` | `2026-02-10-invoicing-saas` |
| Requirement | `FR-###` / `NFR-###` | `FR-014` |
| Workstream | `WS-##` | `WS-03` |
| Test case | `TC-###` | `TC-021` |
| Defect | `DEF-###` | `DEF-007` |
| Security finding | `FIND-###` | `FIND-003` |
| Legal finding | `LF-###` | `LF-002` |
| Decision | `ADR-###` | `ADR-005` |
| Image | `IMG-###-<screen>-<state>.png` | `IMG-004-login-error.png` |
| Skill patch | `<agent>-<slug>.md` | `backend-migration-rollback.md` |

---

## Traceability Chain

```
PROJECT-CHARTER → REQUIREMENTS (FR-###) → PROJECT-PLAN (WS-##)
      → TEST-PLAN (TC-###) → TEST-REPORT (evidence) → APPROVALS (gate verdict)
                                        ↘ PROGRESS-LOG (problems) → skill-patch (evolution)
```

Break any link in this chain and the run cannot pass G7.
