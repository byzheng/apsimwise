# Calculate thermal time for a crop

Calculate thermal time for a crop

## Usage

``` r
thermal_time(..., crop)
```

## Arguments

- ...:

  Arguments passed to the selected crop's thermal time function.

- crop:

  The crop model to use. Supported crops are `wheat`, `canola`,
  `chickpea`, `lupin`, `fababean`, and `lentil`.

## Value

The thermal time.

## Examples

``` r

library(apsimwise)
# Example weather data
mint <- c(0, 10)
maxt <- c(30, 40)
date <- as.Date(c("2024-01-01", "2024-01-02"))

# Use default lupin parameters
thermal_time(
  mint,
  maxt,
  date = date,
  lat = -27,
  crop = "lupin"
)
#> [1] 16.64386 24.88400

# Modify the global lupin thermal time response for all following calculations
crop("lupin")$set(
  "phenology.thermal_time" =
  list(
    x = c(0, 25, 35),
    y = c(0, 25, 0)
  )
)
thermal_time(
  mint,
  maxt,
  date = date,
  lat = -27,
  crop = "lupin"
)
#> [1] 16.64386 24.88400

# Then the parameters can be reset
crop("lupin")$reset()


# Override thermal time parameters for a single call
thermal_time(
  mint,
  maxt,
  date = date,
  lat = -27,
  crop = "lupin",
  x_temp = c(0, 25, 35),
  y_temp = c(0, 25, 0)
)
#> [1] 16.64386 24.88400

# Calculate thermal time from a weather file
met_file <- system.file("extdata/ppd_72150.met", package = "tidyweather")
# Read weather records
records <- read_weather(met_file)
# Calculate thermal time for lupin using tidyverse ways
library(dplyr)
#> 
#> Attaching package: ‘dplyr’
#> The following objects are masked from ‘package:stats’:
#> 
#>     filter, lag
#> The following objects are masked from ‘package:base’:
#> 
#>     intersect, setdiff, setequal, union
records |>
    mutate(
        tt = thermal_time(
            mint = mint,
            maxt = maxt,
            date = date,
            latitude = latitude[1],
            crop = "lupin"
        )
    ) |>
    select(name, date, mint, maxt, tt)
#> # A tibble: 587 × 5
#>    name            date        mint  maxt    tt
#>    <chr>           <date>     <dbl> <dbl> <dbl>
#>  1 WAGGA WAGGA AMO 2023-12-01  14.4  28.7  21.9
#>  2 WAGGA WAGGA AMO 2023-12-02  15.1  29.1  21.5
#>  3 WAGGA WAGGA AMO 2023-12-03  10    27.8  19.9
#>  4 WAGGA WAGGA AMO 2023-12-04  14.6  30.4  22.8
#>  5 WAGGA WAGGA AMO 2023-12-05  15.1  37.9  27.3
#>  6 WAGGA WAGGA AMO 2023-12-06  18.5  33.3  25.6
#>  7 WAGGA WAGGA AMO 2023-12-07  14.9  33.4  25.3
#>  8 WAGGA WAGGA AMO 2023-12-08  20.4  36.4  29.0
#>  9 WAGGA WAGGA AMO 2023-12-09  22.6  38.6  27.6
#> 10 WAGGA WAGGA AMO 2023-12-10  22.3  34.6  28.4
#> # ℹ 577 more rows
# Calculate thermal time for lupin grouped by year and site if there are multiple sites
# Create some fake data for a second site
records2 <- records |>
    mutate(
        name = "site2",
        mint = mint + 1,
        maxt = maxt + 1,
        latitude = latitude - 10
    ) |>
    bind_rows(records)
# Calculate thermal time for lupin grouped by site
records2 |>
    group_by(name) |>
    mutate(
        tt = thermal_time(
            mint = mint,
            maxt = maxt,
            date = date,
            latitude = latitude[1],
            crop = "lupin"
        )
    ) |>
    select(name, date, mint, maxt, tt)
#> # A tibble: 1,174 × 5
#> # Groups:   name [2]
#>    name  date        mint  maxt    tt
#>    <chr> <date>     <dbl> <dbl> <dbl>
#>  1 site2 2023-12-01  15.4  29.7  23.2
#>  2 site2 2023-12-02  16.1  30.1  22.9
#>  3 site2 2023-12-03  11    28.8  21.3
#>  4 site2 2023-12-04  15.6  31.4  24.2
#>  5 site2 2023-12-05  16.1  38.9  28.9
#>  6 site2 2023-12-06  19.5  34.3  27.1
#>  7 site2 2023-12-07  15.9  34.4  26.8
#>  8 site2 2023-12-08  21.4  37.4  28.8
#>  9 site2 2023-12-09  23.6  39.6  23.3
#> 10 site2 2023-12-10  23.3  35.6  29.8
#> # ℹ 1,164 more rows
```
