EXCHANGES <- c("OTC", "NYSE", "NASDAQ", "ARCA", "BATS", "AMEX")
ATTRIBUTES <- c("fractional_eh_enabled", "has_options", "options_late_close", "ptp_no_exception", "ptp_with_exception")

#' Get assets available for trade and data.
#'
#' @param status Asset status (either `"active"`, `"inactive"` or `NULL`). Only
#'   includes active assets by default.
#' @param class Asset class. Only option is `"us_equity"`, which is the default.
#' @param exchange Exchange on which asset listed (one of `"AMEX"`, `"ARCA"`,
#'   `"BATS"`, `"NASDAQ"`, `"NYSE"`, `"OTC"`). Include all by default.
#' @param attributes A vector of attributes (one or more of
#'   `"fractional_eh_enabled"`, `"has_options"`, `"options_late_close"`,
#'   `"ptp_no_exception"`, `"ptp_with_exception"`).
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' \dontrun{
#' assets_list()
#' }
assets_list <- function(
    status = "active",
    class = "us_equity",
    exchange = NULL,
    attributes = NULL) {
  if (!is.null(status) && !status %in% c("active", "inactive")) {
    stop("Invalid status: must be 'active', 'inactive' or NULL.")
  }
  if (!is.null(class) && !class %in% c("us_equity")) {
    stop("Invalid class: must be 'us_equity'.")
  }
  if (!is.null(exchange) && !exchange %in% EXCHANGES) {
    stop("Invalid exchange.")
  }
  if (length(setdiff(attributes, ATTRIBUTES))) {
    stop("Invalid attributes.")
  }

  query <- list()
  if (!is.null(status)) {
    query$status <- status
  }
  if (!is.null(class)) {
    query$class <- class
  }
  if (!is.null(exchange)) {
    query$exchange <- exchange
  }
  if (!is.null(attributes)) {
    query$attributes <- attributes
  }

  GET(base_url(), "assets", query = query) |>
    assets_fix()
}

#' Get information on a specific asset.
#'
#' @param id A symbol or asset ID.
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' \dontrun{
#' AAPL <- assets_get("AAPL")
#' AMD <- assets_get("03fb07bb-5db1-4077-8dea-5d711b272625")
#' }
assets_get <- function(id) {
  GET(base_url(), paste("assets", id, sep = "/")) |>
    list() |>
    assets_fix()
}
