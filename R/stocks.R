quotes_fix <- function(quotes) {
  quotes |>
    rename(
      ask = ap,
      ask_size = as,
      ask_exchange = ax,
      bid = bp,
      bid_size = bs,
      bid_exchange = bx,
      conditions = c,
      timestamp = t,
      tape = z
    ) |>
    mutate(
      ask_exchange = ifelse(ask_exchange == " ", NA, ask_exchange),
      bid_exchange = ifelse(bid_exchange == " ", NA, bid_exchange)
    )
}

#' Get latest quotes for one or more stocks.
#'
#' @param symbols One or more symbols.
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' \dontrun{
#' quotes_latest("AAPL")
#' quotes_latest(c("AAPL", "TSLA"))
#' }
quotes_latest <- function(
    symbols
) {
  query <- list()

  query$symbols <- symbols

  GET(BASE_URL_MARKET_DATA, "stocks/quotes/latest", query=query)$quotes |>
    bind_rows(.id = "symbol") |>
    quotes_fix()
}

# import requests
#
# url = "https://data.alpaca.markets/v2/stocks/quotes/latest?symbols=AAPL"
#
# headers = {
#   "accept": "application/json",
#   "APCA-API-KEY-ID": "PKCFTF0N0UQHAINSGBQX",
#   "APCA-API-SECRET-KEY": "ohhLW58R66fUhmtTmuMsE6WNp2WLU95fk4W4Zwze"
# }
#
# response = requests.get(url, headers=headers)
#
# print(response.text)

#' Get historic quotes for one or more stocks.
#'
#' @param symbols One or more symbols.
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' \dontrun{
#' quotes_latest("AAPL")
#' quotes_latest(c("AAPL", "TSLA"))
#' }
quotes_history <- function(
    symbols
) {
  query <- list()

  query$symbols <- symbols

  # TODO: This needs to be paginated!
  #
  GET(BASE_URL_MARKET_DATA, "stocks/quotes", query=query)$quotes |>
    map(bind_rows) |>
    bind_rows(.id = "symbol") |>
    quotes_fix()
}
