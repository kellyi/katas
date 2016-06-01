#!/usr/bin/env elixir

defmodule PascalsTriangle do
    def triangle(rows) do
        triangle([[0,1,0]], 1, rows)
    end

    def triangle(list, count, rows) when count >= rows do
        Enum.reverse(list)
    end

    def triangle(list, count, rows) do
        [previous | _] = list
        triangle([add_row(previous) | list], count+1, rows)
    end

    def add_row(i) do
        add_row(i, 0, [])
    end

    def add_row([], 0, l) do
        [0 | l]
    end

    def add_row([h | t], last, new) do
        add_row(t, h, [last + h | new])
    end

end

PascalsTriangle.triangle(20)
|> IO.inspect
