#' Cumulative Sequence
#'
#' Determines when in sequence a cumulative sum is reached.
#' Useful for ATUs.
#'
#' @param x A scalar specifying the start.
#' @param cumsum A scalar specifying the cumulative sum.
#' @param data The data.frame.
#' @param sequence A string naming the sequence column.
#' @param value A string of the value column.
#' @return A scalar of the end.
#' @export
ps_cumulative_sequence <- function(x, cumsum, data, sequence = "DateTime", value = "Value") {
  check_scalar(x)
  check_scalar(cumsum)
  check_string(sequence)
  check_string(value)

  check_data(data)
  check_colnames(data, sequence)
  check_colnames(data, value)

  if(sequence == value)
    ps_error("value column '", value, "' must not be the same as sequence")

  data %<>%
    tibble::as_tibble() %>%
    dplyr::arrange(UQ(parse_quosure(sequence)))

  na <- x
  is.na(na) <- TRUE

  if(nrow(data) < 2L) return(na)

  if(!identical(length(unique(diff(data[[sequence]]))), 1L))
    ps_error("sequence must be unique and complete (try ps_add_missing_sequence)")

  if(any(is.na(data[[value]])))
    ps_error("value must not have missing values (try ps_interpolate_sequence)")

  if(!x %in% data[[sequence]]) return(na)

  data <- data[data[[sequence]] > x,]
  data$cumsum <- cumsum(data[[value]])
  data <- data[data$cumsum >= cumsum,]

  if(!nrow(data)) return(na)

  data[[sequence]][1]
}
