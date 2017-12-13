context("add-missing-timeseries")

test_that("add_missing_timeseries", {
  datetime <- as.POSIXct("2001-01-02 03:04:06") + c(1,3,9)

  data <- data.frame(DateTime = datetime, Value = c(1,3,9))
  x <- ps_add_missing_datetimes(data)
  expect_is(x, "tbl")
  expect_identical(colnames(x), c("DateTime", "Value"))
  expect_identical(x$Value, c(1, 3, NA, NA, 9))
  expect_identical(colnames(x), colnames(data))

  datetime <- as.POSIXct("2001-01-02 03:04:06") + c(1,2,9)
  data <- data.frame(DateTimeReading = datetime, Value = c(1,2,9))

  x <- ps_add_missing_datetimes(data, "DateTimeReading")
  expect_is(x, "tbl")
  expect_identical(colnames(x), c("DateTimeReading", "Value"))
  expect_identical(nrow(x), 9L)
  expect_identical(colnames(x), colnames(data))

  datetime <- as.POSIXct("2001-01-02 03:04:06") + c(1,2,9,4)
  data <- data.frame(DateTime = datetime, Value = c(1,2,9,4),
                     Group = 1)

  x <- ps_add_missing_datetimes(data, by = "Group")
  expect_identical(x$Group, rep(1, 9L))
  expect_identical(colnames(x), colnames(data))

  datetime <- as.POSIXct("2001-01-02 03:04:06") + c(1,2,9,4)
  data <- data.frame(Value = c(1,2,9,4),
                     Group = c(1,1,1,3), DateTime = datetime)
  x <- ps_add_missing_datetimes(data, by = "Group")
  expect_identical(x$Group, c(rep(1, 9L), 3))
  expect_identical(colnames(x), colnames(data))
})
