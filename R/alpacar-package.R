#' alpacar: An R interface to the Alpaca API
#'
#' An R interface to the Alpaca python SDK that automatically handles the
#' python development configuration.
#'
#' @section Setup:
#' * Download and install [Miniconda](https://docs.conda.io/en/latest/miniconda.html)
#' * Set up an [Alpaca](https://alpaca.markets/) account
#' * Open your .Rprofile
#' ```
#' usethis::edit_r_profile()
#' ```
#' * Set your
#'   [API key ID and secret key](https://app.alpaca.markets/brokerage/dashboard/overview)
#'   in your .Rprofile
#' ```
#' Sys.setenv("APCA_API_KEY_ID" = <ALPACA_API_KEY_ID>)
#' Sys.setenv("APCA_API_SECRET_KEY" = <ALPACA_API_SECRET_KEY>)
#' ```
#' * Set the correct url for your paper or live trading account
#' ```
#' Sys.setenv("APCA_API_BASE_URL" = "https://paper-api.alpaca.markets/")
#' ```
#' or
#' ```
#' Sys.setenv("APCA_API_BASE_URL" = "https://api.alpaca.markets/")
#' ```
#' * Set additional parameters as required. E.g., for market data:
#' ```
#' Sys.setenv("APCA_API_DATA_URL" = "https://data.alpaca.markets/")
#' ```
#' @seealso
#' Useful links:
#' * Source code [https://github.com/joshwlivingston/alpacar](https://github.com/joshwlivingston/alpacar)
#' * Report bugs at [https://github.com/joshwlivingston/alpacar/issues](https://github.com/joshwlivingston/alpacar/issues)
#' * Alpaca [https://alpaca.markets/](https://alpaca.markets/)
#' * Alpaca API [https://alpaca.markets/docs/](https://alpaca.markets/docs/)
#' * Alpaca Python SDK [https://github.com/alpacahq/alpaca-trade-api-python](https://github.com/alpacahq/alpaca-trade-api-python)
#' * 'reticulate' [https://github.com/rstudio/reticulate](https://github.com/rstudio/reticulate)
#'
#' @keywords internal
"_PACKAGE"

## usethis namespace: start

## usethis namespace: end
NULL
