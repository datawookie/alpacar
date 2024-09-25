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
    type = "market",
    limit_price = NA) {
  body <- list(
    symbol = symbol,
    qty = quantity,
    side = side,
    type = type,
    time_in_force = "day"
  )

  if (type == "limit") {
    body$limit_price <- limit_price
  }

  POST(base_url(), "orders", body)
}
