
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

An R package to read and write data for Poisson Consulting scripts and
packages.

## Demonstration

``` r
library(poisdata)

read_hobo_csv(system.file("hobo", "10723440.csv", package = "poisdata"))
#> imported 11 rows of data from '/Library/Frameworks/R.framework/Versions/3.4/Resources/library/poisdata/hobo/10723440.csv'
#> # A tibble: 11 x 6
#>      Logger            DateTime Temperature_degC FileRow FileName
#>       <chr>              <dttm>            <dbl>   <int>    <chr>
#>  1 10723440 2015-11-10 07:18:12           14.649       1 10723440
#>  2 10723440 2015-11-10 07:23:12           17.106       3 10723440
#>  3 10723440 2015-11-10 07:28:12           16.177       4 10723440
#>  4 10723440 2015-11-10 07:33:12           13.112       5 10723440
#>  5 10723440 2015-11-10 07:38:12           10.883       6 10723440
#>  6 10723440 2015-11-10 07:43:12            9.435       7 10723440
#>  7 10723440 2015-11-10 07:48:12            8.419       8 10723440
#>  8 10723440 2015-11-10 07:53:12            7.795       9 10723440
#>  9 10723440 2015-11-10 07:58:12            7.393      10 10723440
#> 10 10723440 2016-04-09 04:38:12            3.932      11 10723440
#> 11 10723440 2016-04-09 04:43:12            3.932      12 10723440
#> # ... with 1 more variables: Directory <chr>
```

## Installation

`poisdata` is available from GitHub

    # install.packages("devtools")
    devtools::install_github("poissonconsulting/poisdata")

or the Poisson R Archive Site
([PoisRAS](https://github.com/poissonconsulting/drat))

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
