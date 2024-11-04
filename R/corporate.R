#' Get corporate actions.
#'
#' @param type Types of action.
#' @param since Start date.
#' @param until End date. Cannot be more than 90 days after start date.
#'
#' The dates, `until` and `since`, filter the returned data according to the `payable_date` field.
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' \dontrun{
#' # By default retrieves all actions for last 90 days.
#' actions()
#' # Get only dividends for specific range of dates.
#' actions("dividend", start = "2024-07-01", until = "2024-09-01")
#' # Either date can be omitted, in which case get 90 days from/until date.
#' actions("merger", start = "2024-07-01")
#' actions("spinoff", until = "2024-09-01")
#' }
actions <- function(
    type = c("dividend", "merger", "spinoff", "split"),
    since = NULL,
    until = NULL) {
  if (!is.null(since)) since <- as.Date(since)
  if (!is.null(until)) until <- as.Date(until)

  # If neither date specified then last 90 days.
  if (is.null(until) && is.null(since)) {
    until <- Sys.Date()
    since <- until - 90
  }
  # If until specified but not since.
  if (!is.null(until) && is.null(since)) {
    since <- until - 90
  }
  # If since specified but not until.
  if (is.null(until) && !is.null(since)) {
    until <- since + 90
  }

  query <- list()

  query$ca_types <- type
  query$since <- since
  query$until <- until

  GET(base_url(), "corporate_actions/announcements", query = query) |>
    bind_rows()
}
