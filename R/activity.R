activity_fix <- function(quotes) {
  quotes |>
    rename(
      timestamp = transaction_time
    )
}

#' Get account activity.
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' \dontrun{
#' account_activity()
#' }
account_activity <- function() {
  GET(base_url(), "account/activities") |>
    bind_rows() |>
    activity_fix()
}
