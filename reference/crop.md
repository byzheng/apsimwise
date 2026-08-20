# Access crop-specific model options

Returns the options manager associated with a crop. The returned object
can be used to inspect and modify crop-specific parameters such as
thermal time and vernalisation responses.

## Usage

``` r
crop(name)
```

## Arguments

- name:

  Character string specifying the crop name. Supported crops include
  (case-insensitive): `"wheat"`, `"canola"`, `"chickpea"`, `"lupin"`,
  `"fababean"`, and `"lentil"`.

## Value

An options manager object created by
[`optree::create_options_manager()`](https://optree.bangyou.me/reference/create_options_manager.html).

## Examples

``` r
# Get the lentil options manager
l <- crop("lentil")

# View all options
l$get()
#> $phenology
#> $phenology$thermal_time
#> $phenology$thermal_time$x
#> [1]  0 28 35
#> 
#> $phenology$thermal_time$y
#> [1]  0 28  0
#> 
#> 
#> $phenology$vernalisation_time
#> $phenology$vernalisation_time$x
#> [1]  0.0  4.7  8.0 14.0
#> 
#> $phenology$vernalisation_time$y
#> [1] 0.0 1.0 0.5 0.0
#> 
#> 
#> 

# Retrieve thermal time parameters
l$get("phenology.thermal_time")
#> $x
#> [1]  0 28 35
#> 
#> $y
#> [1]  0 28  0
#> 

# Modify an option
l$set(
  "phenology.thermal_time" =
  list(
    x = c(0, 25, 35),
    y = c(0, 25, 0)
  )
)
```
