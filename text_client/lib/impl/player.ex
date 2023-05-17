defmodule TextClient.Impl.Player do

  @typep game :: Hangman.game()
  @typep tally :: Hangman.Type.tally()
  @typep state :: { game, tally }

  @spec start() :: :ok
  def start() do
    game = Hangman.new_game()
    tally = Hangman.tally(game)
    interact({game, tally})
  end

  @spec interact(state) :: :ok
  def interact({_game, _tally = %{game_state: :won}}) do
    IO.puts ("Congratulations. You won!")
  end

  def interact({_game, tally = %{game_state: :lost}}) do
    IO.puts ("Sorry, you lost... The word was #{tally.letters |> Enum.join}")
  end

  def interact({game, tally}) do
    IO.puts feedback_for(tally)
    # display current word
    # get next guess
    # make move
    # interact({game, tally})
  end


  # @type state :: :initializing | :good_guess | :bad_guess | :already_used


  defp feedback_for(tally = %{ game_state: :initializing}) do
    IO.puts("Welcome! I'm thining of a #{tally.letters |> length} letter word.")
  end

  defp feedback_for(%{ game_state: :good_guess}), do: "Good guess!"
  defp feedback_for(%{ game_state: :bad_guess}), do: "Bad guess!"
  defp feedback_for(%{ game_state: :already_used}), do: "Already used!"

end
