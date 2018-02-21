defmodule Tasks1Web.PageController do
  use Tasks1Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def feed(conn, _params) do
    tasks = Tasks1.Social.list_tasks()
    changeset = Tasks1.Social.change_task(%Tasks1.Social.Task{})
    render conn, "feed.html", tasks: tasks, changeset: changeset
  end

end
