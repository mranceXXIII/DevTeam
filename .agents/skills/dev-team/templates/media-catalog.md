# Template: MEDIA-CATALOG.md + media/SEQUENCE.md (Multimedia Agent)

> Produced from the **actual built UI** (via QA's verified render environment). No mocks,
> no alterations (R8). Image order is derived from deterministic, zero-padded filenames.

```markdown
# Media Catalog — <Project Name>
- Run: <run slug> | Owner: multimedia | Version: 1 | Status: submitted
- Inputs: docs/UI-SPEC.md + QA render environment (task id: <qa task>)

## 1. Render environment
- How it was launched: `<command>`
- Base URL: <url>
- Session/auth: <how state was established — names only, never secrets>

## 2. Capture index
| IMG-## | Screen/route | State | File | Source (UI-SPEC ref) | Timestamp |
| :-- | :--- | :--- | :--- | :--- | :--- |
| IMG-001 | <route> | default | media/IMG-001-<screen>-default.png | UI-SPEC §4 Screen: <name> | YYYY-MM-DD HH:MM |

## 3. Ordered sequence (start → finish)
1. IMG-001 — <screen> — default — <what the user sees>
2. IMG-002 — <screen> — <state> — <what changes>
3. IMG-XXX — <end state>

## 4. Gaps / unreachable screens
| Screen | Why unreachable | Reported to |
| :-- | :--- | :--- |

## 5. Integrity note
<Statement: all images are unaltered renders of the built UI at commit <sha>; none are
fabricated or edited.>
```

---

```markdown
# Sequence Manifest — <Project Name>
- Run: <run slug> | Owner: multimedia

Ordered walkthrough (reproducible from MEDIA-CATALOG.md §2 alone):

1. media/IMG-001-<screen>-default.png
2. media/IMG-002-<screen>-loading.png
3. media/IMG-003-<screen>-empty.png
4. media/IMG-004-<screen>-error.png
5. media/IMG-005-<screen>-success.png
```
