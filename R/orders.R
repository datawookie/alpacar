#' List orders.
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' \dontrun{
#' positions_list()
#' }
orders_list <- function(
) {
  GET(base_url(), "orders") |>
    bind_rows()
}

#' Place an order.
#'
#' @return A data frame.
#' @export
order_create <- function(
    symbol,
    side,
    quantity
) {
  body <- list(
    symbol = symbol,
    qty = quantity,
    side = side,
    type = "market",
    time_in_force = "day"
  )

  POST(base_url(), "orders", body)
}
