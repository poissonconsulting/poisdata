context("utils")

test_that("utils", {
  expect_identical(length(seq_datetime(as.POSIXct("2001-01-02 03:04:06", tz = "UTC"))), 1L)
  expect_identical(length(seq_datetime(as.POSIXct("2001-01-02 03:04:06", tz = "UTC") + c(1,3))), 2L)
  expect_identical(length(seq_datetime(as.POSIXct("2001-01-02 03:04:06", tz = "UTC") + c(1,3,9))), 5L)
  expect_identical(length(seq_datetime(as.POSIXct("2001-01-02 03:04:06", tz = "UTC") + c(1,2,9))), 9L)
})

