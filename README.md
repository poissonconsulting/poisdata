
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
datetime <- as.POSIXct("2001-01-02 03:04:06") + c(1:10)
data <- data.frame(DateTime = datetime, Value = c(1,NA,3,NA,NA,3,NA,NA,NA,7))
ps_interpolate_sequence(data)
#> # A tibble: 10 x 2
#>               DateTime Value
#>                 <dttm> <dbl>
#>  1 2001-01-02 03:04:07     1
#>  2 2001-01-02 03:04:08     2
#>  3 2001-01-02 03:04:09     3
#>  4 2001-01-02 03:04:10     3
#>  5 2001-01-02 03:04:11     3
#>  6 2001-01-02 03:04:12     3
#>  7 2001-01-02 03:04:13     4
#>  8 2001-01-02 03:04:14     5
#>  9 2001-01-02 03:04:15     6
#> 10 2001-01-02 03:04:16     7
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
