defmodule AppLiveWeb.Live.Game.WordSoFar do
  use AppLiveWeb, :live_component

  @states %{
    initializing: {"text-black", "Guess the word, a letter a a time"},
    good_guess: {"text-green-400", "Good guess!"},
    bad_guess: {"text-red-400", "Sorry, that's a bad guess"},
    won: {"text-brand", "You won!"},
    lost: {"text-purple-400", "Sorry, you lost"},
    already_used: {"text-gray-800", "You already used that letter"}
  }

  def mount(socket) do
    {:ok, socket}
  end

  defp state_name(state) do
    {_, text} = @states[state] || "Unknown state"
    text
  end

  defp state_class(state) do
    {class, _} = @states[state] || "Unknown state"
    class
  end

  def render(assigns) do
    ~H"""
    <div>
      <% state_class = state_class(@tally.game_state) %>
      <p class={state_class}>
        <%= state_name(@tally.game_state) %>
      </p>
      <div>
        <%= for ch <- @tally.letters do %>
          <% correct = if ch != "_", do: "text-green-400", else: "" %>
          <% cls = "px-2 text-2xl font-extrabold inline-block " <> correct %>
          <div class={cls}>
            <%= ch %>
          </div>
        <% end %>
      </div>
    </div>
    """
  end
end
