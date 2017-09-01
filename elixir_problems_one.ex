# https://wiki.haskell.org/99_questions/1_to_10

defmodule Solve do
    def one([]) do
        nil
    end

    def one([h|[]]) do
        h
    end

    def one([_|t]) do
        one(t)
    end

    def two([]) do
        nil
    end

    def two([_|[]]) do
        nil
    end

    def two ([e,_|[]]) do
        e
    end

    def two([_|t]) do
        two(t)
    end

    def three([], _) do
        nil
    end

    def three(_, 0) do
        nil
    end

    def three([e|_], 1) do
        e
    end

    def three([_|t], n) do
        three(t, n - 1)
    end

    def four([]) do
        0
    end

    def four([h|[]]) do
        1
    end

    def four([_|t]) do
        1 + four(t)
    end
end
