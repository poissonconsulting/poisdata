#' Load CSVs
#'
#' By default reads all files in the directory dir with the extension .csv
#' using \code{readr::read_csv()} and loads them into the
#' calling environment after renaming using \code{make.names(unique = TRUE)}.
#' It is useful for quickly loading a set of csv files into the workspace
#' (just call the function at the top level of a script).
#'
#' @param dir A string of the directory.
#' @param pattern A string of the regular expression to use to identify files.
#' @param recursive A flag indicating whether to include files in subdirectories.
#' @param rename A function that is used to rename files (after removing extension .csv) before they are passed to \code{make.names}.
#' @param envir The environment to assign the data frames.
#' @param ... Additional arguments passed to \code{read_csv}.
#' @return An invisible character vector of the file names.
#' @export
ps_load_csvs <- function(dir = ".", pattern = "[.]csv$", recursive = FALSE,
                         rename = identity, envir = parent.frame(), ...) {

  check_string(dir)
  check_string(pattern)
  check_flag(recursive)

  if (!is.function(rename)) ps_error("rename must be a function")

  if (!dir.exists(dir)) ps_error("directory '", dir, "' does not exist")

  file_names <- list.files(dir, pattern = pattern, full.names = TRUE,
                           recursive = recursive)
  files <- list.files(dir, pattern = pattern, full.names = FALSE,
                      recursive = recursive)
  if (!length(files)) {
    ps_warning("no csv files found")
    return(invisible(character(0)))
  }
  data <- purrr::map(file_names, readr::read_csv, ...)

  names(data) <- files
  names(data) %<>%
    str_replace("[.]csv$", "") %>%
    rename() %>%
    make.names(unique = TRUE)

  purrr::imap(data, function(x, name) {assign(name, x, envir = envir)})
  invisible(files)
}
