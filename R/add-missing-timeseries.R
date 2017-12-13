#' Add Missing Date Times.
#'
#' Adds missing datetimes to a data frame.
#' All missing datetimes between the first and last datetime
#' with the smallest interval
#' in the data are added.
#'
#' @param x The data.frame.
#' @param datetime A string naming the POSIXt column.
#' @param by A character vector of columns to add the missing datetimes by.
#'
#' @return A tbl data frame sorted by DateTime.
#' @export
#'
#' @examples
#' datetime <- as.POSIXct("2001-01-02 03:04:06") + c(1,3,9)
#' ps_add_missing_datetimes(data.frame(DateTime = datetime, Value = c(1,3,9)))
ps_add_missing_datetimes <- function(x, datetime = "DateTime", by = character(0)) {
  check_string(datetime)
  check_vector(by, "", unique = TRUE)

  values <- list(as.POSIXct("2001-01-02 03:04:05"))
  names(values) <- datetime

  check_data(x, values)
  if(length(by)) {
    check_colnames(x, by)
    if(datetime %in% by) ps_error("datetime column '", datetime, "' must not also be in by" )
  }
  x %<>% tibble::as_tibble()

  if(!nrow(x)) return(x)

  # no bys
  if(!length(by)) {
    new <- tibble::data_frame(DateTime = seq_datetime(x[[datetime]]))
    colnames(new) <- datetime
    x %<>% dplyr::left_join(new, ., by = datetime) %>%
      dplyr::arrange(UQ(parse_quosure(datetime)))
    return(x)
  }
  # only one combination of bys
  if(length(unique(plyr::id(x[by]))) == 1L) {
    x %<>% ps_add_missing_datetimes(datetime = datetime)
    x[,by] <- x[1L,by]
    return(x)
  }

  x %<>% plyr::ddply(by, ps_add_missing_datetimes, datetime = datetime, by = by)
  x
}
