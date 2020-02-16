# echo -e "qwerty\nasdfgh" | elixir 17_string_mingling.exs
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

  def read_binary_line() do
    case IO.gets "" do
      line when is_binary(line) -> {
        :ok,
        String.trim(line, "\n")
      }
      :eof -> { :error }
      { :error, _} -> { :error }
    end
  end

  def main() do
    { _, a} = read_binary_line()
    { _, b} = read_binary_line()

    Enum.zip(String.graphemes(a), String.graphemes(b))
    |> Enum.map(fn {c1, c2} -> c1 <> c2 end)
    |> Enum.join
    |> IO.puts

  end

end

Solution.main
