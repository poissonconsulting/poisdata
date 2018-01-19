#' Get Group
#'
#' @param x A numeric or integer vector
#' @param breaks A uniquely named numeric vector of the first value of each group.
#'
#' @return An ordered factor of the group.
#' @export
#'
#' @examples
#' ps_get_group(c(-Inf,-1,0,19,20,69,70,Inf))
ps_get_group <- function (x, breaks = c(Recruit = 0, Juvenile = 20,
                                            Subadult = 50, Adult = 70)) {
  checkor(check_vector(x, c(1, NA)),
          check_vector(x, c(1L, NA)))
  check_vector(breaks, 1, length = c(1, .Machine$integer.max),
               unique = TRUE, sorted = TRUE)
  check_names(breaks, unique = TRUE)

  is_length <- length(x)
  if(!is_length) x <- 1

  levels <- names(breaks)
  breaks %<>% c(Inf)

  x %<>% cut(breaks = breaks, include.lowest = TRUE, right = FALSE, ordered_result = TRUE)

  levels(x) <- levels
  if(!is_length) x <- x[-1]
  x
}
