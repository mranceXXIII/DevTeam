# Template: THREAT-MODEL.md (Penetration Tester)

```markdown
# Threat Model — <Project Name>
- Run: <run slug> | Owner: pentest | Version: 1 | Status: submitted
- Inputs: docs/ARCHITECTURE.md, docs/API-CONTRACT.md, docs/DATA-MODEL.md

## 1. Scope & authorization
<What is authorized to test; what is explicitly out of scope; rules of engagement.>

## 2. Assets
| Asset | Sensitivity | Where it lives |
| :-- | :--- | :--- |

## 3. Actors
| Actor | Trust level | Capabilities |
| :-- | :--- | :--- |

## 4. Trust boundaries
| Boundary | Crossing control | Weakness |
| :-- | :--- | :--- |

## 5. STRIDE analysis
| Component | Threat (S/T/R/I/D/E) | Scenario | Existing mitigation | Residual risk |
| :-- | :--- | :--- | :--- | :--- |

## 6. Attack surface
| Surface | Entry | Notes |
| :-- | :--- | :--- |

## 7. Priority attack plan
1. <highest-value hypothesis to test first>

## 8. Hand-off to assessment
<Which threats become concrete tests in SECURITY-ASSESSMENT.md.>
```
