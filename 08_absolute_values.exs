# echo -e "-1\n2\n-3\n4" | elixir 08_absolute_values.exs
defmodule Solution do
  def read_int() do
    case IO.gets "" do
      line when is_binary(line) -> { :ok, String.to_integer String.trim line }
      :eof -> { :error }
      { :error, _} -> { :error }
    end
  end

  def absolute_list() do
    case read_int() do
      {:ok, val} ->
        IO.puts abs(val)
        absolute_list()
      _ -> false
    end
  end

  def main() do
    absolute_list()
  end

end

Solution.main
