

test_that("test CFMU epoch functions", {
  expect_true(is.Date(as.Date(cfmu_airac_epoch())))
  expect_equal(as.Date(cfmu_airac_epoch()), as.Date("1984-09-27", "%Y-%m-%d", tz = "UTC"))
  expect_equal(cfmu_airac_epoch_number(), 0)

})


test_that("test CFMU AIRAC number and interval", {
  expect_equal(cfmu_airac('2019-01-30'), 447)
  v <- cfmu_airac_interval(441)
  expect_equal(as.Date(int_start(v)), as.Date("2018-07-19", "%Y-%m-%d", tz = "UTC"))
  expect_equal(as.Date(int_end(v)), as.Date("2018-08-16", "%Y-%m-%d", tz = "UTC"))
})

