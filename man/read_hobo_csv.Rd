% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read-hobo-csv.R
\name{read_hobo_csv}
\alias{read_hobo_csv}
\title{Read Hobo CSVs}
\usage{
read_hobo_csv(
  file = ".",
  orders = c("Ymd HMS", "dmy HMS"),
  units = "degC",
  tz = "Etc/GMT+8",
  recursive = FALSE,
  quiet = FALSE
)
}
\arguments{
\item{file}{A string of the file or directory.}

\item{orders}{A character vector of date-time formats used by \code{\link[lubridate:parse_date_time]{lubridate::parse_date_time()}}.}

\item{units}{A string of the units to convert the temperature data to using  \code{\link[units:units]{units::set_units()}}.}

\item{tz}{A string of the time zone to convert the date times to using \code{\link[lubridate:with_tz]{lubridate::with_tz()}}.}

\item{recursive}{A flag indicating whether to read files from subdirectories.}

\item{quiet}{A flag indicating whether to provide messages.
Ignored if file is a file (as opposed to a directory).}
}
\value{
A tibble of the data with the temperature.
}
\description{
Read Hobo CSVs
}
\examples{
read_hobo_csv(system.file("hobo", "10723440.csv", package = "poisdata"))
}
