# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :comm,
  ecto_repos: [Comm.Repo]

# Configures the endpoint
config :comm, CommWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MVMEqvTcCUxawFG0QdZ9JaL8zKtDvOaKBVhFIw9nwSPl6uD51WLeEuDNi0LtfRAH",
  render_errors: [view: CommWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Comm.PubSub,
  live_view: [signing_salt: "eY7S87I+"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
