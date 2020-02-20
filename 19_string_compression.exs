  # echo -e "abccccddeeeeeefffghijjjkll" | elixir 19_string_compression.exs
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


    def compress(l) when length(l) == 1, do: List.first(l)
    def compress(l) do
      List.first(l) <> "#{length(l)}"
    end

    def main() do
      read_binary_line()
      |> elem(1)
      |> String.graphemes
      |> Stream.chunk_by(&(&1))
      |> Stream.map(&compress/1)
      |> Enum.to_list
      |> Enum.join
      |> IO.puts
    end

  end

  Solution.main
