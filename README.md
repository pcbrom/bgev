<!-- # bgev <img src="man/figures/logo.png" align="right" /> -->

<!-- [![Downloads](http://cranlogs.r-pkg.org/badges/bgev?color=brightgreen)](http://www.r-pkg.org/pkg/bgev) -->

<!-- [![Downloads](http://cranlogs.r-pkg.org/badges/mRpostman?color=brightgreen)](http://www.r-pkg.org/pkg/mRpostman) -->

<!-- one space after links to display badges side by side -->

[![Build Status](https://travis-ci.org/pcbrom/bgev.svg?branch=main)](https://travis-ci.org/pcbrom/bgev)
[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/last-release/bgev)](https://cran.r-project.org/package=bgev)
[![Downloads from the RStudio CRAN mirror](https://cranlogs.r-pkg.org/badges/grand-total/bgev)](https://cran.r-project.org/package=bgev)



# bgev

<!-- badges: start -->
<!-- badges: end -->

We propose a new model Bimodal Generalized Extreme value. 


## Installation

You can install the released version of bgev from [CRAN](https://CRAN.R-project.org) with:

``` r

```
or using devtools

``` r
devtools::install_git('https://github.com/pcbrom/bgev')
```


## Load package

``` r
library(bgev)
```


## Density Function


``` r
```


## Distribution Function

``` r
```


## Quantile Function

``` r

```


## Pseudo-Random Numbers Generator

``` r

```


## Theoretical E(X) and empirical first moment

``` r

```


## Theoretical E(X²) and empirical second moment

``` r

```

## Maximum Likelihood Estimation

``` r

```


## GEV Density Function (additional function implemented)


``` r
dgev(x = 2, csi = 0, mu = 1, sigma = 1)
curve(dgev(x, csi = 0, mu = 1, sigma = 1), xlim = c(-5, 10), ylim= c(0, .4))
integrate(dgev, csi = 0, mu = 1, sigma = 1, lower = -5, upper = 0)
```


## GEV Distribution Function (additional function implemented)

``` r
pgev(0, csi = 0, mu = 1, sigma = 1)
integrate(dgev, csi = 0, mu = 1, sigma = 1, lower = -Inf, upper = 0)
pgev(0, csi = 0, mu = 1, sigma = 1, lower.tail = FALSE)
curve(pgev(x, csi = 0, mu = 1, sigma = 1), xlim = c(-5, 10))
```


## Issues

Please, send to: https://github.com/pcbrom/bgev/issues


## To cite package ‘bgev’ in publications use

``` r
citation("bgev")
```
