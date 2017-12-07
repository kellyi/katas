#!/usr/bin/env elixir

defmodule Solve do
  def puzzle_part_one(input) do
    input
    |> String.split(" ", trim: true)
    |> Enum.map(&(String.trim(&1)))
    |> Enum.map(&(String.to_integer(&1)))
    |> reallocate
  end

  def puzzle_part_two(input) do
    input
    |> String.split(" ", trim: true)
    |> Enum.map(&(String.trim(&1)))
    |> Enum.map(&(String.to_integer(&1)))
    |> alt_reallocate
  end

  defp create_hash(list) do
    list
    |> Enum.map(&(Integer.to_string(&1)))
    |> Enum.join("")
  end

  defp reallocate(list) do
    list
    |> adjust_list
    |> reallocate([create_hash(list)], 1)
  end

  defp reallocate(list, cache, counter) do
    hash = create_hash(list)
    case Enum.member?(cache, hash) do
      true -> counter
      _ -> list
        |> adjust_list
        |> reallocate([hash|cache], counter + 1)
    end
  end

  defp alt_reallocate(list) do
    list
    |> adjust_list
    |> alt_reallocate([create_hash(list)], 1)
  end

  defp alt_reallocate(list, cache, counter) do
    hash = create_hash(list)
    case Enum.member?(cache, hash) do
      true -> list
           |> adjust_list
           |> reallocate([hash], 1)
      _ -> list
        |> adjust_list
        |> alt_reallocate([hash|cache], counter + 1)
    end
  end

  defp adjust_list(list) do
    max_value = Enum.max(list)
    max_index = Enum.find_index(list, fn(x) -> x == max_value end)

    Enum.take(list, max_index) ++ [0] ++ Enum.drop(list, max_index + 1)
    |> adjust_list(max_index + 1, max_value)
  end

  defp adjust_list(list, _, 0) do
    list
  end

  defp adjust_list(list, update_index, alloc) when update_index >= length(list) do
    adjust_list(list, 0, alloc)
  end

  defp adjust_list(list, update_index, alloc) do
    Enum.take(list, update_index) ++ [Enum.at(list, update_index) + 1] ++
      Enum.drop(list, update_index + 1)
    |> adjust_list(update_index + 1, alloc - 1)
  end
end

{:ok, input} = File.read("2017_advent_day_six_input.txt")
{Solve.puzzle_part_one(input), Solve.puzzle_part_two(input)}
|> IO.inspect
