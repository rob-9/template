# LaTeX Template

Sngle-page resume template.

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
`geometry`, `titlesec`, `tabularx`, `xcolor`, `enumitem`, `hyperref`, `paracol`, `fourier`, `microtype`, `fontawesome5`
