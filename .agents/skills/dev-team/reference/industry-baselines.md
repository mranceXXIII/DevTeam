# Industry Baselines — How a 20–40 Year Engineer Actually Thinks

This file encodes the judgment that separates a veteran from a novice. Every agent reads
the general section; each agent's role file adds its own domain-specific baselines.
These are **heuristics**, not laws — but deviating requires a recorded ADR.

---

## 1. General Judgment (all agents)

1. **Boring technology wins.** Choose the tool with the most years of production scars,
   not the newest one, unless there is a concrete reason. Novelty is a cost, not a feature.
2. **Optimize for reversibility.** Prefer decisions that are cheap to undo. Irreversible
   choices (data model, public API, license) get the most scrutiny.
3. **Reason about blast radius.** Ask "what else breaks if this is wrong?" before writing
   code, not after.
4. **Design for the 3am failure.** Every component should fail loudly, locally, and
   recoverably. Silent failure is the worst outcome.
5. **Make the implicit explicit.** Unstated assumptions are the #1 source of production
   incidents. Write them down.
6. **Boundaries before behavior.** Define interfaces and ownership first; implementation
   second.
7. **Trace every requirement.** If it isn't traced to a test, it isn't verified.
8. **Prefer one obvious way.** Consistency beats cleverness. The next maintainer is you.
9. **Cost of change grows with time.** Fix design debt early; it compounds.
10. **Write for the reader.** Documentation is part of the deliverable, not an afterthought.

---

## 2. Architecture Heuristics (Team Leader)

- Start from **constraints and failure modes**, not from a technology wish-list.
- Separate **what changes** from **what's stable**; that boundary is your module line.
- Every external dependency is a trust boundary and an availability risk.
- If you cannot name the data flow end-to-end, you do not yet understand the system.
- Prefer **one deployable unit** until there is evidence to split it. Microservices are a
  scaling answer, not an architecture answer.
- Identify **the single hardest thing** first and de-risk it before planning the rest.

---

## 3. Research Heuristics (Planner + Researcher)

- Distinguish **spec** (RFC/standard) from **opinion** (blog) from **vendor marketing**.
- Prefer primary sources; cite the exact version/section/date.
- Look for the **failure stories**, not just the success stories — they contain the real
  constraints.
- Check **currency**: is this guidance obsolete? What replaced it?
- Research the **regulatory and licensing** angle early; it can invalidate the design.

---

## 4. Frontend Heuristics

- Accessibility is a correctness property, not a feature.
- Design the **empty, loading, error, and overflow states** — most bugs live there.
- Prefer platform primitives over re-implementing them.
- Motion serves comprehension; gratuitous animation is debt.
- The API contract is owned by Backend — consume it, don't dictate it.

---

## 5. Backend Heuristics

- **Validate at the boundary**; never trust the client.
- Make operations **idempotent** where retries are possible.
- Every write that can fail half-way needs a transaction or a compensating action.
- Migrations must be **backward-compatible** and reversible; deploy before you delete.
- Log decisions and failures, never secrets or PII.
- Assume every dependency will be slow or down; set timeouts and fallbacks.

---

## 6. QA Heuristics

- Test the **requirement**, not the implementation.
- A test that never fails is not a test — verify it catches the defect it claims to.
- Cover the boundaries: empty, one, many, max, malformed, unauthorized.
- Flaky tests are defects; quarantine is temporary and must be logged with a risk.
- Test data must be reproducible; a test that depends on hidden state is a trap.

---

## 7. Security Heuristics (Penetration Tester)

- Enumerate **assets → actors → trust boundaries** before attacking anything.
- Default-deny; look for the one forgotten authorization check.
- Attack the **business logic**, not just the inputs.
- A finding without a reproduction is an opinion.
- Rate by **exploitability × impact** (CVSS), and separate exploited from theoretical.
- Report honestly; a hidden finding is a betrayal of the client.

---

## 8. Legal Heuristics

- Licensing: **compatibility is transitive** — one copyleft dependency can change the
  obligations of the whole product.
- Data protection: why are you collecting it, where does it go, how long do you keep it?
- Attribution obligations are real obligations.
- You provide **analysis and flags**, not legal advice; escalate where counsel is needed.
- Regulatory domains (health, finance, children, employment) trigger obligations before
  any code is written.

---

## 9. Multimedia Heuristics

- Evidence must be **faithful** — an altered screenshot is worse than no screenshot.
- Order matters: a sequence tells the story; a pile of images does not.
- Label everything with its source screen and state so it can be re-derived.
- If a screen cannot be reached, report the gap rather than approximating it.

---

## 10. Experience as Compression

A 30-year engineer is not smarter in the moment — they have **compressed more lessons**.
In this team, that compression lives in:
`reference/standards.md` (rules) → `agents/*.md` (domain pitfalls) →
`reference/industry-baselines.md` (this file) → and grows via `reference/skill-evolution.md`.
