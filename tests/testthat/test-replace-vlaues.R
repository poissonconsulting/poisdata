test_that("replaces values for columns with identical class to from vector", {
  x <- readRDS(system.file("df/df.rds", package = "poisdata"))
  x$cylf <- as.character(x$cyl)
  x2 <-  ps_replace_values(x, from = 6, to = NA_real_)
  # retains class
  expect_identical(class(x$cylf), class(x2$cylf))
  # certain columns
  x2 <- ps_replace_values(x, columns = c("mpg"), from = 6, to = NA_real_)
  expect_true(any(!is.na(x2$cyl)))

  # works for sf objects
  xsf <- readRDS(system.file("sf/x.rds", package = "poisdata"))
  expect_is(xsf, "sf")
  xsf2 <- ps_replace_values(xsf, from = 6, to = NA_real_)
  expect_identical(class(xsf$cylf), class(xsf2$cylf))
  expect_is(xsf2, "sf")
  # does not give warning when sf object and specific columns argument
  xsf3 <- ps_replace_values(xsf, columns = c("cyl", "carb", "mpg"), from = 6, to = NA_real_)
  expect_identical(xsf2, xsf3)
  # check that different to class does not change class of all columns
  xsf2 <- ps_replace_values(xsf, from = 6, to = "6")
  expect_is(xsf2$mpg, "numeric")
  # check that when specify specific column with active sfc, error does not occur
  xsf2 <- ps_replace_values(xsf, columns = c("cyl"), from = 6, to = NA_real_)
  expect_is(xsf2$mpg, "numeric")
  expect_identical(class(xsf$cylf), class(xsf2$cylf))
  expect_true(any(is.na(xsf2$cyl)))
})
