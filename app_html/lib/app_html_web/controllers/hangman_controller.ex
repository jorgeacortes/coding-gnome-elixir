defmodule AppHtmlWeb.HangmanController do
  use AppHtmlWeb, :controller

  def index(conn, _params) do
    render(conn, :index, layout: false)
  end
end
