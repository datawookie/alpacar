library(rvest)
library(stringr)
library(purrr)
library(glue)

html <- read_html("https://docs.alpaca.markets/reference/authentication-2")

endpoints <- html |>
  html_nodes("li > a.subpage")

api <- map_dfr(endpoints, function(endpoint) {
  data.frame(
    method = endpoint |> html_node("span[class^='Sidebar-method'] > span") |> html_text() |> str_to_upper(),
    description = endpoint |> html_node("span[class^='Sidebar-link']") |> html_text()
  )
})

for (i in seq_len(nrow(api))) {
  cat(glue("- [ ] `{api$method[i]}` {api$description[i]}"), "\n", sep = "")
}
