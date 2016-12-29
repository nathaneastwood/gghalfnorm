
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)

> Half-Normal Plots

This package provides a wrapper around the [halfnorm](https://github.com/cran/faraway/blob/master/R/faraway.R#L78) function from the [faraway](https://github.com/cran/faraway) package using the ggplot2 API. The `gghalfnorm` function is the only function within the package.

Usage
=====

``` r
set.seed(123)
gghalfnorm(x = rnorm(100), nlab = 10)
```

![](README-non_repel-1.png)

The package can also make use of the [ggrepel](https://github.com/slowkow/ggrepel) package.

``` r
set.seed(123)
gghalfnorm(x = rnorm(100), nlab = 10, repel = TRUE)
```

![](README-repel-1.png)

Installation
============

The package is currently only available through CRAN. You can install the package with:

``` r
install.packages("devtools")
devtools::install_github("nathaneastwood/gghalfnorm")
```