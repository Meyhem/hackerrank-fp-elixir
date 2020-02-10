# echo -e "10\n" | elixir 05_array_of_n_elements.exs
defmodule Solution do
  def read_int() do
    case IO.gets "" do
      line when is_binary(line) -> { :ok, String.to_integer String.trim line }
      :eof -> { :error }
      { :error, _} -> { :error }
    end
  end

  def main() do
    { _, n} = read_int()

    IO.puts "[" <> Enum.reduce(1..n, fn n, acc -> "#{acc}, #{n}" end) <> "]"
  end

end

Solution.main
