# echo -e "10 20" | elixir 14_gcd.exs
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

  def gcd(x, y) when y == 0, do: x
  def gcd(x, y), do: gcd(y, rem(x, y))

  def main() do
    {_, [x, y]} = read_int_list()
    IO.inspect gcd(x, y)
  end

end

Solution.main
