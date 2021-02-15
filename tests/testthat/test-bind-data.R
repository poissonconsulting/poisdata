test_that("bind_datas", {
  expect_identical(ps_bind_datas(), tibble::tibble())
  mtcars <- datasets::mtcars
  expect_equal(ps_bind_datas(), mtcars, check.attributes = FALSE)
  expect_identical(ps_bind_datas(), tibble::tibble())
})
