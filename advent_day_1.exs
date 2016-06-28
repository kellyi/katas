#!/usr/bin/env elixir

defmodule CountFloors do

    def solve_part_one(filename) do
        open_file(filename)
        |> Enum.partition(&(&1 == ")"))
        |> Tuple.to_list()
        |> Enum.map(&(Enum.filter(&1, fn x -> x == ")" or x == "(" end)))
        |> Enum.map(&(Enum.count(&1)))
        |> Enum.reduce(&(&1 - &2))
        |> Kernel.abs
    end

    def solve_part_two(filename) do
        f = open_file(filename)
        find_next_floor(f, 0, 0)
    end

    defp open_file(filename) do
        {_, f} = File.read(filename)
        String.split(f, "", trim: true)
        |> Enum.to_list()
    end

    defp find_next_floor(_, position, floor) when floor < 0 do
        position
    end

    defp find_next_floor([h|t], position, floor) do
        case h do
            ")" -> find_next_floor(t, position+1, floor-1)
            "(" -> find_next_floor(t, position+1, floor+1)
        end
    end
end

f = "advent_day_1_part_2_input.txt"
{CountFloors.solve_part_one(f), CountFloors.solve_part_two(f)}
|> IO.inspect
