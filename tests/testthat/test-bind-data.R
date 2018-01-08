context("bind-datas")

test_that("bind_datas", {
  expect_identical(ps_bind_datas(), tibble::data_frame())
  mtcars <- datasets::mtcars
  expect_equal(ps_bind_datas(), mtcars, check.attributes = FALSE)
  expect_identical(ps_bind_datas(), tibble::data_frame())
})
