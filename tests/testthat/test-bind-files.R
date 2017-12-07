context("bind-files")

test_that("bind_files", {
  data <- ps_bind_files(system.file("csv", package = "poisdata"), recursive = TRUE)
  expect_identical(ls(), "data")

  expect_is(data, "tbl")
  expect_identical(nrow(data), 642L)
  expect_identical(ncol(data), 15L)
})
