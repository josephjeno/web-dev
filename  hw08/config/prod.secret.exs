use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :tasks1, Tasks1Web.Endpoint,
  secret_key_base: "QPgSXedn5ivo4CRs70CK1qc0/75EUYIub5PbnaydEYGN51B1TywDRH+0ovQ2JrVg"

# Configure your database
config :tasks1, Tasks1.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "tasks3_prod",
  pool_size: 15
