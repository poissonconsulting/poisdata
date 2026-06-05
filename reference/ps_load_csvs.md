# Load CSVs

Load CSVs

## Usage

``` r
ps_load_csvs(
  dir = ".",
  recursive = FALSE,
  add_name = NULL,
  rename = identity,
  envir = parent.frame(),
  ...
)
```

## Arguments

- dir:

  A string of the directory.

- recursive:

  A flag indicating whether to include files in subdirectories.

- add_name:

  A string specifying the name of the column to add to each data frame
  with the file names (including subdirectories).

- rename:

  A function that is used to rename files (after removing the extension)
  before they are passed to `make.names`.

- envir:

  The environment to assign the data frames.

- ...:

  Additional arguments passed to `read`.

## Value

An invisible character vector of the file names.
