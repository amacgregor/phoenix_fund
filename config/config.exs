# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_fund,
  ecto_repos: [PhoenixFund.Repo]

# Configures the endpoint
config :phoenix_fund, PhoenixFundWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8Xlwyxz5kBhqS3fHmG7yyoerCoFv9o4BncIV3aGP/zXc986Rw+JgAwC29FpTWKej",
  render_errors: [view: PhoenixFundWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PhoenixFund.PubSub,
  live_view: [signing_salt: "1S9l7w1C"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
