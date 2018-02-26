use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :tasktracker2, TasktrackerWeb.Endpoint,
  secret_key_base: "9FeaDDzvxwKUYLvyBHaDX0WcovCWydyNA+Q/XN9y8tioPzjl1xjG98t+NbUYnqYp"

# Configure your database
config :tasktracker2, Tasktracker.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "tasktracker2",
  password: "$jatt$jatt%",
  database: "tasktracker2_prod",
  pool_size: 15
