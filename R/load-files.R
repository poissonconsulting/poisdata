#' Load Files
#'
#' By default reads all files in the directory dir that match the pattern
#' using \code{read_csv} and loads them into the
#' calling environment after renaming using \code{make.names(unique = TRUE)}.
#' It is useful for quickly loading the data in a set of files into the workspace
#' (just call the function at the top level of a script).
#'
#' If bind = TRUE it returns the bound data and does not load the individual
#' data.
#'
#' @param dir A string of the directory.
#' @param pattern A string of the regular expression to use to identify files.
#' @param recursive A flag indicating whether to include files in subdirectories.
#' @param read A function to read the files.
#' @param bind A flag indicating whether to bind and return the data.
#' @param rename A function that is used to rename files (after removing the extension) before they are passed to \code{make.names}.
#' @param envir The environment to assign the data frames.
#' @param ... Additional arguments passed to \code{read}.
#' @return An invisible character vector of the file names or a tibble of the bound data.
#' @export
ps_load_files <- function(dir = ".",
                          pattern = "[.]csv$",
                          recursive = FALSE,
                          read = readr::read_csv,
                          bind = FALSE,
                          rename = identity,
                          envir = parent.frame(), ...) {

  check_string(dir)
  check_string(pattern)
  check_flag(recursive)
  check_function(read, nargs = c(1L, .Machine$integer.max))
  check_flag(bind)
  check_function(rename, nargs = c(1L, .Machine$integer.max))
  check_environment(envir)

  if (!dir.exists(dir)) ps_error("directory '", dir, "' does not exist")

  file_names <- list.files(dir, pattern = pattern, full.names = TRUE,
                           recursive = recursive)
  files <- list.files(dir, pattern = pattern, full.names = FALSE,
                      recursive = recursive)
  if (!length(files)) {
    ps_warning("no files found")
    if(!bind) return(invisible(character(0)))
    return(tibble::data_frame())
  }

  read2 <- function(x, ...) {
    try(x <- read(x, ...))
    x
  }

  data <- purrr::map(file_names, read2, ...)

  names(data) <- files  %>%
    tools::file_path_sans_ext() %>%
    rename() %>%
    make.names(unique = TRUE)

  fail <- purrr::map_lgl(data, is.character)

  if(any(fail)) {
    failed <- data[fail] %>% unlist()
    ps_warning("the following ", ps_plural("file", length(failed)), " failed to read:", ps_punctuate(failed, "and"))
  }

  data <- data[!fail]

  if (!length(data)) {
    ps_warning("no readable files")
    if(!bind) return(invisible(character(0)))
    return(tibble::data_frame())
  }

  if(!bind) {
    purrr::imap(data, function(x, name) {assign(name, x, envir = envir)})
    return(invisible(files))
  }
  if(identical(length(data), 1L)) return(data[[1]])
  data %<>% dplyr::bind_rows()
  data
}
