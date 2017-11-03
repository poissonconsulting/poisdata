context("replace-values")

test_that("replaces values and retains class", {
  x <- mtcars
  ccyl <- class(x$cyl)
  x %<>% ps_replace_values(columns = c("mpg", "cyl", "disp", "hp"), from = 6, to = NA_character_)
  expect_true(x$cyl != 6 || is.na(x$cyl))
  expect_identical(ccyl, class(x$cyl))
})
