is_df <- function(name, envir) {
  is.data.frame(get(name, envir = envir))
}

remove_x <- function(x, envir) remove(list = x, envir = envir)

seq_datetime <- function(x) {
  x <- sort(x)
  if(length(x) < 2L) return(x)
  from <- dplyr::first(x)
  to <- dplyr::last(x)
  by <- min(diff(x))
  seq(from = from, to = to, by = by)
}
