# AKI ROC Analysis

Reproducible analysis evaluating the predictive performance of hydration markers for acute kidney injury (AKI) risk in young vs. older females.

---

## Overview

This repository contains all code needed to reproduce the statistics, figures, and paper-ready summary reported in:

> *Predictive Value of Hydration Markers for Acute Kidney Injury Risk in Young vs. Older Females*

Diagnostic accuracy was assessed using ROC-based methods, comparing five hydration biomarkers across age groups and conditions.

---

## Objectives

### Aim 1 — Between-group diagnostic performance

Evaluate whether hydration markers differ in their ability to predict AKI risk between young females (YF) and older females (OF).

Reported metrics: AUC, 95% CI (DeLong method), Youden's J index, optimal threshold, and unpaired DeLong test for group comparisons.

### Aim 2 — Within-subject marker comparison

Compare spot USG vs. 24-hour USG on the same participants using paired ROC curves and a paired DeLong test.

### Table 1 — Participant characteristics

Descriptive statistics (median [IQR]), Mann–Whitney U test, and rank-biserial correlation effect size for age and BMI.

---

## Repository Structure

```
├── aki_roc_analysis.ipynb   # Main analysis notebook
├── requirements.R           # One-step package installer
├── AKI_data.csv             # Input data (see Data Requirements below)
├── figures/
│   ├── AUCbyAge Apr8.png    # Figure 1 — AUC dot plot by age group
│   └── ROC.png              # Figure 2 — Paired ROC curves
├── .gitignore
└── README.md
```

---

## Data Requirements

Place `AKI_data.csv` in the root directory before running the notebook.

> **Note:** The raw data file is not included in this repository. Please contact the corresponding author to request access.

### Required columns

| Column | Description |
|---|---|
| `Age Group` | `Young` or `Older` |
| `ID` | Participant identifier |
| `Condition` | Experimental condition |
| `IGFBP7*TIMP-2 ((ng/mL)^2)/1000` | Kidney stress biomarker |
| `AKI Risk` | `Yes` / `No` (outcome variable) |
| `percent change weight` | % body mass change |
| `Spot USG` | Spot urine specific gravity |
| `24hr USG` | 24-hour urine specific gravity |
| `24hr Osmo` | 24-hour urine osmolality |
| `Plasma Osmo` | Plasma osmolality |
| `Screening BMI` | BMI at screening |
| `Age` | Age in years |

### Missing data handling

Two participants were missing `AKI Risk` values and are handled as follows:
- **Excluded** from all ROC analyses
- **Included** in Table 1 demographic analyses

Completed to preserve statistical validity while maximizing descriptive sample size.

---

## Quick Start

### 1. Clone the repository

```bash
git clone https://github.com/Jonathan-Hoch/aki-roc-analysis.git
cd aki-roc-analysis
```

### 2. Install R dependencies

```r
source("requirements.R")
```

### 3. Add the dataset

Place `AKI_data.csv` in the root directory (see Data Requirements above).

### 4. Run the analysis

Open `aki_analysis.ipynb` and run all cells from top to bottom.  
Cell 11 prints a complete paper-ready summary of all reported statistics.

---

## Methods Summary

### ROC analysis

- Implemented with the `pROC` package
- AUC estimated with DeLong 95% confidence intervals
- Optimal thresholds identified via Youden's J index (sensitivity + specificity − 1)
- ROC direction determined independently per subgroup (`direction = "auto"`), consistent with maximizing AUC within each group

### Statistical tests

| Test | Purpose |
|---|---|
| Unpaired DeLong | Between-group AUC comparisons (Aim 1) |
| Paired DeLong | Within-subject Spot vs. 24-hr USG comparison (Aim 2) |
| Mann–Whitney U | Demographic comparisons (Table 1) |

---

## Figures

<table>
  <tr>
    <th align="center">Figure 1 — AUC by age group</th>
    <th align="center">Figure 2 — Paired ROC curves</th>
  </tr>
  <tr>
    <td><img src="figures/AUCbyAge.png" width="80%"></td>
    <td><img src="figures/ROC.png" width="80%"></td>
  </tr>
</table>

---

## Requirements

- R ≥ 4.0
- Jupyter Notebook with [IRkernel](https://irkernel.github.io/)

| Package | Purpose |
|---|---|
| `pROC` | ROC analysis, AUC, DeLong tests |
| `ggplot2` | Figures |
| `dplyr` | Data manipulation |
| `zoo` | Rolling statistics |
| `coin` | Permutation-based inference |
| `rstatix` | Tidy statistical tests |

---

## Limitations

- Small sample size limits statistical power; findings should be interpreted as exploratory
- ROC comparisons may not detect modest differences between groups
- Results reflect a specific exercise/hydration protocol and may not generalise broadly

---

## Citation

If you use this code, please cite the associated manuscript (citation to be added upon publication).

---

## Contact

Jonathan Hoch — [GitHub](https://github.com/Jonathan-Hoch)
