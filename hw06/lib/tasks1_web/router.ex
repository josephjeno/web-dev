defmodule Tasks1Web.Router do
  use Tasks1Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :get_current_user
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Tasks1Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/feed", PageController, :feed

    post "/session", SessionController, :create
    delete "/session", SessionController, :delete

    resources "/users", UserController
    resources "/tasks", TaskController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Tasks1Web do
  #   pipe_through :api
  # end

  def get_current_user(conn, _params) do
    # TODO: Move this function out of the router module.
    user_id = get_session(conn, :user_id)
    user = Tasks1.Accounts.get_user(user_id || -1)
    assign(conn, :current_user, user)
  end
end
