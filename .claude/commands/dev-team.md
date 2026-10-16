# /dev-team

Orchestrate the full DevTeam engineering agent team.

## What this does

Activates the **DevTeam Team Leader** skill, which runs a complete software engineering
department — charter, research, parallel build fleet, QA, penetration testing, legal
review, and multimedia documentation — all driven by Markdown artifacts in `workspace/runs/`.

## Usage

```
/dev-team <your request>
```

**Examples:**
```
/dev-team Build a REST API for managing inventory with auth and rate limiting
/dev-team Plan the architecture for a real-time chat application
/dev-team Review and extend the existing codebase in this directory
/dev-team Harden the security of the current project
```

## How it activates

The skill triggers on architecture, build, plan, extend, review, or harden requests.
You can also just describe what you want built — the Team Leader's description matcher
will pick it up automatically.

---

Invoke the dev-team skill and execute the user's request: $ARGUMENTS

Read `.agents/skills/dev-team/SKILL.md` first — it is the Team Leader loop. Then read
`.agents/rules.md` — it is the constitution. Execute the full workflow as defined there.
