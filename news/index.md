# Changelog

## ucimlrepo 0.0.2

CRAN release: 2024-08-31

### Features

- Improved graceful errors for
  [`fetch_ucirepo()`](https://r-pkg.thecoatlessprofessor.com/ucimlrepo/reference/fetch_ucirepo.md)
  and
  [`list_available_datasets()`](https://r-pkg.thecoatlessprofessor.com/ucimlrepo/reference/list_available_datasets.md)
  when resources are not found/available.
  ([\#3](https://github.com/coatless-rpkg/ucimlrepo/issues/3), thanks
  Prof. Ripley!)
- Speed up
  [`fetch_ucirepo()`](https://r-pkg.thecoatlessprofessor.com/ucimlrepo/reference/fetch_ucirepo.md)
  for large data frames by switching to using base functionals instead
  of growing a vector in a loop while sorting variable roles.
  ([\#6](https://github.com/coatless-rpkg/ucimlrepo/pull/6))

### Bug fixes

- Fixed internal subset issue with
  [`fetch_ucirepo()`](https://r-pkg.thecoatlessprofessor.com/ucimlrepo/reference/fetch_ucirepo.md)
  when metadata from the repository had whitespace characters in the
  variable names.
  ([\#2](https://github.com/coatless-rpkg/ucimlrepo/issues/2))

## ucimlrepo 0.0.1

CRAN release: 2024-07-27

### Features

- [`fetch_ucirepo()`](https://r-pkg.thecoatlessprofessor.com/ucimlrepo/reference/fetch_ucirepo.md):
  Download a dataset from the UCI ML Repository.
- [`list_available_datasets()`](https://r-pkg.thecoatlessprofessor.com/ucimlrepo/reference/list_available_datasets.md):
  List all available datasets from the UCI ML Repository.
