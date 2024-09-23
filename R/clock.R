#' Get market clock information.
#'
#' Returns the following information:
#'
#' - the current market timestamp (`timestamp`),
#' - whether or not the market is currently open (`is_open`), and
#' - the times of the next market open (`next_open`) and close (`next_close`).
#'
#' @return A list.
#' @export
#'
#' @examples
#' \dontrun{
#' clock()
#' }
clock <- function() {
  market_clock <- GET(base_url(), "clock")

  for (key in c("timestamp", "next_open", "next_close")) {
    market_clock[[key]] <- lubridate::ymd_hms(market_clock[[key]])
  }

  market_clock
}
