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
end
