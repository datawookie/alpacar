OPTION_TYPES <- c("call", "put")

options_fix <- function(options) {
  options |>
    mutate(
      close_price = as.numeric(close_price),
      strike_price = as.numeric(strike_price),
      multiplier = as.numeric(multiplier),
      size = as.numeric(size),
      open_interest = as.integer(open_interest),
      expiration_date = as.Date(expiration_date),
      open_interest_date = as.Date(open_interest_date),
      close_price_date = as.Date(close_price_date),
      type = factor(type, levels = OPTION_TYPES)
    )
}

#' Get options data.
#'
#' @param type Filter contracts by the type (`"call"` or `"put"`).
#' @param expiration_date_gte Minimum expiration date.
#' @param expiration_date_lte Maximum expiration date. By default this is set to
#'  the next weekend.
#' @param complete Whether to retrieve complete chain with all future expiration
#'  dates.
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
    expiration_date_lte = NULL,
    complete = FALSE) {
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
  if (complete) {
    # Expiration date 5 years into the future. This is conservative. LEAPS have
    # expiration dates up to 3 years into the future.
    #
    query$expiration_date_lte <- Sys.Date() %m+% years(5)
  }

  pages <- list()

  while (TRUE) {
    data <- GET(base_url(), "options/contracts", query = query)

    pages <- c(pages, data$option_contracts)

    # Check if there's another page of data.
    if (is.null(data$next_page_token)) {
      break
    } else {
      query$page_token <- data$next_page_token
    }
  }

  pages |>
    bind_rows() |>
    options_fix()
}
