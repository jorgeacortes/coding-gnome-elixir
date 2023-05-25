defmodule AppLiveWeb.Live.Game.WordSoFar do
  use AppLiveWeb, :live_component

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <p>WordSoFar</p>
    """
  end
end
