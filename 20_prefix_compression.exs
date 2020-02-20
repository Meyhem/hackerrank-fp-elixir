  # echo -e "pizseagtsgevlvwpbshxfwbjijtmslkufgofretehjgpcdedstydokejsnrccnkbruawgjmemfqhwmhjsykrejmmexgrsdlwtaybtnhfcapsylopkthboqkvicgwrvycphqnulnjgfgjlqnhdyfwweyifpxyxrvpnshjrrkmkwrvjjssublanosljhqhppmewuidyqblfcjzkwbhqlljvvcjqthbkpcoquepqzcvbkdlhufbkpiyaqbfblexry\npizseagtsgevlvwpbshxfwbjijtmslkufgofretehjgpcdedstydokejsnrccnkbruawgjmemfqhwmhjsykrejmmexgrsdlwtaybtnhfcapsylopkthboqkvicgcjkyxxubpbqcycioryppydvmwubupxrjlwrwujsiimvpbgkdugjbpqtodgbzzpsduewwovwlfrarfiuaztmmohagkjzzdcnjytamlzpwpfmhlgsdlwfbluxqllcjxbltbrlhgngvtxyksllhfhhzknesqggfazixcotpwwbjenbglhcbnhgjgyimfvfbcezatumthzrqtvdyirxulfhwylbdhkibmiagdgeerriszbnfxmoxgabaxkgkydrnrrbatjbavwdxjqirqivqweqdxeiiotbfidiemakmzbwszgrgekrlalsmbplumxeqmfrulddmbactyuhdljlhhjvxumpkyyzouybtwxtoyiffrderzmztkcdsbhcij" | elixir 20_prefix_compression.exs
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
      { _, s1 } = read_binary_line()
      { _, s2 } = read_binary_line()

      lcp = String.graphemes(s1)
      |> Stream.zip(String.graphemes(s2))
      |> Stream.take_while(fn { a, b } -> a == b end)
      |> Enum.count()

      IO.puts("#{lcp} " <> String.slice(s1, 0, lcp))
      IO.puts("#{String.length(s1) - lcp} " <> String.slice(s1, lcp, String.length(s1)))
      IO.puts("#{String.length(s2) - lcp} " <> String.slice(s2, lcp, String.length(s2)))
    end

  end

  Solution.main
