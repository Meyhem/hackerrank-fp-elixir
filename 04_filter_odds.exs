# echo -e "1\n2\n3\n4" | elixir 04_filter_odds.exs
require Integer
defmodule Solution do
  def read_int() do
    case IO.gets "" do
      line when is_binary(line) -> { :ok, String.to_integer String.trim line }
      :eof -> { :error }
      { :error, _} -> { :error }
    end
  end


  def filter_stdin(n) do

    case read_int() do
      {:ok, val} ->
        if Integer.is_odd(n), do: IO.puts val
        filter_stdin(n + 1)
        false

      {:error} -> false
    end

  end

  def main do
    filter_stdin 0
  end

end
Solution.main

