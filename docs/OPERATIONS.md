# DevTeam Operations Guide

How the department actually runs, step by step, for a human reader.
(The machine-facing procedure is `.agents/skills/dev-team/reference/workflow.md`.)

---

## 1. Roles at a glance

| Role | Analogy | Authority |
| :--- | :--- | :--- |
| Team Leader | Engineering director / principal architect | **Only** approver; owns gates and skill evolutions |
| Planner + Researcher | Staff analyst + tech researcher | Owns the evidence base and the plan |
| Frontend Developer | Senior product engineer (UI/UX) | Owns the interface |
| Backend Developer | Principal systems engineer | Owns APIs, data, integrations |
| QA Tester | Test architect | Owns verification verdict |
| Penetration Tester | Offensive security engineer | Owns the security verdict |
| Legal Agent | Compliance/licensing analyst | Owns the legal verdict |
| Multimedia Agent | Visual documentation specialist | Owns the visual evidence set |

Each agent behaves as an engineer with **20–40 years** of experience — which in practice
means: they compress past lessons into rules (see `reference/industry-baselines.md`) and
they never repeat a documented mistake (see `reference/skill-evolution.md`).

---

## 2. Operating phases

| Phase | Name | Who | Output |
| :-- | :--- | :--- | :--- |
| X | Existing-Project Analysis | Leader | `EXISTING-PROJECT-ANALYSIS.md` |
| 1 | Charter | Leader | charter set (7 docs) |
| 2 | Recon & Research | Planner+Researcher | research, flowchart, plan |
| 3 | Plan Validation (**G2**) | Leader | APPROVED / REJECTED |
| 4 | Parallel Build | FE, BE, QA, PT, Legal, MM | code + per-agent artifacts |
| 5 | Verification (**G5**) | QA + Pentest (+FE/BE fixes) | test + security reports |
| 6 | Legal Sign-off (**G6**) | Legal | legal review |
| 7 | Final Approval (**G7**) | Leader | approval ledger |
| 8 | Retrospective (**G8**) | Leader + all | skill patches |

Gate definitions and checklists: `reference/workflow.md` §3.

---

## 3. The critical control: Gate G2

This is where the design's quality is decided. The Leader compares the Planner's research
against the Leader's own standards. If they disagree — stale versions, uncited claims, a
flowchart missing an error path, a requirement with no workstream — the plan is
**rejected and returned**. Only a matching plan reaches the build fleet. This single gate
is what prevents the fleet from parallelizing garbage at high speed.

---

## 4. Parallelism model

Agents run in **waves**, not as a single chain:

- **Wave 1:** Frontend, Backend, Legal, QA (planning), Pentest (threat modeling) — all at once.
- **Wave 2:** QA (execution), Pentest (dynamic), Multimedia — after the build lands.
- **Wave 3:** Fix + re-verify loops, then legal sign-off and final approval.

Independent agents are dispatched with `runMode: "async"` and collected with
`team_await_runs` — the mechanical form of "different terminals, same time"
(see `reference/orchestration-tools.md`).

---

## 5. Documentation discipline

- Every artifact follows `reference/documentation-contract.md`.
- Every agent keeps a `PROGRESS-LOG.md` recording progress **and problems encountered**.
- Every handoff follows the seven-part structure in `reference/handoff-protocol.md`.
- Approvals are append-only in `APPROVALS.md`.

---

## 6. The evolution mechanism

When an error occurs:

1. It is logged with the exact error text.
2. If it could recur, the Leader orders a **skill patch**.
3. The responsible agent updates its own skill file (new rule / pitfall / tightened gate).
4. The affected work is re-run to prove the rule works.
5. The patch is registered in `workspace/skill-patches/INDEX.md`.

Over time, this makes the team measurably better: the same class of failure cannot
recur, because it is now forbidden by a written rule.

---

## 7. Definition of done (whole run)

A run is done when:

- [ ] Every gate G1–G7 is recorded in `APPROVALS.md` with evidence.
- [ ] Every agent has produced its artifacts and a progress log with problems recorded.
- [ ] QA reports requirement coverage with no hidden skips.
- [ ] Pentest reports no unfixed Critical/High finding.
- [ ] Legal has signed off (or listed exact conditions).
- [ ] Multimedia has an ordered, cataloged image sequence of the built UI.
- [ ] Every recurrence-capable error produced a skill patch (G8).
