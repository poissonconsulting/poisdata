# Load Files

By default reads all files in the directory dir that match the pattern
using `read_csv` and loads them into the calling environment after
renaming using `make.names(unique = TRUE)`. It is useful for quickly
loading the data in a set of files into the workspace (just call the
function at the top level of a script).

## Usage

``` r
ps_load_files(
  dir = ".",
  pattern = "[.]csv$",
  recursive = FALSE,
  read = readr::read_csv,
  add_name = NULL,
  rename = identity,
  envir = parent.frame(),
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

- read:

  A function to read the files.

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
