defmodule Roman do
  def to_integer(str) do
    str
    |> String.split("")
    |> Enum.map(&weight/1)
    |> calculate
  end

  defp calculate(weights), do: calculate(weights, 0)
  defp calculate([weight], acc), do: weight + acc
  defp calculate([head | weights], acc) do
    {sames, others} = Enum.split_while(weights, & &1 == head)

    sum = Enum.sum([head|sames])
    next_weight = hd others

    gathering = if (head < next_weight), do: -sum, else: sum
    calculate(others, gathering + acc)
  end

  defp weight("I"), do: 1
  defp weight("V"), do: 5
  defp weight("X"), do: 10
  defp weight("L"), do: 50
  defp weight("C"), do: 100
  defp weight("D"), do: 500
  defp weight("M"), do: 1000
  defp weight(""),  do: 0
end
