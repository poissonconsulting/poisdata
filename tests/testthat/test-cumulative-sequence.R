context("cumulative-sequence")

test_that("cumulative-sequence", {
  data <- data.frame(DateTime = 1:10, Value = rep(1, 10))

  expect_identical(ps_cumulative_sequence(2, cumsum = 4, data), 6L)
  expect_identical(ps_cumulative_sequence(2, cumsum = 1, data), 3L)
  expect_equal(ps_cumulative_sequence(11, cumsum = 1L, data), NA_integer_)
  expect_equal(ps_cumulative_sequence(1, cumsum = 12L, data), NA_integer_)
  expect_equal(ps_cumulative_sequence(0, cumsum = 1L, data), NA_integer_)
})
