# Names Data Frames

Gets names of the data frames in by default the calling environment.

## Usage

``` r
ps_names_datas(envir = parent.frame())
```

## Arguments

- envir:

  The environment to get the names of the data frames for.

## Value

A character vector of the names of the data frames.

## Examples

``` r
ps_names_datas()
#> character(0)
```
