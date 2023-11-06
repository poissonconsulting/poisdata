#' Write Data
#'
#' Writes all the data frames as files in the directory dir
#' using `write_csv`.
#'
#' @param dir A string of the directory.
#' @param envir The environment to find the data frames.
#' @return An invisible character vector of the object names.
#' @export
ps_write_data_csvs <- function(dir = ".", envir = parent.frame()) {
  chk_string(dir)
  chk_environment(envir)

  if (!dir.exists(dir)) ps_error("directory '", dir, "' does not exist")

  data_names <- ps_names_datas(envir = envir)
  if (!length(data_names)) {
    ps_warning("no data frames")
    return(invisible(character(0)))
  }

  write2 <- function(data_name, dir) {
    x <- get(data_name, envir = envir)
    readr::write_csv(x, file.path(dir, paste0(data_name, ".csv")))
  }

  purrr::walk(data_names, write2, dir = dir)
}
