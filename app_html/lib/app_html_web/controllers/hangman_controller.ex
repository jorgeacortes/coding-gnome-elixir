defmodule AppHtmlWeb.HangmanController do
  use AppHtmlWeb, :controller
  alias AppHtmlWeb.Router.Helpers, as: Routes

  def index(conn, _params) do
    render(conn, :index)
  end

  def new(conn, _params) do
    game = Hangman.new_game()

    conn
    |> put_session(:game, game)
    |> redirect(to: Routes.hangman_path(conn, :show))
  end

  def update(conn, params) do
    guess = params["make_move"]["guess"]

    put_in(conn.params["make_move"]["guess"], "")
    |> get_session(:game)
    |> Hangman.make_move(guess)

    redirect(conn, to: Routes.hangman_path(conn, :show))
  end

  def show(conn, _param) do
    tally =
      conn
      |> get_session(:game)
      |> Hangman.tally()

    render(conn, "game.html", tally: tally)
  end
end
