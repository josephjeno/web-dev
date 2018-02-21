defmodule Tasks1.Social.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasks1.Social.Task


  schema "tasks" do
    field :completed?, :boolean, default: false
    field :description, :string
    field :time_spent, :integer
    field :title, :string
    belongs_to :user, Tasks1.Accounts.User
    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:title, :description, :user_id, :time_spent, :completed?])
    |> validate_required([:title, :description, :user_id, :time_spent, :completed?])
    |> validate_change(:time_spent, fn :time_spent, t ->
      if rem(t, 15) == 0 do
        []
      else
        [time_spent: "Must be a multiple of 15"]
      end
    end)
  end
end
