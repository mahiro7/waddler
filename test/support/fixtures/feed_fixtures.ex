defmodule Waddler.FeedFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Waddler.Feed` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        content: "some content",
        likes: 42,
        retweets: 42,
        user: "some user"
      })
      |> Waddler.Feed.create_post()

    post
  end
end
