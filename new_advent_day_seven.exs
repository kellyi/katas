#!/usr/bin/env elixir

defmodule Solve do
  def puzzle_part_one(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&(String.split(&1, " ", trim: true)))
    |> Enum.map(&(parse_line(&1)))
    |> find_base
  end

  def puzzle_part_two(_) do
    :exit
  end

  defp parse_line([name, _|[]]) do
    {name, []}
  end

  defp parse_line([name, _, _|tail]) do
    {name, Enum.sort(tail)}
  end

  defp find_base(l) do
    Enum.map(l, fn({name, _}) -> name end) -- create_stack(l)
  end

  defp create_stack(s) do
    Enum.flat_map(s, fn({_, stack}) -> stack end)
    |> Enum.map(&(String.replace_trailing(&1, ",", "")))
    |> Enum.uniq
    |> Enum.sort
  end
end

{:ok, f} = File.read("2017_advent_day_seven_input.txt")
{Solve.puzzle_part_one(f), Solve.puzzle_part_two(f)}
|> IO.inspect
