#' Load Files
#'
#' By default reads all files in the directory dir that match the pattern
#' using \code{read_csv} and loads them into the
#' calling environment after renaming using \code{make.names(unique = TRUE)}.
#' It is useful for quickly loading the data in a set of files into the workspace
#' (just call the function at the top level of a script).
#'
#' @param dir A string of the directory.
#' @param pattern A string of the regular expression to use to identify files.
#' @param read A function to read the files.
#' @param recursive A flag indicating whether to include files in subdirectories.
#' @param rename A function that is used to rename files (after removing the extension) before they are passed to \code{make.names}.
#' @param envir The environment to assign the data frames.
#' @param ... Additional arguments passed to \code{read}.
#' @return An invisible character vector of the file names.
#' @export
ps_load_files <- function(dir = ".",
                          pattern = "[.]csv$",
                          read = readr::read_csv,
                          recursive = FALSE,
                          rename = identity,
                          envir = parent.frame(), ...) {

  check_string(dir)
  check_string(pattern)
  check_function(read, nargs = c(1L, .Machine$integer.max))
  check_flag(recursive)
  check_function(rename, nargs = c(1L, .Machine$integer.max))
  check_environment(envir)

  if (!dir.exists(dir)) ps_error("directory '", dir, "' does not exist")

  file_names <- list.files(dir, pattern = pattern, full.names = TRUE,
                           recursive = recursive)
  files <- list.files(dir, pattern = pattern, full.names = FALSE,
                      recursive = recursive)
  if (!length(files)) {
    ps_warning("no files found")
    return(invisible(character(0)))
  }
  data <- purrr::map(file_names, read, ...)

  names(data) <- files
  names(data) %<>%
    tools::file_path_sans_ext() %>%
    rename() %>%
    make.names(unique = TRUE)

  purrr::imap(data, function(x, name) {assign(name, x, envir = envir)})
  invisible(files)
}
