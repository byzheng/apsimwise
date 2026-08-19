test_that("Thermal time", {
    # The daily thermal time
    mint <- c(0, 10)
    maxt <- c(30, 40)
    date <- as.Date(c("2024-01-01", "2024-01-02"))
    res <- thermal_time(mint, maxt, date = date, latitude = -27, crop = "lupin")
    expect_equal(round(res, 1), c(16.6, 24.9), tolerance=1e-3)
    
    #expect_equal(res$value[1], 16.391951095089993, tolerance=1e-3)
    # Read weather records
    met_file <- system.file("extdata/ppd_72150.met", package = "tidyweather")
    records <- tidyweather::read_weather(met_file)
    res <- thermal_time(records$mint, records$maxt, date = records$date, latitude = records$latitude[1], crop = "lupin")
    expect_equal(round(res[1], 1), 21.9, tolerance=1e-3)

    expect_equal(length(res), length(records$mint))
    expect_true(all(is.finite(res)))

})

test_that("Thermal time error test", {
    mint <- c(0, 10)
    maxt <- c(30, 40)
    expect_error(
        thermal_time(mint, maxt, date = date, latitude = -27, crop = "unknown"),
        "Unknown crop: unknown")
})

