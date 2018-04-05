defmodule Tasks1Web.TaskController do
  use Tasks1Web, :controller

  alias Tasks1.Social
  alias Tasks1.Social.Task

  action_fallback Tasks1Web.FallbackController

  def index(conn, _params) do
    tasks = Social.list_tasks()
    render(conn, "index.json", tasks: tasks)
  end

  def create(conn, %{"task" => task_params, "token" => token}) do
    {:ok, user_id} = Phoenix.Token.verify(conn, "auth token", token, max_age: 86400)

    IO.inspect(task_params)

    new_task = %{
      completed: task_params["completed"],
      description: task_params["description"],
      time_spent: task_params["time_spent"],
      title: task_params["title"],
      user_id: task_params["user_id"]
    }

    with {:ok, %Task{} = task} <- Social.create_task(new_task) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", task_path(conn, :show, task))
      |> render("show.json", task: task)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Social.get_task!(id)
    render(conn, "show.json", task: task)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Social.get_task!(id)

    with {:ok, %Task{} = task} <- Social.update_task(task, task_params) do
      render(conn, "show.json", task: task)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Social.get_task!(id)
    with {:ok, %Task{}} <- Social.delete_task(task) do
      send_resp(conn, :no_content, "")
    end
  end
end
