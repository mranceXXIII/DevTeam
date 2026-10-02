# Template: API-CONTRACT.md (Backend)

```markdown
# API Contract — <Project Name>
- Run: <run slug> | Owner: backend | Version: 1 | Status: submitted
- Inputs: docs/ARCHITECTURE.md, docs/REQUIREMENTS.md

## 1. Conventions
- Versioning: <scheme>
- Auth: <scheme>
- Pagination: <scheme>
- Error shape: <json shape>
- Rate limits: <policy>
- Idempotency: <header/behavior>

## 2. Endpoints

### `<METHOD> <path>`
- Purpose: <...>
- Auth: <required role/scope>
- Request:
  ```json
  { "field": "type" }
  ```
- Response (2xx):
  ```json
  { "field": "type" }
  ```
- Status codes: 200 <...>, 400 <...>, 401 <...>, 403 <...>, 404 <...>, 409 <...>, 500 <...>
- Idempotent: yes | no
- Maps to: FR-###
- Notes: <...>

## 3. Error taxonomy
| Code | Meaning | When |
| :-- | :--- | :--- |

## 4. Schema definitions
<Shared objects/entities referenced above.>

## 5. Change log
| Version | Date | Change |
| :-- | :--- | :--- |
```
