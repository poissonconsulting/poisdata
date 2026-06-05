# Cumulative Sequence

Determines when in sequence a cumulative sum is reached. Useful for
ATUs.

## Usage

``` r
ps_cumulative_sequence(x, cumsum, data, sequence = "DateTime", value = "Value")
```

## Arguments

- x:

  A scalar specifying the start.

- cumsum:

  A scalar specifying the cumulative sum.

- data:

  The data.frame.

- sequence:

  A string naming the sequence column.

- value:

  A string of the value column.

## Value

A scalar of the end.
