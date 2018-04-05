# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Tasks1.Repo.insert!(%Tasks1.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


defmodule Seeds do
  alias Tasks1.Repo
  alias Tasks1.Accounts.User
  alias Tasks1.Social.Task

  def run do
    p = Comeonin.Argon2.hashpwsalt("password1")

    Repo.delete_all(User)
    a = Repo.insert!(%User{ name: "alice", email: "alice@gmail.com", password_hash: p })
    b = Repo.insert!(%User{ name: "bob", email: "bob@gmail.com", password_hash: p })
    c = Repo.insert!(%User{ name: "carol", email: "carol@gmail.com", password_hash: p })
    d = Repo.insert!(%User{ name: "dave", email: "dave@gmail.com", password_hash: p })

    Repo.delete_all(Task)
    Repo.insert!(%Task{ user_id: a.id, title: "Alice", description: "Hi, I'm Alice", time_spent: 15, completed: false })
    Repo.insert!(%Task{ user_id: b.id, title: "Bob", description: "Hi, I'm Bob", time_spent: 15, completed: false })
    Repo.insert!(%Task{ user_id: b.id, title: "Bob2", description: "Hi, I'm Bob Again", time_spent: 15, completed: false })
    Repo.insert!(%Task{ user_id: c.id, title: "Carol", description: "Hi, I'm Carol", time_spent: 45, completed: false })
    Repo.insert!(%Task{ user_id: d.id, title: "Dave", description: "Hi, I'm Dave", time_spent: 15, completed: true })
  end
end

Seeds.run
