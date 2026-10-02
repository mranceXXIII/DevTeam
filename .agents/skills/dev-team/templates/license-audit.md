# Template: LICENSE-AUDIT.md (Legal Agent)

> The machine-generated license inventory: every dependency, its license, and any flagged
> row. Captured with the raw command so it is reproducible (R3). Feeds
> `LEGAL-COMPLIANCE-REVIEW.md` §2 and gate **G6**.

```markdown
# License Audit — <Project Name>
- Run: <run slug> | Owner: legal | Version: 1 | Status: submitted
- Inputs: docs/TECH-STACK.md, dependency manifests (package-lock.json / requirements.txt / etc.)

## 1. Method
- Tool/command used: `<exact command>` (e.g., `npx license-checker --summary`, `pip-licenses`, `cargo license`)
- Date captured: YYYY-MM-DD

## 2. Direct dependencies
| Dependency | Version | License | Compatible with project license? | Obligation | Flag |
| :-- | :--- | :--- | :--- | :--- | :--- |
| <dep> | <version> | <MIT/Apache-2.0/GPL-3.0/...> | yes / no / conditional | <attribution / notice / copyleft> | — |

## 3. Transitive dependencies of concern
| Dependency | Introduced by | License | Concern | Action |
| :-- | :--- | :--- | :--- | :--- |

## 4. Flagged rows (REQUIRED SECTION — an empty table is allowed, omitting it is not)
| Dependency | License | Issue | Remediation |
| :-- | :--- | :--- | :--- |

## 5. Verdict
<Compatibility statement: what is cleared, what is conditional, what blocks gate G6.
Verify license claims against the primary source (SPDX, the license text, the project's
LICENSE file), not a blog summary.>
```
