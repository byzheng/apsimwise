# Calculate vernalisation days for a crop

Calculate vernalisation days for a crop

## Usage

``` r
vernalisation_days(..., crop)
```

## Arguments

- ...:

  Arguments passed to the selected crop's vernalisation days function.

- crop:

  The crop model to use. Supported crops are `canola`, `chickpea`,
  `lupin`, `fababean`, and `lentil`.

## Value

The vernalisation days.

## Examples

``` r
mint <- c(0, 10)
maxt <- c(30, 40)
vernalisation_days(mint, maxt, crop = "lupin")
#> [1] 0.22308540 0.03967708
```
