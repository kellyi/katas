#!/usr/bin/env elixir

defmodule CollatzSequence do

    def find_sequence(n) do
        term(n, 1, n)
    end

    defp term(1, count, starting_term) do
        {count, starting_term}
    end

    defp term(n, count, starting_term) do
        case rem(n,2) do
            0 -> term(div(n, 2), count+1, starting_term)
            1 -> term((3*n) + 1, count+1, starting_term)
        end
    end

end

Enum.map(1..999999, &(CollatzSequence.find_sequence(&1)))
|> Enum.max
|> IO.inspect
