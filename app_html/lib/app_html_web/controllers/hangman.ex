defmodule AppHtmlWeb.HangmanHTML do
  import Phoenix.HTML.Link
  use AppHtmlWeb, :html

  embed_templates "hangman/*"
end
