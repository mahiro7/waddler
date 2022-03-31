defmodule Waddler.FeedTest do
  use Waddler.DataCase

  alias Waddler.Feed

  describe "posts" do
    alias Waddler.Feed.Post

    import Waddler.FeedFixtures

    @invalid_attrs %{content: nil, likes: nil, retweets: nil, user: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Feed.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Feed.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{content: "some content", likes: 42, retweets: 42, user: "some user"}

      assert {:ok, %Post{} = post} = Feed.create_post(valid_attrs)
      assert post.content == "some content"
      assert post.likes == 42
      assert post.retweets == 42
      assert post.user == "some user"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Feed.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{content: "some updated content", likes: 43, retweets: 43, user: "some updated user"}

      assert {:ok, %Post{} = post} = Feed.update_post(post, update_attrs)
      assert post.content == "some updated content"
      assert post.likes == 43
      assert post.retweets == 43
      assert post.user == "some updated user"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Feed.update_post(post, @invalid_attrs)
      assert post == Feed.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Feed.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Feed.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Feed.change_post(post)
    end
  end
end
