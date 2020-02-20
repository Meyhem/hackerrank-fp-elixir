  # echo -e "333 3" | elixir 22_super_digit.exs
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

    def super_digit(p) do
      result = p
      |> String.graphemes
      |> Stream.map(&String.to_integer/1)
      |> Enum.to_list
      |> Enum.reduce(0, &(&1 + &2))
      |> Integer.to_string

      case String.length(result) do
        1 -> result
        _ -> super_digit(result)
      end

    end

    def main() do
      { _, [n, k]} = read_int_list()

      # String.duplicate(Integer.to_string(n), k)
      n
      |> Integer.to_string
      |> super_digit()
      |> String.to_integer
      |> (&(&1 * k)).()
      |> Integer.to_string
      |> super_digit()
      |> IO.puts

    end

  end

  Solution.main
