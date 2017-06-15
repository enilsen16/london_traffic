use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :london_traffic, LondonTraffic.Web.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :london_traffic,
  google_maps_api_key: System.get_env("MAPS_API_KEY")

# Configure your database
config :london_traffic, LondonTraffic.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "london_traffic_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
