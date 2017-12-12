#' Add Missing Date Times.
#'
#' Adds missing datetimes to a data frame.
#' All missing datetimes between the first and last datetime
#' with the smallest interval
#' in the data are added.
#'
#' @param x The data.frame.
#' @param datetime A string naming the POSIXt column.
#'
#' @return A tbl data frame sorted by DateTime.
#' @export
#'
#' @examples
#' datetime <- as.POSIXct("2001-01-02 03:04:06") + c(1,3,9)
#' ps_add_missing_datetimes(data.frame(DateTime = datetime, Value = c(1,3,9)))
ps_add_missing_datetimes <- function(x, datetime = "DateTime") {
  check_string(datetime)

  values <- list(as.POSIXct("2001-01-02 03:04:05"))
  names(values) <- datetime

  check_data(x, values)

  x %<>% tibble::as_tibble()

  if(!nrow(x)) return(x)

  new <- tibble::data_frame(DateTime = seq_datetime(x[[datetime]]))
  x %<>% dplyr::left_join(new, ., by = datetime) %>%
    dplyr::arrange(UQ(parse_quosure(datetime)))
  x
}
