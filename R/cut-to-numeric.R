#' Cut to Numeric
#'
#' @param x A character or factor vector of cuts
#'
#' @return An numeric vector of the cuts.
#' @export
#'
#' @examples
#' ps_cut_to_numeric(c(NA, "(0.25,0.75]", "[-2,-1)"))
ps_cut_to_numeric <- function(x) {
  chk::chk_character_or_factor(x)
  x1 <- stringr::str_extract(x, "(?<=(\\(|\\[))[-[.]\\d]+(?=,)")
  x2 <- stringr::str_extract(x, "(?<=,)[-[.]\\d]+(?=(\\)|\\]))")
  (as.numeric(x1) + as.numeric(x2)) / 2
}
