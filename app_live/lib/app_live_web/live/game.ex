defmodule AppLiveWeb.Live.Game do
  use AppLiveWeb, :live_view

  def mount(_params, _session, socket) do
    game = Hangman.new_game()
    tally = Hangman.tally(game)

    socket =
      socket
      |> assign(%{game: game, tally: tally})

    {:ok, socket}
  end

  def handle_event("make_move", %{"key" => key}, socket) do
    tally = Hangman.make_move(socket.assigns.game, key)
    {:noreply, assign(socket, %{tally: tally})}
  end

  def render(assigns) do
    ~H"""
    <h1 class="text-4xl text-brand font-bold  mb-8">LiveView Hangman</h1>
    <div class="grid grid-row-2 w-full mx-4 items-center" phx-window-keyup="make_move">
      <div>
        <%= live_component(__MODULE__.Figure, tally: assigns.tally, id: 1) %>
      </div>
      <div class="ml-8 w-full items-center text-center">
        <%= live_component(__MODULE__.Alphabet, tally: assigns.tally, id: 2) %>
        <%= live_component(__MODULE__.WordSoFar, tally: assigns.tally, id: 3) %>
      </div>
    </div>
    """
  end
end
