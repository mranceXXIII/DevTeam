# Template: PROGRESS-LOG.md (every agent)

> Append-only. Written **at the moment** work happens or a problem occurs (R5).
> One file per agent, in `workspace/runs/<run>/docs/progress/<agentId>-PROGRESS-LOG.md`.

```markdown
# Progress Log — <agentId>
- Run: <run slug>
- Task: <board task id>

---

### YYYY-MM-DD HH:MM — <task id> — IN PROGRESS
- Did: <what was worked on>
- Artifacts: <paths touched/produced>
- Problem encountered: none
- Remedy attempted: n/a
- Next: <next step>

---

### YYYY-MM-DD HH:MM — <task id> — BLOCKED
- Did: <what was attempted>
- Artifacts: <paths>
- Problem encountered:
  ```
  <exact error text / stack trace / failing command output>
  ```
  Context: <what was being done, inputs, environment>
- Remedy attempted: <what was tried, and the result>
- Escalation: blocked by <reason>; requires team-leader decision
- Next: await guidance

---

### YYYY-MM-DD HH:MM — <task id> — COMPLETE
- Did: <summary of completed work>
- Artifacts: <paths>
- Problem encountered: none
- Remedy attempted: n/a
- Next: hand off for verification

---

## Error tally (rolling)
| # | Error class | Occurrences | Skill patch raised? |
| :-- | :--- | :--- | :--- |
```
