#' Load CSVs
#'
#' @inheritParams ps_load_files
#' @return An invisible character vector of the file names.
#' @export
ps_load_csvs <- function(dir = ".", recursive = FALSE, add_name = NULL,
                         rename = identity, envir = parent.frame(), ...) {
  .Deprecated("ps_load_files")
  ps_load_files(
    dir = dir, recursive = recursive, add_name = add_name,
    rename = rename, envir = envir
  )
}
