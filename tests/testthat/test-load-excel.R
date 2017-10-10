context("load-excel")

test_that("can read excel sheets", {
  sheets <- ps_load_excel(file = system.file("excel/test-excel.xlsx", package = "poisdata"))
  expect_identical(sort(sheets), sort(c("Sheet1", "Sheet2", "Sheet3")))
  expect_identical(sort(ls()), sort(c("Sheet1", "Sheet2", "Sheet3", "sheets")))
  expect_true(nrow(Sheet1) == 1)
  expect_true(ncol(Sheet1) == 2)
  expect_identical(names(Sheet1), c("x", "y"))
})
