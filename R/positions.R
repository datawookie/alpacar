# https://paper-api.alpaca.markets/v2/positions

#' List open positions.
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' \dontrun{
#' positions_list()
#' }
positions_list <- function(
) {
  GET(base_url(), "positions") |>
    bind_rows()
}
