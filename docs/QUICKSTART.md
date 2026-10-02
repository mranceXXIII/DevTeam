# Quickstart

Get the DevTeam running in three steps.

---

## 1. Install the skill

From the repository root:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install.ps1
```

Options:

| Goal | Command |
| :--- | :--- |
| Copy (safe default, works everywhere) | `.\scripts\install.ps1` |
| Live link (edit repo → changes apply instantly) | `.\scripts\install.ps1 -Mode link` |
| Overwrite an existing install silently | `.\scripts\install.ps1 -Force` |

The script copies `.agents/skills/dev-team` into `~/.agents/skills/dev-team`, verifies all
core files are present, and writes a log to `scripts/.install-log.txt`.

---

## 2. Invoke the team

```text
/dev-team Build a multi-tenant SaaS invoicing app with Stripe billing and role-based access.
```

or just describe what you want — the skill triggers on its description when you ask to
build, plan, architect, review, or harden software.

**Also useful:**

```text
/dev-team Analyze this existing repo and tell me how to safely add a feature.
/dev-team I need an architecture, requirements, and a plan for <system>. Do not build yet.
```

---

## 3. What happens next

1. The Team Leader creates `workspace/runs/<date>-<slug>/` and announces the plan.
2. It authors the charter (architecture, requirements, tech stack, context).
3. The Planner+Researcher gathers the industry baseline and a start-to-finish flowchart.
4. The Leader validates that research (Gate **G2**) — mismatch means it goes back.
5. The build fleet runs in parallel: Frontend, Backend, QA, Penetration, Legal, Multimedia.
6. Gates G5–G7 verify, sign off legally, and get final approval.
7. The retrospective turns any error into a permanent skill upgrade.

---

## 4. Reading the results

Everything is in `workspace/runs/<date>-<slug>/`:

| You want… | Open… |
| :--- | :--- |
| The goal and scope | `docs/PROJECT-CHARTER.md` |
| What it must do | `docs/REQUIREMENTS.md` |
| How it is designed | `docs/ARCHITECTURE.md` |
| Why these technologies | `docs/TECH-STACK.md` + `docs/DECISIONS.md` |
| The system flow | `docs/SYSTEM-FLOWCHART.md` |
| The plan and who does what | `docs/PROJECT-PLAN.md` |
| Whether it works | `docs/TEST-REPORT.md` |
| Whether it is secure | `docs/SECURITY-ASSESSMENT.md` |
| Whether it is legal | `docs/LEGAL-COMPLIANCE-REVIEW.md` |
| What it looks like | `docs/MEDIA-CATALOG.md` + `media/` |
| The audit trail | `docs/APPROVALS.md` + `docs/progress/*` |
| What the team learned | `workspace/skill-patches/INDEX.md` |

---

## 5. Troubleshooting

| Symptom | Fix |
| :--- | :--- |
| Skill not appearing | Re-run `install.ps1 -Force`; confirm `~/.agents/skills/dev-team/SKILL.md` exists |
| `-Mode link` fails | Needs Administrator or Developer Mode; the script auto-falls back to copy |
| Agents stalling | Ask the Leader to `team_list_runs(status="running")` and re-dispatch stalled agents |
| Plan keeps getting rejected at G2 | Read `docs/APPROVALS.md` — the defect list is explicit |
| Want the team to stop | Ask the Leader to shut down teammates and run teardown |
