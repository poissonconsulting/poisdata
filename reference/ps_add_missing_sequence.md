# Add Missing Sequence.

Adds missing sequence to a data frame. All missing values between the
minimum and maximum values with the smallest interval in the data are
added.

## Usage

``` r
ps_add_missing_sequence(x, sequence = "DateTime", by = character(0))
```

## Arguments

- x:

  The data.frame.

- sequence:

  A string naming the sequence column.

- by:

  A character vector of columns to add the missing sequence by.

## Value

A tbl data frame sorted by DateTime.

## Examples

``` r
datetime <- as.POSIXct("2001-01-02 03:04:06") + c(1, 3, 9)
ps_add_missing_sequence(data.frame(DateTime = datetime, Value = c(1, 3, 9)))
#> # A tibble: 5 × 2
#>   DateTime            Value
#>   <dttm>              <dbl>
#> 1 2001-01-02 03:04:07     1
#> 2 2001-01-02 03:04:09     3
#> 3 2001-01-02 03:04:11    NA
#> 4 2001-01-02 03:04:13    NA
#> 5 2001-01-02 03:04:15     9
```
