% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assets.R
\name{assets_list}
\alias{assets_list}
\title{Get assets available for trade and data.}
\usage{
assets_list(
  id = NULL,
  status = "active",
  class = "us_equity",
  exchange = NULL,
  attributes = NULL
)
}
\arguments{
\item{id}{A symbol or asset ID.}

\item{status}{Asset status (either `"active"`, `"inactive"` or `NULL`). Only
includes active assets by default.}

\item{class}{Asset class. Only option is `"us_equity"`, which is the default.}

\item{exchange}{Exchange on which asset listed (one of `"AMEX"`, `"ARCA"`,
`"BATS"`, `"NASDAQ"`, `"NYSE"`, `"OTC"`). Include all by default.}

\item{attributes}{A vector of attributes (one or more of
`"fractional_eh_enabled"`, `"has_options"`, `"options_late_close"`,
`"ptp_no_exception"`, `"ptp_with_exception"`).}
}
\value{
A data frame.
}
\description{
Get assets available for trade and data.
}
\examples{
\dontrun{
assets_list()
AAPL <- assets_list("AAPL")
AMD <- assets_list("03fb07bb-5db1-4077-8dea-5d711b272625")
}
}
