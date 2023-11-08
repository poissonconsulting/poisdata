test_that("bind_datas", {
  expect_identical(
    ps_get_group(c(-Inf, -1, 0, 19, 20, 69, 70, Inf)),
    ordered(
      c(
        NA, NA, "Recruit", "Recruit", "Juvenile",
        "Subadult", "Adult", "Adult"
      ),
      levels = c("Recruit", "Juvenile", "Subadult", "Adult")
    )
  )
  expect_identical(
    ps_get_group(20L),
    ordered("Juvenile",
      levels = c("Recruit", "Juvenile", "Subadult", "Adult")
    )
  )
  expect_identical(
    ps_get_group(numeric()),
    ordered("Recruit", levels = c("Recruit", "Juvenile", "Subadult", "Adult"))[-1]
  )
})
