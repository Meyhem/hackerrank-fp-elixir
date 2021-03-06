# echo -e "3" | elixir 15_fibonacci.exs
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

  def fib(n) when n > 2, do: fib(n - 1) + fib(n - 2)
  def fib(2), do: 1
  def fib(1), do: 0

  def main() do
    { _, n} = read_int()

    fib(n)
    |> IO.inspect
  end

end

Solution.main
