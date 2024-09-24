#' @import logger
#' @import dplyr
#' @import purrr
#' @import httr2
#' @import lubridate
NULL

.onLoad <- function(libname, pkgname) {
  # nolint start
  # nocov start
  options(digits.secs = 3)
  log_layout(layout_glue_generator('{stringr::str_pad(level, 7, side = "right")} [{time}] {msg}'))
  # nocov end
  # nolint end
}

globalVariables(
  c(
    "GET",
    "base_url"
  )
)
