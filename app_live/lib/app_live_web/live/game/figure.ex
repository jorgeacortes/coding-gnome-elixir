defmodule AppLiveWeb.Live.Game.Figure do
  use AppLiveWeb, :live_component

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <p>Figure</p>
    """
  end
end
