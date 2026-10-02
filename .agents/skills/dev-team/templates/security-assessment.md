# Template: SECURITY-ASSESSMENT.md (Penetration Tester)

```markdown
# Security Assessment — <Project Name>
- Run: <run slug> | Owner: pentest | Version: 1 | Status: submitted
- Inputs: docs/THREAT-MODEL.md, build under test: <commit/sha>

## 1. Scope & authorization
<Confirmed authorization, target(s), timeframe, rules of engagement.>

## 2. Method
<Static analysis, dynamic testing, manual review, tooling used.>

## 3. Findings
| ID | Title | CVSS | Severity | Component | Reproduction | Evidence | Remediation |
| :-- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| FIND-001 | | 0.0 | Critical/High/Medium/Low | | <steps> | <artifact/command> | <fix> |

### FIND-001 — <title>
- Type: exploited | theoretical
- Vector: <AV/AC/PR/UI/S/C/I/A>
- Impact: <...>
- Reproduction: <step by step>
- Evidence: <screenshot/log/command output path>
- Remediation: <specific fix>

## 4. Exploited vs theoretical
| Exploited | Theoretical |
| :-- | :--- |

## 5. Retest status
| FIND-## | Fix ref | Retested | Result | Evidence |
| :-- | :--- | :--- | :--- | :--- |

## 6. Residual risk statement
<What remains after remediation, and the accepted risk level.>

## 7. Out of scope
<Explicitly not tested, and why.>

## 8. Verdict to Team Leader
<Blocks G5 if any unfixed Critical/High remains. State explicitly.>
```
