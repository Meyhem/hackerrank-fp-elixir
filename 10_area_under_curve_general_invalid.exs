# echo -e "1 2 3 4 5\n6 7 8 9 10\n1 4" | elixir 10_area_under_curve_general_invalid.exs
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

  def integrate(algebraic_expression) do
    algebraic_expression |> Enum.map(fn {c, p} -> { c / (p + 1), p + 1} end)
  end

  def eval_algebraic(expr, x) do
    Enum.reduce(expr, 0, fn {c, p}, acc -> acc + (c * :math.pow(x, p)) end)
  end

  def eval_definite_integral(expr, l, r) do
    eval_algebraic(expr, r) - eval_algebraic(expr, l)
  end

  def main() do
    { _, coeffs } = read_int_list()
    { _, powers } = read_int_list()
    { _, [l, r] } = read_int_list()

    result = Enum.zip(coeffs, powers) |>
      integrate |>
      eval_definite_integral(l, r)

    IO.puts :erlang.float_to_binary(result, [decimals: 1])
  end

end

Solution.main
