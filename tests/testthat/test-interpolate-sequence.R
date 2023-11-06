test_that("interpolate-sequence", {
  datetime <- as.POSIXct("2001-01-02 03:04:06") + c(1:10)

  data <- data.frame(DateTime = datetime, Value = c(1, NA, 3, NA, NA, 3, NA, NA, NA, 7))

  x <- ps_interpolate_sequence(data)
  expect_is(x, "tbl")
  expect_identical(colnames(x), c("DateTime", "Value"))
  expect_identical(x$Value, c(1, 2, 3, 3, 3, 3, 4, 5, 6, 7))
  expect_identical(colnames(x), colnames(data))

  x <- ps_interpolate_sequence(data, max_gap = 2)
  expect_is(x, "tbl")
  expect_identical(colnames(x), c("DateTime", "Value"))
  expect_identical(x$Value, c(1, 2, 3, 3, 3, 3, NA, NA, NA, 7))
  expect_identical(colnames(x), colnames(data))

  x <- ps_interpolate_sequence(data, method = "constant")
  expect_identical(x$Value, c(1, 2, 3, 3, 3, 3, 5, 5, 5, 7))

  x <- ps_interpolate_sequence(data, method = "constant", step = 0.66)
  expect_equal(x$Value, c(1, 2.32, 3, 3, 3, 3, 5.64, 5.64, 5.64, 7))

  data <- data.frame(DateTime = datetime, Value = c(NA, NA, 3, NA, NA, 3, NA, NA, 4, NA))
  x <- ps_interpolate_sequence(data)
  expect_equal(x$Value, c(NA, NA, 3, 3, 3, 3, 3.33333, 3.66666, 4, NA), tolerance = 0.00001)
})
