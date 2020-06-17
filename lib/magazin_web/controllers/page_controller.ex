defmodule MagazinWeb.PageController do
  use MagazinWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
