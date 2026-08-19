test_that("crop returns crop option managers", {
    expect_no_error(crop("wheat"))
    expect_no_error(crop("canola"))
    expect_no_error(crop("chickpea"))
    expect_no_error(crop("lupin"))
    expect_no_error(crop("fababean"))
    expect_no_error(crop("lentil"))
})

test_that("crop rejects unknown crop names", {
    expect_error(
        crop("rice"),
        "Unknown crop"
    )
})

test_that("crop option managers are functional", {
    expect_no_error(
        crop("wheat")$get()
    )

    expect_no_error(
        crop("lentil")$get()
    )
})

test_that("crop option setters are functional", {
    expect_no_error(
        crop("wheat")$set(
            "phenology.thermal_time" =
                list(
                    x = c(0, 40, 40),
                    y = c(0, 25, 0)
                )
        )
    )
    wheat <- crop("wheat")
    expect_equal(
        wheat$get("phenology.thermal_time"),
        list(
            x = c(0, 40, 40),
            y = c(0, 25, 0)
        )
    )
    wheat$reset()
    expect_equal(
        wheat$get("phenology.thermal_time"),
        list(
            x = c(0, 26, 37),
            y = c(0, 26, 0)
        )
    )
})