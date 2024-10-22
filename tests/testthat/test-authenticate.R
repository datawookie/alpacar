test_that("authenticates", {
  authenticate(
    key = Sys.getenv("ALPACA_KEY"),
    secret = Sys.getenv("ALPACA_SECRET_KEY")
  )
  expect_false(is.null(alpacar:::cache$ALPACA_API_KEY))
  expect_false(is.null(alpacar:::cache$ALPACA_API_SECRET))
})
