# Markdown resume

My personal (up-to-date) resume, written in Markdown

- [HTML version](http://htmlpreview.github.io/?https://github.com/carmelom/resume/blob/master/output/resume.html)
- [pdf version](output/resume.pdf)

Originally inspired by <https://github.com/mszep/pandoc_resume>, which uses a CSS style written by [C. M. Duquesne](https://github.com/chmduquesne/resume) inspired by the LaTeX [moderncv](https://ctan.org/pkg/moderncv) class.

In the original repo, the pdf is generated using ConTeXt, which requires a separated .tex style in the `styles` folder. I preferred to rely to CSS only and let pandoc convert the html output to pdf using wkhtmltopdf.

I include my (short) scientific bibiliography with pandoc-citeproc, using a customized version of the [APS Zotero style](https://www.zotero.org/styles/american-physics-society) which sorts the entry by year and also displays the DOI link.


## Requirements

- pandoc 2.x
    - 1.x is deprecated
- wkhtmltopdf
- pyScss (substitute of ruby-sass)
