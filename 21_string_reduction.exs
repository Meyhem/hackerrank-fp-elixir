  # echo -e "aabccdddddefaaaagggg" | elixir 21_string_reduction.exs
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
      { _, s } = read_binary_line()

      s
      |> String.graphemes
      |> Enum.uniq
      |> IO.puts

    end

  end

  Solution.main
