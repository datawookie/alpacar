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
    query = list()
) {
  req <- request(url) |>
    req_url_path_append(path) |>
    req_headers(
      'APCA-API-KEY-ID' = cache$ALPACA_API_KEY,
      'APCA-API-SECRET-KEY' = cache$ALPACA_API_SECRET
    ) |>
    req_headers(
      accept = "application/json",
      "Content-Type" = "application/octet-stream"
    )

  if (length(query)) {
    req <- do.call(req_url_query, c(list(.req = req, .multi = "comma"), query))
  }

  req |> req_dry_run(redact_headers = FALSE)

  req |>
    req_perform() |>
    resp_body_json()
}

#' GET
#'
#' @noRd
POST <- function(
    url,
    path,
    body = list()
) {
  req <- request(url) |>
    req_method("POST") |>
    req_url_path_append(path) |>
    req_headers(
      'APCA-API-KEY-ID' = cache$ALPACA_API_KEY,
      'APCA-API-SECRET-KEY' = cache$ALPACA_API_SECRET
    ) |>
    req_headers(
      accept = "application/json",
      "Content-Type" = "application/octet-stream"
    ) |>
    req_body_json(body)

  req |> req_dry_run(redact_headers = FALSE)

  req |>
    req_perform() |>
    resp_body_json()
}
