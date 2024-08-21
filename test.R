library(dotenv)
library(alpaca)

load_dot_env()

authenticate(
  key = Sys.getenv("ALPACA_KEY"),
  secret = Sys.getenv("ALPACA_SECRET_KEY")
)

quotes_latest(c("AAPL", "TSLA"))

quotes_history("AAPL")
