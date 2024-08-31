# ucimlrepo 0.0.2

## Features

- Improved graceful errors for `fetch_ucirepo()` and `list_available_datasets()`
  when resources are not found/available. ([#3](https://github.com/coatless-rpkg/ucimlrepo/issues/3),
  thanks Prof. Ripley!)
  
## Bug fixes

- Fixed internal subset issue with `fetch_ucirepo()` when metadata from the
  repository had whitespace characters in the variable names. ([#2](https://github.com/coatless-rpkg/ucimlrepo/issues/2))

# ucimlrepo 0.0.1

## Features

- `fetch_ucirepo()`: Download a dataset from the UCI ML Repository.
- `list_available_datasets()`: List all available datasets from the UCI ML Repository.

