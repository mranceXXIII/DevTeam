# Template: skill-patch.md

> Authored when an error could recur on another project. Ordered and ratified by the
> Team Leader only (R2). See `reference/skill-evolution.md`.

```markdown
# Skill Patch: <agent> — <short title>

- Date: YYYY-MM-DD
- Run: workspace/runs/<run>/
- Agent: <agentId>
- Origin: error | gate-rejection | integrity-violation | research-gap
- Recurrence risk: high | medium | low
- Status: pending | applied

## 1. What happened (verbatim)
```
<exact error text / rejection quote>
```
Context: <what the agent was doing, inputs, environment.>

## 2. Root cause
<Why it happened — trace to the missing or unclear rule. Not the symptom.>

## 3. Local fix applied
- <file:line — what changed>

## 4. Permanent skill change (the evolution)
- Target file: agents/<agent>.md | reference/<file>.md | SKILL.md
- Change type: new-rule | known-pitfall | tightened-gate | clarified-standard
- Exact markdown to add/modify:
```markdown
<the literal block to insert>
```

## 5. Verification
- Command: `<command>`
- Output: `<output proving the work is now clean>`
- Confirmation the rule now exists in the target file: <file:line>

## 6. Order & ratification
- Ordered by: team-leader on YYYY-MM-DD
- Ratified: <yes/no>
```
