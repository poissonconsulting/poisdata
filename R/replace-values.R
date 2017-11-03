#' Replace values over set of columns
#'
#' Replace any number of values over a specified set of columns. Class is retained.
#'
#' @param x A data.frame or tbl object.
#' @param columns A vector of chracter strings indicating columns to modify.
#' @param from A vector of values to be replaced.
#' @param to A value to replace with.
#' @return The modified object.
#' @export
ps_replace_values <- function(x, columns = names(x), from = 8, to = NA_character_) {
  classes <- purrr::map(x, class)
  x[columns] <- purrr::modify(x[columns], function(y) replace(y, y %in% from, to))
  x[] <- mapply(FUN = as, x , classes, SIMPLIFY = FALSE)
  x
}
