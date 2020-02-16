
# echo -e "1\n2\n3\n4" | elixir 02_sum_odds.exs
require Integer
defmodule Solution do
  def read_int() do
    case IO.gets "" do
      line when is_binary(line) -> { :ok, String.to_integer String.trim line }
      :eof -> { :error }
      { :error, _} -> { :error }
    end
  end

  def sum_odds(sum) do
    case read_int() do
      {:ok, val} ->
        case Integer.is_odd(val) do
          true -> sum_odds(sum + val)
          false -> sum_odds(sum)
        end
      {:error} -> sum
    end
  end

  def main do
    IO.inspect sum_odds 0
  end

end
Solution.main

