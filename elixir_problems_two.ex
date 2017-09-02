# https://wiki.haskell.org/99_questions/11_to_20

defmodule Solve do
    def pack([]) do
        []
    end

    def pack([h|t]) do
        pack(t, [[h]])
    end

    def pack([], encoded) do
        Enum.reverse(encoded)
    end

    def pack([h|t], [eh|et] = encoded) do
        case Enum.member?(eh, h) do
            true -> pack(t, [[h] ++ eh|et])
            _ -> pack(t, [[h]] ++ encoded)
        end
    end

    def run_length_encoding([]) do
        []
    end

    def run_length_encoding(l) do
        pack(l)
        |> Enum.map(&{List.first(&1), Enum.count(&1)})
    end

    # 11: modified run-length encoding
    def modified_run_length_encoding(l) do
        run_length_encoding(l)
        |> Enum.map(&(adjust_encoded_list/1))
    end

    defp adjust_encoded_list({x, 1}) do
        x
    end

    defp adjust_encoded_list(t) do
        t
    end
end