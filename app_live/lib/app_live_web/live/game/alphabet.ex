defmodule AppLiveWeb.Live.Game.Alphabet do
  use AppLiveWeb, :live_component

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <p>Alphabet</p>
    """
  end
end
