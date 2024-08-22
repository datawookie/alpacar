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
  GET(base_url(), "account")
}
