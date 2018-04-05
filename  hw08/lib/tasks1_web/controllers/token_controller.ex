defmodule Tasks1Web.TokenController do
  use Tasks1Web, :controller
  alias Tasks1.Accounts.User

  action_fallback Tasks1Web.FallbackController

  def create(conn, %{"name" => name, "pass" => pass}) do
    with {:ok, %User{} = user} <- Tasks1.Accounts.get_and_auth_user(name, pass) do
      token = Phoenix.Token.sign(conn, "auth token", user.id)
      conn
      |> put_status(:created)
      |> render("token.json", user: user, token: token)
    end
  end
end