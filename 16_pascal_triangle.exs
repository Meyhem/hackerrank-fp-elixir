# echo -e "5" | elixir 16_pascal_triangle.exs
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

  def read_int_list() do
    case IO.gets "" do
      line when is_binary(line) -> {
        :ok,
        String.trim(line, "\n") |> String.split |> Enum.map(&String.to_integer/1)
      }
      :eof -> { :error }
      { :error, _} -> { :error }
    end
  end

  def fac(0), do: 1
  def fac(n) when n > 0, do: n * fac(n - 1)

  def pascal(row, col) do
    fac(row) / (fac(col) * fac(row - col))
  end

  def main() do
    { _, n} = read_int()

    0..n-1
    |> Enum.map(fn r -> Enum.map(0..r, fn c -> pascal(r, c) end) end)
    |> Enum.map(fn e -> Enum.join(Enum.map(e, &trunc/1), " ") end)
    |> Enum.map(&IO.puts/1)

  end

end

Solution.main
