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

assets_fix <- function(assets) {
  assets |>
    map(~ modify_at(.x, "attributes", ~ paste(.x, collapse = ", "))) |>
    bind_rows() |>
    rename(asset_id = id)
}
