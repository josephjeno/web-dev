defmodule Tasks1.Social.Manage do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasks1.Social.Manage
  alias Tasks1.Accounts.User


  schema "manages" do
    belongs_to :manager, User, foreign_key: :manager_id
    belongs_to :underling, User, foreign_key: :underling_id

    timestamps()
  end

  @doc false
  def changeset(%Manage{} = manage, attrs) do
    manage
    |> cast(attrs, [:manager_id, :underling_id])
    |> validate_required([:manager_id, :underling_id])
  end
end
