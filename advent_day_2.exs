#!/usr/bin/env elixir

defmodule FindWrappingPaperAndRibbonOrder do

    def solve_paper(input) do
        open_file(input)
        |> Enum.map(&(string_to_list(&1)))
        |> Enum.map(&(find_square_feet(&1)))
        |> Enum.sum
    end

    def solve_ribbon(input) do
        open_file(input)
        |> Enum.map(&(string_to_list(&1)))
        |> Enum.map(&(find_ribbon_length(&1)))
        |> Enum.sum
    end

    defp open_file(filename) do
        {_, f} = File.read(filename)
        String.split(f, "\n", trim: true)
    end

    defp string_to_list(str) do
        [a, b, c] = String.split(str, "x", trim: true)
        [String.to_integer(a), String.to_integer(b), String.to_integer(c)]
    end

    defp find_square_feet([l,w,h]) do
        [_|t] = Enum.sort([l,w,h], &(&1 > &2))
        Enum.sum([2*l*w, 2*w*h, 2*h*l, Enum.reduce(t, &(&1*&2))])
    end

    defp find_ribbon_length([l,w,h]) do
        [sm,md,lg] = Enum.sort([l,w,h], &(&1 < &2))
        Enum.sum([sm, sm, md, md]) + (sm*md*lg)
    end

end

FindWrappingPaperAndRibbonOrder.solve_paper("advent_day_2_input.txt")
|> IO.inspect

FindWrappingPaperAndRibbonOrder.solve_ribbon("advent_day_2_input.txt")
|> IO.inspect
