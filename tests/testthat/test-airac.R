test_that("epoch is correct", {
  expect_true(is.Date(as.Date(airac_epoch())))
  expect_equal(as.Date(airac_epoch()), as.Date("1998-01-29", "%Y-%m-%d", tz = "UTC"))
})
