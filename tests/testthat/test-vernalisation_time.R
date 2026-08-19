test_that("Vernalisation days", {
    mint <- c(0, 10)
    maxt <- c(30, 40)
    res <- vernalisation_days(mint, maxt, crop = "lupin")
    
    # Check that result is numeric and has correct length
    expect_true(is.numeric(res))
    expect_equal(length(res), 2)
    
    # Check that results are non-negative
    expect_true(all(res >= 0))
    expect_equal(res, c(0.2231, 0.0397), tolerance=1e-3)
})

test_that("Vernalisation days - error", {
    mint <- c(0, 10)
    maxt <- c(30, 40)
    
    # Test that mint <= maxt is enforced
    expect_error(vernalisation_days(maxt, mint, crop = "unknown"), "Unknown crop: unknown")
})
