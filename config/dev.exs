import Config

# Configure your database
config :nimble, Nimble.Repo,
  username: "postgres",
  password: "postgres",
  database: "auth_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with webpack to recompile .js and .css sources.
config :nimble, Nimble.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []

config :nimble, Nimble.Mailer, adapter: Swoosh.Adapters.Local

config :nimble, :strategies,
  github: [
    client_id: {:system, "OAUTH_GITHUB_CLIENT_ID"},
    client_secret: {:system, "OAUTH_GITHUB_CLIENT_SECRET"},
    strategy: Assent.Strategy.Github
  ],
  google: [
    client_id: System.get_env("OAUTH_GOOGLE_CLIENT_ID"),
    client_secret: System.get_env("OAUTH_GOOGLE_CLIENT_SECRET"),
    strategy: Assent.Strategy.Google,
    authorization_params: [
      access_type: "offline",
      scope: "https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile"
    ]
  ]

# ## SSL Support
#
# In order to use HTTPS in development, a self-signed
# certificate can be generated by running the following
# Mix task:
#
#     mix phx.gen.cert
#
# Note that this task requires Erlang/OTP 20 or later.
# Run `mix help phx.gen.cert` for more information.
#
# The `http:` config above can be replaced with:
#
#     https: [
#       port: 4001,
#       cipher_suite: :strong,
#       keyfile: "priv/cert/selfsigned_key.pem",
#       certfile: "priv/cert/selfsigned.pem"
#     ],
#
# If desired, both `http:` and `https:` keys can be
# configured to run both http and https servers on
# different ports.

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime
