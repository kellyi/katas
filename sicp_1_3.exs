#!/usr/bin/env elixir

# Define a procedure that takes three numbers as
# arguments and returns the sum of the squares of
# the two larger numbers.

defmodule SquareTwoLarger do

    def start({x, y, z}) do
        {check_pair(x, y), check_pair(y, z)}
        |> sum_squares
    end

    defp check_pair(x, y) do
        case x > y do
            true -> x
            _ -> y
        end
    end

    defp square(n) do
        n * n
    end

    defp sum_squares({x, y}) do
        square(x) + square(y)
    end

end

SquareTwoLarger.start({ 1, 2, 3 })
|> IO.inspect

SquareTwoLarger.start({ 6, 4, 5 })
|> IO.inspect

SquareTwoLarger.start({ 7, 6, 5 })
|> IO.inspect
