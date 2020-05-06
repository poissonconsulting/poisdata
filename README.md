
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Coverage
Status](https://img.shields.io/codecov/c/github/poissonconsulting/poisdata/master.svg)](https://codecov.io/github/poissonconsulting/poisdata?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
<!-- badges: end -->

# poisdata

An R package to read, write and manipulate data frames.

## Demonstration

``` r
library(poisdata)
datetime <- as.POSIXct("2001-01-02 03:04:06") + c(2,1,4,7)
data <- data.frame(DateTime = datetime, Value = c(5,1,3,4))
print(data)
#>              DateTime Value
#> 1 2001-01-02 03:04:08     5
#> 2 2001-01-02 03:04:07     1
#> 3 2001-01-02 03:04:10     3
#> 4 2001-01-02 03:04:13     4
data <- ps_add_missing_sequence(data)
#> Warning: `data_frame()` is deprecated as of tibble 1.1.0.
#> Please use `tibble()` instead.
#> This warning is displayed once every 8 hours.
#> Call `lifecycle::last_warnings()` to see where this warning was generated.
#> Warning: `parse_quosure()` is deprecated as of rlang 0.2.0.
#> Please use `parse_quo()` instead.
#> This warning is displayed once per session.
print(data)
#> # A tibble: 7 x 2
#>   DateTime            Value
#>   <dttm>              <dbl>
#> 1 2001-01-02 03:04:07     1
#> 2 2001-01-02 03:04:08     5
#> 3 2001-01-02 03:04:09    NA
#> 4 2001-01-02 03:04:10     3
#> 5 2001-01-02 03:04:11    NA
#> 6 2001-01-02 03:04:12    NA
#> 7 2001-01-02 03:04:13     4
ps_interpolate_sequence(data)
#> # A tibble: 7 x 2
#>   DateTime            Value
#>   <dttm>              <dbl>
#> 1 2001-01-02 03:04:07  1   
#> 2 2001-01-02 03:04:08  5   
#> 3 2001-01-02 03:04:09  4   
#> 4 2001-01-02 03:04:10  3   
#> 5 2001-01-02 03:04:11  3.33
#> 6 2001-01-02 03:04:12  3.67
#> 7 2001-01-02 03:04:13  4
```

## Installation

`poisdata` is available from GitHub

    # install.packages("remotes")
    remotes::install_github("poissonconsulting/poisdata")

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/poisdata/issues).

[Pull requests](https://github.com/poissonconsulting/poisdata/pulls) are
always welcome.

Please note that this project is released with a [Contributor Code of
Conduct](https://github.com/poissonconsulting/poisdata/blob/master/CONDUCT.md).
By participating in this project you agree to abide by its terms.
