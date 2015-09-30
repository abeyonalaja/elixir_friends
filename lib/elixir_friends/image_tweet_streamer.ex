defmodule ElixirFriends.ImageTweetStreamer do
  def stream(search_term) do
    IO.puts("Streamig ")
    IO.puts(search_term)
    ExTwitter.stream_filter(track: search_term)
    |> Stream.filter(&has_images?/1)
    |> Stream.map(&store_tweet/1)
  end

  defp has_images?(tweet) do
    Map.has_key?(tweet.entities, :media) &&
    Enum.any?(photos(tweet))
  end


  def store_tweet(tweet) do
    IO.puts("Streamig #{tweet.user.screen_name}")
    %ElixirFriends.Post{
      image_url: first_photo(tweet).media_url,
      content: tweet.text,
      source_url: first_photo(tweet).expanded_url,
      username: tweet.user.screen_name
    }
    |> ElixirFriends.Repo.insert
  end

  defp photos(tweet) do
    tweet.entities.media
    |> Enum.filter(fn(medium) ->
      medium.type == "photo"
    end)
  end

  defp first_photo(tweet) do
    photos(tweet)
    |> hd
  end
end
