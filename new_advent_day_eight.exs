#!/usr/bin/env elixir

defmodule Solve do
  def puzzle(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&(String.split(&1, " ", trim: true)))
    |> Enum.map(&(convert_to_instructions(&1)))
    |> run_instructions
  end

  defp convert_to_instructions([var, "dec", operand, _|rest]) do
    [var, -String.to_integer(operand), rest]
  end

  defp convert_to_instructions([key, _, operand, _|rest]) do
    [key, String.to_integer(operand), rest]
  end

  defp run_instructions(l) do
    run_instructions(l, Map.new(Enum.map(l, fn(x) -> hd(x) end), fn(x) -> {x, 0} end), 0)
  end

  defp run_instructions([], map, highest_value) do
    {get_max(map), highest_value}
  end

  defp run_instructions([[key, count, condition]|t], map, highest_value) do
    case check_condition(condition, map) do
      true ->
        run_instructions(t, update_map(key, count, map), Enum.max([get_max(map), highest_value]))
      _ -> run_instructions(t, map, highest_value)
    end
  end

  defp check_condition([key, comparator, check_value], map) do
    {result, _} = Code.eval_string("#{Map.get(map, key)} #{comparator} #{check_value}")
    result
  end

  defp update_map(key, count, map) do
    Map.replace(map, key, Map.get(map, key) + count)
  end

  defp get_max(map) do
    {_, max} = map |> Map.to_list |> Enum.max_by(fn({_,v}) -> v end)
    max
  end
end

{:ok, f} = File.read("2017_advent_day_eight_input.txt")
Solve.puzzle(f) |> IO.inspect
