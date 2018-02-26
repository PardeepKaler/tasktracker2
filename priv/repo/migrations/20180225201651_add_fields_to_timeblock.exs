defmodule Tasktracker.Repo.Migrations.AddFieldsToTimeblock do
  use Ecto.Migration

  def change do
    drop table(:timeblocks)
    create table(:timeblocks) do
      add :start_time, :naive_datetime
      add :end_time, :naive_datetime
      add :task_id, references(:tasks, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:timeblocks, [:task_id])
  end
end
