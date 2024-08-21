cache <- new.env()

cache$BASE_URL <- "https://paper-api.alpaca.markets/v2"

cache_get <- function(x) {
  if (log_threshold() >= DEBUG) {
    log_debug("Cache contents:")
    for (key in ls(cache)) {
      log_debug("- {key} -> {get(key, envir = cache)} {ifelse(x == key, '*', '')}")
    }
  }
  possibly(get, NULL)(x, envir = cache)
}

cache_set <- function(x, value) {
  assign(x, value, envir = cache)
}

.onLoad <- function(libname, pkgname) {
  cache$BASE_URL <- "https://paper-api.alpaca.markets/v2/"
}
