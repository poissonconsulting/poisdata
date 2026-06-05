# Load Excel sheets

Loads all excel sheets in a workbook as data.frames into specified
environment.

## Usage

``` r
ps_load_excel(file = ".", rename = identity, envir = parent.frame())
```

## Arguments

- file:

  A string of the path to the file.

- rename:

  A function that is used to rename files (after removing extension
  .csv) before they are passed to make.names.

- envir:

  The environment to assign the data frames.

## Value

An invisible character vector of the sheet names.
