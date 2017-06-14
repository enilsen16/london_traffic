defmodule LondonTraffic.Web.PageController do
  use LondonTraffic.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
