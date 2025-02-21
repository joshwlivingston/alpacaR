% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/alpacar-package.R
\docType{package}
\name{alpacar-package}
\alias{alpacar}
\alias{alpacar-package}
\title{alpacar: An R interface to the Alpaca API}
\description{
alpacar provides an interface to the full Alpaca API. It uses the reticulate
package to expose the alpaca-trade-api python module to an R environment
}
\section{Setup}{

\itemize{
\item Download and install \href{https://docs.conda.io/en/latest/miniconda.html}{Miniconda}
\item Set up an \href{https://alpaca.markets/}{Alpaca} account
\item Open your .Rprofile
}\preformatted{usethis::edit_r_profile()
}
\itemize{
\item Set your
\href{https://app.alpaca.markets/brokerage/dashboard/overview}{API key ID and secret key}
in your .Rprofile
}\preformatted{Sys.setenv("APCA_API_KEY_ID" = <ALPACA_API_KEY_ID>)
Sys.setenv("APCA_API_SECRET_KEY" = <ALPACA_API_SECRET_KEY>)
}
\itemize{
\item Set the correct url for your paper or live trading account
}\preformatted{Sys.setenv("APCA_API_BASE_URL" = "https://paper-api.alpaca.markets/")
}

or\preformatted{Sys.setenv("APCA_API_BASE_URL" = "https://api.alpaca.markets/")
}
\itemize{
\item Set additional parameters as required. E.g., for market data:
}\preformatted{Sys.setenv("APCA_API_DATA_URL" = "https://data.alpaca.markets/")
}
}

\seealso{
Useful links:
\itemize{
\item Source code \url{https://github.com/joshwlivingston/alpacar}
\item Report bugs at \url{https://github.com/joshwlivingston/alpacar/issues}
\item Alpaca \url{https://alpaca.markets/}
\item Alpaca API \url{https://alpaca.markets/docs/}
\item Alpaca Python SDK \url{https://github.com/alpacahq/alpaca-trade-api-python}
\item Reticulate \url{https://github.com/rstudio/reticulate}
}
}
\author{
\strong{Maintainer}: Josh Livingston \email{joshwlivingston@gmail.com}

}
\keyword{internal}
