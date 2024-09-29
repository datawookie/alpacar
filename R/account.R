#' Get account details.
#'
#' @return A list.
#' @export
#'
#' @examples
#' \dontrun{
#' account()
#' }
account <- function() {
  details <- GET(base_url(), "account")

  # TODO: Helper function to do this in loop (other fields required too!).
  details$cash <- as.numeric(details$cash)
  details$portfolio_value <- as.numeric(details$portfolio_value)
  details$equity <- as.numeric(details$equity)

  details
}
