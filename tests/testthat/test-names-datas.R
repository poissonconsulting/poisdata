test_that("names_datas", {
  expect_identical(ps_names_datas(), character(0))
  mtcars <- datasets::mtcars
  expect_identical(ps_names_datas(), "mtcars")
})
