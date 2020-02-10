# echo -e "1\n2\n3\n4" | elixir 06_reverse_a_list.exs
defmodule Solution do
  def read_int() do
    case IO.gets "" do
      line when is_binary(line) -> { :ok, String.to_integer String.trim line }
      :eof -> { :error }
      { :error, _} -> { :error }
    end
  end

  def build_list(list) do
    case read_int() do
      {:ok, val} -> build_list [val | list]
      {:error} -> list
    end
  end

  def main() do
    list = build_list []
    Enum.map(list, fn n -> IO.puts n end)
  end

end

Solution.main
