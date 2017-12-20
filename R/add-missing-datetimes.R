#' Add Missing SequenceDate Times.
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
ps_add_missing_datetimes <- function(x, datetime = "DateTime", by = character(0)) {

  .Deprecated("ps_add_missing_sequence")
  ps_add_missing_sequence(x, sequence = datetime, by = by)
}
