defmodule Tasktracker.TaskTrack.TimeBlock do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.TaskTrack.TimeBlock


  schema "timeblocks" do
    field :end_time, :naive_datetime
    field :start_time, :naive_datetime
    belongs_to :task, Tasktracker.TaskTrack.Task, foreign_key: :task_id

    timestamps()
  end

  @doc false
  def changeset(%TimeBlock{} = time_block, attrs) do
    time_block
    |> cast(attrs, [:start_time, :end_time, :task_id])
    |> validate_required([:start_time, :end_time, :task_id])
    |> foreign_key_constraint(:task_id)
  end
end
