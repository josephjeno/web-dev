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
  secret_key_base: "IFpA1bDpM904cvVvdKNMrCg9Mo7Ayv41zKC/FIaQIjq3nziRT3jkTsyomav1w7ES"

# Configure your database
config :tasks1, Tasks1.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "tasks2",
  password: "tasks2",
  database: "tasks2_prod",
  pool_size: 15
