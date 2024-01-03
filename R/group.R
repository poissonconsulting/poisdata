#' Get Group
#'
#' @param x A numeric or integer vector
#' @param breaks A uniquely named numeric vector of the first value of each group.
#'
#' @return An ordered factor of the group.
#' @export
#'
#' @examples
#' ps_get_group(c(-Inf, -1, 0, 19, 20, 69, 70, Inf))
ps_get_group <- function(x, breaks = c(
                           Recruit = 0, Juvenile = 20,
                           Subadult = 50, Adult = 70
                         )) {
  chk_vector(x)
  chk_numeric(x)
  check_dim(breaks, values = c(1, .Machine$integer.max))
  chk_unique(breaks)
  chk_sorted(breaks)
  check_names(breaks)
  chk_unique(names(breaks))

  is_length <- length(x)
  if (!is_length) x <- 1

  levels <- names(breaks)
  breaks %<>% c(Inf)

  x %<>% cut(breaks = breaks, include.lowest = TRUE, right = FALSE, ordered_result = TRUE)

  levels(x) <- levels
  if (!is_length) x <- x[-1]
  x
}
