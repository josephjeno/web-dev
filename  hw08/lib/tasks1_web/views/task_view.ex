defmodule Tasks1Web.TaskView do
  use Tasks1Web, :view
  alias Tasks1Web.TaskView
  alias Tasks1Web.UserView

  def render("index.json", %{tasks: tasks}) do
    %{data: render_many(tasks, TaskView, "task.json")}
  end

  def render("show.json", %{task: task}) do
    %{data: render_one(task, TaskView, "task.json")}
  end

  def render("task.json", %{task: task}) do
    %{id: task.id,
      title: task.title,
      description: task.description,
      time_spent: task.time_spent,
      completed: task.completed,
      user: render_one(task.user, UserView, "user.json")}
  end
end
