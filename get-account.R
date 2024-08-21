library(httr)
library(dotenv)

load_dot_env()

ALPACA_KEY = Sys.getenv("ALPACA_KEY")
ALPACA_SECRET_KEY = Sys.getenv("ALPACA_SECRET_KEY")

url <- "https://paper-api.alpaca.markets/v2/account"

response <- VERB(
  "GET",
  url,
  add_headers(
    'APCA-API-KEY-ID' = ALPACA_KEY,
    'APCA-API-SECRET-KEY' = ALPACA_SECRET_KEY
  ),
  content_type("application/octet-stream"),
  accept("application/json")
)

content(response, "text")
