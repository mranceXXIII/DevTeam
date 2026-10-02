# Template: APPROVALS.md (Gate Ledger — append only)

```markdown
# Approvals — <Project Name>
- Run: <run slug> | Owner: team-leader | Status: append-only

---

### [G1] Charter Complete — YYYY-MM-DD — APPROVED
- Gate: G1
- Submitted by: team-leader
- Artifacts: docs/PROJECT-CHARTER.md, docs/REQUIREMENTS.md, docs/ARCHITECTURE.md, docs/TECH-STACK.md, docs/CONTEXT.md
- Standard checked: reference/standards.md §1.1, §1.2
- Evidence: <FR-### count> requirements, all testable; 9 stack choices justified
- Verdict: APPROVED
- Remediation required: none
- Decided by: team-leader

---

### [G2] Plan Validation — YYYY-MM-DD — REJECTED
- Gate: G2
- Submitted by: planner-researcher
- Artifacts: docs/RESEARCH-REPORT.md, docs/SYSTEM-FLOWCHART.md, docs/PROJECT-PLAN.md
- Standard checked: reference/standards.md §3 (Research Integrity), §4 (Traceability)
- Defects:
  1. FR-017 has no workstream in PROJECT-PLAN.md
  2. SYSTEM-FLOWCHART.md missing the "expired session" error path
  3. Dependency X version cited as <vN> but source is stale (accessed <date>)
- Verdict: REJECTED
- Remediation required: resubmit with the three defects resolved
- Decided by: team-leader

---

### [G5] Verification — YYYY-MM-DD — APPROVED / REJECTED
### [G6] Legal Sign-off — YYYY-MM-DD — APPROVED / REJECTED
### [G7] Final Approval — YYYY-MM-DD — APPROVED / REJECTED
### [G8] Retrospective / Skill Evolution — YYYY-MM-DD — CLOSED
```
