separator <- function(text = NA, width = 80, char = "=") {
  text <- ifelse(is.na(text), "", paste0(text, " "))
  extra <- paste(rep(char, width - nchar(text)), collapse = "")
  paste0(text, extra)
}
