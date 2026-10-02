# Template: UI-SPEC.md (Frontend)

```markdown
# UI Spec — <Project Name>
- Run: <run slug> | Owner: frontend | Version: 1 | Status: submitted
- Inputs: docs/ARCHITECTURE.md, docs/REQUIREMENTS.md, docs/API-CONTRACT.md

## 1. Design tokens
| Token group | Values |
| :-- | :--- |
| Typography | <display font / body font / scale> |
| Color | <palette: bg, surface, text, accent, semantic (success/warn/danger)> |
| Space | <scale> |
| Radius | <scale> |
| Motion | <durations, easings> |

## 2. Component inventory
| Component | Purpose | Variants | Reused by |
| :-- | :--- | :--- | :--- |

## 3. Screens & routes
| Screen | Route | Requirement(s) |
| :-- | :--- | :--- |

## 4. Screen details

### Screen: <name>
- Route: <route>
- Data needs: <maps to API-CONTRACT endpoints>
- States: default | loading | empty | error | success
- Interactions: <...>
- Accessibility: <keyboard order, focus, labels, contrast, ARIA>

## 5. Responsive breakpoints
| Breakpoint | Width | Layout change |
| :-- | :--- | :--- |

## 6. Accessibility plan
- Keyboard navigation: <...>
- Contrast targets: <WCAG 2.2 AA>
- Focus visibility: <...>
- Labels/semantics: <...>

## 7. Motion notes
<Where motion clarifies; where it is deliberately absent.>
```
