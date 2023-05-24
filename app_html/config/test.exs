import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :app_html, AppHtmlWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "pHF7D4i2ZyY1lSSqi3frbEPRDTmYsZSrt7vg5Jxj7FrGB3kyikzeKKgqIozc09RA",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
