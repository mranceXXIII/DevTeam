# Template: TEST-REPORT.md (QA)

```markdown
# Test Report — <Project Name>
- Run: <run slug> | Owner: qa | Version: 1 | Status: submitted
- Inputs: docs/TEST-PLAN.md, build under test: <commit/sha>

## 1. Execution summary
| Metric | Value |
| :-- | :--- |
| Total cases | |
| Passed | |
| Failed | |
| Skipped/blocked | |
| Requirement coverage | <n>/<total> Must requirements |

## 2. Executed cases
| TC-## | Result | Evidence (command + output) | Duration |
| :-- | :--- | :--- | :--- |
| TC-001 | PASS | `<cmd>` → `<output>` | 0.4s |

## 3. Defects found
| DEF-## | Severity | Title | Steps to reproduce | Evidence | Related FR |
| :-- | :--- | :--- | :--- | :--- | :--- |

## 4. Requirement coverage
| FR-### | Covered by | Status |
| :-- | :--- | :--- |

## 5. Skipped / blocked tests (with risk) — REQUIRED SECTION
| TC-## | Reason | Residual risk | Owner |
| :-- | :--- | :--- | :--- |

## 6. Re-verification after fixes
| DEF-## | Fixed by | Retested? | Result | Evidence |
| :-- | :--- | :--- | :--- | :--- |

## 7. Verdict to Team Leader
<Can this pass G5? State explicitly and cite any blocker.>
```
