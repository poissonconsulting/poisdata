# Bind Data

Binds all the data frames in files by rows (and removes them)

## Usage

``` r
ps_bind_files(
  dir = ".",
  pattern = "[.]csv$",
  recursive = FALSE,
  add_name = NULL,
  read = readr::read_csv,
  ...
)
```

## Arguments

- dir:

  A string of the directory.

- pattern:

  A string of the regular expression to use to identify files.

- recursive:

  A flag indicating whether to include files in subdirectories.

- add_name:

  A string specifying the name of the column to add to each data frame
  with the file names (including subdirectories).

- read:

  A function to read the files.

- ...:

  Additional arguments passed to `read`.

## Value

The bound data frames as tbl data frame.
