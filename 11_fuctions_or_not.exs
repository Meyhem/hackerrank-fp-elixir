# echo -e "2\n3\n1 2\n2 3\n3 4\n2\n1 2\n1 3\n" | elixir 11_fuctions_or_not.exs
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

  def relation_list_reducer(e, acc) do
    [k, v] = e
    if Map.has_key?(acc, k) and acc[k] != v do
      Map.put(acc, :hasCollision, true)
    else
      Map.put(acc, k, v)
    end
  end

  def map_bool(true), do: "YES"
  def map_bool(false), do: "NO"

  def process_test_case(n) do
    IO.puts Enum.map(1..n, fn _ -> elem(read_int_list(), 1) end)
    |> Enum.reduce(%{:hasCollision => false}, &relation_list_reducer/2)
    |> Map.fetch!(:hasCollision)
    |> Kernel.not
    |> map_bool

  end

  def main() do
    { _, cases } = read_int()

    for _ <- 1..cases do
      { _,  n } = read_int()
      process_test_case n
    end

  end

end

Solution.main
