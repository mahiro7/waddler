defmodule Waddler.Feed.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :content, :string
    field :likes, :integer, default: 0
    field :retweets, :integer, default: 0
    field :user, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:user, :content, :likes, :retweets])
    |> validate_required([:content, :likes, :retweets])
    |> validate_length(:content, [min: 2, max: 280]) 
  end
end
