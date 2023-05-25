import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :app_live, AppLiveWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "kzws/tjbOJpwpHh72tTChOJQxSqtVrdSDzqRJHomyX7W68c7wsFd5hRIycoAW+32",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
