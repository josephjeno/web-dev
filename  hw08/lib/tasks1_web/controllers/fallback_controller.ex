defmodule Tasks1Web.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use Tasks1Web, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(Tasks1Web.ChangesetView, "error.json", changeset: changeset)
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> render(Tasks1Web.ErrorView, :"404")
  end

  def call(conn, {:error, "invalid password"}) do
    conn
    |> put_status("invalid password")
    |>render(Tasks1Web.ErrorView, :"invalid password")
  end
end
