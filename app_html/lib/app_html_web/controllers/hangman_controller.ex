defmodule AppHtmlWeb.HangmanController do
  use AppHtmlWeb, :controller

  def index(conn, _params) do
    render(conn, :index, layout: false)
  end

  def new(conn, _params) do
    game = Hangman.new_game()
    tally = Hangman.tally(game)
    put_session(conn, :game, game)
    render(conn, "game.html", tally: tally)
  end
end
