# echo -e "4\n0 0\n0 1\n2 3\n4 8" | elixir 13_surface_polygon.exs
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

  def loop_polygon([head | tail]), do: [head | tail] ++ [head]

  def main() do
    { _, n} = read_int()

    poly = Enum.map(1..n, fn _ -> elem(read_int_list(), 1) end)
    |> loop_polygon
    |> Enum.chunk_every(2, 1, :discard)

    part1 = poly
    |> Enum.map(fn [[x1, _], [_, y2]] -> x1 * y2 end)
    |> Enum.sum

    part2 = poly
    |> Enum.map(fn [[_, y1], [x2, _]] -> y1 * x2 end)
    |> Enum.sum

    IO.inspect( ( part1 - part2 ) / 2 )

  end

end

Solution.main
