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

    # 22: Create a list containing all integers within a given range.

    def list_from_range(start, finish) when start > finish do
        nil
    end

    def list_from_range(start, finish) do
        case start == finish do
            true -> [start]
            _ -> Enum.to_list(start..finish)
        end
    end

    # 23: Extract a given number of randomly selected elements from a list.

    def get_random([], _) do
        []
    end

    def get_random(_, 0) do
        []
    end

    def get_random(l, n) do
        case n >= Enum.count(l) do
            true -> l
            _ -> Enum.take(Enum.shuffle(l), n)
        end
    end

    # 24: Lotto: Draw N different random numbers from the set 1..M.

    def lotto(n, m) when n > m do
        []
    end

    def lotto(n, m) do
        case n == m do
            true -> Enum.shuffle(list_from_range(1, m))
            _ -> get_random(list_from_range(1, m), n)
        end
    end
end
