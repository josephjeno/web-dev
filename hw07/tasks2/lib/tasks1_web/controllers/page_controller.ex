defmodule Tasks1Web.PageController do
  use Tasks1Web, :controller

  alias Tasks1.Social

  def index(conn, _params) do
    render conn, "index.html"
  end

  def feed(conn, _params) do
    id = get_session(conn, :user_id)
    tasks = Social.list_tasks_current(id)
    undertasks = Social.list_tasks_old(id)
    changeset = Social.change_task(%Social.Task{})
    render conn, "feed.html", mytasks: tasks, undertasks: undertasks, changeset: changeset
  end

  def profile(conn, _params) do
    id = get_session(conn, :user_id)
    managers = Social.list_managers(id)
    underlings = Social.list_underlings(id)
    render conn, "profile.html", managers: managers, underlings: underlings
  end

end
