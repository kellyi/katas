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
end
