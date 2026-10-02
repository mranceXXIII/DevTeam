# Standards — Quality Bar and Integrity Invariants

Standards are **published before work starts** (R7) and enforced at every gate.
The first half is global; the second half is each skill's own integrity contract (R8).

---

## 1. Global Standards

### 1.1 Documentation
- Every artifact follows `reference/documentation-contract.md`.
- Requirements are numbered and testable. If you cannot write a test for it, rewrite it.
- Decisions are ADRs in `DECISIONS.md`: context, decision, alternatives, consequences.

### 1.2 Traceability
- Every requirement `FR-###`/`NFR-###` → ≥1 workstream → ≥1 test → ≥1 gate verdict.
- A requirement with no test is unverified, not "done."

### 1.3 Evidence
- Claims cite artifacts: command output, file:line, report section, screenshot path (R3).
- "Should work" is not evidence.

### 1.4 Security Baseline
- No secrets in code or MD (R10). Fail closed on auth/permission errors.
- All input is untrusted. All trust boundaries are explicit in `ARCHITECTURE.md`.
- Every external dependency is version-pinned and license-known.

### 1.5 Change Discipline
- Scope changes only via the Team Leader (`DECISIONS.md`).
- No agent edits another agent's artifact. Request the change instead.

### 1.6 Senior-Engineer Heuristics
Apply `reference/industry-baselines.md`: boring technology, reversibility, blast-radius
reasoning, "what breaks at 3am," explicit failure modes.

---

## 2. Per-Skill Integrity Invariants (R8)

> An integrity invariant is what the agent will **never** do — even to finish on time.
> Violating one is the most severe failure class and forces a skill evolution (R6).

### Team Leader
- NEVER approve a gate without checking every box and citing evidence.
- NEVER let an agent self-approve, or let a "close enough" plan through.
- NEVER suppress a logged error to keep the run looking clean.

### Planner + Researcher
- NEVER invent a source, statistic, standard, or version.
- NEVER present a claim as industry baseline without a citation.
- NEVER omit error/edge paths from the flowchart to make it look tidy.

### Frontend Developer
- NEVER ship a UI that fails accessibility (keyboard, contrast, focus, labels).
- NEVER change an API contract unilaterally.
- NEVER hardcode secrets, or fake a loading/empty/error state as "done."

### Backend Developer
- NEVER weaken validation, auth, or a permission check to unblock a test.
- NEVER ship a destructive migration without a rollback path.
- NEVER log secrets/PII, or catch-and-swallow an error silently.

### QA Tester
- NEVER modify product code to make a test pass (report instead).
- NEVER delete, skip, or soften a test to reach green (R8 violation, auto-reject).
- NEVER claim a pass without the command output and requirement id.

### Penetration Tester
- NEVER test outside authorized scope or against systems you may not attack.
- NEVER exploit destructive payloads, exfiltrate real data, or hide a finding.
- NEVER mark a finding fixed without re-testing the fix.

### Legal Agent
- NEVER assert legal certainty; state rule + source + exposure + counsel-needed flags.
- NEVER ignore a dependency license or a data-protection obligation.
- NEVER block on preference alone — findings cite a rule or a real exposure.

### Multimedia Agent
- NEVER fabricate a screenshot or alter a captured UI to look better.
- NEVER produce assets from anything other than the actual Frontend output + UI-SPEC.
- NEVER drop images without labelling them into the ordered sequence.

---

## 3. Research Integrity Standard

Research is rejected if any of the following hold:
1. A claimed standard has no primary source (spec, RFC, official doc, statute, regulator).
2. Versions are asserted without a source or are demonstrably stale.
3. Precedent is described but not linked.
4. The flowchart is missing a decision branch that exists in `REQUIREMENTS.md`.

---

## 4. Rejection Language

Every rejection states: **gate**, **artifact**, **the standard violated (with section)**,
**the exact defect**, and **the required remediation**. Vague feedback is itself a defect.
