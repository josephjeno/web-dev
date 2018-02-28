defmodule Tasks1.Social.TimeBlock do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasks1.Social.TimeBlock


  schema "timeblocks" do
    field :end, :naive_datetime
    field :start, :naive_datetime
    belongs_to :task, Tasks1.Social.Task

    timestamps()
  end

  @doc false
  def changeset(%TimeBlock{} = time_block, attrs) do
    time_block
    |> cast(attrs, [:task_id, :start, :end])
    |> validate_required([:task_id, :start, :end])
  end
end
