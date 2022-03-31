defmodule WaddlerWeb.PageController do
  use WaddlerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
