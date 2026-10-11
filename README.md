# Modern Serverless Web Application Architecture

MSc dissertation, University of Southampton, September 2021.
Degree: MSc Computer Science (Distinction). Author: Sharang Gupta.

**[Read the dissertation (PDF, 62 pages)](thesis.pdf)** · [DOI: 10.5281/zenodo.23299984](https://doi.org/10.5281/zenodo.23299984)

## What it is about

Companies are moving to the cloud and, increasingly, to serverless architectures that scale up and down with demand and charge only for what is used. This dissertation compares the serverless offerings of the major cloud providers, weighs their strengths and weaknesses, and builds a standard application to show the practices working together as a benchmark and proof of concept.

The application built for the study is a recipe-sharing website with sign-up and OAuth login, recipe creation and editing, likes, comments, reporting, an admin panel, search and filtering, and calorie estimation from the ingredient list using a third-party API.

The proof-of-concept code is in [theveganmanna](https://github.com/sharanggupta/theveganmanna) (archived).

## Contents

1. Introduction
2. Literature Review
3. Project Management
4. System Analysis
5. System Architecture
6. Implementation
7. Testing and Evaluation
8. Reflection
9. Conclusion
10. References

## This repository

| Path | What it is |
|---|---|
| `thesis.pdf` | The finished dissertation |
| `thesis.tex`, `chapters/` | LaTeX source, one file per chapter |
| `img/` | Figures |
| `soton.cls`, `input_*.tex` | University of Southampton document class and front matter |

To rebuild the PDF, compile `thesis.tex` with a standard LaTeX distribution (the main file includes the chapters in order).

## Cite this work

Gupta, S. (2021). *Modern Serverless Web Application Architecture* [MSc dissertation, University of Southampton]. Zenodo. https://doi.org/10.5281/zenodo.23299984

Permanent record with the PDF: [10.5281/zenodo.23299984](https://doi.org/10.5281/zenodo.23299984) (this DOI always points to the latest version; the first version is [10.5281/zenodo.23299985](https://doi.org/10.5281/zenodo.23299985)).

## Licence

The dissertation is licensed under [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/): you may share and adapt it, including commercially, if you credit the author.
