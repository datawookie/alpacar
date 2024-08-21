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
      cond = cond %>% map_chr(~ paste(.x, collapse=""))
    )
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

  pages %>% map(bind_rows) %>% bind_rows(.id = "symbol") %>% quotes_fix()
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
