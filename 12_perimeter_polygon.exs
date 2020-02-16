# echo -e "4\n0 0\n0 1\n2 3\n4 8" | elixir 12_perimeter_polygon.exs
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

  def distance({x1, y1}, {x2, y2}), do: :math.sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1))

  def distance([]), do: 0
  def distance([_]), do: 0
  def distance([p1, p2]), do: distance(p1, p2)
  def distance([p1, p2 | tail]) do
    distance(p1, p2) + distance([p2 | tail])
  end

  def loop_polygon([head | tail]), do: [head | tail] ++ [head]

  def main() do
    { _, n} = read_int()

    Enum.map(1..n, fn _ -> elem(read_int_list(), 1) end)
    |> loop_polygon
    |> Enum.map(&List.to_tuple/1)
    |> distance
    |> IO.inspect
  end

end

Solution.main
