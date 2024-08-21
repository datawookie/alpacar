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
base_url <- function(url = "https://api.alpaca.markets") {
  if (!is.null(url)) {
    # Ensure that URL has a trailling slash.
    cache$BASE_URL <- ifelse(grepl("/$", url), url, paste0(url, "/"))
  }

  cache$BASE_URL
}

#' GET
#'
#' @noRd
GET <- function(
    path
    # query = list()
) {
  request(cache$BASE_URL) |>
    req_url_path_append(path) |>
    req_headers(
      'APCA-API-KEY-ID' = ALPACA_KEY,
      'APCA-API-SECRET-KEY' = ALPACA_SECRET_KEY
    ) |>
    req_headers(
      "Accept" = "application/json",
      "Content-Type" = "application/octet-stream"
    ) |>
    req_perform() |>
    resp_body_json()
}
