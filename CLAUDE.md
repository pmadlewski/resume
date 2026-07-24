# Agent instructions — pm-resume

Personal Typst resume for Paweł Madlewski. Single source file: `resume.typ` → `resume.pdf`.

Human-facing setup (install, watch, knobs) lives in `README.md`. This file is the agent handoff.

## Quick start

```bash
# Prerequisites (once): brew install typst && brew install --cask font-fontawesome
typst compile resume.typ resume.pdf
# or: npm run export
```

After any content or layout change, recompile the PDF before considering the task done.

## Layout of the repo

| File | Role |
| --- | --- |
| `resume.typ` | All content + local template overrides |
| `resume.pdf` | Compiled output — keep in sync with `.typ` |
| `photo.jpg` | Optional headshot (still present even when hidden) |
| `package.json` | `npm run export` / `npm run watch` wrappers |
| `README.md` | Human setup docs |

## Editing rules

1. **Edit `resume.typ` only** for resume content. Do not invent experience, employers, dates, or metrics — rewrite existing facts, or ask before adding new ones.
2. **Bold tools/tech** in bullets with `*dbt*`, `*Snowflake*`, etc.
3. **Add a job** by copying an existing `#work(...)` block plus its bullet list.
4. **Do not remove or “simplify away” the local overrides** near the top of `resume.typ`:
   - custom `work()` — underlines title/company; adds 18pt gap only between sibling jobs (via `seen-work` state)
   - custom `extracurriculars` — no blanket `strong()`; bold only what the author marks with `*...*`
   - `#show heading.where(level: 2)` — navy underline + resets `seen-work`
5. **Tunable knobs** (top of `resume.typ`): `color-*` palette, `banner-about-gap` (typical `0pt`–`30pt`).
6. **Photo**: currently `show-photo: false`. Toggle that flag; leave `photo:` / `photo-size:` in place unless asked to purge. README documents the same.

## Section order (current)

1. About Me (banner + template header)
2. Work Experience
3. Side Projects
4. Technical Skills
5. Education
6. Awards

Do not reorder sections unless the user asks.

## Template

Uses `@preview/vivid-cv:0.1.1`. Prefer the local `work` / `extracurriculars` / heading overrides above the package defaults. Parameter reference: https://typst.app/universe/package/vivid-cv

## Git

Commit only when the user explicitly asks. Do not push unless asked.
