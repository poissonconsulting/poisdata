# Replace values over set of columns

From argument may contain multiple values. Class of column is retained,
except if coerced by replacement value.

## Usage

``` r
ps_replace_values(x, columns = names(x), from, to = NA_character_)
```

## Arguments

- x:

  A data.frame, tibble, or sf object.

- columns:

  A vector of character strings indicating columns to modify.

- from:

  A vector of values to be replaced.

- to:

  A value to replace with.

## Value

The modified object.
