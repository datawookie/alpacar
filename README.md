
<!-- 🚨 README.md is generated from README.Rmd. Please edit that file -->

# emayili <img src="man/figures/alpacar-hex.png" align="right" alt="" width="120" />

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/alpacar)](https://cran.r-project.org/package=alpacar)
![GitHub Actions build
status](https://github.com/datawookie/alpacar/actions/workflows/build.yaml/badge.svg)
[![Codecov test
coverage](https://img.shields.io/codecov/c/github/datawookie/alpacar.svg)](https://app.codecov.io/gh/datawookie/alpacar)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html)
<!-- badges: end -->

`{alpacar}` is an R package wrapper for the
[Alpaca](https://alpaca.markets/) API.

API documentation can be found
[here](https://docs.alpaca.markets/docs/).

The functionality for this package is covered in a series of blog posts:

- [Authenticate with Alpaca
  API](https://datawookie.dev/blog/2024/10/authenticate-with-alpaca-api/)
- [Listing
  Assets](https://datawookie.dev/blog/2024/10/listing-alpaca-assets/)

## Installation

Install from GitHub.

``` r
remotes::install_github("datawookie/alpacar")
```

## Load

Once installed you can load the package. I also like to increase the
number of significant figures in `tibble` output (completely optional).

``` r
  library(alpacar)
  
  # Expand decimal places.
  options(pillar.sigfig = 8)
```

## Authenticate

I store my credentials in environment variables. Specifically I use a
`.env` file in my project directory.

``` r
library(dotenv)

load_dot_env()

authenticate(
  key = Sys.getenv("ALPACA_KEY"),
  secret = Sys.getenv("ALPACA_SECRET_KEY")
)
```

## Endpoints

<!-- List created with the get-endpoints.R script. -->

- [x] `GET` Get Account
- [x] `GET` Get Assets
- [ ] `GET` Get an Asset by ID or Symbol
- [ ] `GET` Get Option Contracts
- [ ] `GET` Get an option contract by ID or Symbol
- [ ] `GET` Retrieve a Specific Announcement
- [ ] `GET` Retrieve Announcements
- [ ] `POST` Create an Order
- [ ] `GET` Get All Orders
- [ ] `DELETE` All Orders
- [ ] `GET` Get Order by ID
- [ ] `PATCH` Replace Order by ID
- [ ] `DELETE` Delete Order by ID
- [ ] `GET` All Open Positions
- [ ] `DELETE` Close All Positions
- [ ] `GET` Get an Open Position
- [ ] `DELETE` Close a Position
- [ ] `POST` Exercise an Options Position
- [ ] `GET` Get Account Portfolio History
- [ ] `GET` Get All Watchlists
- [ ] `POST` Create Watchlist
- [ ] `GET` Get Watchlist by ID
- [ ] `PUT` Update Watchlist By Id
- [ ] `POST` Add Asset to Watchlist
- [ ] `DELETE` Delete Watchlist By Id
- [ ] `GET` Get Watchlist by Name
- [ ] `PUT` Update Watchlist By Name
- [ ] `POST` Add Asset to Watchlist By Name
- [ ] `DELETE` Delete Watchlist By Name
- [ ] `DELETE` Delete Symbol from Watchlist
- [ ] `GET` Get Account Configurations
- [ ] `PATCH` Account Configurations
- [x] `GET` Retrieve Account Activities
- [ ] `GET` Retrieve Account Activities of Specific Type
- [ ] `GET` Get Market Calendar info
- [x] `GET` Get Market Clock info
- [ ] `GET` Retrieve Crypto Funding Wallets
- [ ] `GET` Retrieve Crypto Funding Transfers
- [ ] `POST` Request a New Withdrawal
- [ ] `GET` Retrieve a Crypto Funding Transfer
- [ ] `GET` An array of whitelisted addresses
- [ ] `POST` Request a new whitelisted address
- [ ] `DELETE` Delete a whitelisted address
- [ ] `GET` Returns the estimated gas fee for a proposed transaction.
- [ ] `GET` Historical auctions
- [x] `GET` Historical bars
- [ ] `GET` Latest bars
- [x] `GET` Condition codes
- [x] `GET` Exchange codes
- [x] `GET` Historical quotes
- [x] `GET` Latest quotes
- [ ] `GET` Snapshots
- [x] `GET` Historical trades
- [ ] `GET` Latest trades
- [ ] `GET` Historical auctions (single)
- [ ] `GET` Historical bars (single symbol)
- [ ] `GET` Latest bar (single symbol)
- [ ] `GET` Historical quotes (single symbol)
- [ ] `GET` Latest quote (single symbol)
- [ ] `GET` Snapshot (single symbol)
- [ ] `GET` Historical trades (single symbol)
- [ ] `GET` Latest trade (single symbol)
- [ ] `GET` Historical bars
- [ ] `GET` Latest bars
- [ ] `GET` Latest orderbook
- [ ] `GET` Latest quotes
- [ ] `GET` Latest trades
- [ ] `GET` Historical quotes
- [ ] `GET` Snapshots
- [ ] `GET` Historical trades
- [ ] `GET` Latest rates for currency pairs
- [ ] `GET` Historical rates for currency pairs
- [ ] `GET` Logos
- [ ] `GET` Most active stocks
- [ ] `GET` Top market movers
- [ ] `GET` News articles
- [ ] `GET` Corporate actions
- [ ] `GET` Historical bars
- [ ] `GET` Condition codes
- [ ] `GET` Exchange codes
- [ ] `GET` Latest quotes
- [ ] `GET` Snapshots
- [ ] `GET` Option chain
- [ ] `GET` Historical trades
- [ ] `GET` Latest trades
- [ ] `GET` Get All Accounts
- [ ] `GET` Subscribe to Account Status Events (SSE)
- [ ] `POST` Create an Account
- [ ] `POST` Upload Owner Documents for an Existing Account
- [ ] `GET` Get An Account by ID
- [ ] `DELETE` Delete a Bank Relationship for an Account
- [ ] `PATCH` Update an Account
- [ ] `POST` Request options trading for an account (BETA)
- [ ] `DELETE` Request to Close a Transfer
- [ ] `GET` Retrieve Account Activities
- [ ] `GET` Retrieve Account Activities of Specific Type
- [ ] `GET` Retrieve ACH Relationships for an account
- [ ] `POST` Create an ACH Relationship
- [ ] `GET` Retrieve Trading Details for an Account
- [ ] `DELETE` Delete an existing ACH relationship
- [ ] `GET` Get Pattern Day Trader Status for account
- [ ] `POST` Exercise PDT one time removal
- [ ] `POST` Close an Account
- [ ] `GET` Retrieve a List of Account Documents
- [ ] `GET` Download an Account Document
- [ ] `GET` Download the W8BEN document for the primary owner of an
  account
- [ ] `GET` List Open Positions for an Account
- [ ] `DELETE` Close All Positions for an Account
- [ ] `GET` Get an Open Position for account by Symbol or AssetId
- [ ] `DELETE` Close a Position for an Account
- [ ] `POST` Exercise an Options Position (BETA)
- [ ] `GET` Retrieve an Order by its ID
- [ ] `PATCH` Replace an Order
- [ ] `DELETE` Cancel an Open Order
- [ ] `GET` Retrieve a List of Orders
- [ ] `POST` Create an Order for an Account
- [ ] `DELETE` Cancel all Open Orders For an Account
- [ ] `POST` Estimate an Order
- [ ] `GET` Bulk Fetch All Accounts Positions
- [ ] `GET` Get Account Portfolio History
- [ ] `PATCH` Update Trading Configurations for an Account
- [ ] `GET` Retrieve real-time Trading Limits for an Account
- [ ] `GET` Retrieve All Assets
- [ ] `GET` Retrieve an Asset by ID
- [ ] `GET` Retrieve Entry Requirements for requested assets
- [ ] `GET` Get Option Contracts (BETA)
- [ ] `GET` Get an option contract by ID or Symbol (BETA)
- [ ] `GET` Retrieve the Market Calendar
- [ ] `GET` Subscribe to Transfer Events (SSE)
- [ ] `GET` Subscribe to Trade Events (SSE) (Legacy)
- [ ] `GET` Subscribe to Trade Events (SSE)
- [ ] `GET` Subscribe to Admin Action Events (SSE)
- [ ] `GET` Subscribe to Non-Trading Activities Events (SSE)
- [ ] `GET` Retrieve Bank Relationships for an Account
- [ ] `POST` Create a Bank Relationship for an Account
- [ ] `GET` Retrieve List of Transfers for an Account.
- [ ] `POST` Request a New Transfer
- [ ] `GET` Retrieve JIT Reports
- [ ] `GET` Retrieve Daily Trading Limits
- [ ] `GET` Retrieve JIT Ledgers
- [ ] `GET` Retrieve JIT Ledger Balances
- [ ] `GET` List all JIT Settlements
- [ ] `POST` Create a new JIT settlement
- [ ] `GET` Get a single JIT settlement
- [ ] `POST` Create sandbox deposit transfer
- [ ] `POST` Batch create funding wallets
- [ ] `GET` Retrieve funding wallet
- [ ] `POST` Creates a funding wallet
- [ ] `GET` Retrieve funding details
- [ ] `GET` Retrieve funding wallet transfers
- [ ] `GET` Retrieve recipient bank
- [ ] `POST` Create a recipient bank
- [ ] `DELETE` Delete a recipient bank
- [ ] `POST` Create a withdrawal
- [ ] `GET` Get Instant Funding List
- [ ] `POST` Create an instant funding request
- [ ] `GET` Get an instant funding request
- [ ] `DELETE` Cancel an instant funding request
- [ ] `GET` List settlements
- [ ] `POST` Create a new settlement
- [ ] `GET` Get a single settlement
- [ ] `GET` Get instant funding limits
- [ ] `GET` Get instant funding account limits
- [ ] `GET` Get instant funding report
- [ ] `GET` Get an OAuth client
- [ ] `POST` Issue an OAuth token
- [ ] `POST` Authorize an OAuth Token
- [ ] `GET` Retrieve the Market Clock
- [ ] `GET` Retrieve a List Journals
- [ ] `GET` Subscribe to Journal Events (SSE)
- [ ] `POST` Create a Journal
- [ ] `DELETE` Cancel a Pending Journal
- [ ] `GET` Retrieve a Single Journal Entry
- [ ] `POST` Create a Batch Journal Transaction (One-to-Many)
- [ ] `POST` Create a Reverse Batch Journal Transaction (Many-to-One)
- [ ] `GET` Retrieve Announcements
- [ ] `GET` Retrieve a Specific Announcement
- [ ] `GET` Retrieve all Watchlists for an Account
- [ ] `POST` Create a New Watchlist for an Account
- [ ] `GET` Manage watchlists
- [ ] `PUT` Update a Watchlist
- [ ] `DELETE` Remove a Watchlist
- [ ] `POST` Add an Asset to a Watchlist
- [ ] `DELETE` Remove a Symbol from a Watchlist
- [ ] `POST` Upload CIP information
- [ ] `GET` Retrieve CIP information
- [ ] `GET` Retrieve an Onfido SDK Token
- [ ] `PATCH` Update the Onfido SDK Outcome
- [ ] `GET` List Portfolios
- [ ] `POST` Create Portfolio
- [ ] `GET` Get Portfolio by ID
- [ ] `PATCH` Update Portfolio by ID
- [ ] `DELETE` Inactivate Portfolio By ID
- [ ] `GET` List All Subscriptions
- [ ] `POST` Create Subscription
- [ ] `GET` Get Subscription by ID
- [ ] `DELETE` Unsubscribe Account (Delete Subscription)
- [ ] `GET` List All Runs
- [ ] `POST` Create Run (Manual rebalancing event)
- [ ] `GET` Get Run by ID
- [ ] `DELETE` Cancel Run by ID
- [ ] `GET` Get Logo
- [ ] `GET` Retrieve Aggregate Positions
- [ ] `GET` Retrieve EOD Positions
- [ ] `GET` Retrieve EOD Cash Interest Details
- [ ] `GET` Retrieve countries information
- [ ] `GET` Retrieve Crypto Funding Wallets
- [ ] `GET` Retrieve Crypto Funding Transfers
- [ ] `POST` Request a New Withdrawal
- [ ] `GET` Retrieve a Crypto Funding Transfer
- [ ] `GET` An array of whitelisted addresses
- [ ] `POST` Request a new whitelisted address
- [ ] `DELETE` Delete a whitelisted address
- [ ] `GET` Returns the estimated gas fee for a proposed transaction.
- [ ] `GET` Retrieve Excess Contributions
- [ ] `GET` List APR Tiers
- [ ] `GET` Get Account
- [ ] `GET` Get Assets
- [ ] `GET` Get an Asset by ID or Symbol
- [x] `GET` Get Option Contracts
- [ ] `GET` Get an option contract by ID or Symbol
- [ ] `GET` Retrieve a Specific Announcement
- [x] `GET` Retrieve Announcements
- [ ] `POST` Create an Order
- [x] `GET` Get All Orders
- [ ] `DELETE` All Orders
- [ ] `GET` Get Order by ID
- [ ] `PATCH` Replace Order by ID
- [ ] `DELETE` Delete Order by ID
- [x] `GET` All Open Positions
- [ ] `DELETE` Close All Positions
- [ ] `GET` Get an Open Position
- [ ] `DELETE` Close a Position
- [ ] `POST` Exercise an Options Position
- [ ] `GET` Get Account Portfolio History
- [x] `GET` Get All Watchlists
- [ ] `POST` Create Watchlist
- [x] `GET` Get Watchlist by ID
- [ ] `PUT` Update Watchlist By Id
- [x] `POST` Add Asset to Watchlist
- [ ] `DELETE` Delete Watchlist By Id
- [ ] `GET` Get Watchlist by Name
- [ ] `PUT` Update Watchlist By Name
- [ ] `POST` Add Asset to Watchlist By Name
- [ ] `DELETE` Delete Watchlist By Name
- [ ] `DELETE` Delete Symbol from Watchlist
- [ ] `GET` Get Account Configurations
- [ ] `PATCH` Account Configurations
- [ ] `GET` Retrieve Account Activities
- [ ] `GET` Retrieve Account Activities of Specific Type
- [ ] `GET` Get Market Calendar info
- [ ] `GET` Get Market Clock info
- [ ] `GET` Retrieve Crypto Funding Wallets
- [ ] `GET` Retrieve Crypto Funding Transfers
- [ ] `POST` Request a New Withdrawal
- [ ] `GET` Retrieve a Crypto Funding Transfer
- [ ] `GET` An array of whitelisted addresses
- [ ] `POST` Request a new whitelisted address
- [ ] `DELETE` Delete a whitelisted address
- [ ] `GET` Returns the estimated gas fee for a proposed transaction.
- [ ] `GET` Historical auctions
- [ ] `GET` Historical bars
- [ ] `GET` Latest bars
- [ ] `GET` Condition codes
- [ ] `GET` Exchange codes
- [ ] `GET` Historical quotes
- [ ] `GET` Latest quotes
- [ ] `GET` Snapshots
- [ ] `GET` Historical trades
- [ ] `GET` Latest trades
- [ ] `GET` Historical auctions (single)
- [ ] `GET` Historical bars (single symbol)
- [ ] `GET` Latest bar (single symbol)
- [ ] `GET` Historical quotes (single symbol)
- [ ] `GET` Latest quote (single symbol)
- [ ] `GET` Snapshot (single symbol)
- [ ] `GET` Historical trades (single symbol)
- [ ] `GET` Latest trade (single symbol)
- [ ] `GET` Historical bars
- [ ] `GET` Latest bars
- [ ] `GET` Latest orderbook
- [ ] `GET` Latest quotes
- [ ] `GET` Latest trades
- [ ] `GET` Historical quotes
- [ ] `GET` Snapshots
- [ ] `GET` Historical trades
- [ ] `GET` Latest rates for currency pairs
- [ ] `GET` Historical rates for currency pairs
- [ ] `GET` Logos
- [ ] `GET` Most active stocks
- [ ] `GET` Top market movers
- [ ] `GET` News articles
- [ ] `GET` Corporate actions
- [ ] `GET` Historical bars
- [ ] `GET` Condition codes
- [ ] `GET` Exchange codes
- [ ] `GET` Latest quotes
- [ ] `GET` Snapshots
- [ ] `GET` Option chain
- [ ] `GET` Historical trades
- [ ] `GET` Latest trades
- [ ] `GET` Get All Accounts
- [ ] `GET` Subscribe to Account Status Events (SSE)
- [ ] `POST` Create an Account
- [ ] `POST` Upload Owner Documents for an Existing Account
- [ ] `GET` Get An Account by ID
- [ ] `DELETE` Delete a Bank Relationship for an Account
- [ ] `PATCH` Update an Account
- [ ] `POST` Request options trading for an account (BETA)
- [ ] `DELETE` Request to Close a Transfer
- [ ] `GET` Retrieve Account Activities
- [ ] `GET` Retrieve Account Activities of Specific Type
- [ ] `GET` Retrieve ACH Relationships for an account
- [ ] `POST` Create an ACH Relationship
- [ ] `GET` Retrieve Trading Details for an Account
- [ ] `DELETE` Delete an existing ACH relationship
- [ ] `GET` Get Pattern Day Trader Status for account
- [ ] `POST` Exercise PDT one time removal
- [ ] `POST` Close an Account
- [ ] `GET` Retrieve a List of Account Documents
- [ ] `GET` Download an Account Document
- [ ] `GET` Download the W8BEN document for the primary owner of an
  account
- [ ] `GET` List Open Positions for an Account
- [ ] `DELETE` Close All Positions for an Account
- [ ] `GET` Get an Open Position for account by Symbol or AssetId
- [ ] `DELETE` Close a Position for an Account
- [ ] `POST` Exercise an Options Position (BETA)
- [ ] `GET` Retrieve an Order by its ID
- [ ] `PATCH` Replace an Order
- [ ] `DELETE` Cancel an Open Order
- [ ] `GET` Retrieve a List of Orders
- [ ] `POST` Create an Order for an Account
- [ ] `DELETE` Cancel all Open Orders For an Account
- [ ] `POST` Estimate an Order
- [ ] `GET` Bulk Fetch All Accounts Positions
- [ ] `GET` Get Account Portfolio History
- [ ] `PATCH` Update Trading Configurations for an Account
- [ ] `GET` Retrieve real-time Trading Limits for an Account
- [ ] `GET` Retrieve All Assets
- [ ] `GET` Retrieve an Asset by ID
- [ ] `GET` Retrieve Entry Requirements for requested assets
- [ ] `GET` Get Option Contracts (BETA)
- [ ] `GET` Get an option contract by ID or Symbol (BETA)
- [ ] `GET` Retrieve the Market Calendar
- [ ] `GET` Subscribe to Transfer Events (SSE)
- [ ] `GET` Subscribe to Trade Events (SSE) (Legacy)
- [ ] `GET` Subscribe to Trade Events (SSE)
- [ ] `GET` Subscribe to Admin Action Events (SSE)
- [ ] `GET` Subscribe to Non-Trading Activities Events (SSE)
- [ ] `GET` Retrieve Bank Relationships for an Account
- [ ] `POST` Create a Bank Relationship for an Account
- [ ] `GET` Retrieve List of Transfers for an Account.
- [ ] `POST` Request a New Transfer
- [ ] `GET` Retrieve JIT Reports
- [ ] `GET` Retrieve Daily Trading Limits
- [ ] `GET` Retrieve JIT Ledgers
- [ ] `GET` Retrieve JIT Ledger Balances
- [ ] `GET` List all JIT Settlements
- [ ] `POST` Create a new JIT settlement
- [ ] `GET` Get a single JIT settlement
- [ ] `POST` Create sandbox deposit transfer
- [ ] `POST` Batch create funding wallets
- [ ] `GET` Retrieve funding wallet
- [ ] `POST` Creates a funding wallet
- [ ] `GET` Retrieve funding details
- [ ] `GET` Retrieve funding wallet transfers
- [ ] `GET` Retrieve recipient bank
- [ ] `POST` Create a recipient bank
- [ ] `DELETE` Delete a recipient bank
- [ ] `POST` Create a withdrawal
- [ ] `GET` Get Instant Funding List
- [ ] `POST` Create an intant funding request
- [ ] `GET` Get an instant funding request
- [ ] `DELETE` Cancel an instant funding request
- [ ] `GET` List settlements
- [ ] `POST` Create a new settlement
- [ ] `GET` Get a single settlement
- [ ] `GET` Get instant funding limits
- [ ] `GET` Get instant funding account limits
- [ ] `GET` Get instant funding report
- [ ] `GET` Get an OAuth client
- [ ] `POST` Issue an OAuth token
- [ ] `POST` Authorize an OAuth Token
- [ ] `GET` Retrieve the Market Clock
- [ ] `GET` Retrieve a List Journals
- [ ] `GET` Subscribe to Journal Events (SSE)
- [ ] `POST` Create a Journal
- [ ] `DELETE` Cancel a Pending Journal
- [ ] `GET` Retrieve a Single Journal Entry
- [ ] `POST` Create a Batch Journal Transaction (One-to-Many)
- [ ] `POST` Create a Reverse Batch Journal Transaction (Many-to-One)
- [ ] `GET` Retrieve Announcements
- [ ] `GET` Retrieve a Specific Announcement
- [ ] `GET` Retrieve all Watchlists for an Account
- [ ] `POST` Create a New Watchlist for an Account
- [ ] `GET` Manage watchlists
- [ ] `PUT` Update a Watchlist
- [ ] `DELETE` Remove a Watchlist
- [ ] `POST` Add an Asset to a Watchlist
- [ ] `DELETE` Remove a Symbol from a Watchlist
- [ ] `POST` Upload CIP information
- [ ] `GET` Retrieve CIP information
- [ ] `GET` Retrieve an Onfido SDK Token
- [ ] `PATCH` Update the Onfido SDK Outcome
- [ ] `GET` List Portfolios
- [ ] `POST` Create Portfolio
- [ ] `GET` Get Portfolio by ID
- [ ] `PATCH` Update Portfolio by ID
- [ ] `DELETE` Inactivate Portfolio By ID
- [ ] `GET` List All Subscriptions
- [ ] `POST` Create Subscription
- [ ] `GET` Get Subscription by ID
- [ ] `DELETE` Unsubscribe Account (Delete Subscription)
- [ ] `GET` List All Runs
- [ ] `POST` Create Run (Manual rebalancing event)
- [ ] `GET` Get Run by ID
- [ ] `DELETE` Cancel Run by ID
- [ ] `GET` Get Logo
- [ ] `GET` Retrieve Aggregate Positions
- [ ] `GET` Retrieve EOD Positions
- [ ] `GET` Retrieve EOD Cash Interest Details
- [ ] `GET` Retrieve countries information
- [ ] `GET` Retrieve Crypto Funding Wallets
- [ ] `GET` Retrieve Crypto Funding Transfers
- [ ] `POST` Request a New Withdrawal
- [ ] `GET` Retrieve a Crypto Funding Transfer
- [ ] `GET` An array of whitelisted addresses
- [ ] `POST` Request a new whitelisted address
- [ ] `DELETE` Delete a whitelisted address
- [ ] `GET` Returns the estimated gas fee for a proposed transaction.
- [ ] `GET` Retrieve Excess Contributions
- [ ] `GET` List APR Tiers
