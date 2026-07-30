# LaTeX Template

Single-page resume template.

## Setup

1. **Use this template** on GitHub, or clone it:
   ```bash
   git clone <repo-url> && cd <repo-name>
   ```

2. **Edit `resume.tex`** — replace all placeholder text (`Your Name`, `your.email@example.com`, etc.) with your information.

3. **Build the PDF:**
   ```bash
   pdflatex resume.tex
   ```

## Structure

```
├── resume.tex                  # Main resume
├── cv/
│   └── example_cover_letter.tex  # Cover letter template
├── .gitignore                  # Ignores LaTeX build artifacts
└── README.md
```

## Cover Letters

Copy and rename the example:

```bash
cp cv/example_cover_letter.tex cv/company_cover_letter.tex
# Edit and build
pdflatex cv/company_cover_letter.tex
```

## Requirements

A LaTeX distribution with `pdflatex` and these packages (included in most distributions):
`geometry`, `titlesec`, `tabularx`, `xcolor`, `enumitem`, `hyperref`, `paracol`, `lmodern`, `microtype`, `fontawesome5`

## Helper macros

- `\company{...}` — org names in entry titles. Use this instead of `\textit`, which
  is redefined to hardcode its own size and will ignore any size you set around it.
- `\datefont` — font for date columns. Empty by default; set to `\sffamily` or `\ttfamily`.
- `\ghbutton{url}` — GitHub icon, right-aligned at the margin. Pass a repo URL.

Inside `onecolentry` use `\linewidth`, not `\textwidth` — `\textwidth` ignores the
0.2cm inset and overhangs the right margin.
