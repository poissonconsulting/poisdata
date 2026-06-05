# Interpolate Sequence

Interpolates missing values in sequence using
[`stats::approx()`](https://rdrr.io/r/stats/approxfun.html)

## Usage

``` r
ps_interpolate_sequence(
  x,
  sequence = "DateTime",
  value = "Value",
  by = character(0),
  max_gap = 10L,
  method = "linear",
  step = 0.5
)
```

## Arguments

- x:

  The data.frame.

- sequence:

  A string naming the sequence column.

- value:

  A character vector of the value column.

- by:

  A character vector of columns to interpolate by.

- max_gap:

  A count of the maximum gap to interpolate within.

- method:

  A string specifying the method (linear or constant).

- step:

  An probability (number between 0 and 1 inclusive) specifing the
  compromise between left- and right- continuous step function.

## Value

A tbl data frame sorted by sequence and by.
