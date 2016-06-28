#!/usr/bin/env elixir

defmodule FindWrappingPaperAndRibbonOrder do

    def solve_paper(filename) do
        open_file(filename)
        |> Enum.map(&(find_square_feet(&1)))
        |> Enum.map(&(Enum.sum(&1)))
        |> Enum.sum
    end

    def solve_ribbon(filename) do
        open_file(filename)
        |> Enum.sort(&(&1 < &2))
        |> Enum.map(&find_ribbon_length(&1))
        |> Enum.sum
    end

    defp open_file(filename) do
        {_, f} = File.read(filename)
        String.split(f, "\n", trim: true)
        |> Enum.to_list()
        |> Enum.map(&(split_string(&1)))
    end

    defp split_string(present) do
        String.split(present, "x")
        |> Enum.to_list()
        |> Enum.map(&(String.to_integer(&1)))
    end

    defp find_square_feet(present) do
        [l, w, h] = present
        [_|t] = Enum.sort(present, &(&1 > &2))
        [2*l*w, 2*w*h, 2*h*l, Enum.reduce(t, &(&1*&2))]
    end

    def find_ribbon_length([l,w,h]) do
        l + l + w + w + (l*w*h)
    end

end

FindWrappingPaperAndRibbonOrder.solve_paper("advent_day_2_input.txt")
|> IO.inspect

FindWrappingPaperAndRibbonOrder.solve_ribbon("advent_day_2_input.txt")
|> IO.inspect
