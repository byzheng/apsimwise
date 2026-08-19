[![R-CMD-check.yaml](https://github.com/byzheng/apsimwise/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/byzheng/apsimwise/actions/workflows/R-CMD-check.yaml)

# apsimwise

apsimwise is a collection of interoperable R packages for crop modelling,
weather analysis, and agricultural decision support.

The goal of apsimwise is to provide a consistent and user-friendly
interface to APSIM-related workflows, allowing researchers, students,
breeders, agronomists, and consultants to work with multiple crops using
a common set of tools.

## Installation

```r
remotes::install_github("byzheng/apsimwise")
```

## Load APSIMWISE

```r
library(apsimwise)
```

This package installs and loads the core APSIMWISE ecosystem, including:

- `tidyweather`
- `rapsimng`
- `rapsimng.wheat`
- `rapsimng.canola`
- `rapsimng.chickpea`
- `rapsimng.fababean`
- `rapsimng.lentil`
- `rapsimng.lupin`
- additional crop packages as they become available
