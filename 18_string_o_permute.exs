  # echo -e "2\nabcdef\ghijkl" | elixir 18_string_o_permute.exs
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
      { _, n} = read_int()
      for _ <- 1..n do
        { _, str } = read_binary_line()

        str
        |> String.graphemes
        |> Enum.chunk_every(2)
        |> Enum.map(&Enum.reverse/1)
        |> Enum.join
        |> IO.puts
      end
    end

  end

  Solution.main
