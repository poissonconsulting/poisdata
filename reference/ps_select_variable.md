# Select Variable Columns

Select Variable Columns

## Usage

``` r
ps_select_variable(x, na_ignore = FALSE)
```

## Arguments

- x:

  A data frame.

- na_ignore:

  A flag specifying whether to ignore missing values when determining if
  variable.

## Value

A data frame with constant columns removed.

## Examples

``` r
ps_select_variable(data.frame(x = c(1, 1), y = c(2, 1)))
#>   y
#> 1 2
#> 2 1
```
