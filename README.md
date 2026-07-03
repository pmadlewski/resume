# pm-resume

Personal resume built with [Typst](https://typst.app) using the [`vivid-cv`](https://typst.app/universe/package/vivid-cv) template.

## Prerequisites

Install once via Homebrew:

```bash
brew install typst
brew install --cask font-fontawesome
```

Font Awesome is needed for the contact icons (phone, location, email, LinkedIn). Without it those glyphs render as empty boxes.

## Workflow

```bash
# Export to PDF
typst compile resume.typ resume.pdf

# Live preview — auto-recompiles on every save
typst watch resume.typ resume.pdf
```

Or via npm scripts:

```bash
npm run export   # same as: typst compile resume.typ resume.pdf
npm run watch    # same as: typst watch resume.typ resume.pdf
```

The first compile downloads the `@preview/vivid-cv` and `@preview/fontawesome` packages automatically. Subsequent compiles are fully offline.

## Photo

The resume expects a square headshot named `photo.jpg` in the repo root. Replace it with your own to swap the photo. To hide the photo entirely, set `show-photo: false` in the `#show: resume.with(...)` block of `resume.typ`.

## Editing

- **Content** lives inline in `resume.typ`
- **Highlight tools** in bullets by wrapping them in `*`: e.g. `*Python*`, `*BigQuery*`, `*dbt*` — they render bold
- **Add a new job** by copying a `#work(...)` block plus its bullets
- **Change colors** via the color palette at the top of `resume.typ` (`color-name`, `color-heading`, `color-dark`, `color-light`)
- **Adjust the gap between the banner and About Me** via the `banner-about-gap` knob (also top of file); typical range `0pt`–`30pt`

Full parameter reference: [vivid-cv on Typst Universe](https://typst.app/universe/package/vivid-cv).
