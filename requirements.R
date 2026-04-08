# requirements.R
# Run this script once to install all packages required for aki_roc_analysis.ipynb
# Usage: source("requirements.R")  or  Rscript requirements.R

pkgs <- c(
  "pROC",      # ROC analysis, AUC, DeLong tests
  "ggplot2",   # figures
  "dplyr",     # data manipulation
  "zoo",       # rolling statistics (used in plotting)
  "coin",      # permutation-based inference
  "rstatix"    # tidy statistical tests
)

to_install <- pkgs[!pkgs %in% installed.packages()[, "Package"]]

if (length(to_install) == 0) {
  cat("All packages already installed.\n")
} else {
  cat("Installing:", paste(to_install, collapse = ", "), "\n")
  install.packages(to_install, repos = "https://cloud.r-project.org")
  cat("Done.\n")
}

# Verify all packages load cleanly
invisible(lapply(pkgs, function(p) {
  if (!requireNamespace(p, quietly = TRUE))
    warning("Package failed to load: ", p)
}))

cat("Package check complete.\n")
