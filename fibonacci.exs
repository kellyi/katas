#!/usr/bin/env elixir

defmodule Fibonacci do

    def term(n) do
        case n do
            0 -> 0
            1 -> 1
            2 -> 1
            _ -> term(n-1) + term(n-2)
        end
    end

end

Enum.map(1..10, &(Fibonacci.term(&1))) |> IO.inspect
