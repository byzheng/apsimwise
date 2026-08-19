#' Calculate vernalisation days for a crop
#'
#' @param ... Arguments passed to the selected crop's vernalisation days function.
#' @param crop The crop model to use. Supported crops are `canola`,
#'   `chickpea`, `lupin`, `fababean`, and `lentil`.
#' @return The vernalisation days.
#' @export
#' @examples
#' mint <- c(0, 10)
#' maxt <- c(30, 40)
#' vernalisation_days(mint, maxt, crop = "lupin")
vernalisation_days <- function(..., crop) {
    switch(
        crop,
        canola = rapsimng.canola::vernalisation_days(...),
        chickpea= rapsimng.chickpea::vernalisation_days(...),
        lupin = rapsimng.lupin::vernalisation_days(...),
        fababean = rapsimng.fababean::vernalisation_days(...),
        lentil = rapsimng.lentil::vernalisation_days(...),
        stop("Unknown crop: ", crop)
    )
}

