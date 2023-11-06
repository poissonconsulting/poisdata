test_that("works", {
  df <- readRDS(file = system.file("df/df.rds", package = "poisdata"))
  df_chr <- df
  df_chr$chr <- "a"
  expect_identical(length(ls()), 2L)
  expect_identical(length(poisdata::ps_names_datas()), 2L)
  ps_env_map_df(fun = function(x) {
    dplyr::select_if(x, is.character)
  })
  expect_identical(ncol(df_chr), 1L)
  expect_identical(ncol(df), 0L)
  expect_identical(names(df_chr), "chr")
})
