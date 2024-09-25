#' List orders.
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' \dontrun{
#' positions_list()
#' }
orders_list <- function() {
  GET(base_url(), "orders") |>
    bind_rows()
}

#' Place an order.
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' \dontrun{
#' order_create("SPY", "buy", 1, "limit")
#' }
order_create <- function(
    symbol,
    side,
    quantity,
    type = "market") {
  body <- list(
    symbol = symbol,
    qty = quantity,
    side = side,
    type = type,
    time_in_force = "day"
  )

  POST(base_url(), "orders", body)
}
