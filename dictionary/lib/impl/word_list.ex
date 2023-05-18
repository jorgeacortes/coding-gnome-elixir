defmodule Dictionary.Impl.WordList do

  @word_list "assets/words.txt"
  |> File.read!()
  |> String.split()

  @spec start() :: list(String.t)
  def start() do
    @word_list
  end

  def random_word(word_list) do
    word_list |> Enum.random()
  end
end
