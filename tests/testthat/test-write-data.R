test_that("writes", {
  files <- ps_load_files(system.file("csv", package = "poisdata"), recursive = TRUE)

  expect_identical(sort(files), sort(c("mtcars.csv", "sub1/ChickWeight.csv",
                                       "sub1/mtcars.csv")))

  expect_identical(sort(ls()), sort(c(
    "files", "mtcars", "sub1.ChickWeight", "sub1.mtcars")))

  dir <- tempdir()
  data <- ps_write_data_csvs(dir)
  expect_identical(sort(c("dir", "files", "data", data)), sort(ls()))
  expect_identical(sort(list.files(dir)), sort(paste0(data, ".csv")))
})
