# Template: TEST-PLAN.md (QA)

```markdown
# Test Plan — <Project Name>
- Run: <run slug> | Owner: qa | Version: 1 | Status: submitted
- Inputs: docs/REQUIREMENTS.md, docs/API-CONTRACT.md, docs/UI-SPEC.md, docs/SYSTEM-FLOWCHART.md

## 1. Scope
<What is tested and what is explicitly not.>

## 2. Test levels
| Level | Tooling | Coverage target |
| :-- | :--- | :--- |
| Unit | | |
| Integration | | |
| End-to-end | | |
| Acceptance | | |

## 3. Environment
<How the system is launched, base URL, data seeding, credentials (names only).>

## 4. Entry / exit criteria
- Entry: <build runnable, contract frozen>
- Exit: <all Must tests pass, no open Critical/High>

## 5. Test cases
| TC-## | Maps FR-### | Steps | Expected | Level |
| :-- | :--- | :--- | :--- | :--- |
| TC-001 | FR-001 | <steps> | <expected> | acceptance |

## 6. Test data strategy
<Fixtures, seeding, isolation, cleanup.>

## 7. Regression set
<Cases that must run on every change.>

## 8. Boundary coverage checklist
- [ ] empty  - [ ] single  - [ ] many  - [ ] max  - [ ] malformed  - [ ] unauthorized  - [ ] concurrent

## 9. Out of scope
- <...>
```
