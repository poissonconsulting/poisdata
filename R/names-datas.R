#' Names Data Frames
#'
#' Gets names of the data frames in by default the calling environment.
#'
#' @param envir The environment to get the names of the data frames for.
#' @return A character vector of the names of the data frames.
#' @export
#'
#' @examples
#' ps_names_datas()
ps_names_datas <- function(envir = parent.frame()) {
  check_environment(envir)
  names <- objects(envir = envir)
  is_df <- vapply(names, is_df, TRUE, envir)
  sort(names[is_df])
}
