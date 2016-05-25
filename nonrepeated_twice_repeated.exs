#!/usr/bin/env elixir
# https://programmingpraxis.com/2015/12/18/two-part-interview-question/

defmodule Repeated do
    def nonrepeated(sequence) do
        repeats(sequence, 1)
    end

    def doubly_repeated(sequence) do
        repeats(sequence, 2)
    end

    def repeats(seq, n) do
        a = for i <- seq, do: {i, Enum.count(seq, fn(x) -> x == i end)}
        elem(Enum.find(a, fn(x) -> elem(x, 1) == n end), 0)
    end
end

IO.inspect Repeated.nonrepeated([3, 5, 3, 2, 1])
IO.inspect Repeated.doubly_repeated([5, 3, 5, 1, 5, 1, 3])
