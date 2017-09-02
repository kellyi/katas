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

    # 14: Duplicate the elements of a list.
    def duplicate_list([]) do
        []
    end

    def duplicate_list(l) do
        l
        |> Enum.map(&([&1, &1]))
        |> List.flatten
    end

    # 15: Replicate the elements of a list a given number of times.

    def replicate_list([], _) do
        []
    end

    def replicate_list(_, 0) do
        []
    end

    def replicate_list(l, 1) do
        l
    end

    def replicate_list(l, times) do
        l
        |> Enum.map(&(List.duplicate(&1, times)))
        |> List.flatten
    end

    # 16: Drop every N'th element from a list.

    def drop_every_nth([], _) do
        []
    end

    def drop_every_nth(l, n) when n < 2 do
        case n do
            1 -> []
            _ -> l
        end
    end

    def drop_every_nth(l, n) do
        drop_every_nth(l, n - 1, n - 1, [])
    end

    def drop_every_nth([], _, _, acc) do
        Enum.reverse(acc)
    end

    def drop_every_nth([_|t], n, 0, acc) do
        drop_every_nth(t, n, n, acc)
    end

    def drop_every_nth([h|t], n, counter, acc) do
        drop_every_nth(t, n, counter - 1, [h|acc])
    end

    # 17: Split a list into two parts; the length of the first part is given.

    def split_list([], _) do
        [[],[]]
    end

    def split_list(l, 0) do
        [[], l]
    end

    def split_list([h|t], 1) do
        [[h], t]
    end

    def split_list(l, n) do
        split_list(l, n, [])
    end

    def split_list(l, 0, acc) do
        [Enum.reverse(acc), l]
    end

    def split_list([h|t], n, acc) do
        split_list(t, n - 1, [h|acc])
    end

    # 18: Extract a slice from a list.

    def slice([], _, _) do
        []
    end

    def slice(_, first, last) when last <= first do
        []
    end

    def slice(l, first, last) do
        slice(l, first, last, [])
    end

    def slice(_, 1, 1, acc) do
        Enum.reverse(acc)
    end

    def slice([h|t], 1, last, acc) do
        slice(t, 1, last - 1, [h|acc])
    end

    def slice([_|t], first, last, acc) do
        slice(t, first - 1, last - 1, acc)
    end

    # 19: Rotate a list N places to the left.

    def rotate_list([], _) do
        []
    end

    def rotate_list(l, 0) do
        l
    end

    def rotate_list([h|t], 1) do
        t ++ [h]
    end

    def rotate_list([h|t], n) do
        rotate_list(t ++ [h], n - 1)
    end

    # 20: Remove the K'th element from a list.

    def remove_kth_element([], _) do
        []
    end

    def remove_kth_element(l, 0) do
        l
    end

    def remove_kth_element([_|t], 1) do
        t
    end

    def remove_kth_element(l, n) do
        case n > Enum.count(l) do
            true -> l
            _ -> remove_kth_element(l, n, [])
        end
    end

    def remove_kth_element([_|t], 1, acc) do
        Enum.reverse(acc) ++ t
    end

    def remove_kth_element([h|t], n, acc) do
        remove_kth_element(t, n - 1, [h|acc])
    end
end
