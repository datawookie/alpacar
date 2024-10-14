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

  for (field in c(
    "cash", "portfolio_value", "equity", "buying_power", "regt_buying_power",
    "daytrading_buying_power", "effective_buying_power", "options_buying_power",
    "non_marginable_buying_power", "long_market_value", "short_market_value",
    "position_market_value", "initial_margin", "maintenance_margin",
    "last_maintenance_margin"
  )) {
    details[[field]] <- as.numeric(details[[field]])
  }

  details$created_at <- strptime(details$created_at, format = "%Y-%m-%dT%H:%M:%S", tz = "UTC")

  structure(details, class = "alpacaAccount")
}

#' Generic print() method for Alpaca Account objects.
#'
#' @param obj An Alpaca Account object.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' print(account())
#' account()
#' }
print.alpacaAccount <- function(obj) {
  BLANKS <- paste(rep(" ", 40), collapse = "")
  cat(
    separator(),
    glue("Alpaca Account: {obj$account_number} ({obj$id})"),
    glue("Currency:       {obj$currency}"),
    glue("Created:        {obj$created_at}"),
    glue("Status:         {obj$status}"),
    separator(),
    "",
    # glue("Crypto: status = {obj$crypto_status}; tier = {obj$crypto_tier}"),
    # glue("Options level: approved = {obj$options_approved_level}; trading {obj$options_trading_level}"),
    separator(glue("Balances ({obj$balance_asof})"), char = "-"),
    glue("Equity:                    = {sprintf('%9.2f', obj$equity)}"),
    glue("Cash:                      = {sprintf('%9.2f', obj$cash)}"),
    glue(
      "Buying power: Nominal      = {sprintf('%9.2f', obj$buying_power)}",
      "   Daytrading       = {sprintf('%9.2f', obj$daytrading_buying_power)}"
    ),
    glue(
      "              Regulation-T = {sprintf('%9.2f', obj$regt_buying_power)}",
      "   Non-marginable   = {sprintf('%9.2f', obj$non_marginable_buying_power)}"
    ),
    glue(
      "              Effective    = {sprintf('%9.2f', obj$effective_buying_power)}",
      "   Options          = {sprintf('%9.2f', obj$options_buying_power)}"
    ),
    glue(
      "Market value: Position     = {sprintf('%9.2f', obj$position_market_value)}",
      "   Long             = {sprintf('%9.2f', obj$long_market_value)}"
    ),
    glue("{BLANKS} Short            = {sprintf('%9.2f', obj$short_market_value)}"),
    glue(
      "Margin:       Initial      = {sprintf('%9.2f', obj$initial_margin)}",
      "   Maintenance      = {sprintf('%9.2f', obj$maintenance_margin)}"
    ),
    glue("{BLANKS} Last maintenance = {sprintf('%9.2f', obj$last_maintenance_margin)}"),
    separator(char = "-"),
    sep = "\n"
  )
}
