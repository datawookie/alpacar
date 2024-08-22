#' Get options data.
#'
#' @param type Filter contracts by the type (`"call"` or `"put"`).
#' @param expiration_date_gte Minimum expiration date.
#' @param expiration_date_lte Maximum expiration date.
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' \dontrun{
#' options("AAPL")
#' options("AAPL", "put")
#' }
options_list <- function(
    underlying_symbols,
    type = NULL,
    expiration_date_gte = NULL,
    expiration_date_lte = NULL
) {
  query <- list()

  query$underlying_symbols <- underlying_symbols

  if (!is.null(type)) {
    if (!type %in% c("call", "put")) {
      stop("Invalid status: must be 'active' or 'inactive'.")
    }
    query$type <- type
  }
  if (!is.null(expiration_date_gte)) {
    query$expiration_date_gte <- expiration_date_gte
  }
  if (!is.null(expiration_date_lte)) {
    query$expiration_date_lte <- expiration_date_lte
  }

  pages = list()

  while (TRUE) {
    data <- GET(base_url(), "options/contracts", query=query)

    pages <- c(pages, data$option_contracts)

    # Check if there's another page of data.
    if (is.null(data$next_page_token)) {
      break
    } else {
      query$page_token <- data$next_page_token
    }
  }

  pages |> bind_rows()
}
