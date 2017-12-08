context("bind-files")

test_that("bind_files", {
  data <- ps_bind_files(system.file("csv", package = "poisdata"), recursive = TRUE)
  expect_identical(ls(), "data")

  expect_is(data, "tbl")
  expect_identical(nrow(data), 642L)
  expect_identical(ncol(data), 15L)

  data2 <- ps_bind_files(system.file("csv", package = "poisdata"),
                         add_name = ".FileName", recursive = TRUE)
  expect_is(data2, "tbl")
  expect_identical(nrow(data2), 642L)
  expect_identical(ncol(data2), 16L)
  expect_identical(sort(unique(data2$.FileName)),
                  sort(c("mtcars.csv", "sub1/ChickWeight.csv", "sub1/mtcars.csv")))
})
