% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/corporate.R
\name{actions}
\alias{actions}
\title{Get corporate actions.}
\usage{
actions(
  type = c("dividend", "merger", "spinoff", "split"),
  since = NULL,
  until = NULL
)
}
\arguments{
\item{type}{Types of action.}

\item{since}{Start date.}

\item{until}{End date. Cannot be more than 90 days after start date.

The dates, `until` and `since`, filter the returned data according to the `payable_date` field.}
}
\value{
A data frame.
}
\description{
Get corporate actions.
}
\examples{
\dontrun{
# By default retrieves all actions for last 90 days.
actions()
# Get only dividends for specific range of dates.
actions("dividend", start="2024-07-01", until="2024-09-01")
# Either date can be omitted, in which case get 90 days from/until date.
actions("merger", start="2024-07-01")
actions("spinoff", until="2024-09-01")
}
}
