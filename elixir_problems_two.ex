# https://wiki.haskell.org/99_questions/11_to_20

defmodule Solve do
    defp pack([]) do
        []
    end

    defp pack([h|t]) do
        pack(t, [[h]])
    end

    defp pack([], encoded) do
        Enum.reverse(encoded)
    end

    defp pack([h|t], [eh|et] = encoded) do
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

    # 12: Decode a run-length encoded list.
    def decode_run_length_encoded_list([]) do
        []
    end

    def decode_run_length_encoded_list(l) do
        l
        |> Enum.map(&(decode_list/1))
        |> List.flatten
    end

    defp decode_list({element,count}) do
        List.duplicate(element, count)
    end

    defp decode_list(x) do
        x
    end

    # 13: Run-length encoding of a list (direct solution).

    def direct_run_length_encoding([]) do
        []
    end

    def direct_run_length_encoding(l) do
        modified_run_length_encoding(l)
        |> Enum.map(&(direct_encoding_mapper/1))
    end

    defp direct_encoding_mapper({element, count}) do
        {:multiple, count, element}
    end

    defp direct_encoding_mapper(e) do
        {:single, e}
    end

    # 15: Duplicate the elements of a list.
    def duplicate_list([]) do
        []
    end

    def duplicate_list(l) do
        l
        |> Enum.map(&([&1, &1]))
        |> List.flatten
    end
end