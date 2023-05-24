defmodule AppHtmlWeb.HangmanHTML do
  use AppHtmlWeb, :html

  import Phoenix.HTML.Link
  import Phoenix.HTML.Form

  embed_templates "hangman/*"
end
