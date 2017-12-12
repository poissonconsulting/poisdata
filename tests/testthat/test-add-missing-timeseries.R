context("add-missing-timeseries")

test_that("add_missing_timeseries", {
  datetime <- as.POSIXct("2001-01-02 03:04:06") + c(1,3,9)
  x <- ps_add_missing_datetimes(data.frame(DateTime = datetime, Value = c(1,3,9)))
  expect_is(x, "tbl")
  expect_identical(colnames(x), c("DateTime", "Value"))
  expect_identical(x$Value, c(1, 3, NA, NA, 9))

  datetime <- as.POSIXct("2001-01-02 03:04:06") + c(1,2,9)
  x <- ps_add_missing_datetimes(data.frame(DateTimeReading = datetime, Value = c(1,3,9)), "DateTimeReading")
  expect_is(x, "tbl")
  expect_identical(colnames(x), c("DateTimeReading", "Value"))
  expect_identical(nrow(x), 9L)
})

