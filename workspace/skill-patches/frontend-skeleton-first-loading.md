# Skill Patch: frontend — skeleton-first loading states

- Date: 2026-10-12
- Run: mssql-ticket-dashboard (workspace/runs/2026-10-09-incharge-summary)
- Agent: frontend
- Origin: user-request evolution (professional loading UX), ratified by team-leader
- Recurrence risk: high (every frontend project has loading states)
- Status: applied

## 1. What happened (verbatim)
```
"in the loading time, make it a skeleton loading time instead of traditional
loading so that it would look more professional, and update the skills in the
front-end agent so that whenever i want to create a project it will do the
setup of the loading time"
```
Context: mssql-ticket-dashboard run. The frontend agent had shipped a spinner-based
boot state and a spinner-based ticket-list loading state; the user asked for
skeleton-first loading and for the change to become a permanent part of the
frontend skill for every future project.

## 2. Root cause
The Frontend Developer skill required "all states designed" but never specified the
loading-state pattern, so agents defaulted to the platform-default spinner.

## 3. Local fix applied
- client/src/components/PageSkeleton.jsx (new): full-page boot skeleton mirroring the
  real layout (filters bar, summary cards, chart blocks)
- client/src/components/TicketTable.jsx: spinner replaced by a column-shaped
  skeleton table (12 rows, varied widths)
- client/src/styles.css: token-driven skeleton color; light + dark theme system
  (header moon/sun toggle, localStorage persistence, prefers-color-scheme default,
  chart CSS overrides for dark mode)
- client/src/components/Loading.jsx: removed (dead code after the migration)

## 4. Permanent skill change (the evolution)
- Target file: agents/frontend-developer.md
- Change type: new-rule (+ integrity rule + known pitfall)
- Exact markdown to add/modify:
```markdown
## Loading States (skeleton-first, mandatory)

Every asynchronous data-loading surface renders a **shape-matched skeleton
placeholder** — never a spinner as the primary loading state.
(boot = full-page skeleton mirroring the real layout; per-surface skeletons with
role="status" + aria-label; token colors; pulse honoring prefers-reduced-motion;
layout-stable swap to content; theme-aware; spinners only inside small buttons.)
```
Plus the integrity rule "NEVER ship a page-level or card-level spinner as the
primary loading state; every async surface gets a shape-matched skeleton." and the
pitfall "A spinner-only loading state that hides the page structure instead of a
shape-matched skeleton."

## 5. Verification
- Command: `npm run build --prefix client` → EXIT=0 (vite 5.4.21)
- Output: DOM audits on the live app — boot skeleton (5 shape-matched cards +
  2 chart blocks, role="status") during load; skeleton table rows in the ticket
  modal; dark and light themes both render skeletons correctly. Screenshots:
  media/15-dark-mode.png, media/16-light-mode.png, media/17-boot-skeleton.png.
- Confirmation the rule now exists in the target file: agents/frontend-developer.md,
  "Loading States (skeleton-first, mandatory)" section + R8 rule + pitfall.
- Companion skill promoted to agent-spec:
  .agents/skills/frontend-skeleton-loading/SKILL.md (durable across projects).

## 6. Order & ratification
- Ordered by: team-leader on 2026-10-12
- Ratified: yes
