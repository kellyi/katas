# https://wiki.haskell.org/99_questions/21_to_28

defmodule Solve do
    # 21: Insert an element at a given position into a list.

    def insert([], _, _) do
        []
    end

    def insert(l, e, 0) do
        [e] ++ l
    end

    def insert(l, element, position) do
        case position >= Enum.count(l) do
            true -> l ++ [element]
            _ -> insert(l, element, position, [])
        end
    end

    def insert(l, element, 0, acc) do
        Enum.reverse(acc) ++ [element] ++ l
    end

    def insert([h|t], element, n, acc) do
        insert(t, element, n - 1, [h|acc])
    end
end