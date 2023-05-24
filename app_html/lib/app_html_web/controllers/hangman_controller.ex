defmodule AppHtmlWeb.HangmanController do
  use AppHtmlWeb, :controller

  def index(conn, _params) do
    render(conn, :index, layout: false)
  end

  def new(conn, _params) do
    game = Hangman.new_game()
    tally = Hangman.tally(game)

    conn
    |> put_session(:game, game)
    |> render("game.html", tally: tally)
  end

  def update(conn, params) do
    guess = params["make_move"]["guess"]

    tally =
      conn
      |> get_session(:game)
      |> Hangman.make_move(guess)

    put_in(conn.params["make_move"]["guess"], "")
    |> render("game.html", tally: tally)
  end
end
