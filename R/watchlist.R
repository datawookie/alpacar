watchlist_fix <- function(watchlist) {
  watchlist |>
    modify_at(c("assets"), ~ list(map_dfr(.x, bind_rows))) |>
    as_tibble()
}

#' Get watchlists.
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' \dontrun{
#' }
watchlists <- function(
) {
  GET(base_url(), "watchlists") |>
    bind_rows()
}

#' Get watchlist by ID.
#'
#' @param id Watchlist ID.
#'
#' The `assets` column is a list column containing a data frame listing the watched assets.
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' \dontrun{
#' }
watchlist <- function(
    id
) {
  id <- as.character(id)

  GET(base_url(), paste("watchlists", id, sep = "/")) |>
    watchlist_fix()
}

#' Add asset to watchlist by ID.
#'
#' @param id Watchlist ID.
#' @param symbol Asset symbol.
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' \dontrun{
#' }
watchlist_add <- function(
    id,
    symbol
) {
  id <- as.character(id)
  symbol <- as.character(symbol)

  body <- list(
    symbol = symbol
  )

  POST(base_url(), paste("watchlists", id, sep = "/"), body) |>
    watchlist_fix()
}
