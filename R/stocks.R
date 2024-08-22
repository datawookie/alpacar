quotes_fix <- function(quotes) {
  quotes |>
    rename(
      ask = ap,
      ask_size = as,
      ask_exch = ax,
      bid = bp,
      bid_size = bs,
      bid_exch = bx,
      cond = c,
      timestamp = t,
      tape = z
    ) |>
    mutate(
      ask_exch = ifelse(ask_exch == " ", NA, ask_exch),
      bid_exch = ifelse(bid_exch == " ", NA, bid_exch),
      cond = cond |> map_chr(~ paste(.x, collapse=""))
    )
}

bars_fix <- function(quotes) {
  quotes |>
    rename(
      open = o,
      close = c,
      high = h,
      low = l,
      timestamp = t,
      volume = v,
      vwap = vw,
      trades = n
    ) |>
    select(symbol, timestamp, open, high, low, close, volume, trades, vwap, everything())
}

#' Get latest quotes for one or more stocks.
#'
#' To make sense of the `cond` column see the output from `condition_codes()`.
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

#' Get historic quotes for one or more stocks.
#'
#' To make sense of the `cond` column see the output from `condition_codes()`.
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

  pages = list()

  while (TRUE) {
    data <- GET(BASE_URL_MARKET_DATA, "stocks/quotes", query=query)

    pages <- c(
      pages,
      data$quotes
    )

    # Check if there's another page of data.
    if (is.null(data$next_page_token)) {
      break
    } else {
      query$page_token <- data$next_page_token
    }
  }

  pages |> map(bind_rows) |> bind_rows(.id = "symbol") |> quotes_fix()
}

#' Get condition codes.
#'
#' @param symbols One or more symbols.
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' \dontrun{
#' condition_codes("C")
#' }
condition_codes <- function(
    tape,
    ticktype = "quote"
) {
  query <- list()

  query$tape <- tape

  GET(BASE_URL_MARKET_DATA, paste0("stocks/meta/conditions/", ticktype), query=query) |>
    stack() |>
    setNames(c("meaning", "code")) |>
    select(code, everything())
}


#' Get exchange codes.
#'
#' @param symbols One or more symbols.
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' \dontrun{
#' exchange_codes()
#' }
exchange_codes <- function(
) {
  GET(BASE_URL_MARKET_DATA, "stocks/meta/exchanges") |>
    stack() |>
    setNames(c("name", "code")) |>
    select(code, everything())
}

# https://data.alpaca.markets/v2/stocks/bars

#' Get historic bars
#'
#' @param symbols One or more symbols.
#' @param timeframe Timeframe for bars. Expressed in various units: `Min` or `T` for minutes, `Hour` or `H` for hours, `Day` or `D` for days, `Week` or `W` for weeks and `Month` or `M` for months.
#' @param start Start date (YYYY-MM-DD).
#' @param end End date (YYYY-MM-DD).
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' \dontrun{
#' bars("SPY", "1Hour", "2024-08-19", "2024-08-19")
#' bars("SPY", "5T", "2024-08-19", "2024-08-19")
#' }
bars <- function(
    symbols,
    timeframe,
    start,
    end
) {
  query <- list()

  query$symbols <- symbols
  query$timeframe <- timeframe
  query$start <- start
  query$end <- end

  pages = list()

  while (TRUE) {
    data <- GET(BASE_URL_MARKET_DATA, "stocks/bars", query=query)

    pages <- c(
      pages,
      data$bars
    )

    # Check if there's another page of data.
    if (is.null(data$next_page_token)) {
      break
    } else {
      query$page_token <- data$next_page_token
    }
  }

  pages |> map(bind_rows) |> bind_rows(.id = "symbol") |> bars_fix()
}
