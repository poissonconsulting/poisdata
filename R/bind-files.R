#' Bind Data
#'
#' Binds all the data frames in files by rows (and removes them)
#'
#' @inheritParams ps_load_files
#' @return The bound data frames as tbl data frame.
#' @export
ps_bind_files <- function(dir = ".",
                          pattern = "[.]csv$",
                          recursive = FALSE,
                          read = readr::read_csv,
                          ...) {

  ps_load_files(dir = dir, pattern = pattern, recursive = recursive,
                read = read, ...)

  ps_bind_datas()
}
