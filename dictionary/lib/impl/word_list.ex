defmodule Dictionary.Impl.WordList do

  @type t :: list(String.t)

  @spec word_list :: t
  def word_list do
    "../dictionary/assets/words.txt"
    |> File.read!()
    |> String.split()
  end

  @spec random_word(t) :: String.t
  def random_word(word_list) do
    word_list
    |> Enum.random()
  end
end
