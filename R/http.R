BASE_URL_PAPER_TRADING <- "https://paper-api.alpaca.markets/v2"
BASE_URL <- "https://api.alpaca.markets"
BASE_URL_MARKET_DATA <- "https://data.alpaca.markets/v2"

#' Set or query API base URL
#'
#' @param url Base URL (with or without trailling slash).
#'
#' @return URL string.
#' @export
#'
#' @examples
#' base_url()
#' # The live API.
#' base_url("https://api.alpaca.markets")
#' # The paper-trading API.
#' base_url("https://paper-api.alpaca.markets/v2")
base_url <- function(url = NULL) {
  if (!is.null(url)) {
    # Ensure that URL has a trailing slash.
    cache$BASE_URL <- ifelse(grepl("/$", url), url, paste0(url, "/"))
  }

  cache$BASE_URL
}

#' GET
#'
#' @noRd
GET <- function(
    url,
    path,
    query = list(),
    debug = FALSE) {
  req <- request(url) |>
    req_url_path_append(path) |>
    req_headers(
      "APCA-API-KEY-ID" = cache$ALPACA_API_KEY,
      "APCA-API-SECRET-KEY" = cache$ALPACA_API_SECRET
    ) |>
    req_headers(
      accept = "application/json",
      "Content-Type" = "application/octet-stream"
    )

  if (length(query)) {
    req <- do.call(req_url_query, c(list(.req = req, .multi = "comma"), query))
  }

  if (debug) req |> req_dry_run(redact_headers = FALSE)

  withCallingHandlers(
    response <- req |> req_perform(),
    error = function(error) {
      rlang::abort("Request failed.", parent = error)
    }
  )

  response |>
    resp_body_json()
}

#' GET
#'
#' @noRd
POST <- function(
    url,
    path,
    body = list(),
    debug = FALSE) {
  req <- request(url) |>
    req_method("POST") |>
    req_url_path_append(path) |>
    req_headers(
      "APCA-API-KEY-ID" = cache$ALPACA_API_KEY,
      "APCA-API-SECRET-KEY" = cache$ALPACA_API_SECRET
    ) |>
    req_headers(
      accept = "application/json",
      "Content-Type" = "application/octet-stream"
    ) |>
    req_body_json(body)

  if (debug) req |> req_dry_run(redact_headers = FALSE)

  # TODO: On 422 error there is useful information in the response. Turn this
  # into a meaningful error message.
  #
  # For example, if you try to create a limit order without giving limit_price.
  #
  withCallingHandlers(
    response <- req |> req_perform(),
    error = function(error) {
      rlang::abort("Request failed.", parent = error)
    }
  )

  response |>
    resp_body_json()
}
