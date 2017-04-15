defmodule Discuss.DocController do
  use Discuss.Web, :controller

  def index(conn, _params) do
    render conn, "/doc/index.html"
  end
end
