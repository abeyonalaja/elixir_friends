# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :elixir_friends, ElixirFriends.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "0ivt9hrzBbzWlLAkh40RaLUzO5b91D1JDUpOjgrLO6XCXkhpLoQRo9nj71WgNaYS",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: ElixirFriends.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

  config :ex_twitter, :oauth, [
    consumer_key:        System.get_env("TWITTER_CONSUMER_KEY"),
    consumer_secret:     System.get_env("TWITTER_CONSUMER_SECRET"),
    access_token:        System.get_env("TWITTER_ACCESS_TOKEN"),
    access_token_secret: System.get_env("TWITTER_ACCESS_SECRET")
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
