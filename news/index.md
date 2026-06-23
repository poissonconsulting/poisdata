# Changelog

## poisdata 0.0.1.9004

- Same as previous version.

## poisdata 0.0.1.9003

- Add fledge-bump workflow
- Add fledge-tag-on-merge workflow

## poisdata 0.0.1.9002

- Increased `guess_max` in
  [`readr::read_csv`](https://readr.tidyverse.org/reference/read_delim.html)
  for hobo files to Inf to avoid obscure memory error.

- Merge pull request
  [\#26](https://github.com/poissonconsulting/poisdata/issues/26) from
  poissonconsulting/duplicate.

  Transferred `duplicate()` to tidyplus

- Merge pull request
  [\#25](https://github.com/poissonconsulting/poisdata/issues/25) from
  poissonconsulting/replace-deprecated-functs.

  Replace and fix deprecated functions

- Merge pull request
  [\#24](https://github.com/poissonconsulting/poisdata/issues/24) from
  poissonconsulting/fix-udunits2-warning(orphaned).

  Removed dependency on ‘udunits2’ package (orphaned) by switching func…

- Merge pull request
  [\#22](https://github.com/poissonconsulting/poisdata/issues/22) from
  poissonconsulting/Fix-notes-warnings.

  Fixed package notes during dev check - removed unused ‘methods’
  packag…

- Merge pull request
  [\#21](https://github.com/poissonconsulting/poisdata/issues/21) from
  poissonconsulting/update-actions.

  Removed ‘Commands’ action, updated ‘coverage’ and ‘pkgdown’ actions

- Merge pull request
  [\#20](https://github.com/poissonconsulting/poisdata/issues/20) from
  poissonconsulting/b-rmd-check.

  update rmd check action

- Merge pull request
  [\#19](https://github.com/poissonconsulting/poisdata/issues/19) from
  poissonconsulting/remove-checkr-dependency.

  updated package to use chk_function over deprecated check_function

- Merge pull request
  [\#18](https://github.com/poissonconsulting/poisdata/issues/18) from
  poissonconsulting/fix-replace-values-sf.

  Fix replace values sf

- Merge pull request
  [\#17](https://github.com/poissonconsulting/poisdata/issues/17) from
  poissonconsulting/lubridate_to_dttr2.

  replace some lubridate and old dplyr functions

- [`ps_duplicates()`](https://poissonconsulting.github.io/poisdata/reference/ps_duplicates.md)
  converts to tibble (to avoid issues with sf object).

- Merge pull request
  [\#14](https://github.com/poissonconsulting/poisdata/issues/14) from
  poissonconsulting/checkrtochk.

  replaced checkr functions with chk functions

- Add `select_variable()`.

- Merge pull request
  [\#13](https://github.com/poissonconsulting/poisdata/issues/13) from
  poissonconsulting/readme.

  lifecycle badge fix

- Added
  [`ps_cut_to_numeric()`](https://poissonconsulting.github.io/poisdata/reference/ps_cut_to_numeric.md).

## poisdata 0.0.1.9001

- Same as previous version.

## poisdata 0.0.1.9000

- Internal changes only.

## poisdata 0.0.1

- Added a `NEWS.md` file to track changes to the package.
