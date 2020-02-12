# echo -e "1 2 3 4 5\n6 7 8 9 10\n1 4" | elixir 10_area_under_curve.exs
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

  def f(expr, x) do
    Enum.reduce(expr, 0, fn {c, p}, acc -> acc + (c * :math.pow(x, p)) end)
  end

  def dx_square(expr, x, dx) do
    f(expr, x) * dx
  end

  def main() do
    { _, coeffs } = read_int_list()
    { _, powers } = read_int_list()
    { _, [l, r] } = read_int_list()

    expr = Enum.zip(coeffs, powers)

    surface = Stream.iterate(l, fn i -> i + 0.001 end) |>
      Stream.take_while(fn i -> i < r end) |>
      Stream.map(fn i -> dx_square(expr, i, 0.001) end) |>
      Enum.sum

    IO.puts :erlang.float_to_binary(surface, [decimals: 1])
  end

end

Solution.main
