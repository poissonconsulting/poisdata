variable_column <- function(x, na_ignore = FALSE) {
  x <- unique(x)
  if(na_ignore)
    x <- x[!is.na(x)]
  length(x) > 1
}

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

sequence <- function(x) {
  x <- sort(x)
  if(length(x) < 2L) return(x)
  from <- dplyr::first(x)
  to <- dplyr::last(x)
  by <- min(diff(x))
  seq(from = from, to = to, by = by)
}

#' Size Gaps
#'
#' @param x A logical vector where TRUE indicates a gap.
#'
#' @return An integer vector of the size of gap each element occurs in.
#' @keywords internal
size_gaps <- function(x) {
  stopifnot(is.logical(x))
  stopifnot(all(!is.na(x)))

  if(!length(x)) return(integer(0))
  gaps <- rep(0L, length(x))

  which <- which(x)
  if(!length(which)) return(gaps)

  contin <- c(diff(which), 2L) == 1L
  n <- length(contin)
  gap <- rep(1L, n)
  i <- 1L
  while(i <= n) {
    if(contin[i]) {
      j <- i + 1L
      while(contin[j]) {
        j <- j + 1L
      }
      gap[i:j] <- j - i + 1L
      i <- j + 1L
    } else {
      i <- i + 1L
    }
  }
  gaps[which] <- gap
  gaps
}

