#' Bind Data
#'
#' Binds all the data frames in the environment by rows (and removes them)
#'
#' @param envir The environment containing the data frames.
#' @param rm A flag indicating wether to remove the data frames.
#' @return The bound data frames as tbl data frame or an empty data frame.
#' @export
ps_bind_datas <- function(envir = parent.frame(), rm = TRUE) {
  chk_flag(rm)
  names <- ps_names_datas(envir)
  if(!length(names)) return(tibble::tibble())

  ..data <- purrr::map(names, get, envir = envir)

  ..data %<>% dplyr::bind_rows()
  if(rm) purrr::map(names, remove_x, envir = envir)

  ..data
}
