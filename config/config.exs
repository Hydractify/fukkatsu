# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :fukkatsu,
  ecto_repos: [Fukkatsu.Repo]

config :fukkatsu_web,
  ecto_repos: [Fukkatsu.Repo],
  generators: [context_app: :fukkatsu]

# Configures the endpoint
config :fukkatsu_web, FukkatsuWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1nJwBG8eUwBx+u3UK94AKUldqej9FG6km/NupDxKEV1TaddtzlraML/kNNDKnjEa",
  render_errors: [view: FukkatsuWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: FukkatsuWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
