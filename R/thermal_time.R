#' Calculate thermal time for a crop
#'
#' @param ... Arguments passed to the selected crop's thermal time function.
#' @param crop The crop model to use. Supported crops are `wheat`, `canola`,
#'   `chickpea`, `lupin`, `fababean`, and `lentil`.
#' @return The thermal time.
#' @export
#' @examples
#'
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
#'   latitude = -27,
#'   crop = "lupin"
#' )
#'
#' # Modify the global lupin thermal time response
#' crop("lupin")$set(
#'   "phenology.thermal_time",
#'   list(
#'     x = c(0, 25, 35),
#'     y = c(0, 25, 0)
#'   )
#' )
#'
#' thermal_time(
#'   mint,
#'   maxt,
#'   date = date,
#'   latitude = -27,
#'   crop = "lupin"
#' )
#'
#' # Override thermal time parameters for a single call
#' thermal_time(
#'   mint,
#'   maxt,
#'   date = date,
#'   latitude = -27,
#'   crop = "lupin",
#'   x_temp = c(0, 25, 35),
#'   y_temp = c(0, 25, 0)
#' )
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
