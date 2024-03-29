% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add-missing-sequence.R
\name{ps_add_missing_sequence}
\alias{ps_add_missing_sequence}
\title{Add Missing Sequence.}
\usage{
ps_add_missing_sequence(x, sequence = "DateTime", by = character(0))
}
\arguments{
\item{x}{The data.frame.}

\item{sequence}{A string naming the sequence column.}

\item{by}{A character vector of columns to add the missing sequence by.}
}
\value{
A tbl data frame sorted by DateTime.
}
\description{
Adds missing sequence to a data frame.
All missing values between the minimum and maximum values
with the smallest interval
in the data are added.
}
\examples{
datetime <- as.POSIXct("2001-01-02 03:04:06") + c(1, 3, 9)
ps_add_missing_sequence(data.frame(DateTime = datetime, Value = c(1, 3, 9)))
}
