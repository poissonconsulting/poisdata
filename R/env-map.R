#' Environment map
#'
#' Map a function to all data.frames in envir.
#'
#' @param fun A function.
#' @param envir The environment.
#' @return An invisible vector of the modified data frames.
#' @export

ps_env_map_df <- function(fun, envir = parent.frame()) {
  chk_environment(envir)
  chk_is(fun, "function")

  names <- poisdata::ps_names_datas(envir = envir)

  names %<>% purrr::map(function(x) {
    data <- get(x, envir) %>%
      fun(.) %>%
      assign(x, ., envir)

    data
  })

  invisible(unlist(names))
}
