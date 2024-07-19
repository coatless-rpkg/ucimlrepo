
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ucimlrepo

<!-- badges: start -->

[![R-CMD-check](https://github.com/coatless-rpkg/ucimlrepo/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/coatless-rpkg/ucimlrepo/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of `ucimlrepo` is to download and import data sets directly
into R from the [UCI Machine Learning
Repository](https://archive.ics.uci.edu/).

> \[!IMPORTANT\]
>
> This package is an unoffical port of the [Python `ucimlrepo`
> package](https://github.com/uci-ml-repo/ucimlrepo).

## Installation

You can install the development version of ucimlrepo from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("coatless-rpkg/ucimlrepo")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(ucimlrepo)
```

With the package now loaded, we can dowload a dataset using the
`fetch_repo()` function. For example, to download the `iris` dataset, we
can use:

``` r
# Fetch a dataset by name
iris_by_name <- fetch_ucirepo(name = "iris")
names(iris_by_name)
#> [1] "data"      "metadata"  "variables"
```

There are many levels to the data returned. For example, we can extract
the original data frame containing the `iris` dataset using:

``` r
iris_uci <- iris_by_name$data$original
head(iris_uci)
#>   sepal.length sepal.width petal.length petal.width       class
#> 1          5.1         3.5          1.4         0.2 Iris-setosa
#> 2          4.9         3.0          1.4         0.2 Iris-setosa
#> 3          4.7         3.2          1.3         0.2 Iris-setosa
#> 4          4.6         3.1          1.5         0.2 Iris-setosa
#> 5          5.0         3.6          1.4         0.2 Iris-setosa
#> 6          5.4         3.9          1.7         0.4 Iris-setosa
```

You can also directly query by using an ID:

``` r
# Fetch a dataset by id
iris_by_id <- fetch_ucirepo(id = 53)
```

We can also view a list of data sets available for download using the
`list_available_datasets()` function:

``` r
# List available datasets
list_available_datasets()
```
