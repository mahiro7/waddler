defmodule Waddler.Repo do
  use Ecto.Repo,
    otp_app: :waddler,
    adapter: Ecto.Adapters.Postgres
end
