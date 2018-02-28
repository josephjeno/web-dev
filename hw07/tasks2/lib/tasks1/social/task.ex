defmodule Tasks1.Social.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasks1.Social.Task
  alias Tasks1.Social.TimeBlock
  alias Tasks1.Accounts.User


  schema "tasks" do
    field :title, :string
    field :description, :string
    field :completed?, :boolean, default: false
    has_many :timeblock, TimeBlock
    belongs_to :user, User, foreign_key: :user_id
    belongs_to :from, User, foreign_key: :old_id
    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:title, :description, :completed?, :user_id, :old_id])
    |> validate_required([:title, :description, :completed?, :user_id, :old_id])
  end
end
