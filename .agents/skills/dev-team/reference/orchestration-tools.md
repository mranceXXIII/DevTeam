# Orchestration Tools — Running Agents Simultaneously

This file maps the human concept ("a team working in parallel, each in its own terminal")
onto the platform's multi-agent mechanics. The Team Leader is the main session; every
other agent is an independent worker.

---

## 1. Concept → Mechanism

| Concept | Mechanism |
| :--- | :--- |
| "Open a terminal for an agent" | `team_spawn_teammate` |
| "Assign work to that terminal" | `team_run_task` |
| "Run them at the same time" | `team_run_task ... runMode: "async"` ×N, then `team_await_runs` |
| "Shared work board / Kanban" | `team_task` (create/claim/complete/block) |
| "Mission log / audit trail" | `team_mission_log` |
| "Team status" | `team_status`, `team_list_runs` |
| "Converge & sign off" | `team_create_outcome` → `team_attach_outcome_fragment` → `team_review_outcome_fragment` → `team_finalize_outcome` |
| "Mail a specific agent" | `team_send_message` |
| "Broadcast to all" | `team_broadcast` |
| "Shut a terminal down" | `team_shutdown_teammate` |

---

## 2. Spawning the Fleet

Spawn each agent **once** per run, with its role file verbatim (see
`reference/handoff-protocol.md` §1).

```text
team_spawn_teammate(agentId="frontend",    rolePrompt="<contents of agents/frontend-developer.md>")
team_spawn_teammate(agentId="backend",     rolePrompt="<contents of agents/backend-developer.md>")
team_spawn_teammate(agentId="qa",          rolePrompt="<contents of agents/qa-tester.md>")
team_spawn_teammate(agentId="pentest",     rolePrompt="<contents of agents/penetration-tester.md>")
team_spawn_teammate(agentId="legal",       rolePrompt="<contents of agents/legal-agent.md>")
team_spawn_teammate(agentId="multimedia",  rolePrompt="<contents of agents/multimedia-agent.md>")
```

`planner-researcher` is spawned for Phase 2; `team-leader` is the main session itself.

---

## 3. Board Setup (before dispatch)

Create one task per workstream so progress is visible platform-wide:

```text
team_task(action="create", title="FE: build UI for <feature>", description="<workstream + DoD + deliverable paths>", assignee="frontend")
team_task(action="create", title="BE: implement API for <feature>", description="...", assignee="backend")
team_task(action="create", title="QA: plan + execute verification", description="...", assignee="qa")
team_task(action="create", title="PT: threat model + assessment", description="...", assignee="pentest")
team_task(action="create", title="LG: license + privacy review", description="...", assignee="legal")
team_task(action="create", title="MM: capture + sequence UI evidence", description="...", assignee="multimedia", dependsOn=["<qa task id>"])
```

Use `dependsOn` to encode ordering (e.g. Multimedia depends on QA's render environment).

---

## 4. Parallel Dispatch (the key step)

Fire independent agents together, then wait:

```text
team_run_task(agentId="frontend", task="<full mission, see handoff protocol>", runMode="async", taskId="<fe task>")
team_run_task(agentId="backend",  task="...", runMode="async", taskId="<be task>")
team_run_task(agentId="legal",    task="...", runMode="async", taskId="<lg task>")
team_run_task(agentId="qa",       task="...", runMode="async", taskId="<qa task>")
team_run_task(agentId="pentest",  task="...", runMode="async", taskId="<pt task>")

team_await_runs()                  # blocks until all active async runs resolve
team_list_runs(status="running")   # inspect anything still going
```

**Do not** use `runMode: "sync"` for independent agents — that serializes the fleet and
defeats the design. Use `sync` only for a single dependent step you need immediately.

Agents that genuinely depend on others (Multimedia on QA, QA execution on the build) are
dispatched in a **second wave** after the first wave's `team_await_runs`.

---

## 5. Monitoring

```text
team_status()                       # roster + task counts + mailbox stats
team_list_runs(agentId="backend")   # a single agent's run history
team_read_mailbox(unreadOnly=true)  # messages agents sent the Leader
```

Append milestone events to the mission log so the run has an auditable narrative:

```text
team_mission_log(kind="progress", summary="G2 plan validation APPROVED",
                 evidence=["docs/APPROVALS.md#g2"], nextAction="dispatch build fleet")
team_mission_log(kind="blocked",  summary="BE blocked: schema ambiguity in FR-014", taskId="<be task>")
team_mission_log(kind="decision", summary="Chose Postgres over MySQL (ADR-003)",
                 evidence=["docs/DECISIONS.md#adr-003"])
team_mission_log(kind="done",     summary="G7 final approval granted", evidence=["docs/APPROVALS.md#g7"])
```


---

## 6. Convergence and Sign-off

For a run that must converge on a formal decision:

```text
team_create_outcome(title="Release <run>",
                    requiredSections=["current_state","boundary_analysis","interface_proposal"])
team_attach_outcome_fragment(outcomeId="...", section="current_state", content="<fragment>", sourceRunId="<run>")
team_review_outcome_fragment(fragmentId="...", approved=true)
team_finalize_outcome(outcomeId="...")
```

Use the **default** `requiredSections` unless the user asks otherwise.

---

## 7. Failure Handling

| Situation | Action |
| :--- | :--- |
| A run fails | `team_list_runs(status="failed")`, read mailbox, re-dispatch that agent only |
| An agent blocks | Amend the plan in `DECISIONS.md`, then re-dispatch |
| An agent goes off-plan | Stop it, `team_send_message` the correction, re-run with tightened scope |
| Repeated failure | Trigger a **skill evolution** (`reference/skill-evolution.md`) before retrying |
| Runaway/idle agent | `team_cancel_run(runId=...)` then re-scope |

---

## 8. Teardown

After G7 and the retrospective:

```text
team_shutdown_teammate(agentId="frontend", reason="run complete")
# ...for each agent
team_cleanup()
```

Do not leave teammates running between runs.
