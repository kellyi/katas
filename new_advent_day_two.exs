#!/usr/bin/env elixir

defmodule Solve do
  def puzzle_part_one(input) do
    {:ok, f} = File.read(input)
    f
    |> String.split("\n", trim: true)
    |> Enum.map(&(convert_to_int(&1)))
    |> Enum.map(&(min_max_difference(&1)))
    |> Enum.sum
    |> IO.inspect
  end

  def puzzle_part_two(input) do
    {:ok, f} = File.read(input)
    f
    |> String.split("\n", trim: true)
    |> Enum.map(&(convert_to_int(&1)))
    |> Enum.flat_map(&(find_divisible(&1)))
    |> Enum.sum
    |> IO.inspect
  end

  defp convert_to_int(str) do
    String.split(str)
    |> Enum.map(&(String.to_integer(&1)))
  end

  defp min_max_difference(list) do
    Enum.max(list) - Enum.min(list)
  end

  defp find_divisible(list) do
    for n <- list, d <- list, rem(n, d) == 0, n != d, do: div(n, d)
  end
end

Solve.puzzle_part_one("2017_advent_day_two_input.txt")
Solve.puzzle_part_two("2017_advent_day_two_input.txt")
