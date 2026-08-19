#' Access crop-specific model options
#'
#' Returns the options manager associated with a crop. The returned object
#' can be used to inspect and modify crop-specific parameters such as
#' thermal time and vernalisation responses.
#'
#' @param name Character string specifying the crop name.
#'   Supported crops include (case-insensitive):
#'   \code{"wheat"}, \code{"canola"}, \code{"chickpea"},
#'   \code{"lupin"}, \code{"fababean"}, and \code{"lentil"}.
#'
#' @return An options manager object created by
#'   \code{optree::create_options_manager()}.
#'
#' @examples
#' # Get the lentil options manager
#' l <- crop("lentil")
#'
#' # View all options
#' l$get()
#'
#' # Retrieve thermal time parameters
#' l$get("phenology.thermal_time")
#'
#' # Modify an option
#' l$set(
#'   "phenology.thermal_time" =
#'   list(
#'     x = c(0, 25, 35),
#'     y = c(0, 25, 0)
#'   )
#' )
#'
#' @export
crop <- function(name) {
    switch(
        tolower(name),
        wheat = rapsimng.wheat::wheat,
        canola = rapsimng.canola::canola,
        chickpea = rapsimng.chickpea::chickpea,
        lupin = rapsimng.lupin::lupin,
        fababean = rapsimng.fababean::fababean,
        lentil = rapsimng.lentil::lentil,
        stop("Unknown crop: ", name)
    )
}