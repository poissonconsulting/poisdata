#' Select Variable Columns
#'
#' @param x A data frame.
#' @param na_ignore A flag specifying whether to ignore missing values when
#' determining if variable.
#'
#' @return A data frame with constant columns removed.
#' @export
#'
#' @examples
#' ps_select_variable(data.frame(x = c(1, 1), y = c(2, 1)))
ps_select_variable <- function(x, na_ignore = FALSE) {
  chk::chk_flag(na_ignore)
  if (nrow(x) <= 1 || !ncol(x)) {
    return(x)
  }
  y <- dplyr::summarise(x, dplyr::across(dplyr::everything(), function(x) {
    variable_column(x, na_ignore = na_ignore)
  }))
  y <- vapply(y, identity, TRUE)
  y <- names(y)[y]
  x <- x[y]
  if (!ncol(x)) {
    x <- x[FALSE, , drop = FALSE]
  }
  x
}
