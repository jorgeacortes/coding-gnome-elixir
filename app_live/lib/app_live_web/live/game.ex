defmodule AppLiveWeb.Live.Game do
  use AppLiveWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <p>Hello Hangman</p>
    """
  end
end
