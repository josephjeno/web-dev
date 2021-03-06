defmodule Tasks1.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasks1.Accounts.User
  alias Tasks1.Social.Manage


  schema "users" do
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :name])
    |> validate_required([:email, :name])
  end
end
