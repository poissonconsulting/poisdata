#' Load Excel sheets
#'
#' Loads all excel sheets in a workbook as data.frames into specified environment.
#'
#' @param file A string of the path to the file.
#' @param rename A function that is used to rename files (after removing extension .csv) before they are passed to make.names.
#' @param envir The environment to assign the data frames.
#' @return An invisible character vector of the sheet names.
#' @export
ps_load_excel <- function (file = ".",
                           rename = identity,
                           envir = parent.frame())
{
  check_string(file)
  if (!is.function(rename))
    ps_error("rename must be a function")
  if (!file.exists(file))
    ps_error("file '", file, "' does not exist")

  sheets <- readxl::excel_sheets(file)

  data <- purrr::map(sheets, function(x){
    readxl::read_excel(file, sheet = x)})

  names(data) <- sheets
  names(data) %<>% rename() %>%
    make.names(unique = TRUE)

  purrr::imap(data, function(x, name) {
    assign(name, x, envir = envir)
  })
  invisible(sheets)
}

