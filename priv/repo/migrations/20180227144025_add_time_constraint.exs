defmodule Tasktracker.Repo.Migrations.AddTimeConstraint do
  use Ecto.Migration

  def change do
    create constraint("timeblocks", :end_time_bigger, check: "start_time <= end_time")
  end
end
