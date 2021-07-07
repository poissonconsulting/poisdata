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
#' @param recursive A flag indicating whether to include files in subdirectories.
#' @param read A function to read the files.
#' @param add_name A string specifying the name of the column to add to each data frame with the file names (including subdirectories).
#' @param rename A function that is used to rename files (after removing the extension) before they are passed to \code{make.names}.
#' @param envir The environment to assign the data frames.
#' @param ... Additional arguments passed to \code{read}.
#' @return An invisible character vector of the file names.
#' @export
ps_load_files <- function(dir = ".",
                          pattern = "[.]csv$",
                          recursive = FALSE,
                          read = readr::read_csv,
                          add_name = NULL,
                          rename = identity,
                          envir = parent.frame(), ...) {

  chk_string(dir)
  chk_string(pattern)
  chk_flag(recursive)
  check_function(read, nargs = c(1L, .Machine$integer.max))

  chkor(chk_null(add_name), chk_string(add_name))
  check_function(rename, nargs = c(1L, .Machine$integer.max))
  chk_environment(envir)

  if (!dir.exists(dir)) ps_error("directory '", dir, "' does not exist")

  file_names <- list.files(dir, pattern = pattern, full.names = TRUE,
                           recursive = recursive)
  files <- list.files(dir, pattern = pattern, full.names = FALSE,
                      recursive = recursive)
  if (!length(files)) {
    ps_warning("no files found")
    return(invisible(character(0)))
  }

  read2 <- function(x, ...) {
    try(x <- read(x, ...))
    x
  }

  data <- purrr::map(file_names, read2, ...)

  names(data) <- files

  fail <- purrr::map_lgl(data, is.character)

  if(any(fail)) {
    failed <- data[fail] %>% unlist()
    ps_warning("the following ", ps_plural("file", length(failed)), " failed to read:", ps_punctuate(failed, "and"))
  }

  data <- data[!fail]

  if (!length(data)) {
    ps_warning("no readable files")
    return(invisible(character(0)))
  }

  if(!is.null(add_name))
    data %<>% purrr::imap(function(x, name) {x[add_name] <- name; x})

  names(data) %<>%
    tools::file_path_sans_ext() %>%
    rename() %>%
    make.names(unique = TRUE)

  purrr::imap(data, function(x, name) {assign(name, x, envir = envir)})
  invisible(files)
}
