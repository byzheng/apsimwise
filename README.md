[![R-CMD-check.yaml](https://github.com/byzheng/apsimwise/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/byzheng/apsimwise/actions/workflows/R-CMD-check.yaml)

# apsimwise

apsimwise is a collection of interoperable R packages for crop modelling,
weather analysis, and agricultural decision support.

The goal of apsimwise is to provide a consistent and user-friendly
interface to APSIM-related workflows, allowing researchers, students,
breeders, agronomists, and consultants to work with multiple crops using
a common set of tools.

## Installation

From CRAN:

```r
install.packages("apsimwise")
```

From GitHub for the latest development version: 

```r
remotes::install_github("byzheng/apsimwise")
```

## Load apsimwise

```r
library(apsimwise)
```
## Installed Packages

This package installs and loads the core APSIMWISE ecosystem, including:

- [tidyweather](https://tidyweather.byzheng.me/) for weather data analysis.
- [rapsimng](https://rapsimng.bangyou.me) for manipulating APSIM Next Generation.
- Packages for specific crops, including: 
  - [rapsimng.wheat](https://wheat.rapsimng.bangyou.me) for Wheat
  - [rapsimng.canola](https://canola.rapsimng.bangyou.me) for Canola
  - [rapsimng.chickpea](https://chickpea.rapsimng.bangyou.me) for Chickpea
  - [rapsimng.fababean](https://fababean.rapsimng.bangyou.me) for Faba Bean
  - [rapsimng.lentil](https://lentil.rapsimng.bangyou.me) for Lentil
  - [rapsimng.lupin](https://lupin.rapsimng.bangyou.me) for Lupin
  - additional crop packages as they become available


## Get Started

apsimwise re-exports commonly used functions from the ecosystem so that
most users only need to load a single package.

```r
library(apsimwise)

# Read weather data
met <- read_weather("weather.met")

# Calculate day length
day_length(
  date = met$date,
  latitude = -27
)

# Calculate thermal time using crop-specific defaults
thermal_time(
  mint = met$mint,
  maxt = met$maxt,
  date = met$date,
  latitude = -27,
  crop = "lupin"
)

# View crop-specific parameters
crop("lupin")$get()
```

For a complete list of functions, see the package documentation:

```r
help(package = "apsimwise")
```
