ALPACA_API_KEY = "api_key"
ALPACA_API_SECRET = "api_secret"

#' Set Alpaca REST API key & secret
#'
#' @param key API key.
#' @param secret API secret.
#'
#' @export
#'
#' @examples
#' authenticate(
#'   key = Sys.getenv("ALPACA_KEY"),
#'   secret = Sys.getenv("ALPACA_SECRET_KEY")
#' )
authenticate <- function(key = NULL, secret = NULL) {
  if (!is.null(key)) cache_set(ALPACA_API_KEY, key)
  if (!is.null(secret)) cache_set(ALPACA_API_SECRET, secret)
}
