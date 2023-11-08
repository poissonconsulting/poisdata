test_that("multiplication works", {
  expect_identical(ps_cut_to_numeric(character(0)), numeric(0))
  expect_identical(ps_cut_to_numeric(factor(character(0))), numeric(0))
  expect_identical(ps_cut_to_numeric(NA_character_), NA_real_)
  expect_equal(
    ps_cut_to_numeric(c(NA, "(0.25,0.75]", "[-2,-1)")),
    c(NA, 0.5, -1.5)
  )
})
