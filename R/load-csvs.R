#' Load CSVs
#'
#' By default reads all files in the directory dir with the extension .csv
#' using \code{readr::read_csv()} and loads them into the
#' calling environment after renaming using \code{make.names(unique = TRUE)}.
#' It is useful for quickly loading a set of csv files into the workspace
#' (just call the function at the top level of a script).
#'
#' @param dir A string of the directory.
#' @param recursive A flag indicating whether to include files in subdirectories.
#' @param rename A function that is used to rename files (after removing extension .csv) before they are passed to \code{make.names}.
#' @param envir The environment to assign the data frames.
#' @param ... Additional arguments passed to \code{read_csv}.
#' @return An invisible character vector of the file names.
#' @export
ps_load_csvs <- function(dir = ".", recursive = FALSE,
                         rename = identity, envir = parent.frame(), ...) {
  ps_load_files(dir = dir, recursive = recursive,
                rename = rename, envir = envir)
}
