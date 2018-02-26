defmodule TasktrackerWeb.TaskidController do
  use TasktrackerWeb, :controller

  alias Tasktracker.Accounts
  alias Tasktracker.Accounts.User

  def create(conn, %{"task_id" => task_id}) do
    conn=  conn
      |> put_session(:task_id, task_id)
      |> redirect(to: "/timeblocks1/new")
      conn
  end


  def delete(conn, _params) do
    conn
    |> delete_session(:task_id)
    |> put_flash(:info, "Logged out")
    |> redirect(to: page_path(conn, :index))
  end
end
