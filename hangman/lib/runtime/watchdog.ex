defmodule Hangman.Runtime.Watchdog do
  def start(expiry_time) do
    spawn_link(fn -> watcher(expiry_time) end)
  end

  def im_alive(watcher) do
    send(watcher, :im_alive)
  end

  defp watcher(expiry_time) do
    receive do
      :im_alive ->
        watcher(expiry_time)
    after
      expiry_time ->
        # This is the way in the course is described to shutdown the process
        # Observed behavior:
        # If any of the child process is alive, it won't let the supervisor to shutdown
        # and it will restart the other childs that are exiting
        Process.exit(self(), {:shutdown, :watchdog_triggered})
    end
  end
end
