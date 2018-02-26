defmodule Tasktracker.Repo.Migrations.AddFieldsToUsers do
  use Ecto.Migration

  def change do
      alter table(:users) do
        add :admin, :boolean, null: false
        add :manager, :string
   end
  end
end
