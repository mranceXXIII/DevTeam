---
description: Run the DevTeam engineering agent team on your request (Team Leader orchestration with parallel specialist agents)
argument-hint: <your request>
---

# /dev-team — DevTeam Engineering Agent Team

Orchestrate the full DevTeam engineering department for the user's request: **$ARGUMENTS**

## Activation steps (in order)

1. Read the Team Leader skill: `${CLAUDE_PLUGIN_ROOT}/.agents/skills/dev-team/SKILL.md` —
   it defines the orchestration loop, phases, and gates.
2. Read the constitution: `${CLAUDE_PLUGIN_ROOT}/.agents/rules.md` — it overrides everything.
3. Read the referenced support files from the skill **only as needed** (workflow, standards,
   agent role definitions, templates) using `${CLAUDE_PLUGIN_ROOT}` as their base path.
4. Execute the full workflow as defined there. If the request targets an existing project
   in the current working directory, run the Existing-Project Analysis phase first.
5. Produce all Markdown artifacts under `./workspace/runs/` in the current project
   (create the folder structure if it does not exist).

## Notes

- If `${CLAUDE_PLUGIN_ROOT}/.agents/skills/dev-team/SKILL.md` is not readable, tell the
  user the plugin installation is incomplete and to reinstall with:
  `/plugin marketplace add mranceXXIII/DevTeam` then `/plugin install dev-team@devteam`.
- All coordination artifacts are Markdown. Code is a product; Markdown is the brain.