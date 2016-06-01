#!/usr/bin/env elixir

defmodule SumList do

    def sum([]) do
        0
    end

    def sum(lst) do
        sum(lst, 0)
    end

    def sum([], accumulator) do
        accumulator
    end

    def sum([h | t], accumulator) do
        sum(t, accumulator + h)
    end

end

SumList.sum([1,2,3,4,5,6,7,8,9,10])
|> IO.inspect

Enum.sum([1,2,3,4,5,6,7,8,9,10])
|> IO.inspect
