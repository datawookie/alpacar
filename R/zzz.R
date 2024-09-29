.onLoad <- function(libname, pkgname) {
  # nolint start
  # nocov start
  log_layout(layout_glue_generator('{stringr::str_pad(level, 7, side = "right")} [{time}] {msg}'))

  message("alpacar v", as.character(packageVersion("alpacar")))
  message("Selecting paper trading API by default.")

  base_url(BASE_URL_PAPER_TRADING)
  # nocov end
  # nolint end
}
