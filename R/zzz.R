.onLoad <- function(libname, pkgname) {
  message("Selecting paper trading API by default.")
  base_url(BASE_URL_PAPER_TRADING)
}
