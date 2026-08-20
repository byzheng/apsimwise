#' Calculate thermal time for a crop
#'
#' @param ... Arguments passed to the selected crop's thermal time function.
#' @param crop The crop model to use. Supported crops are `wheat`, `canola`,
#'   `chickpea`, `lupin`, `fababean`, and `lentil`.
#' @return The thermal time.
#' @export
#' @examples
#' 
#' library(apsimwise)
#' # Example weather data
#' mint <- c(0, 10)
#' maxt <- c(30, 40)
#' date <- as.Date(c("2024-01-01", "2024-01-02"))
#'
#' # Use default lupin parameters
#' thermal_time(
#'   mint,
#'   maxt,
#'   date = date,
#'   lat = -27,
#'   crop = "lupin"
#' )
#'
#' # Modify the global lupin thermal time response for all following calculations
#' crop("lupin")$set(
#'   "phenology.thermal_time" =
#'   list(
#'     x = c(0, 25, 35),
#'     y = c(0, 25, 0)
#'   )
#' )
#' thermal_time(
#'   mint,
#'   maxt,
#'   date = date,
#'   lat = -27,
#'   crop = "lupin"
#' )
#' 
#' # Then the parameters can be reset
#' crop("lupin")$reset()
#'
#'
#' # Override thermal time parameters for a single call
#' thermal_time(
#'   mint,
#'   maxt,
#'   date = date,
#'   lat = -27,
#'   crop = "lupin",
#'   x_temp = c(0, 25, 35),
#'   y_temp = c(0, 25, 0)
#' )
#' 
#' # Calculate thermal time from a weather file
#' met_file <- system.file("extdata/ppd_72150.met", package = "tidyweather")
#' # Read weather records
#' records <- read_weather(met_file)
#' # Calculate thermal time for lupin using tidyverse ways
#' library(dplyr)
#' records |>
#'     mutate(
#'         tt = thermal_time(
#'             mint = mint,
#'             maxt = maxt,
#'             date = date,
#'             latitude = latitude[1],
#'             crop = "lupin"
#'         )
#'     ) |>
#'     select(name, date, mint, maxt, tt)
#' # Calculate thermal time for lupin grouped by year and site if there are multiple sites
#' # Create some fake data for a second site
#' records2 <- records |>
#'     mutate(
#'         name = "site2",
#'         mint = mint + 1,
#'         maxt = maxt + 1,
#'         latitude = latitude - 10
#'     ) |>
#'     bind_rows(records)
#' # Calculate thermal time for lupin grouped by site
#' records2 |>
#'     group_by(name) |>
#'     mutate(
#'         tt = thermal_time(
#'             mint = mint,
#'             maxt = maxt,
#'             date = date,
#'             latitude = latitude[1],
#'             crop = "lupin"
#'         )
#'     ) |>
#'     select(name, date, mint, maxt, tt)
thermal_time <- function(..., crop) {
    switch(
        crop,
        wheat = rapsimng.wheat::thermal_time(...),
        canola = rapsimng.canola::thermal_time(...),
        chickpea= rapsimng.chickpea::thermal_time(...),
        lupin = rapsimng.lupin::thermal_time(...),
        fababean = rapsimng.fababean::thermal_time(...),
        lentil = rapsimng.lentil::thermal_time(...),
        stop("Unknown crop: ", crop)
    )
}
