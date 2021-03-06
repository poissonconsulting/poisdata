% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/replace-values.R
\name{ps_replace_values}
\alias{ps_replace_values}
\title{Replace values over set of columns}
\usage{
ps_replace_values(x, columns = names(x), from, to = NA_character_)
}
\arguments{
\item{x}{A data.frame, tibble, or sf object.}

\item{columns}{A vector of character strings indicating columns to modify.}

\item{from}{A vector of values to be replaced.}

\item{to}{A value to replace with.}
}
\value{
The modified object.
}
\description{
From argument may contain multiple values. Class of column is retained, except if coerced by replacement value.
}
