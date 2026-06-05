# Add Missing SequenceDate Times.

Adds missing datetimes to a data frame. All missing datetimes between
the first and last datetime with the smallest interval in the data are
added.

## Usage

``` r
ps_add_missing_datetimes(x, datetime = "DateTime", by = character(0))
```

## Arguments

- x:

  The data.frame.

- datetime:

  A string naming the POSIXt column.

- by:

  A character vector of columns to add the missing datetimes by.

## Value

A tbl data frame sorted by DateTime.
