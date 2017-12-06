context("load-files")

test_that("can read multiple hobo csv file", {
  files <- ps_load_files(system.file("hobo", package = "poisdata"), recursive = TRUE)
  expect_identical(sort(files), sort(c("10328118.csv", "10328122.csv", "10723440.csv",
                                 "Ex13.csv", "folder123/10723450.csv", "M10.csv",
                                 "M2.csv", "M3.csv", "MBB1.csv")))

  expect_identical(sort(ls()), sort(c("Ex13", "files", "folder123.10723450", "M10",                "M2", "M3", "MBB1", "X10328118", "X10328122", "X10723440")))
})

test_that("can bind multiple file", {
  data <- ps_load_files(system.file("hobo", package = "poisdata"), recursive = TRUE, bind = TRUE)

  expect_is(data, "tbl")
})
