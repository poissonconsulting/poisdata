# Cut to Numeric

Cut to Numeric

## Usage

``` r
ps_cut_to_numeric(x)
```

## Arguments

- x:

  A character or factor vector of cuts

## Value

An numeric vector of the cuts.

## Examples

``` r
ps_cut_to_numeric(c(NA, "(0.25,0.75]", "[-2,-1)"))
#> [1]   NA  0.5 -1.5
```
