defmodule TextClient.Runtime.RemoteHangman do

  @remote_server :hangman@cabesm3017121

  def connect() do
    :rpc.call(@remote_server, Hangman, :new_game, [])
  end

end
