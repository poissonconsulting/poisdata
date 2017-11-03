#' Replace values over set of columns
#'
#' From argument may contain multiple values. Class of column is retained even if replacement value is of different class.
#'
#' @param x A data.frame or tbl object.
#' @param columns A vector of chracter strings indicating columns to modify.
#' @param from A vector of values to be replaced.
#' @param to A value to replace with.
#' @return The modified object.
#' @export
ps_replace_values <- function(x, columns = names(x), from, to = NA) {
  x[columns] <- purrr::modify(x[columns], function(y){
    if(any(y %in% from)){replace(y, y %in% from, to)} else {
      y <- y
    }
  })
  x
}

