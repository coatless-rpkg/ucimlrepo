
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ucimlrepo <img src="man/figures/logo-ucimlrepo.png" align ="right" alt="A hexagonal logo of the ucimlrepo R package that shows data being downloaded from a repository" width ="150"/>

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

> \[!NOTE\]
>
> Want to have datasets alongside a help documentation entry?
>
> Check out the [`{ucidata}`](https://github.com/coatless-rpkg/ucidata)
> R package! The package provides a small selection of data sets from
> the UC Irvine Machine Learning Repository alongside of help entries.

## Installation

You can install the development version of ucimlrepo from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("coatless-rpkg/ucimlrepo")
```

## Usage

To use `ucimlrepo`, load the package using:

``` r
library(ucimlrepo)
```

With the package now loaded, we can download a dataset using the
`fetch_ucirepo()` function or use the `list_available_datasets()`
function to view a list of available datasets.

### Download data

For example, to download the `iris` dataset, we can use:

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
#>   sepal length sepal width petal length petal width       class
#> 1          5.1         3.5          1.4         0.2 Iris-setosa
#> 2          4.9         3.0          1.4         0.2 Iris-setosa
#> 3          4.7         3.2          1.3         0.2 Iris-setosa
#> 4          4.6         3.1          1.5         0.2 Iris-setosa
#> 5          5.0         3.6          1.4         0.2 Iris-setosa
#> 6          5.4         3.9          1.7         0.4 Iris-setosa
```

Alternatively, we could retrieve two data frames, one for the features
and one for the targets:

``` r
iris_features <- iris_by_name$data$features
iris_targets <- iris_by_name$data$targets
```

We can then view the first few rows of each data frame:

``` r
head(iris_features)
#>   sepal length sepal width petal length petal width
#> 1          5.1         3.5          1.4         0.2
#> 2          4.9         3.0          1.4         0.2
#> 3          4.7         3.2          1.3         0.2
#> 4          4.6         3.1          1.5         0.2
#> 5          5.0         3.6          1.4         0.2
#> 6          5.4         3.9          1.7         0.4
```

``` r
head(iris_targets)
#>         class
#> 1 Iris-setosa
#> 2 Iris-setosa
#> 3 Iris-setosa
#> 4 Iris-setosa
#> 5 Iris-setosa
#> 6 Iris-setosa
```

Alternatively, you can also directly query by using an ID found by using
`list_available_datasets()` or by looking up the dataset on the UCI ML
Repo website:

``` r
# Fetch a dataset by id
iris_by_id <- fetch_ucirepo(id = 53)
```

### View list of data sets

We can also view a list of data sets available for download using the
`list_available_datasets()` function:

``` r
# List available datasets
list_available_datasets()
```

> \[!NOTE\]
>
> Not all 600+ datasets on UCI ML Repo are available for download using
> the package. The current list of available datasets can be viewed
> [here](https://archive.ics.uci.edu/datasets?Python=true&skip=0&take=25&sort=desc&orderBy=NumHits).
>
> If you would like to see a specific dataset added, please submit a
> comment on an [issue ticket in the upstream
> repository](https://github.com/uci-ml-repo/ucimlrepo/issues/9).
