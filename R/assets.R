EXCHANGES <- c("OTC", "NYSE", "NASDAQ", "ARCA", "BATS", "AMEX")
ATTRIBUTES <- c("fractional_eh_enabled", "has_options", "options_late_close", "ptp_no_exception", "ptp_with_exception")

#' Get assets available for trade and data.
#'
#' @param status Asset status (either `"active"` or `"inactive"`). Include both by default.
#' @param class Asset class. Only option is `"us_equity"`, which is the default.
#' @param exchange Exchange on which asset listed (one of `"AMEX"`, `"ARCA"`, `"BATS"`, `"NASDAQ"`, `"NYSE"`, `"OTC"`). Include all by default.
#' @param attributes A vector of attributes (one or more of `"fractional_eh_enabled"`, `"has_options"`, `"options_late_close"`, `"ptp_no_exception"`, `"ptp_with_exception"`).
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' \dontrun{
#' assets()
#' }
assets <- function(
    status = NULL,
    class = "us_equity",
    exchange = NULL,
    attributes = NULL
) {
  if (!status %in% c("active", "inactive")) {
    stop("Invalid status: must be 'active' or 'inactive'.")
  }
  if (!class %in% c("us_equity")) {
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

  GET(base_url(), "assets", query=query) |>
    map(~ modify_at(.x, "attributes", ~ paste(.x, collapse = ", "))) |>
    bind_rows()
}
