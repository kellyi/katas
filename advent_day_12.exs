#!/usr/bin/env elixir

defmodule SumJSON do

    def solve(filename) do
        open(filename)
        |> Enum.map(&(String.to_integer(&1)))
        |> Enum.sum
    end

    defp open(filename) do
        {_,f} = File.read(filename)
        String.replace(f, ~r/[^\-0-9]/, ",")
        |> String.split(",")
        |> Enum.filter(&(&1 != ""))
    end

end

SumJSON.solve("advent_day_12_input.txt")
|> IO.inspect
