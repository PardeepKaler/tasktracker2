defmodule TasktrackerWeb.Router do
  use TasktrackerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :get_current_user
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :get_current_task
  end

  def get_current_user(conn, _params) do
    # TODO: Move this function out of the router module.
    user_id = get_session(conn, :user_id)
    user = Tasktracker.Accounts.get_user(user_id || -1)
    assign(conn, :current_user, user)
  end

  def get_current_task(conn, _params) do
    # TODO: Move this function out of the router module.
    task_id = get_session(conn, :task_id)
    IO.inspect("#{task_id}")
    task = Tasktracker.TaskTrack.get_task(task_id || -1)
    assign(conn, :current_task, task)
  end


  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TasktrackerWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/feed", PageController, :feed
    resources "/users", UserController
    resources "/posts", PostController
    resources "/tasks", TaskController
    get "tasks/report/new", TaskController, :report
    post "/session", SessionController, :create
    post "/taskid", TaskidController, :create
    delete "/session", SessionController, :delete
#    get "/timeblocks1/new/:task", TimeBlockController, :new
    get "/timeblocks1/new", TimeBlockController, :new
   get "/timeblocks/:task", TimeBlockController, :editblock
  # get "/timeblocks/new/:task", TimeBlockController, :new
    post "/timeblocks/create1", TimeBlockController, :create1
    get "/timeblocks/:id/edit", TimeBlockController, :edit
    put "/timeblocks/:id", TimeBlockController, :update1
    delete "/timeblocks/:id", TimeBlockController, :delete1
  end

  scope "/api/v1", TasktrackerWeb do
    pipe_through :api
    resources "/timeblocks", TimeBlockController
  end

  # Other scopes may use custom stacks.
  # scope "/api", TasktrackerWeb do
  #   pipe_through :api
  # end
end
