defmodule BareExample.QuestionStorage do
  @moduledoc false

  @questions [
    {"Wann entdeckte Kolumbus Amerika?", "1492", ["1589", "1792", "1289"]},
    {"Wo wurde Napoléon geboren?", "Korsika", ["Elba", "Waterloo", "Sankt Petersburg"]},
    {"Wann war die Kubakrise?", "1962", ["1959", "1974", "1934"]},
  ]

  def get_question do
    {{question, correct, incorrect}, index} = @questions
    |> Enum.with_index
    |> Enum.shuffle
    |> Enum.at(0)

    {index, question, shuffle_answers(correct, incorrect)}
  end

  def correct?({index, _, _}, answer) do
    {_, correct, _} = @questions
    |> Enum.at(index)

    correct == answer
  end

  defp shuffle_answers(correct, incorrect) do
    incorrect
    |> Enum.concat([correct])
    |> Enum.shuffle
  end
end
