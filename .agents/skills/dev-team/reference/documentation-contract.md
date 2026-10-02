# Documentation Contract — What Every Artifact Must Contain

Every `.md` artifact has a **fixed shape**. An artifact that does not match its contract
is rejected at the gate (R0, R9). This is what makes agent output machine-checkable.

All artifacts live in `workspace/runs/<run>/docs/` and start with a header block:

```markdown
# <Artifact Title>
- Run: <run slug>
- Owner: <agentId>
- Version: <n>
- Last updated: YYYY-MM-DD
- Status: draft | submitted | approved | superseded
- Inputs: <artifact paths this was derived from>
```

---

## 1. Team Leader Artifacts

### PROJECT-CHARTER.md
Goal · Scope (in) · Scope (out / non-goals) · Success criteria (measurable) ·
Constraints · Stakeholders/actors · Risks (with impact) · Assumptions · Out-of-scope log.

### REQUIREMENTS.md
Table: `ID | Requirement | Type (FR/NFR) | Priority | Acceptance criteria | Source`.
`FR-###`/`NFR-###` numbered. Every row must have a verifiable acceptance criterion.

### ARCHITECTURE.md
Context (C4-1) · Containers/components (C4-2) · Responsibilities & boundaries ·
Data flow (diagram) · Trust boundaries · External integrations · Failure modes ·
Scalability & performance posture · Observability · Security posture · Open questions.

### TECH-STACK.md
Table: `Layer | Choice | Version | Why | Alternatives rejected | Risk`.
Every choice justified; every alternative named; every version pinned.

### CONTEXT.md
Glossary · Domain rules & invariants · Actors & roles · Integrations & credentials
(names only, never values) · Environments · Environment assumptions.

### DECISIONS.md (ADR log, append-only)
Per ADR: `ADR-### | title | date | status | context | decision | alternatives | consequences`.

### APPROVALS.md (append-only)
See `reference/workflow.md` §6 for the exact entry format.

### EXISTING-PROJECT-ANALYSIS.md
Repo map · Languages/frameworks & versions · Entry points · Build/test/lint commands ·
Data layer & schema · Auth/permission model · External integrations · CI/CD ·
Conventions observed · Tech debt & risks · **How to extend safely**.

---

## 2. Planner + Researcher Artifacts

### RESEARCH-REPORT.md
Question · Method · Findings (each with source URL) · Industry baseline · Reference
implementations · Standards/RFCs/regulations that apply · Dependency & version landscape ·
Security advisories relevant here · Compliance signals · Contradictions found ·
Recommendations for the charter · **Sources table** (`claim | source | url | date accessed`).

### SYSTEM-FLOWCHART.md
One Mermaid `flowchart TD` from **start to finish**, plus a numbered narrative:
happy path, every decision branch, every error/edge path, actors, external systems,
termination states. Must cover every `FR-###`.

### PROJECT-PLAN.md
Workstreams (`WS-##`) · each: objective, owner agent, inputs, deliverables, DoD, depends-on ·
Sequencing & critical path · Parallelization map · Milestones · Requirement traceability
matrix (`FR-### → WS-##`) · Risks to schedule.

---

## 3. Development Artifacts

### UI-SPEC.md (Frontend)
Design tokens (type, color, space, radius, motion) · Component inventory · Screens & routes ·
Per-screen states (loading/empty/error/success) · Responsive breakpoints · Accessibility
plan (keyboard, contrast, focus, ARIA, labels) · Data needs (maps to API-CONTRACT) ·
Interaction/animation notes · Sections: `## Screen: <name>`.

### API-CONTRACT.md (Backend)
Per endpoint: `METHOD path | purpose | auth | request schema | response schema |
status codes | error shape | rate limits | idempotency`. Plus versioning, pagination,
auth model, error taxonomy.

### DATA-MODEL.md (Backend)
Entities & attributes · relationships & cardinality · constraints/indexes · migration plan ·
rollback path · retention/PII classification.

### FRONTEND-NOTES.md / BACKEND-NOTES.md
Implementation notes, notable files, tradeoffs, local run instructions, follow-ups.

---

## 4. Verification Artifacts

### TEST-PLAN.md (QA)
Scope · test levels (unit/integration/e2e/acceptance) · environment · entry/exit criteria ·
test cases table (`TC-## | maps FR-### | steps | expected | level`) · data strategy ·
regression set · out-of-scope.

### TEST-REPORT.md (QA)
Executed cases table (`TC-## | result | evidence (command/output) | duration`) ·
pass/fail totals · defects found (`DEF-## | severity | steps | evidence`) ·
requirement coverage summary · **explicitly: any skipped/blocked test + reason + risk**.

### THREAT-MODEL.md (Pentest)
Assets · actors · trust boundaries · STRIDE table (`component | threat | mitigation | residual risk`).

### SECURITY-ASSESSMENT.md (Pentest)
Scope & authorization · method · findings table
(`FIND-## | title | CVSS | severity | component | reproduction | evidence | remediation`) ·
exploited vs theoretical · retest status · residual risk statement · out-of-scope.

---

## 5. Legal Artifact

### LEGAL-COMPLIANCE-REVIEW.md
Scope & jurisdiction assumptions (**not legal advice** disclaimer) ·
license audit table (`dependency | version | license | compatible? | obligation`) ·
privacy/data-protection (data categories, lawful basis, retention, rights) ·
IP & attribution · third-party terms/ToS exposure · regulated-domain obligations ·
findings (`LF-## | rule | source | exposure | remediation | counsel-needed?`) ·
sign-off statement + open items.

### LICENSE-AUDIT.md
Machine-generated dependency license list + the raw command used + any flagged rows.

---

## 6. Multimedia Artifacts

### MEDIA-CATALOG.md
Render environment & how it was launched · capture index
(`IMG-## | screen/route | state | file | source (UI-SPEC ref) | timestamp`) ·
**ordered sequence** (start → finish walkthrough, referencing `IMG-##`) ·
gaps/unreachable screens · integrity note (images are unaltered renders of the built UI) ·
`media/SEQUENCE.md` manifest.

---

## 7. Universal Artifacts

### PROGRESS-LOG.md (every agent)
Append-only entries:

```markdown
### YYYY-MM-DD HH:MM — <task id> — <status>
- Did: <what>
- Artifacts: <paths>
- Problem encountered: <exact error text + context>  (or "none")
- Remedy attempted: <what>
- Next: <next step>
```

### skill-patch.md
See `reference/skill-evolution.md` §3.
