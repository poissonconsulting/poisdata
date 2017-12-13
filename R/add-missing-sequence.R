#' Add Missing Sequence.
#'
#' Adds missing sequence to a data frame.
#' All missing values between the minimum and maximum values
#' with the smallest interval
#' in the data are added.
#'
#' @param x The data.frame.
#' @param sequence A string naming the sequence column.
#' @param by A character vector of columns to add the missing sequence by.
#'
#' @return A tbl data frame sorted by DateTime.
#' @export
#'
#' @examples
#' datetime <- as.POSIXct("2001-01-02 03:04:06") + c(1,3,9)
#' ps_add_missing_sequence(data.frame(DateTime = datetime, Value = c(1,3,9)))
ps_add_missing_sequence <- function(x, sequence = "DateTime", by = character(0)) {
  check_string(sequence)
  check_vector(by, "", unique = TRUE)

  check_data(x)
  check_colnames(x, sequence)

  if(length(by)) {
    check_colnames(x, by)
    if(sequence %in% by) ps_error("sequence column '", sequence, "' must not also be in by" )
  }
  x %<>% tibble::as_tibble()

  if(!nrow(x)) return(x)

  colnames <- colnames(x)

  # no bys
  if(!length(by)) {
    new <- tibble::data_frame(Sequence = sequence(x[[sequence]]))
    colnames(new) <- sequence
    x %<>% dplyr::left_join(new, ., by = sequence) %>%
      dplyr::arrange(UQ(parse_quosure(sequence)))
    x <- x[colnames]
    return(x)
  }
  # only one combination of bys
  if(length(unique(plyr::id(x[by]))) == 1L) {
    x %<>% ps_add_missing_sequence(sequence = sequence)
    x[,by] <- x[1L,by]
    x <- x[colnames]
    return(x)
  }

  x %<>% plyr::ddply(by, ps_add_missing_sequence, sequence = sequence, by = by)
  x <- x[colnames]
  x
}
