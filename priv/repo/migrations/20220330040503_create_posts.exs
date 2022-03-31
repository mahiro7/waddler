defmodule Waddler.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :user, :string
      add :content, :string
      add :likes, :integer
      add :retweets, :integer

      timestamps()
    end
  end
end
