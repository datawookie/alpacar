library(dotenv)
library(alpaca)

load_dot_env()

authenticate(
  key = Sys.getenv("ALPACA_KEY"),
  secret = Sys.getenv("ALPACA_SECRET_KEY")
)

things <- assets(status = "active", attributes = c("has_options"))

dim(things)
