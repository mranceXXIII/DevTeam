# Template: EXISTING-PROJECT-ANALYSIS.md

> Authored by the Team Leader (Phase X) **before** any agent touches an existing project.
> This document is mandatory context for every spawned agent.

```markdown
# Existing-Project Analysis — <Project Name>
- Run: <run slug> | Owner: team-leader | Version: 1 | Status: submitted
- Inputs: <repo path / URL>

## 1. Repository map
```
<tree of top-level dirs/files, annotated with purpose>
```

## 2. Languages, frameworks & versions
| Layer | Tech | Version | Source of truth |
| :-- | :--- | :--- | :--- |

## 3. Entry points
| Entry point | File | Purpose |
| :-- | :--- | :--- |

## 4. Build / test / lint commands
| Action | Command | Verified? |
| :-- | :--- | :--- |
| install | | |
| build | | |
| test | | |
| lint | | |
| run | | |

## 5. Data layer & schema
<Tables/entities, migrations location, ORM/query layer.>

## 6. Auth / permission model
<How identity and authorization work today.>

## 7. External integrations
| Integration | Purpose | Config location |
| :-- | :--- | :--- |

## 8. CI/CD
<Pipeline files, stages, deploy targets, secrets handling.>

## 9. Conventions observed
- Naming: <...>
- Structure: <...>
- Tests: <...>
- Errors/logging: <...>

## 10. Tech debt & risks
| ID | Area | Debt/risk | Impact | Suggested handling |
| :-- | :--- | :--- | :--- | :--- |

## 11. How to extend safely
<The do's and don'ts for adding to this codebase without breaking it.>

## 12. Unknowns
- <what could not be determined — and the plan to resolve it>
```
