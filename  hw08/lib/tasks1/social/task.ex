defmodule Tasks1.Social.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :completed, :boolean, default: false
    field :description, :string
    field :time_spent, :integer
    field :title, :string
    belongs_to :user, Tasks1.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :description, :time_spent, :completed, :user_id])
    |> validate_required([:title, :description, :time_spent, :completed])
  end
end
