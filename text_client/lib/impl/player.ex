defmodule TextClient.Impl.Player do
  @typep game :: Hangman.game()
  @typep tally :: Hangman.Type.tally()
  @typep state :: {game, tally}

  @spec start(game) :: :ok
  def start(game) do
    # Debugging
    # IO.puts("The word is: #{game.letters}")
    tally = Hangman.tally(game)
    interact({game, tally})
  end

  @spec interact(state) :: :ok
  def interact({_game, _tally = %{game_state: :won}}) do
    IO.puts("Congratulations. You won!")
  end

  def interact({_game, tally = %{game_state: :lost}}) do
    IO.puts("Sorry, you lost... The word was #{tally.letters |> Enum.join()}")
  end

  def interact({game, tally}) do
    IO.puts(feedback_for(tally))
    IO.puts(current_word(tally))
    # Debug
    # IO.puts(inspect(game))
    # IO.puts(inspect(tally))
    tally = Hangman.make_move(game, get_guess())
    interact({game, tally})
  end

  defp feedback_for(tally = %{game_state: :initializing}) do
    "Welcome! I'm thining of a #{tally.letters |> length} letter word."
  end

  defp feedback_for(%{game_state: :good_guess}), do: "Good guess!"
  defp feedback_for(%{game_state: :bad_guess}), do: "Bad guess!"
  defp feedback_for(%{game_state: :already_used}), do: "Already used!"

  defp current_word(tally) do
    [
      "Word so far: ",
      tally.letters |> Enum.join(" "),
      "  turns left: ",
      tally.turns_left |> to_string,
      "  used so far: ",
      tally.used |> Enum.join(",")
    ]
  end

  defp get_guess() do
    IO.gets("Next letter: ")
    |> String.trim()
    |> String.downcase()
  end
end
