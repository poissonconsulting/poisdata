
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![stability-unstable](https://img.shields.io/badge/stability-unstable-yellow.svg)](https://github.com/joethorley/stability-badges#unstable)
[![Travis-CI Build
Status](https://travis-ci.org/poissonconsulting/poisdata.svg?branch=master)](https://travis-ci.org/poissonconsulting/poisdata)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/poissonconsulting/poisdata?branch=master&svg=true)](https://ci.appveyor.com/project/poissonconsulting/poisdata)
[![Coverage
Status](https://img.shields.io/codecov/c/github/poissonconsulting/poisdata/master.svg)](https://codecov.io/github/poissonconsulting/poisdata?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/poisdata)](https://cran.r-project.org/package=poisdata)

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
print(data)
#> # A tibble: 7 x 2
#>              DateTime Value
#>                <dttm> <dbl>
#> 1 2001-01-02 03:04:07     1
#> 2 2001-01-02 03:04:08     5
#> 3 2001-01-02 03:04:09    NA
#> 4 2001-01-02 03:04:10     3
#> 5 2001-01-02 03:04:11    NA
#> 6 2001-01-02 03:04:12    NA
#> 7 2001-01-02 03:04:13     4
ps_interpolate_sequence(data)
#> # A tibble: 7 x 2
#>              DateTime    Value
#>                <dttm>    <dbl>
#> 1 2001-01-02 03:04:07 1.000000
#> 2 2001-01-02 03:04:08 5.000000
#> 3 2001-01-02 03:04:09 4.000000
#> 4 2001-01-02 03:04:10 3.000000
#> 5 2001-01-02 03:04:11 3.333333
#> 6 2001-01-02 03:04:12 3.666667
#> 7 2001-01-02 03:04:13 4.000000
```

## Installation

`poisdata` is available from GitHub

    # install.packages("devtools")
    devtools::install_github("poissonconsulting/poisdata")

or the Poisson R Archive Network
([PoisRAN](https://github.com/poissonconsulting/drat))

    # install.packages("drat")
    drat::addRepo("poissonconsulting")
    install.packages("poisdata")

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/poisdata/issues).

[Pull requests](https://github.com/poissonconsulting/poisdata/pulls) are
always welcome.

Please note that this project is released with a [Contributor Code of
Conduct](https://github.com/poissonconsulting/poisdata/blob/master/CONDUCT.md).
By participating in this project you agree to abide by its terms.
