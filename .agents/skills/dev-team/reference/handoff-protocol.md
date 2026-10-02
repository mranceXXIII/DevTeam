# Handoff Protocol — The Agent Contract

Rule R9. Every piece of work moves between agents through an explicit, complete handoff.
A handoff missing any required field is returned unprocessed.

---

## 1. Outbound Handoff (Leader → Agent)

The Team Leader gives each spawned agent exactly this package:

```text
ROLE:            <verbatim contents of agents/<agent>.md>
RUN:             workspace/runs/<run>/
MISSION:         <one sentence — the outcome this agent must produce>
WORKSTREAM:      <the PROJECT-PLAN.md workstream id + definition-of-done>
INPUTS:          <exact artifact paths this agent MUST read first>
STANDARDS:       reference/standards.md (§2 invariants for this agent) + reference/documentation-contract.md
DELIVERABLES:    <exact .md paths + code paths this agent must produce>
BOUNDARIES:      <what this agent must NOT touch>
BOARD TASK:      <team_task id>
REPORT BACK:     the Inbound Handoff block below
```

**Rules for the Leader:**
- Pass the role file **verbatim**. Never paraphrase an agent's own rules.
- Give only the inputs that agent needs — scope discipline starts with context discipline.
- Every deliverable is a named path, not a description.

---

## 2. Inbound Handoff (Agent → Leader)

Every agent, on completion **or** blockage, returns exactly this:

```markdown
## Handoff — <agentId> — <task id> — <status: complete | blocked | partial>

### 1. Inputs received
- <path> — how it was used

### 2. Work performed
- <what was actually done, in order>

### 3. Artifacts produced
- <path> — one-line description
- <path> — one-line description

### 4. Standards checked
- reference/standards.md §<n> (<name>) — result: PASS/FAIL + evidence
- reference/documentation-contract.md — result: PASS/FAIL

### 5. Verification evidence
- `<exact command>` → `<key output>`  (or: file:line reference, or screenshot path)

### 6. Problems encountered
- <exact error + context + remedy attempted>  (or: "none")

### 7. Integrity self-check
- Did I violate any invariant in standards.md §2? <no | yes: which + why>

### 8. Open risks / assumptions
- <risk> — impact — suggested mitigation

### 9. Exact next action (for the Leader)
- <what the Leader must do next: approve, route to X, request remediation>
```

---

## 3. Validation by the Leader

Accept a handoff only if **all** hold:
1. Every §3 artifact path exists on disk.
2. §4 standards checks are specific (section numbers, not "looks fine").
3. §5 evidence is concrete and reproducible (R3).
4. §6 is present — "none" is allowed, blank is not (R5).
5. §7 self-check is answered.
6. §9 names a concrete next action.

Any failure → return the handoff with the specific missing field, do not partially accept.

---

## 4. Peer Handoffs (agent → agent)

When work must flow directly (e.g. Frontend needs the API contract from Backend),
the same structure applies with `MISSION` replaced by the specific request. Peer
handoffs still go through the board (`team_task`) so the Leader retains visibility.

**Frontend ↔ Multimedia ↔ QA channel** (the only sanctioned direct chain):
- Frontend publishes `UI-SPEC.md` (screens, states, routes, data needs) + a runnable UI.
- QA provides Multimedia a **verified render environment** (how to launch + reach each screen).
- Multimedia captures/renders each screen and logs it in `MEDIA-CATALOG.md`.
- Multimedia never invents UI; if a screen can't be reached, it reports that to QA.

---

## 5. Handoff Log

The Leader appends every accepted handoff summary to `APPROVALS.md` (or a
`HANDOFF-LOG.md` when volume is high) so the run has a single readable timeline:
`<timestamp> | <agent> | <task> | <status> | <artifact link>`.
