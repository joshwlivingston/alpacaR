# alpacar
<!-- badges: start -->
[![R-CMD-check](https://github.com/joshwlivingston/alpacar/workflows/R-CMD-check/badge.svg)](https://github.com/joshwlivingston/alpacar/actions)
<!-- badges: end -->
*An R interface to the Alpaca API*

'alpacar' provides an R interface to the [Alpaca](https://alpaca.markets/) [API](https://alpaca.markets/docs/)'s [Python SDK](https://github.com/alpacahq/alpaca-trade-api-python). It uses [Miniconda](https://docs.conda.io/en/latest/miniconda.html) and ['reticulate'](https://github.com/rstudio/reticulate) to automatically configure your python environment for exposure to R.

## Setup

* Install 'alpacar'
```
remotes::install_github("https://github.com/joshwlivingston/alpacar/")
```
* Download and install [Miniconda](https://docs.conda.io/en/latest/miniconda.html)
* Set up an [Alpaca](https://alpaca.markets/) account
* Open your .Rprofile
```
usethis::edit_r_profile()
```

* Set your [API key ID and secret key](https://app.alpaca.markets/brokerage/dashboard/overview) in your .Rprofile
 
```
Sys.setenv("APCA_API_KEY_ID" = <ALPACA_API_KEY_ID>)
Sys.setenv("APCA_API_SECRET_KEY" = <ALPACA_API_SECRET_KEY>)
```

* Set the correct url for your paper or live trading account

```
Sys.setenv("APCA_API_BASE_URL" = "https://paper-api.alpaca.markets/")
```
or
```
Sys.setenv("APCA_API_BASE_URL" = "https://api.alpaca.markets/")
```

* Set additional parameters as required. E.g., for market data:

```
Sys.setenv("APCA_API_DATA_URL" = "https://data.alpaca.markets/")
```

## Usage

To get started, simply load the python module as an R object:

``` r
library(alpacar)
alpaca <- alpaca_trade_api()
```

By default, a conda environment named "r-alpacar" will be created to host the python executable containing the alpaca-trade-api module.
If you want to use your own conda environment, you can specify with the `env` argument.
You can configure an existing conda environment:
```
configure_env(conda_env = "myenv")
```

Once the module is loaded, the submodules are accessed with `$`
```
REST <- alpaca$rest$REST
TimeFrame <- alpaca$rest$TimeFrame
```

Module methods are accessible as callable R functions
```
r <- api$REST()
r$get_account()
```

Module attributes are accessible as R objects
```
api <- REST()
data_res <- api$get_bars(
  "AAPL",
  TimeFrame$Hour,
  "2021-06-08",
  "2021-06-08",
  adjustment = "raw"
)
head(data_res$df)
```



