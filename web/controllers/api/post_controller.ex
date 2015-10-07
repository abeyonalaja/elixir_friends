defmodule ElixirFriends.API.PostController do
  use ElixirFriends.Web, :controller
  import Ecto.Query

  alias ElixirFriends.Post
  plug :scrub_params, "post" when action in [:create, :update]

  def index(conn, params) do
    IO.puts "HEEEEEYYYYYY"
    post_page = Post
    |> order_by([p], desc: p.inserted_at)
    |> ElixirFriends.Repo.paginate(page: params["page"])

    render(conn, "index.json", posts_page: post_page)
  end


end
