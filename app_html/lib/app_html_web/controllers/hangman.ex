defmodule AppHtmlWeb.HangmanHTML do
  use AppHtmlWeb, :html

  import Phoenix.HTML.Link
  import Phoenix.HTML.Form

  alias AppHtmlWeb.Router.Helpers, as: Routes

  embed_templates "hangman/*"

  def continue_or_try_again(conn, status) when status in [:won, :lost] do
    button("Try again",
      to: Routes.hangman_path(conn, :new),
      class: "flex mt-2 mx-auto bg-brand text-white font-semibold p-2"
    )
  end

  def continue_or_try_again(conn, _) do
    form_for(
      conn,
      Routes.hangman_path(conn, :update),
      [as: "make_move", method: :put],
      fn f ->
        [
          text_input(f, :guess),
          submit("Make the next guess",
            class: "flex mt-2 mx-auto bg-brand text-white font-semibold p-2"
          )
        ]
      end
    )
  end

  @status_fields %{
    initializing: {"text-black", "Guess the word, a letter a a time"},
    good_guess: {"text-green-400", "Good guess!"},
    bad_guess: {"text-red-400", "Sorry, that's a bad guess"},
    won: {"text-brand", "You won!"},
    lost: {"text-purple-400", "Sorry, you lost"},
    already_used: {"text-gray-800", "You already used that letter"}
  }

  def move_status(status) do
    {class, msg} = @status_fields[status]
    "<div class='font-semibold #{class}'>#{msg}</div>"
  end

  defdelegate figure_for(turns_left), to: AppHtmlWeb.Helpers.FigureFor
end
