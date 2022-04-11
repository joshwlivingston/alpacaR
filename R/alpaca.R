#' alpaca-trade-api
#'
#' Exposes the alpaca-trade-api python module to R using the
#'   [reticulate](https://rstudio.github.io/reticulate/) package
#'
#' @param env The name of the environment that contains the python
#'   installation for 'alpacar' to use. If not "r-alpacar," the default, this
#'   environment will automatically be configured with
#'   [configure_env()]. Disable this setting with 'configure' = FALSE.
#'
#' @param configure (default TRUE) If 'env' is not "r-alpacar," should the
#'   specified environment be configured for 'alpacar'?
#'
#' @return the alpaca-trade-api python module or NULL
#'
#' @seealso [alpaca-trade-api](https://pypi.org/project/alpaca-trade-api/)
#'   for full documentation
#'
#' @export
#'
#' @examplesIf interactive()
#' # store the module inside an R object
#' alpaca <- alpaca_trade_api()
#'
#' # modules are read as lists with submodules nested inside
#' REST <- alpaca$rest$REST
#' TimeFrame <- alpaca$rest$TimeFrame
#'
#' # module methods are accessible as callable R functions
#' r <- api$REST()
#' r$get_account()
#'
#' # module attributes are accessible as R objects
#' api <- REST()
#' data_res <- api$get_bars(
#'   "AAPL",
#'   TimeFrame$Hour,
#'   "2021-06-08",
#'   "2021-06-08",
#'   adjustment = "raw"
#' )
#' head(data_res$df)
alpaca_trade_api <- function(env = "r-alpacar", configure = TRUE) {
  if (configure) {
    message("checking environment configuration...")
    configure_env(env)
  }

  mod <- import_module("alpaca_trade_api")

  return(mod)
}
