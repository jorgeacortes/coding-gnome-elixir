defmodule Dictionary.Runtime.Application do

  def start(_type, _args) do
    Dictionary.Runtime.Server.start_link()
  end
end
