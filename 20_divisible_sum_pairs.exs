  # echo -e "4 2\n2 3 4 6" | elixir 20_divisible_sum_pairs.exs
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
      { _, [_, _k] } = read_int_list()

      { _, list } = read_int_list()

      Stream.iterate(0, &(&1 + 1))
      |> Stream.take(length(list))
      |> Stream.map(&(Enum.to_list(0..&1) |> Enum.chunk_every(2, 1, :discard)))
      |> Enum.to_list
      |> IO.inspect

    end

  end

  Solution.main
