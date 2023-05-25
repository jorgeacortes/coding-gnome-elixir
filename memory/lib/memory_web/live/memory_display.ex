defmodule MemoryWeb.Live.MemoryDisplay do
  use MemoryWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, schedule_tick_and_update_assign(socket)}
  end

  def handle_info(:tick, socket) do
    {:noreply, schedule_tick_and_update_assign(socket)}
  end

  defp schedule_tick_and_update_assign(socket) do
    Process.send_after(self(), :tick, 1000)
    assign(socket, memory: :erlang.memory(), time: Time.utc_now())
  end

  def render(assigns) do
    ~L"""
    <h1 class="font-bold text-2xl pb-4">Hello world from LiveView!<h1>
    <p class="py-4">The time <%= assigns.time %></p>
    <table>
      <%= for { name, value } <- assigns.memory do %>
        <tr>
          <th class="text-left border-b pr-2"><%= name %></th>
          <td class="text-right px-4 py-1 border-b"><%= value %></td>
        </tr>
        <%end%>
    </table>
    """
  end
end
