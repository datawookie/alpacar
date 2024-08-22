library(dotenv)
library(alpaca)

# Expand decimal places.
options(pillar.sigfig = 8)

load_dot_env()

authenticate(
  key = Sys.getenv("ALPACA_KEY"),
  secret = Sys.getenv("ALPACA_SECRET_KEY")
)

# positions_list()

# print(bars("SPY", "1Hour", "2024-08-19", "2024-08-19"))
# print(bars("SPY", "1T", "2024-08-19", "2024-08-19"))

# quotes_latest("SPY")
# quotes <- quotes_history("AAPL")
# quotes
# quotes <- quotes_history("AAPL", "2024-08-01T09:00:00Z", "2024-08-01T09:05:00Z")

# print(trades("SPY", "2024-08-01", "2024-08-21"))

order_create("AAPL", "buy", 1)
