defmodule Tasktracker.TaskTrackTest do
  use Tasktracker.DataCase

  alias Tasktracker.TaskTrack

  describe "tasks" do
    alias Tasktracker.TaskTrack.Task

    @valid_attrs %{assigned: "some assigned", completed: true, description: "some description", timeSpent: "120.5", title: "some title"}
    @update_attrs %{assigned: "some updated assigned", completed: false, description: "some updated description", timeSpent: "456.7", title: "some updated title"}
    @invalid_attrs %{assigned: nil, completed: nil, description: nil, timeSpent: nil, title: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TaskTrack.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert TaskTrack.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert TaskTrack.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = TaskTrack.create_task(@valid_attrs)
      assert task.assigned == "some assigned"
      assert task.completed == true
      assert task.description == "some description"
      assert task.timeSpent == Decimal.new("120.5")
      assert task.title == "some title"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TaskTrack.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, task} = TaskTrack.update_task(task, @update_attrs)
      assert %Task{} = task
      assert task.assigned == "some updated assigned"
      assert task.completed == false
      assert task.description == "some updated description"
      assert task.timeSpent == Decimal.new("456.7")
      assert task.title == "some updated title"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = TaskTrack.update_task(task, @invalid_attrs)
      assert task == TaskTrack.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = TaskTrack.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> TaskTrack.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = TaskTrack.change_task(task)
    end
  end

  describe "follows" do
    alias Tasktracker.Task_track.Follow

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def follow_fixture(attrs \\ %{}) do
      {:ok, follow} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Task_track.create_follow()

      follow
    end

    test "list_follows/0 returns all follows" do
      follow = follow_fixture()
      assert Task_track.list_follows() == [follow]
    end

    test "get_follow!/1 returns the follow with given id" do
      follow = follow_fixture()
      assert Task_track.get_follow!(follow.id) == follow
    end

    test "create_follow/1 with valid data creates a follow" do
      assert {:ok, %Follow{} = follow} = Task_track.create_follow(@valid_attrs)
    end

    test "create_follow/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Task_track.create_follow(@invalid_attrs)
    end

    test "update_follow/2 with valid data updates the follow" do
      follow = follow_fixture()
      assert {:ok, follow} = Task_track.update_follow(follow, @update_attrs)
      assert %Follow{} = follow
    end

    test "update_follow/2 with invalid data returns error changeset" do
      follow = follow_fixture()
      assert {:error, %Ecto.Changeset{}} = Task_track.update_follow(follow, @invalid_attrs)
      assert follow == Task_track.get_follow!(follow.id)
    end

    test "delete_follow/1 deletes the follow" do
      follow = follow_fixture()
      assert {:ok, %Follow{}} = Task_track.delete_follow(follow)
      assert_raise Ecto.NoResultsError, fn -> Task_track.get_follow!(follow.id) end
    end

    test "change_follow/1 returns a follow changeset" do
      follow = follow_fixture()
      assert %Ecto.Changeset{} = Task_track.change_follow(follow)
    end
  end

  describe "timeblocks" do
    alias Tasktracker.TaskTrack.TimeBlock

    @valid_attrs %{end_time: "2010-04-17 14:00:00.000000Z", start_time: "2010-04-17 14:00:00.000000Z"}
    @update_attrs %{end_time: "2011-05-18 15:01:01.000000Z", start_time: "2011-05-18 15:01:01.000000Z"}
    @invalid_attrs %{end_time: nil, start_time: nil}

    def time_block_fixture(attrs \\ %{}) do
      {:ok, time_block} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TaskTrack.create_time_block()

      time_block
    end

    test "list_timeblocks/0 returns all timeblocks" do
      time_block = time_block_fixture()
      assert TaskTrack.list_timeblocks() == [time_block]
    end

    test "get_time_block!/1 returns the time_block with given id" do
      time_block = time_block_fixture()
      assert TaskTrack.get_time_block!(time_block.id) == time_block
    end

    test "create_time_block/1 with valid data creates a time_block" do
      assert {:ok, %TimeBlock{} = time_block} = TaskTrack.create_time_block(@valid_attrs)
      assert time_block.end_time == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert time_block.start_time == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
    end

    test "create_time_block/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TaskTrack.create_time_block(@invalid_attrs)
    end

    test "update_time_block/2 with valid data updates the time_block" do
      time_block = time_block_fixture()
      assert {:ok, time_block} = TaskTrack.update_time_block(time_block, @update_attrs)
      assert %TimeBlock{} = time_block
      assert time_block.end_time == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert time_block.start_time == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
    end

    test "update_time_block/2 with invalid data returns error changeset" do
      time_block = time_block_fixture()
      assert {:error, %Ecto.Changeset{}} = TaskTrack.update_time_block(time_block, @invalid_attrs)
      assert time_block == TaskTrack.get_time_block!(time_block.id)
    end

    test "delete_time_block/1 deletes the time_block" do
      time_block = time_block_fixture()
      assert {:ok, %TimeBlock{}} = TaskTrack.delete_time_block(time_block)
      assert_raise Ecto.NoResultsError, fn -> TaskTrack.get_time_block!(time_block.id) end
    end

    test "change_time_block/1 returns a time_block changeset" do
      time_block = time_block_fixture()
      assert %Ecto.Changeset{} = TaskTrack.change_time_block(time_block)
    end
  end
end
