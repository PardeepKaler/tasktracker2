defmodule TasktrackerWeb.TimeBlockController do
  use TasktrackerWeb, :controller

  alias Tasktracker.TaskTrack
  alias Tasktracker.TaskTrack.TimeBlock

  action_fallback TasktrackerWeb.FallbackController

  def index(conn, _params) do
    timeblocks = TaskTrack.list_timeblocks()
    render(conn, "index.json", timeblocks: timeblocks)
  end

  def create(conn, %{"time_block" => time_block_params}) do
  IO.inspect("control")
    with {:ok, %TimeBlock{} = time_block} <- TaskTrack.create_time_block(time_block_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", time_block_path(conn, :show, time_block))
      |> render("show.json", time_block: time_block)
    end
  end

  def show(conn, %{"id" => id}) do
    time_block = TaskTrack.get_time_block!(id)

    render(conn, "show.json", time_block: time_block)
  end

  def update(conn, %{"id" => id, "time_block" => time_block_params}) do
    time_block = TaskTrack.get_time_block!(id)

    with {:ok, %TimeBlock{} = time_block} <- TaskTrack.update_time_block(time_block, time_block_params) do
      render(conn, "show.json", time_block: time_block)
    end
  end

  def delete(conn, %{"id" => id}) do
    time_block = TaskTrack.get_time_block!(id)
    with {:ok, %TimeBlock{}} <- TaskTrack.delete_time_block(time_block) do
      send_resp(conn, :no_content, "")
    end
  end

  def new(conn,  _params) do
    changeset = TaskTrack.change_time_block(%TimeBlock{})

    render(conn, "new.html", changeset: changeset)
  end

  def editblock(conn,  %{"task" => task}) do
    task
    |> IO.inspect
   render(conn, "index.html", task: task)
  end

  def create1(conn, %{"time_block" => time_block_params}) do
    case TaskTrack.create_time_block(time_block_params) do
      {:ok, timeblock} ->
        conn
        |> put_flash(:info, "Time Block created successfully.")
        |> redirect(to: task_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    time = TaskTrack.get_time_block!(id)
    changeset = TaskTrack.change_time_block(time)
    render(conn, "edit.html", time: time, changeset: changeset)
  end

  def update1(conn, %{"id" => id, "time_block" => time_params}) do
    time = TaskTrack.get_time_block!(id)

    case TaskTrack.update_time_block(time, time_params) do
      {:ok, time} ->
        conn
        |> put_flash(:info, "Time Block updated successfully.")
        |> redirect(to: time_block_path(conn, :editblock, time.task_id))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", time: time, changeset: changeset)
    end
  end

  def delete1(conn, %{"id" => id}) do
    time = TaskTrack.get_time_block!(id)
    task= time.task_id
    {:ok, _time} = TaskTrack.delete_time_block(time)

    conn
    |> put_flash(:info, "Time Block deleted successfully.")
    |> redirect(to: time_block_path(conn, :editblock, task))
  end


end
