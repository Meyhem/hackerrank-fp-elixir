# echo -e "2\n1\n2\n3" | elixir 03_filter_array.exs

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
        if val < n, do: IO.puts val
        filter_stdin(n)
        false

      {:error} -> false
    end

  end

  def main do
    { _, n} = read_int()

    filter_stdin n
  end

end
Solution.main

