#' Replace values over set of columns
#'
#' From argument may contain multiple values. Class of column is retained, except if coerced by replacement value.
#'
#' @param x A data.frame, tibble, or sf object.
#' @param columns A vector of character strings indicating columns to modify.
#' @param from A vector of values to be replaced.
#' @param to A value to replace with.
#' @return The modified object.
#' @export
ps_replace_values <- function(x, columns = names(x), from, to = NA_character_) {
  x <- purrr::modify_at(x, columns, function(y){
    if(any(y %in% from)){replace(y, y %in% from, to)} else {
      y <- y
    }
  })
  x
}
