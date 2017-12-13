#' Interpolate Sequence
#'
#' Interpolates missing values in sequence using \code{\link[stats]{approx}}
#'
#' @param x The data.frame.
#' @param sequence A string naming the sequence column.
#' @param value A character vector of the value column.
#' @param by A character vector of columns to interpolate by.
#' @param max_gap A count of the maximum gap to interpolate within.
#' @param method A string specifying the method (linear or constant).
#' @param step An probability (number between 0 and 1 inclusive) specifing
#' the compromise between left- and right- continuous step function.
#' @return A tbl data frame sorted by sequence and by.
#' @export
ps_interpolate_sequence <- function(x, sequence = "DateTime", value = "Value",
                                    by = character(0),
                                    max_gap = 10L,
                                    method = "linear",
                                    step = 0.5) {
  check_string(sequence)
  check_string(value)
  max_gap <- check_count(max_gap, coerce = TRUE)

  check_vector(by, "", unique = TRUE)
  check_vector(method, c("linear", "constant", "constant"), length = 1L)
  step <- check_probability(step, coerce = TRUE)

  check_data(x)
  check_colnames(x, sequence)
  check_colnames(x, value)

  if(sequence == value)
    ps_error("value column '", value, "' must not be the same as sequence")

  if(length(by)) {
    check_colnames(x, by)
    if(sequence %in% by)
      ps_error("sequence column '", sequence, "' must not also be in by" )
    if(value %in% by)
      ps_error("value column '", value, "' must not also be in by" )
  }

  if(!length(by)) {
    x %<>%
      tibble::as_tibble() %>%
      dplyr::arrange(UQ(parse_quosure(sequence)))

    if(nrow(x) < 2L || max_gap == 0L) return(x)

    if(!identical(length(unique(diff(x[[sequence]]))), 1L))
      ps_error("sequence must be unique and complete (try ps_add_missing_sequence)")
    gap <- size_gaps(is.na(x[[value]]))
    x[[value]] <- stats::approx(x[[value]], xout = 1:length(x[[value]]),
                                method = method, f = step)$y
    is.na(x[[value]][gap > max_gap]) <- TRUE
    return(x)
  }

  x %<>% plyr::ddply(by, ps_interpolate_sequence, sequence = sequence,
                     value = value, max_gap = max_gap, method = method, step = step)
  x
}
