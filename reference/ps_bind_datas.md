# Bind Data

Binds all the data frames in the environment by rows (and removes them)

## Usage

``` r
ps_bind_datas(envir = parent.frame(), rm = TRUE)
```

## Arguments

- envir:

  The environment containing the data frames.

- rm:

  A flag indicating wether to remove the data frames.

## Value

The bound data frames as tbl data frame or an empty data frame.
