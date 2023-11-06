test_that("load_files", {
  files <- ps_load_files(system.file("csv", package = "poisdata"), recursive = TRUE)
  expect_identical(sort(files), sort(c(
    "mtcars.csv", "sub1/ChickWeight.csv",
    "sub1/mtcars.csv"
  )))

  expect_identical(sort(ls()), sort(c(
    "files", "mtcars", "sub1.ChickWeight", "sub1.mtcars"
  )))
})
