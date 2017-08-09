defmodule Roman do
  def from_integer(n), do: from_integer(n, "")
  defp from_integer(0, acc), do: acc
  defp from_integer(n, acc) do
    case proximate_roman_and_value(n) do
      {roman, value} ->
        amount = div n, value
        rest   = rem n, value
        from_integer(rest, acc <> String.duplicate(roman, amount))
      roman ->
        acc <> roman
    end
  end
  
  defp proximate_roman_and_value(n) do
    cond do
      n >= 1000 -> {"M" ,1000}
      n >= 900  -> {"CM", 900}
      n >= 500  -> {"D" , 500}
      n >= 400  -> {"CD", 400}
      n >= 100  -> {"C" , 100}
      n >= 90   -> {"XC",  90}
      n >= 50   -> {"L" ,  50}
      n >= 40   -> {"XL",  40}
      n >= 10   -> {"X" ,  10}
      n == 9    -> {"IX",   9}
      n >= 5    -> {"V" ,   5}
      n == 4    -> {"IV",   4}
      true      -> String.duplicate("I", n)
    end
  end

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
