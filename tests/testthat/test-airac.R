library(lubridate)

test_that("test epoch functions", {
  expect_true(is.Date(as.Date(airac_epoch())))
  expect_equal(as.Date(airac_epoch()), as.Date("1998-01-29", "%Y-%m-%d", tz = "UTC"))
  expect_equal(as.Date(airac_year_epoch(2018)), as.Date("2018-01-04", "%Y-%m-%d", tz = "UTC"))

})


test_that("test AIRAC ID and interval", {
  expect_equal(airac('2019-01-30'), c("1901"))
  v <- airac_interval("1603")
  expect_equal(as.Date(int_start(v)), as.Date("2016-03-03", "%Y-%m-%d", tz = "UTC"))
  expect_equal(as.Date(int_end(v)), as.Date("2016-03-31", "%Y-%m-%d", tz = "UTC"))
})

