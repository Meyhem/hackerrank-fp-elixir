# echo -e "4\n20.0000\n5.0000\n0.5000\n-0.5000" | elixir 09_euler_expansion.exs
defmodule Solution do
  def read_float() do
    case IO.gets "" do
      line when is_binary(line) -> { :ok, String.to_float String.trim line }
      :eof -> { :error }
      { :error, _} -> { :error }
    end
  end

  def read_int() do
    case IO.gets "" do
      line when is_binary(line) -> { :ok, String.to_integer String.trim line }
      :eof -> { :error }
      { :error, _} -> { :error }
    end
  end

  def factorial(n) when n <= 1 do
    1
  end

  def factorial(n) when n > 1 do
    n * factorial(n - 1)
  end


  def eulerstep(x, order) do
    :math.pow(x, order) / factorial(order)
  end

  def euler(x) do
    Enum.map(0..9, fn n -> eulerstep(x, n) end) |> Enum.sum
  end


  def unwrap({:ok, val}), do: val

  def main() do
    { _, n} = read_int()

    Enum.map(0..n-1, fn _ -> read_float() end) |>
    Enum.map(&unwrap/1) |>
    Enum.map(&euler/1) |>
    Enum.map(fn n -> IO.puts :erlang.float_to_binary(n, [decimals: 4]) end)
  end

end

Solution.main

