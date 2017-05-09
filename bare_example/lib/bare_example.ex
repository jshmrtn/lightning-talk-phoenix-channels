defmodule BareExample do
  @moduledoc false

  alias BareExample.QuestionStorage
  require Logger

  @num_questions 3

  @doc """
  Start a game
  """
  def start do
    spawn fn ->
      game(:idle, @num_questions)
    end
  end

  # All Questions Answered
  defp game(:idle, 0) do
    Logger.info "All questions answered"
  end

  # Idle State, waiting for questions
  defp game(:idle, remaining_questions) do
    Logger.info "#{remaining_questions} remaining questions, waiting for ask command"

    receive do
      :ask ->
        question_set = QuestionStorage.get_question()
        Logger.info "Question Asked: #{inspect question_set}"

        Process.send_after(self(), :timeout, 10_000)

        game({:question, question_set}, remaining_questions)
    end
  end

  # Question State, waiting for answer
  defp game({:question, question}, remaining_questions) do
    receive do
      {:answer, answer} ->
        if QuestionStorage.correct?(question, answer) do
          Logger.info "Yay, Correct"

          game(:idle, remaining_questions - 1)
        else
          Logger.info "¯\_(ツ)_/¯"

          game(:idle, remaining_questions - 1)
        end
      :timeout ->
        Logger.info "Time is up"

        game(:idle, remaining_questions - 1)
    end
  end
end
