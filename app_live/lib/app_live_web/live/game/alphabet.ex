defmodule AppLiveWeb.Live.Game.Alphabet do
  use AppLiveWeb, :live_component

  def mount(socket) do
    letters = ?a..?z |> Enum.map(fn ch -> <<ch::utf8>> end)
    {:ok, assign(socket, :letters, letters)}
  end

  defp letter_state(letter, tally) do
    cond do
      Enum.member?(tally.letters, letter) -> "text-green-400"
      Enum.member?(tally.used, letter) -> "text-red-400"
      true -> "text-black"
    end
  end

  def render(assigns) do
    ~H"""
    <div>
      <div class="mx-auto text-2xl py-4">
        <%= for letter <- assigns.letters do %>
          <div
            phx-click="make_move"
            phx-value-key={letter}
            class={"px-1 text-xl font-medium inline-block #{letter_state(letter, @tally)}"}
          >
            <%= letter %>
          </div>
        <% end %>
      </div>
    </div>
    """
  end
end
