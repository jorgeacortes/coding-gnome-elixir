defmodule AppHtmlWeb.PageHTML do
  use AppHtmlWeb, :html

  embed_templates "page_html/*"

  def plural_phrase(n = 1, noun), do: "#{n}, #{noun}"
  def plural_phrase(n, noun), do: "#{n}, #{noun}s"
end
