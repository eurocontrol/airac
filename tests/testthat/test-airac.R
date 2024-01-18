library(lubridate)

test_that("test epoch functions", {
  expect_true(is.Date(as.Date(airac_epoch())))
  expect_equal(as.Date(airac_epoch()), as.Date("1998-01-29", "%Y-%m-%d", tz = "UTC"))
  expect_equal(as.Date(airac_year_epoch(2018)), as.Date("2018-01-04", "%Y-%m-%d", tz = "UTC"))

})


test_that("test AIRAC ID", {
  expect_equal(airac('2016-01-06'), "1513")
  expect_equal(airac('2016-01-07'), "1601")
  expect_equal(airac('2016-12-08'), "1613")

  expect_equal(airac('2017-01-04'), "1613")
  expect_equal(airac('2017-01-05'), "1701")
  expect_equal(airac('2017-12-31'), "1713")

  expect_equal(airac('2018-01-03'), "1713")
  expect_equal(airac('2018-01-04'), "1801")
  expect_equal(airac('2018-12-31'), "1813")

  expect_equal(airac('2019-01-02'), "1813")
  expect_equal(airac('2019-01-03'), "1901")
  expect_equal(airac('2019-12-31'), "1913")

  expect_equal(airac('2020-01-01'), "1913")
  expect_equal(airac('2020-01-02'), "2001")
  expect_equal(airac('2020-12-28'), "2013")
  expect_equal(airac('2020-12-31'), "2014")

  expect_equal(airac('2021-01-27'), "2014")
  expect_equal(airac('2021-01-28'), "2101")
  expect_equal(airac('2021-12-31'), "2113")

  expect_equal(airac('2022-01-26'), "2113")
  expect_equal(airac('2022-01-27'), "2201")
  expect_equal(airac('2022-12-31'), "2213")

  expect_equal(airac('2023-01-25'), "2213")
  expect_equal(airac('2023-01-26'), "2301")
  expect_equal(airac('2023-12-31'), "2313")

  expect_equal(airac('2024-01-24'), "2313")
  expect_equal(airac('2024-01-25'), "2401")
  expect_equal(airac('2024-12-31'), "2413")

  expect_equal(airac('2025-01-22'), "2413")
  expect_equal(airac('2025-01-23'), "2501")
  expect_equal(airac('2025-12-31'), "2513")

  expect_equal(airac('2026-01-21'), "2513")
  expect_equal(airac('2026-01-22'), "2601")
  expect_equal(airac('2026-12-31'), "2613")

})



test_that("test AIRAC interval", {

  v <- airac_interval("1601")
  expect_equal(as.Date(int_start(v)), as.Date("2016-01-07", "%Y-%m-%d", tz = "UTC"))
  expect_equal(as.Date(int_end(v)), as.Date("2016-02-04", "%Y-%m-%d", tz = "UTC"))
  v <- airac_interval("1603")
  expect_equal(as.Date(int_start(v)), as.Date("2016-03-03", "%Y-%m-%d", tz = "UTC"))
  expect_equal(as.Date(int_end(v)), as.Date("2016-03-31", "%Y-%m-%d", tz = "UTC"))
  v <- airac_interval("1613")
  expect_equal(as.Date(int_start(v)), as.Date("2016-12-08", "%Y-%m-%d", tz = "UTC"))
  expect_equal(as.Date(int_end(v)), as.Date("2017-01-05", "%Y-%m-%d", tz = "UTC"))

  v <- airac_interval("1701")
  expect_equal(as.Date(int_start(v)), as.Date("2017-01-05", "%Y-%m-%d", tz = "UTC"))
  expect_equal(as.Date(int_end(v)), as.Date("2017-02-02", "%Y-%m-%d", tz = "UTC"))
  v <- airac_interval("1713")
  expect_equal(as.Date(int_start(v)), as.Date("2017-12-07", "%Y-%m-%d", tz = "UTC"))
  expect_equal(as.Date(int_end(v)), as.Date("2018-01-04", "%Y-%m-%d", tz = "UTC"))

  v <- airac_interval("1901")
  expect_equal(as.Date(int_start(v)), as.Date("2019-01-03", "%Y-%m-%d", tz = "UTC"))
  expect_equal(as.Date(int_end(v)), as.Date("2019-01-31", "%Y-%m-%d", tz = "UTC"))
  v <- airac_interval("1913")
  expect_equal(as.Date(int_start(v)), as.Date("2019-12-05", "%Y-%m-%d", tz = "UTC"))
  expect_equal(as.Date(int_end(v)), as.Date("2020-01-02", "%Y-%m-%d", tz = "UTC"))

  v <- airac_interval("2001")
  expect_equal(as.Date(int_start(v)), as.Date("2020-01-02", "%Y-%m-%d", tz = "UTC"))
  expect_equal(as.Date(int_end(v)), as.Date("2020-01-30", "%Y-%m-%d", tz = "UTC"))
  v <- airac_interval("2013")
  expect_equal(as.Date(int_start(v)), as.Date("2020-12-03", "%Y-%m-%d", tz = "UTC"))
  expect_equal(as.Date(int_end(v)), as.Date("2020-12-31", "%Y-%m-%d", tz = "UTC"))
  v <- airac_interval("2014")
  expect_equal(as.Date(int_start(v)), as.Date("2020-12-31", "%Y-%m-%d", tz = "UTC"))
  expect_equal(as.Date(int_end(v)), as.Date("2021-01-28", "%Y-%m-%d", tz = "UTC"))

  v <- airac_interval("3801")
  expect_equal(as.Date(int_start(v)), as.Date("2038-01-07", "%Y-%m-%d", tz = "UTC"))
  expect_equal(as.Date(int_end(v)), as.Date("2038-02-04", "%Y-%m-%d", tz = "UTC"))
  v <- airac_interval("3813")
  expect_equal(as.Date(int_start(v)), as.Date("2038-12-09", "%Y-%m-%d", tz = "UTC"))
  expect_equal(as.Date(int_end(v)), as.Date("2039-01-06", "%Y-%m-%d", tz = "UTC"))

})

