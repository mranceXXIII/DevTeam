# Workspace — Where Runs Happen

This folder is the **output area** for the DevTeam. The skill code lives in
`.agents/skills/dev-team/`; this folder is where a project actually gets built.

```
workspace/
├─ runs/
│  └─ YYYY-MM-DD-<slug>/            # one folder per run
│     ├─ docs/                      # every Markdown artifact (the coordination medium)
│     │  ├─ PROJECT-CHARTER.md
│     │  ├─ REQUIREMENTS.md
│     │  ├─ ARCHITECTURE.md
│     │  ├─ TECH-STACK.md
│     │  ├─ CONTEXT.md
│     │  ├─ DECISIONS.md
│     │  ├─ APPROVALS.md
│     │  ├─ EXISTING-PROJECT-ANALYSIS.md   # only when extending a repo
│     │  ├─ RESEARCH-REPORT.md
│     │  ├─ SYSTEM-FLOWCHART.md
│     │  ├─ PROJECT-PLAN.md
│     │  ├─ UI-SPEC.md
│     │  ├─ API-CONTRACT.md
│     │  ├─ DATA-MODEL.md
│     │  ├─ TEST-PLAN.md / TEST-REPORT.md
│     │  ├─ THREAT-MODEL.md / SECURITY-ASSESSMENT.md
│     │  ├─ LEGAL-COMPLIANCE-REVIEW.md / LICENSE-AUDIT.md
│     │  ├─ MEDIA-CATALOG.md
│     │  └─ progress/               # <agentId>-PROGRESS-LOG.md, one per agent
│     ├─ code/                      # the actual source code deliverables
│     └─ media/                     # rendered UI images + SEQUENCE.md
└─ skill-patches/                   # evolutions produced by the retrospective loop
   ├─ INDEX.md
   └─ <agent>-<slug>.md
```

## Rules for this folder

- **One folder per run.** Never mix two projects in one run folder.
- **Docs first.** An artifact is written before the work it governs.
- **Media is evidence.** Images are unaltered renders of the built UI (never mocks).
- **Code is a product, Markdown is the brain.** If it is not in a `.md` file, it did not happen.
- Per `.gitignore`, real runs and binary media are not committed by default — commit the
  artifacts you want to keep by adjusting the ignore rules or force-adding specific files.
