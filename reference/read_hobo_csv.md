# Read Hobo CSVs

Read Hobo CSVs

## Usage

``` r
read_hobo_csv(
  file = ".",
  orders = c("Ymd HMS", "dmy HMS"),
  units = "degC",
  tz = "Etc/GMT+8",
  recursive = FALSE,
  quiet = FALSE
)
```

## Arguments

- file:

  A string of the file or directory.

- orders:

  A character vector of date-time formats used by
  [`lubridate::parse_date_time()`](https://lubridate.tidyverse.org/reference/parse_date_time.html).

- units:

  A string of the units to convert the temperature data to using
  [`units::set_units()`](https://r-quantities.github.io/units/reference/units.html).

- tz:

  A string of the time zone to convert the date times to using
  [`lubridate::with_tz()`](https://lubridate.tidyverse.org/reference/with_tz.html).

- recursive:

  A flag indicating whether to read files from subdirectories.

- quiet:

  A flag indicating whether to provide messages. Ignored if file is a
  file (as opposed to a directory).

## Value

A tibble of the data with the temperature.

## Examples

``` r
read_hobo_csv(system.file("hobo", "10723440.csv", package = "poisdata"))
#> imported 11 rows of data from '/home/runner/work/_temp/Library/poisdata/hobo/10723440.csv'
#> # A tibble: 11 × 6
#>    Logger   DateTime            Temperature_degC FileRow FileName Directory     
#>    <chr>    <dttm>                         <dbl>   <dbl> <chr>    <chr>         
#>  1 10723440 2015-11-10 07:18:12            14.6        1 10723440 /home/runner/…
#>  2 10723440 2015-11-10 07:23:12            17.1        3 10723440 /home/runner/…
#>  3 10723440 2015-11-10 07:28:12            16.2        4 10723440 /home/runner/…
#>  4 10723440 2015-11-10 07:33:12            13.1        5 10723440 /home/runner/…
#>  5 10723440 2015-11-10 07:38:12            10.9        6 10723440 /home/runner/…
#>  6 10723440 2015-11-10 07:43:12             9.44       7 10723440 /home/runner/…
#>  7 10723440 2015-11-10 07:48:12             8.42       8 10723440 /home/runner/…
#>  8 10723440 2015-11-10 07:53:12             7.80       9 10723440 /home/runner/…
#>  9 10723440 2015-11-10 07:58:12             7.39      10 10723440 /home/runner/…
#> 10 10723440 2016-04-09 04:38:12             3.93      11 10723440 /home/runner/…
#> 11 10723440 2016-04-09 04:43:12             3.93      12 10723440 /home/runner/…
```
