defmodule ElixirFriends.API.PostView do
  use ElixirFriends.Web, :view

  def render("index.json", %{posts_page: post_page}) do
    Poison.encode!(post_page)
  end
end
