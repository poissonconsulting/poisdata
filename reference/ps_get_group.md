# Get Group

Get Group

## Usage

``` r
ps_get_group(
  x,
  breaks = c(Recruit = 0, Juvenile = 20, Subadult = 50, Adult = 70)
)
```

## Arguments

- x:

  A numeric or integer vector

- breaks:

  A uniquely named numeric vector of the first value of each group.

## Value

An ordered factor of the group.

## Examples

``` r
ps_get_group(c(-Inf, -1, 0, 19, 20, 69, 70, Inf))
#> [1] <NA>     <NA>     Recruit  Recruit  Juvenile Subadult Adult    Adult   
#> Levels: Recruit < Juvenile < Subadult < Adult
```
