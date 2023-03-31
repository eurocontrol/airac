
<!-- README.md is generated from README.Rmd. Please edit that file -->

# The `airac` package

<!-- badges: start -->
<!-- badges: end -->

The `airac` package helps with determining the ICAO’s AIRAC ID or the
relevant date intervals as used internationally and by the data services
of the European Network Manager.

AIRAC stands for Aeronautical Information Regulation and Control and it
indicates the period used to publish and disseminate changes to
[aeronautical
data](https://en.wikipedia.org/wiki/Aeronautical_Information_Publication "Aeronautical Information Publication").

## Installation

You can install the development version of airac like so:

``` r
library(remotes)
install_github("euctrl-pru/pruatlas")
```

## Example

You may be interested to know which period corresponfs to AIRAC ‘2307’

``` r
library(airac)

airac_interval("2307")
#> [1] 2023-07-13 UTC--2023-08-10 UTC
```

or which AIRAC number is needed to download data on 1st Feb 2023 from
EUROCONTROL’s Network Manager DDR2 repository:

``` r
library(airac)

cfmu_airac("2023-02-01")
#> [1] 500
```
