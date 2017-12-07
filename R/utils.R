is_df <- function(name, envir) {
  is.data.frame(get(name, envir = envir))
}

remove_x <- function(x, envir) remove(list = x, envir = envir)
