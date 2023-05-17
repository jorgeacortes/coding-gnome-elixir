defmodule Sandbox do
  def ex1({a,b}) do
    {b, a}
  end

  def equal(a,a), do: true
  def equal(_,_), do: false
end

defmodule PatternMatch2 do

  @doc """
  a function that takes two parameters. It should return `true`
  if the parameters are the same, `false` others. You aren't allowed
  to use any conditional logic, so you'll have to rely on pattern
  matching.
  """

  def equal(a, a), do: true
  def equal(_, _), do: false
end

defmodule Lists do
  def sum_pairs([]),              do: []
  def sum_pairs([h1, h2 | t]),    do: [ h1+h2 | sum_pairs(t)]
  def even_length?(list),         do: length(list) |> rem(2) == 0
  def odd_length?(list),          do: length(list) |> rem(2) == 1
  # def sum_pairs(list) do
  #   if (odd_length?(list))
  #     :false
  # end
end
