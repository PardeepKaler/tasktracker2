defmodule Tasktracker.Repo.Migrations.RemoveTimespentFromTask do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
      remove :timeSpent
 end
  end
end
