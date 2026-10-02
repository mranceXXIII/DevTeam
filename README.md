# DevTeam — Orchestrated Software Engineering Agent Team

> A self-contained, **Markdown-only** agent organization. You give one prompt to the
> **Team Leader**. The Team Leader builds the architecture, requirements, tech stack,
> standards, and context; the **Planner + Researcher** validates it against the real
> world; then a **parallel development fleet** (Frontend, Backend, QA, Penetration,
> Legal, Multimedia) builds, tests, attacks, reviews, and documents it — while the
> Team Leader approves every gate and can order any skill to **evolve** after an error.

---

## 1. Purpose

This repository defines a **virtual software engineering department** of autonomous
agents, each modeled on an engineer with **20–40 years of field experience**. The goal
is not "generate code fast." The goal is **disciplined, documented, auditable delivery**:

- Every decision is written down before it is executed.
- Every agent works inside a strict, pre-approved plan — never free-styling.
- Every artifact an agent produces is a Markdown file other agents can read.
- Every error becomes a permanent upgrade to the responsible agent's skill.
- Nothing ships until the Team Leader approves it against the published standards.

**The only file format the agents read or write for coordination is `.md`.**
Code is a product; Markdown is the brain.

---

## 2. The Roster

| Agent | Role | Owns | Primary Artifacts |
| :--- | :--- | :--- | :--- |
| **Team Leader** | Orchestrator, architect, approver | Scope, architecture, standards, gates, final sign-off, skill evolution orders | `PROJECT-CHARTER.md`, `ARCHITECTURE.md`, `REQUIREMENTS.md`, `TECH-STACK.md`, `CONTEXT.md`, `EXISTING-PROJECT-ANALYSIS.md`, `APPROVALS.md` |
| **Planner + Researcher** | Recon, internet baseline, sequencing | External standards baseline, precedent, dependencies, flow | `RESEARCH-REPORT.md`, `SYSTEM-FLOWCHART.md`, `PROJECT-PLAN.md` |
| **Frontend Developer (UI/UX)** | Interface engineering | Components, design system, accessibility, state | `UI-SPEC.md`, `FRONTEND-NOTES.md`, `PROGRESS-LOG.md` |
| **Backend Developer** | Server, data, integration | APIs, data model, migrations, async jobs | `API-CONTRACT.md`, `DATA-MODEL.md`, `BACKEND-NOTES.md`, `PROGRESS-LOG.md` |
| **QA Tester** | Verification | Test strategy, coverage, regression, acceptance | `TEST-PLAN.md`, `TEST-REPORT.md`, `PROGRESS-LOG.md` |
| **Penetration Tester** | Offensive security | Threat model, exploit attempts, CVSS findings | `SECURITY-ASSESSMENT.md`, `THREAT-MODEL.md`, `PROGRESS-LOG.md` |
| **Legal Agent** | Compliance & licensing | Licensing, privacy, IP, regulatory conformity | `LEGAL-COMPLIANCE-REVIEW.md`, `LICENSE-AUDIT.md`, `PROGRESS-LOG.md` |
| **Multimedia Agent** | Visual evidence | Image generation of the UI, ordered walkthrough sequence | `MEDIA-CATALOG.md`, `media/` image set + sequence manifest |

Every role definition lives in [`.agents/skills/dev-team/agents/`](./.agents/skills/dev-team/agents).

---

## 3. How It Operates Inside a Coding Platform

The team is packaged as a **single installable skill**: `dev-team`.
The platform's top-level agent acts as the **Team Leader process**, and the teammates
are spawned as **independent parallel workers** — the "different terminals."

```text
        YOU  --prompt-->  TEAM LEADER (main session)
                              |
              +---------------+-------------------------------+
              |               |                               |
   PHASE 1 Charter     PHASE 2 Recon                  PHASE 3 GATE
   arch+reqs+stack     planner/researcher             leader validates
   +context            scrape baseline+flowchart      vs standards
              |               |                               |
              +---------------+-----------+-------------------+
                                          v
                         PHASE 4  PARALLEL BUILD (async workers)
        +----------+-----------+----------+------------+-----------+
        v          v           v          v            v           v
    FRONTEND   BACKEND       QA       PEN-TEST      LEGAL     MULTIMEDIA
        |          |           |          |            |           |
        +----------+-----------+----+-----+------------+-----------+
                                    v
                         PHASE 5-7  VERIFY > LEGAL SIGN-OFF > LEADER APPROVAL
                                    v
                         PHASE 8  RETROSPECTIVE > SKILL EVOLUTION
```

### Tool mapping ("different terminals")

| Concept | Mechanical realization |
| :--- | :--- |
| Team Leader session | The main agent turn (this skill) |
| Spawn an agent ("open a terminal") | `team_spawn_teammate(agentId, rolePrompt)` |
| Give an agent work | `team_run_task(agentId, task, runMode)` |
| Run agents simultaneously | `runMode: "async"`, then `team_await_runs` |
| Shared work board | `team_task` (create / claim / complete / block) |
| Audit trail & approvals | `team_mission_log`, plus MD files on disk |
| Convergence / sign-off | `team_create_outcome` -> `team_attach_outcome_fragment` -> `team_finalize_outcome` |

Details: [`.agents/skills/dev-team/reference/orchestration-tools.md`](./.agents/skills/dev-team/reference/orchestration-tools.md).

---

## 4. The Invariant Loop

1. **You** send one request.
2. **Team Leader** writes the charter: architecture, requirements, tech stack, standards, context.
3. **Planner + Researcher** scrape the internet for the *industry baseline* of that kind of
   system, document precedent and dependencies, and produce a start-to-finish flowchart.
4. **Team Leader** checks that research against its own standards.
   **Mismatch -> the plan is rejected and returned.** Match -> the plan is released.
5. **Development fleet runs in parallel**, each agent locked to the approved plan and to
   its own integrity rules; each writes progress + problems to its `PROGRESS-LOG.md`.
6. **QA, Penetration, Legal** gate the build. **Multimedia** renders the UI the Frontend
   produced into images and an ordered sequence for evidence.
7. **Team Leader approves** or returns work with specific, documented defects.
8. **Retrospective -> Skill Evolution:** any error that could recur is converted into a
   permanent update of the responsible skill, so the same mistake never happens twice.

Full phase definitions: [`.agents/skills/dev-team/reference/workflow.md`](./.agents/skills/dev-team/reference/workflow.md).

---

## 5. Install

The skill is auto-discoverable when placed in a skills directory the platform scans.

```powershell
# From the repository root
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
```

This links/copies `.agents/skills/dev-team` into `~/.agents/skills/dev-team`, after which
it appears as the `dev-team` skill everywhere you work.

**Using it:**

```text
/dev-team <your request>
```

or simply start a request and let the skill trigger on its description
(architecture, build a system, plan a project, review existing codebase, etc.).

---

## 6. Repository Map

| Path | What it is |
| :--- | :--- |
| `.agents/rules.md` | Non-negotiable orchestrator + agent rules |
| `.agents/skills/dev-team/SKILL.md` | Entry point; the Team Leader loop |
| `.agents/skills/dev-team/agents/` | The 8 role definitions (personas, duties, integrity rules) |
| `.agents/skills/dev-team/reference/` | Standards, workflow, gates, handoff, evolution, tool mapping |
| `.agents/skills/dev-team/templates/` | The MD template for every artifact an agent must produce |
| `docs/` | Human-facing operations guide, quickstart, artifact map |
| `scripts/install.ps1` | Installs the skill into the platform |
| `workspace/` | Where a project run's Markdown + code are produced (per-run folders) |
| `workspace/skill-patches/` | Evolutions produced by the retrospective loop |

---

## 7. Principle

> An engineer with 30 years of experience is not faster at typing.
> They are **faster at not repeating mistakes** — because they wrote down the lesson.
>
> This team is built on that one sentence.
