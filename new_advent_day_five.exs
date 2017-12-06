#!/usr/bin/env elixir

defmodule Solve do
  def puzzle_part_one(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&(String.to_integer(&1)))
    |> jump
  end

  def puzzle_part_two(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&(String.to_integer(&1)))
    |> alt_jump
  end

  defp alt_jump(list) do
    jump(list, :two)
  end

  defp jump(list) do
    jump(list, :one)
  end

  defp jump(list, puzzle) do
    jump(list, Enum.at(list, 0), 0, 0, puzzle)
  end

  defp jump(l, _, i, step, _) when i >= length(l) do
    step
  end

  defp jump(l, instruction, index, step, puzzle) do
    new_inst = if (instruction >= 3 and puzzle == :two) do
      instruction - 1
    else
      instruction + 1
    end
    new_l = Enum.take(l, index) ++ [new_inst] ++ Enum.drop(l, index + 1)
    jump(new_l, Enum.at(new_l, index + instruction), index + instruction,
      step + 1, puzzle)
  end
end

{:ok, input} = File.read("2017_advent_day_five_input.txt")
{Solve.puzzle_part_one(input), Solve.puzzle_part_two(input)}
|> IO.inspect
